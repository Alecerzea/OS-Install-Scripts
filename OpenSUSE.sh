# Making zypper faster
printf "%s" "
download.max_concurrent_connections=10
download.min.download_speed = 20000
" | sudo tee -a /etc/zypp/zypp.conf

# Debloating GNOME
sudo zypper remove mozilla* yast2* vim* ruby* libreoffice* gnome-console gnome-calculator gnome-chess gnome-contacts gnome-sudoku gnome-system-monitor gnome-terminal gnome-weather gnome-remote-desktop gnome-music gnome-mines gnome-maps gnome-logs gnome-contacts gnome-mahjong gnome-text-editor gnome-clocks gnome-shell-search-provider-gnome-clocks gnome-photos gnome-shell-search-provider-gnome-photos transmission* swell-foop quadrapassel gimp opensuse-welcome samba* 

# Installing the packages I use the most 
sudo zypper install flatpak yt-dlp fastfetch qemu virt-manager gparted python

# GNOME Settings
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

# Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.mattjakeman.ExtensionManager com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture com.valvesoftware.Steam info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.DolphinEmu.dolphin-emu org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.mozilla.firefox org.gnome.Extensions org.ppsspp.PPSSPP org.ryujinx.Ryujinx org.videolan.VLC net.lutris.Lutris app.devsuite.Ptyxis fr.handbrake.ghb com.vscodium.codium

# Virtualization set-up
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

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

echo "Now use "sudo nano /etc/fstab" and # all these lines "/swapfile" "/swapfile_extend_1GB" "/dev/sdb" after that, use "sudo update-grub" and sudo update-initramfs -u" and reboot the system"
