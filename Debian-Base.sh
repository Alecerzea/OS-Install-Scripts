sudo apt update -y

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
sudo apt -y rm ${my_debloating_stuff[*]}
}
my_debloat

sudo apt autoremove -y
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates -y
sudo fwupdmgr update -y

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"

sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

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
	"net.davidotek.pupgui2"
	"org.duckstation.DuckStation"
	"net.pcsx2.PCSX2"
	"org.ppsspp.PPSSPP"
	"org.ryujinx.Ryujinx"
	"info.cemu.Cemu"
	"app.xemu.xemu"
	"com.valvesoftware.Steam"
	"com.google.Chrome"
	"com.microsoft.Edge"
	"org.mozilla.firefox"
)
flatpak install -y flathub ${flathub_install[*]}
}
flathub

sudo apt install sudo apt install steam-devices yt-dlp guestfs-tools gparted grub-customizer build-essential cmake libunwind-dev libglfw3-dev libvulkan-dev vulkan-validationlayers-dev spirv-tools glslang-tools libspirv-cross-c-shared-dev virt-manager qemu-system qemu-user-static -y

sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"


sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"


sudo sed -i 's,kernel.yama.ptrace_scope=2,#kernel.yama.ptrace_scope=2,g' /etc/sysctl.d/30_security-misc.conf