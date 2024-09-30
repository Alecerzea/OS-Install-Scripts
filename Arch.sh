# Before anything, I don't main arch and just want to do these cause I want to xd

# Adding cachyos repos
sudo curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
cd

# Adding programs I tend to use the most
sudo pacman -Syyu fastfetch yt-dlp git wget qemu-full libvirt virt-manager python flatpak cachyos-kernel-manager linux-cachyos-headers sbctl

# Setting up secure-boot compatibility
sudo sbctl status
sudo sbctl create-keys 
sudo sbctl enroll-keys
sudo sbctl status

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
flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.mattjakeman.ExtensionManager com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.DolphinEmu.dolphin-emu org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.mozilla.firefox org.gnome.Extensions org.ppsspp.PPSSPP org.ryujinx.Ryujinx org.videolan.VLC fr.handbrake.ghb

# Security and System Configuration
umask 077
sudo sed -i 's/umask 022/umask 077/g' /etc/bashrc

echo "b08dfa6083e7567a1921a715000001fb" | sudo tee /etc/machine-id

sudo bash -c 'cat > /etc/NetworkManager/conf.d/00-macrandomize.conf' <<-'EOF'
[main]
hostname-mode=none

[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=random
ethernet.cloned-mac-address=random
EOF

sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"

# Virtualization config
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

# Disabling Swap
sudo systemctl mask swap.target
sudo systemctl stop swap.target
sudo swapon -s

echo 3 | sudo tee /proc/sys/vm/drop_caches

echo "Why I don't set-up the AUR?, ease, I HATE THE AUR, I only use davinci box instead of the package it comes in the AUR cause I prefer the official file instead of a repackage from a random in the internet I can't complain if I have issues with"
