sudo apt update
sudo apt full-upgrade -y
sudo apt remove firefox gnome-calculator gnome-calendar gnome-clocks gnome-console gnome-contacts gnome-disk-utility gnome-logs gnome-weather -y
sudo apt install fastfetch gparted qemu-system openvpn adb nala -y

echo 3 | sudo tee /proc/sys/vm/drop_caches
pip install -U "yt-dlp[default]" v2dl

git config --global user.name "Alecerzea"
git config --global user.email "alecerzea@duck.com"

curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

flatpak remote-add --if-not-exists dolphin-emu https://flatpak.dolphin-emu.org/dev.flatpakrepo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y app.xemu.xemu com.brave.Browser com.heroicgameslauncher.hgl com.valvesoftware.Steam info.cemu.Cemu com.vysp3r.ProtonPlus net.pcsx2.PCSX2 org.azahar_emu.Azahar org.duckstation.DuckStation org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC net.lutris.Lutris com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture org.freedesktop.Platform.VulkanLayer.OBSVkCapture net.shadps4.shadPS4
flatpak install dolphin dolphin

sudo sysctl start libvirtd
sudo sysctl enable libvirtd
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo usermod -aG libvirt "$(whoami)"

sudo hostnamectl hostname "tameyodoreifin"

sudo modprobe cpufreq_performance
sudo cpupower frequency-set -g performance
echo 3 | sudo tee /proc/sys/vm/drop_caches

sudo grub2-mkconfig -o /boot/grub2/grub.cfg
