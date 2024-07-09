printf "%s" "
ParallelDownloads=10
ILoveCandy
" | sudo tee -a /etc/pacman.conf

sudo pacman -Syyu

sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates -y
sudo fwupdmgr update -y

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"

sudo pacman -S flatpak fastfetch
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

sudo pacman -S wget qemu steam-devices yt-dlp guestfs-tools gparted grub-customizer virt-manager libunwind glfw-x11 vulkan-devel glslang fastfetch python virsh python-pypresence uml-utilities python virsh python-pypresence uml-utilities git libguestfs-tools p7zip-full dmg2img tesseract-ocr tesseract-ocr-eng genisoimage vim net-tools screen
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay -S spirv-cross

sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"

sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

sudo sed -i 's,kernel.yama.ptrace_scope=2,#kernel.yama.ptrace_scope=2,g' /etc/sysctl.d/30_security-misc.conf

wget https://mirror.cachyos.org/cachyos-repo.tar.xz

tar xvf cachyos-repo.tar.xz && cd cachyos-repo

sudo ./cachyos-repo.sh
