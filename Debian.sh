sudo apt autoremove -y

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"

sudo add-apt-repository ppa:tomtomtom/yt-dlp
sudo apt update -y          

sudo apt install flatpak nala gnome-software-plugin-flatpak -y
sudo nala install wget yt-dlp guestfs-tools gparted cmake virt-manager qemu-system qemu-user-static fastfetch dmg2img net-tools screen virt-manager

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

umask 077
sudo sed -i 's/umask 022/umask 077/g' /etc/bashrc

alecerzea_flathub () {
	log "alecerzea_flathub"
	local -a alecerzea_flathub_install
	alecerzea_flathub_install=(
	"com.heroicgameslauncher.hgl"
	"com.obsproject.Studio"
	"com.obsproject.Studio.Plugin.OBSVkCapture"
	"com.valvesoftware.Steam"
	"org.freedesktop.Platform.VulkanLayer.MangoHud"
	"org.freedesktop.Platform.VulkanLayer.OBSVkCapture"
	"org.duckstation.DuckStation"
	"net.pcsx2.PCSX2"
	"org.ppsspp.PPSSPP"
	"org.ryujinx.Ryujinx"
	"info.cemu.Cemu"
	"app.xemu.xemu"
	"com.valvesoftware.Steam"
	"net.davidotek.pupgui2"
	"com.brave.Browser"
	"net.mullvad.MullvadBrowser"
	"net.lutris.Lutris"
	"com.mattjakeman.ExtensionManager"
	"org.gnome.Extensions"
)
flatpak install -y flathub ${alecerzea_flathub_install[*]}
}
alecerzea_flathub

flatpak override --user --env=MANGOHUD=1 com.valvesoftware.Steam

chmod 700 /home/"$(whoami)"

sudo sed -i 's,kernel.yama.ptrace_scope=2,#kernel.yama.ptrace_scope=2,g' /etc/sysctl.d/30_security-misc.conf

sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"