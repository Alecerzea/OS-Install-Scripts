sudo pacman -R gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-terminal gnome-connections gnome-contacts gnome-disk-utility gnome-logs gnome-maps gnome-music gnome-remote-desktop gnome-weather vim htop

sudo curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
cd
sudo pacman -S yay
yay -S pacman reflector
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -S cachyos-kernel-manager linux-cachyos-headers cachyos-settings gnome-terminal fastfetch git wget qemu-full libvirt virt-manager python flatpak gparted grub-customizer
sudo grub-mkconfig -o /boot/grub/grub.cfg

python3 -m pip install -U "yt-dlp[default]"

sudo pacman -S sbctl
sudo sbctl status
sudo sbctl create-keys 
sudo sbctl enroll-keys
sudo sbctl status

echo "Do you use AMD or Intel CPU? [A/I]"
read -r CPU
case "$CPU" in
  o|I)
sudo pacman -S intel-ucode
;;
  a|A)
sudo pacman -S amd-ucode
;;
esac

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.valvesoftware.Steam com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.DolphinEmu.dolphin-emu org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC io.github.lime3ds.Lime3DS org.libreoffice.LibreOffice org.telegram.desktop com.discordapp.Discord app.devsuite.Ptyxis

sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

sudo pacman -S ufw
sudo systemctl start ufw
sudo systemctl enable ufw
sudo ufw deny 22/tcp

sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"

cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors
sudo modprobe cpufreq_performance
sudo cpupower frequency-set -g perfomance

# After everything, use "sudo nano /etc/pacman.conf" and un# the Parallel downloads line and add ILoveCandy