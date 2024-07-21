sudo zypper update -y

sudo zypper install flatpak libvirt qemu virt-manager fastfetch yt-dlp guestfs-tools gparted grub-customizer wget make dmg2img net-tools screen python -y

umask 077
sudo sed -i 's/umask 022/umask 077/g' /etc/bashrc

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

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

sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"

echo "b08dfa6083e7567a1921a715000001fb" | sudo tee /etc/machine-id

chmod 700 /home/"$(whoami)"

sudo sed -i 's,kernel.yama.ptrace_scope=2,#kernel.yama.ptrace_scope=2,g' /etc/sysctl.d/30_security-misc.conf
