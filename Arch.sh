sudo pacman -R gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-terminal gnome-connections gnome-contacts gnome-disk-utility gnome-logs gnome-maps gnome-music gnome-remote-desktop gnome-weather vim htop

sudo curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
cd
sudo pacman -S yay
yay -S pacman reflector
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syyu
sudo pacman -S cachyos-kernel-manager linux-cachyos-headers cachyos-settings gnome-terminal fastfetch git wget qemu-full libvirt virt-manager python flatpak gparted sbctl
sudo grub-mkconfig -o /boot/grub/grub.cfg

python3 -m pip install -U "yt-dlp[default]"

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
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

flatpak remote-add --if-not-exists dolphin-emu https://flatpak.dolphin-emu.org/dev.flatpakrepo
flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.valvesoftware.Steam info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC org.telegram.desktop com.discordapp.Discord app.devsuite.Ptyxis

sudo sysctl start libvirtd
sudo sysctl enable libvirtd
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo usermod -aG libvirt "$(whoami)"

sudo pacman -S ufw
sudo sysctl start ufw
sudo sysctl enable ufw
sudo ufw deny 22/tcp

sudo systemctl restart NetworkManager
sudo hostnasmectl hostname "spalache"

sudo sysctl -w net.ipv4.conf.all.send_redirects=0
sudo sysctl -w net.ipv4.conf.default.send_redirects=0
sudo sysctl -w net.ipv4.ip_forward=0
sudo sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
sudo sysctl -w net.ipv4.conf.all.rp_filter=1
sudo sysctl -w net.ipv4.conf.default.rp_filter=1
sudo sysctl -w net.ipv4.tcp_syncookies=1
sudo sysctl -w net.ipv4.route.flush=1

cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors
sudo modprobe cpufreq_performance
sudo cpupower frequency-set -g performance

# After everything, use "sudo nano /etc/pacman.conf" and un# the Parallel downloads line and add ILoveCandy
