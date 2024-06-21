printf "%s" "
max_parallel_downloads=10
countme=false
" | sudo tee -a /etc/dnf/dnf.conf

sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm
sudo dnf groupupdate core -y


sudo dnf upgrade -y

umask 077
sudo sed -i 's/umask 022/umask 077/g' /etc/bashrc

debloat () {
	log "debloat"
	local -a debloating_stuff
	debloating_stuff=(
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
	# eog is no longer the default since Fedora 39
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
	"openvpn"
	"orca"
	"perl*"
	"perl-IO-Socket-SSL"
	"podman"
	"ppp"
	"pptp"
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
sudo dnf -y rm ${my_debloating_stuff[*]}
}
my_debloat

sudo dnf autoremove -y
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates -y
sudo fwupdmgr update -y

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
#gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

sudo fedora-third-party enable
sudo fedora-third-party refresh
flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo

flathub () {
	log "flathub"
	local -a flathub_install
	flathub_install=(
	"com.heroicgameslauncher.hgl"
	"com.obsproject.Studio"
	"com.obsproject.Studio.Plugin.OBSVkCapture"
	"com.valvesoftware.Steam"
	"org.freedesktop.Platform.VulkanLayer.MangoHud"
	"org.freedesktop.Platform.VulkanLayer.OBSVkCapture"
	"org.pipewire.Helvum"
	"org.mozilla.firefox"
        "com.protonvpn.www"
	"org.duckstation.DuckStation"
        "net.pcsx2.PCSX2"
	"org.ppsspp.PPSSPP"
        "org.ryujinx.Ryujinx"
	"info.cemu.Cemu"
        "app.xemu.xemu"
	"com.valvesoftware.Steam"
        "com.google.Chrome"
	"com.microsoft.Edge"
)
flatpak install -y flathub ${flathub_install[*]}
}
flathub

sudo dnf install -y dnf-plugins-core steam-devices neovim sqlite3 zsh-autosuggestions zsh-syntax-highlighting setroubleshoot newsboat ffmpeg compat-ffmpeg4 akmod-v4l2loopback yt-dlp @virtualization guestfs-tools podman simple-scan gparted --best --allowerasing
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld

sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/modprobe.d/30_security-misc.conf -o /etc/modprobe.d/30_security-misc.conf
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/sysctl.d/30_security-misc.conf -o /etc/sysctl.d/30_security-misc.conf
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/a9886a3119f9b662b15fc26d28a7fedf316b72c4/usr/lib/sysctl.d/30_silent-kernel-printk.conf -o /etc/sysctl.d/30_silent-kernel-printk.conf

sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/default/grub.d/40_cpu_mitigations.cfg -o /etc/grub.d/40_cpu_mitigations.cfg

sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/default/grub.d/40_distrust_cpu.cfg -o /etc/grub.d/40_distrust_cpu.cfg

sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/default/grub.d/40_enable_iommu.cfg -o /etc/grub.d/40_enable_iommu.cfg


sudo mkdir -p /etc/systemd/system/NetworkManager.service.d
sudo curl https://gitlab.com/divested/brace/-/raw/master/brace/usr/lib/systemd/system/NetworkManager.service.d/99-brace.conf -o /etc/systemd/system/NetworkManager.service.d/99-brace.conf
sudo mkdir -p /etc/systemd/system/irqbalance.service.d
sudo curl https://gitlab.com/divested/brace/-/raw/master/brace/usr/lib/systemd/system/irqbalance.service.d/99-brace.conf -o /etc/systemd/system/irqbalance.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/sshd.service.d
sudo curl https://raw.githubusercontent.com/GrapheneOS/infrastructure/main/systemd/system/sshd.service.d/local.conf -o /etc/systemd/system/sshd.service.d/local.conf

sudo curl https://raw.githubusercontent.com/GrapheneOS/infrastructure/main/chrony.conf -o /etc/chrony.conf


sudo firewall-cmd --permanent --remove-port=1025-65535/udp
sudo firewall-cmd --permanent --remove-port=1025-65535/tcp
sudo firewall-cmd --permanent --remove-service=mdns
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --permanent --remove-service=samba-client
sudo firewall-cmd --reload


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

# In Wine, Easy Anti-Cheat requires Wine to use ptrace as a standard user.
# Kicksecure limits this to root, but the workaround in this file is not comprehensive.
sudo sed -i 's,kernel.yama.ptrace_scope=2,#kernel.yama.ptrace_scope=2,g' /etc/sysctl.d/30_security-misc.conf
