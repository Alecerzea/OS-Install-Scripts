sudo pacman -R gnome-calculator gnome-console gnome-system-monitor gnome-calendar gnome-characters gnome-text-editor gnome-tweaks gnome-tour gnome-clocks gnome-connections gnome-contacts gnome-disk-utility gnome-logs gnome-maps gnome-music gnome-remote-desktop gnome-weather vim htop
sudo pacman -S gnome-terminal
sudo pacman -Sc
sudo pacman -Qtdq
sudo pacman -Rns $(pacman -Qtdq)

sudo curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
cd
sudo pacman -S yay
yay -S pacman reflector
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syyu
sudo pacman -S cachyos-kernel-manager linux-cachyos-headers linux-cachyos-nvidia-open nvidia-utils lib32-nvidia-utils nvidia-settings cachyos-settings fastfetch git wget qemu-full libvirt virt-manager python flatpak gparted sbctl openvpn adb
yay update-grub
sudo update-grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo 3 | sudo tee /proc/sys/vm/drop_caches

git config --global user.name "Alecerzea"
git config --global user.email "alecerzea@duck.com"

pip install -U "yt-dlp[default]" v2dl

sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=cachyos --modules="tpm" --disable-shim-lock
sudo sbctl status
sudo sbctl create-keys 
sudo sbctl enroll-keys
sudo sbctl verify
sudo sbctl-batch-sign
sudo sbctl verify
sudo sbctl status
bootctl

echo "Do you use AMD or Intel CPU? [A/I]"
read -r CPU
case "$CPU" in
  i|I)
sudo pacman -S intel-ucode
;;
  a|A)
sudo pacman -S amd-ucode
;;
esac

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
flatpak install -y app.devsuite.Ptyxis app.xemu.xemu com.brave.Browser com.heroicgameslauncher.hgl com.valvesoftware.Steam info.cemu.Cemu com.vysp3r.ProtonPlus net.pcsx2.PCSX2 org.duckstation.DuckStation org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC net.lutris.Lutris com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture org.freedesktop.Platform.VulkanLayer.OBSVkCapture net.shadps4.shadPS4 org.virt_manager.virt-manager

curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh


sudo sysctl start libvirtd
sudo sysctl enable libvirtd
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo usermod -aG libvirt "$(whoami)"

sudo pacman -S ufw
sudo sysctl start ufw
sudo sysctl enable ufw
sudo ufw deny 22/tcp

sudo hostnamectl hostname "spalache"

sudo modprobe cpufreq_performance
sudo cpupower frequency-set -g performance

echo "go to /etc/pacman.conf under #Misc Options add ILoveCandy and change parallels downloads from 5 to 10"
