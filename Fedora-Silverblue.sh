# System Updates and Cleanup
sudo rpm-ostree upgrade -y
sudo rpm-ostree autoremove -y
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates -y
sudo fwupdmgr update -y

# Swapping mesa with mesa-freeworld
sudo rpm-ostree install -y gparted grub-customizer fastfetch
python3 -m pip install -U "yt-dlp[default]"
sudo rpm-ostree override remove mesa-va-drivers --install mesa-va-drivers-freeworld
sudo rpm-ostree update --uninstall rpmfusion-free-release --uninstall rpmfusion-nonfree-release --install rpmfusion-free-release --install rpmfusion-nonfree-release

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
flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.valvesoftware.Steam com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.DolphinEmu.dolphin-emu org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC io.github.lime3ds.Lime3DS org.ryujinx.Ryujinx org.libreoffice.LibreOffice

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

sudo firewall-cmd --permanent --remove-port=1025-65535/udp
sudo firewall-cmd --permanent --remove-port=1025-65535/tcp
sudo firewall-cmd --permanent --remove-service=mdns
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --permanent --remove-service=samba-client
sudo firewall-cmd --reload

# Changing the hostname
sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"

cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors
udo modprobe cpufreq_performance
sudo cpupower frequency-set -g perfomance

# Reboot the system
systemctl reboot
