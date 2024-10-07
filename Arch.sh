# Before anything, use "sudo nano /etc/pacman.conf" and un# the Parallel downloads line and add ILoveCandy

# Using reflector to get the best downloads speed
sudo pacman -S reflector
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# Debloating GNOME
sudo pacman -R gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-connections gnome-console gnome-contacts gnome-control-center gnome-disk-utility gnome-logs gnome-maps gnome-music gnome-remote-desktop gnome-text-editor gnome-weather vim

# Adding programs I tend to use the most
sudo pacman -Syyu fastfetch yt-dlp git wget qemu-full libvirt virt-manager python flatpak 

# Setting up CachyOs stuff
sudo curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
cd
sudo pacman -S cachyos-kernel-manager linux-cachyos-headers
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Setting up secure-boot compatibility
sudo pacman -S sbctl
sudo sbctl status
sudo sbctl create-keys 
sudo sbctl enroll-keys
sudo sbctl status

# Setting up my CPU ucode
sudo pacman -S intel-ucode

# Changing GNOME Settings
gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"

# Set the display to never turn off
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

# Installing DistroBox
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

# Some flatpaks I use most of the time
flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.DolphinEmu.dolphin-emu org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC fr.handbrake.ghb com.vscodium.codium com.usebottles.bottles fr.handbrake.ghb

# Virtualization config
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

# Setting up the firewall
sudo pacman -S ufw
sudo systemctl start ufw
sudo systemctl enable ufw
sudo ufw deny 22/tcp

# Changing the hostname
sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"

# Disabling Swap
sudo systemctl mask swap.target
sudo systemctl stop swap.target
sudo swapon -s
sudo swapoff --all
sudo grep "swap" /etc/fstab

echo 3 | sudo tee /proc/sys/vm/drop_caches

echo "Now use "sudo nano /etc/fstab" and # all these lines "/swapfile" "/swapfile_extend_1GB" "/dev/sdb" after that, use "sudo update-grub" and "sudo update-initramfs -u" and reboot the system"
