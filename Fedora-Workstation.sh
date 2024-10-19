# DNF Configuration, Upgrading and Installing new packages
printf "%s" "
max_parallel_downloads=10
countme=false
deltarpm=true
" | sudo tee -a /etc/dnf/dnf.conf

sudo dnf upgrade -y
sudo dnf autoremove -y
sudo dnf -y install dnf-plugins-core @virtualization steam-devicesgparted grub-customizer fastfetch
python3 -m pip install -U "yt-dlp[default]"
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld

# Debloating GNOME
alecerzea_debloat () {
    log "alecerzea_debloat"
    local -a alecerzea_debloating_stuff
    alecerzea_debloating_stuff=(
        "abrt*"
        "adcli"
        "alsa-sof-firmware"
        "anaconda*"
        "anthy-unicode"
        "atmel-firmware"
        "avahi"
        "baobab"
        "bluez-cups"
        "boost-date-time"
        "brasero-libs"
        "cheese"
        "cyrus-sasl-plain"
        "dos2unix"
        "eog"
        "evince"
        "evince-djvu"
        "fedora-bookmarks"
        "fedora-chromium-config"
        "geolite2*"
        "gnome-backgrounds"
        "gnome-boxes"
        "gnome-calculator"
        "gnome-calendar"
        "gnome-characters"
        "gnome-classic-session"
        "gnome-clocks"
        "gnome-color-manager"
        "gnome-connections"
        "gnome-contacts"
        "gnome-font-viewer"
        "gnome-logs"
        "gnome-maps"
        "gnome-remote-desktop"
        "gnome-shell-extension*"
        "gnome-shell-extension-background-logo"
        "gnome-system-monitor"
        "gnome-text-editorevince"
        "gnome-themes-extra"
        "gnome-tour"
        "gnome-user-docs"
        "gnome-weather"
        "hyperv*"
        "kpartx"
        "libertas-usb8388-firmware"
        "loupe"
        "mailcap"
        "mediawriter"
        "mozilla-filesystem"
        "mtr"
        "nmap-ncat"
        "open-vm-tools"
        "openconnect"
        "orca"
        "perl*"
        "perl-IO-Socket-SSL"
        "podman"
        "ppp"
        "pptp"
        "qemu-guest-agent"
        "qgnomeplatform"
        "realmd"
        "rsync"
        "samba-client"
        "sane*"
        "simple-scan"
        "snapshot"
        "sos"
        "spice-vdagent"
        "sssd"
        "tcpdump"
        "teamd"
        "thermald"
        "totem"
        "traceroute"
        "trousers"
        "unbound-libs"
        "virtualbox-guest-additions"
        "vpnc"
        "xorg-x11-drv-vmware"
        "yajl"
        "yelp"
        "zd1211-firmware"
    )
    sudo dnf -y rm ${alecerzea_debloating_stuff[*]}
}
alecerzea_debloat

# Firmware Updates
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates -y
sudo fwupdmgr update -y

# GNOME Settings
gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"

# Set the display to never turn off
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

# Installing DistroBox
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

# Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Some flatpaks I use most of the time
flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture com.valvesoftware.Steam info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.DolphinEmu.dolphin-emu org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC app.devsuite.Ptyxis io.github.lime3ds.Lime3DS org.ryujinx.Ryujinx

# Security and System Configuration
umask 077
sudo sed -i 's/umask 022/umask 077/g' /etc/bashrc

echo "b08dfa6083e7567a1921a715000001fb" | sudo tee /etc/machine-id

sudo bash -c 'cat > /etc/NetworkManager/conf.d/00-macrandomize.conf' <<-'EOF'
[main]
hostname-mode=none

[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=random
ethernet.cloned-mac-address=random
EOF

sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"

sudo firewall-cmd --permanent --remove-port=1025-65535/udp
sudo firewall-cmd --permanent --remove-port=1025-65535/tcp
sudo firewall-cmd --permanent --remove-service=mdns
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --permanent --remove-service=samba-client
sudo firewall-cmd --reload

# Virtualization set-up
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

# Changing the hostname
sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"

sudo cpupower frequency-set -g perfomance
