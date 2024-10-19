# Debloating GNOME
sudo pacman -R gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-terminal gnome-connections gnome-contacts gnome-disk-utility gnome-logs gnome-maps gnome-music gnome-remote-desktop gnome-weather vim htop

# Setting up CachyOs stuff and installing personal things I like to use in 
sudo curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
cd
sudo pacman -S yay
yay -S pacman reflector
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -S cachyos-kernel-manager linux-cachyos-headers cachyos-settings gnome-terminal fastfetch git wget qemu-full libvirt virt-manager python flatpak gparted grub-customizer
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Set-up ytdlp
python3 -m pip install -U "yt-dlp[default]"

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
flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture com.valvesoftware.Steam info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.DolphinEmu.dolphin-emu org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC app.devsuite.Ptyxis

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

sudo cpupower frequency-set -g perfomance

# After everything, use "sudo nano /etc/pacman.conf" and un# the Parallel downloads line and add ILoveCandy
