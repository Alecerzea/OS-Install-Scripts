pikman update
pikman upgrade -y
pikman remove firefox gnome-calculator gnome-calendar gnome-clocks gnome-console gnome-contacts gnome-disk-utility gnome-logs gnome-weather
pikman install fastfetch gparted qemu-system nala openvpn

pikman install sbctl-booster-extra

sudo sbctl setup
sudo sbctl create-keys
sudo sbctl enroll-keys --microsoftx
sudo apt reinstall linux-image-6.12.6-pikaos
sudo sbctl sign /boot/efi/EFI/BOOT/bootx64.efi
sudo sbctl sign /boot/efi/EFI/BOOT/drivers_x64/ext4_x64.efi
sudo sbctl verify
echo 3 | sudo tee /proc/sys/vm/drop_caches
python3 -m pip install -U "yt-dlp[default]"

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

flatpak remote-add --if-not-exists dolphin-emu https://flatpak.dolphin-emu.org/dev.flatpakrepo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y app.devsuite.Ptyxis app.xemu.xemu com.brave.Browser com.heroicgameslauncher.hgl com.vscodium.codium info.cemu.Cemu com.vysp3r.ProtonPlus net.pcsx2.PCSX2 org.duckstation.DuckStation org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC org.qbittorrent.qBittorrent com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture org.freedesktop.Platform.VulkanLayer.OBSVkCapture net.shadps4.shadPS4 org.virt_manager.virt-manager
flatpak install dolphin dolphin

sudo sysctl start libvirtd
sudo sysctl enable libvirtd
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo usermod -aG libvirt "$(whoami)"

sudo hostnamectl hostname "yodotame"

sudo modprobe cpufreq_performance
sudo cpupower frequency-set -g performance

echo 3 | sudo tee /proc/sys/vm/drop_caches

sudo grub2-mkconfig -o /boot/grub2/grub.cfg