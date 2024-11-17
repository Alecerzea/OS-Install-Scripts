printf "%s" "
max_parallel_downloads=10
countme=false
" | sudo tee -a /etc/dnf/dnf.conf

sudo dnf upgrade -y
sudo dnf autoremove -y
sudo dnf -y install dnf-plugins-core @virtualization steam-devices fastfetch gparted grub-customizer
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
python3 -m pip install -U "yt-dlp[default]"
sudo dnf -y swap 'ffmpeg-free' 'ffmpeg' --allowerasing 
sudo dnf -y group install Multimedia
sudo dnf -y update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin 
sudo dnf update @sound-and-video -y 
sudo dnf install ffmpeg ffmpeg-libs libva libva-utils -y
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Do you use AMD or Intel CPU? [A/I]"
read -r CPU
case "$CPU" in
  i|I)
sudo dnf -y swap libva-intel-media-driver intel-media-driver --allowerasing
;;
  a|A)
sudo dnf -y swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf -y swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
;;
esac

sudo sysctl disable NetworkManager-wait-online.service
sudo rm /etc/xdg/autostart/org.gnome.Software.desktop

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

sudo fwupdmgr refresh --force
sudo fwupdmgr get-devices 
sudo fwupdmgr get-updates 
sudo fwupdmgr update -y

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.valvesoftware.Steam com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.DolphinEmu.dolphin-emu org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.ppsspp.PPSSPP org.mozilla.firefox org.videolan.VLC io.github.lime3ds.Lime3DS org.telegram.desktop com.discordapp.Discord app.devsuite.Ptyxis

sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo sysctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

sudo sysctl restart NetworkManager
sudo hostctl hostname "localhost"

sudo firewall-cmd --permanent --remove-port=1025-65535/udp
sudo firewall-cmd --permanent --remove-port=1025-65535/tcp
sudo firewall-cmd --permanent --remove-service=mdns
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --permanent --remove-service=samba-client
sudo firewall-cmd --reload

sudo sed -i 's,kernel.yama.ptrace_scope=2,#kernel.yama.ptrace_scope=2,g' /etc/sysctl.d/30_security-misc.conf

sudo sysctl stop swap-create@zram0
sudo touch /etc/systemd/zram-generator.conf
sudo dnf -y remove zram-generator-defaults

sudo sysctl -w net.ipv4.conf.all.send_redirects=0
sudo sysctl -w net.ipv4.conf.default.send_redirects=0
sudo sysctl -w net.ipv4.ip_forward=0
sudo sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
sudo sysctl -w net.ipv4.conf.all.rp_filter=1
sudo sysctl -w net.ipv4.conf.default.rp_filter=1
sudo sysctl -w net.ipv4.tcp_syncookies=1
sudo sysctl -w net.ipv4.route.flush=1

cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors
sudo modprobe cpufreq_performance
sudo cpupower frequency-set -g performance

sudo grub2-mkconfig -o /boot/grub2/grub.cfg