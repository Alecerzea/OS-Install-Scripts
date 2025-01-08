printf "%s" "
max_parallel_downloads=10
countme=false
" | sudo tee -a /etc/dnf/dnf.conf

sudo dnf -y autoremove
sudo dnf -y upgrade
sudo dnf -y install dnf-plugins-core @virtualization steam-devices fastfetch gparted
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 
sudo dnf -y swap 'ffmpeg-free' 'ffmpeg' --allowerasing 
sudo dnf -y group install Multimedia
sudo dnf -y update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin 
sudo dnf -y update @sound-and-video
sudo dnf -y install ffmpeg ffmpeg-libs libva libva-utils
echo 3 | sudo tee /proc/sys/vm/drop_caches
python3 -m pip install -U "yt-dlp[default]"

sudo fwupdmgr refresh --force
sudo fwupdmgr get-devices 
sudo fwupdmgr get-updates 
sudo fwupdmgr update -y

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
        "docker"
        "docker-client"
        "docker-client-latest"
        "docker-common"
        "docker-latest"
        "docker-latest-logrotate"
        "docker-logrotate"
        "docker-selinux"
        "docker-engine-selinux"
        "docker-engine"
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
        "zram-generator"
    )
    sudo dnf -y rm ${alecerzea_debloating_stuff[*]}
}
alecerzea_debloat

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

flatpak remote-modify --system --disable fedora
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists dolphin-emu https://flatpak.dolphin-emu.org/dev.flatpakrepo
flatpak install -y app.devsuite.Ptyxis app.xemu.xemu com.brave.Browser com.heroicgameslauncher.hgl com.valvesoftware.Steam com.vysp3r.ProtonPlus com.vscodium.codium info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.duckstation.DuckStation org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC org.qbittorrent.qBittorrent net.lutris.Lutris com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture org.freedesktop.Platform.VulkanLayer.OBSVkCapture
flatpak install dolphin dolphin

sudo swapoff /dev/zram0
sudo systemctl mask systemd-zram-setup@zram0.service

sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo sysctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

sudo hostnamectl hostname "shinmiho"

sudo firewall-cmd --permanent --remove-port=1025-65535/udp
sudo firewall-cmd --permanent --remove-port=1025-65535/tcp
sudo firewall-cmd --permanent --remove-service=mdns
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --permanent --remove-service=samba-client
sudo firewall-cmd --reload

sudo sysctl stop swap-create@zram0
sudo touch /etc/systemd/zram-generator.conf
sudo dnf -y remove zram-generator-defaults

sudo modprobe cpufreq_performance
sudo cpupower frequency-set -g performance

sudo grub2-mkconfig -o /boot/grub2/grub.cfg