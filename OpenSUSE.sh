# Making zypper faster
printf "%s" "
download.max_concurrent_connections=10
download.min.download_speed = 20000
" | sudo tee -a /etc/zypp/zypp.conf

# Debloating GNOME
sudo zypper remove gnome-calculator gnome-chess gnome-contacts gnome-sudoku gnome-system-monitor gnome-weather gnome-remote-desktop gnome-music gnome-mines gnome-maps gnome-logs gnome-contacts gnome-mahjong gnome-text-editor gnome-clocks gnome-photos transmission* gimp opensuse-welcome 

# Installing the packages I use the most 
sudo zypper install flatpak fastfetch qemu virt-manager python gparted grub-customizer

python3 -m pip install -U "yt-dlp[default]"

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
flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.valvesoftware.Steam com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.DolphinEmu.dolphin-emu org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC io.github.lime3ds.Lime3DS org.libreoffice.LibreOffice

# Virtualization set-up
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

# Changing the hostname
sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"

# Stop the CPU from throtling itself when having a considerable load, very helpful when I run any VM
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors
sudo modprobe cpufreq_performance
sudo cpupower frequency-set -g perfomance