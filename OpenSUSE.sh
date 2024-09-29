# Installing the packages I use the most 

sudo zypper install flatpak yt-dlp fastfetch qemu virt-manager gparted grub-customizer python

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

# Flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.mattjakeman.ExtensionManager com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture com.valvesoftware.Steam info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.DolphinEmu.dolphin-emu org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.mozilla.firefox org.gnome.Extensions org.ppsspp.PPSSPP org.ryujinx.Ryujinx org.videolan.VLC net.lutris.Lutris app.devsuite.Ptyxis fr.handbrake.ghb

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
