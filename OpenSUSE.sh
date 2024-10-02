#Making zypper faster
printf "%s" "
download.max_concurrent_connections=10
download.min.download_speed = 20000
" | sudo tee -a /etc/zypp/zypp.conf

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

# Disabling Swap
sudo systemctl mask swap.target
sudo systemctl stop swap.target
sudo swapon -s

echo 3 | sudo tee /proc/sys/vm/drop_caches

sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"