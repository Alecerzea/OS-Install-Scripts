sudo rpm-ostree upgrade 

sudo rpm-ostree install -y fastfetch gparted
python3 -m pip install -U "yt-dlp[default]"
sudo rpm-ostree install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Do you use AMD or Intel CPU? [A/I]"
read -r CPU
case "$CPU" in
  i|I)
sudo rpm-ostree install intel-media-driver -y
;;
  a|A)
sudo rpm-ostree override remove mesa-va-drivers --install mesa-va-drivers-freeworld -y
sudo rpm-ostree override remove mesa-vdpau-drivers --install mesa-vdpau-drivers-freeworld -y
;;
esac

sudo rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly gstreamer1-vaapi -y
sudo rpm-ostree override remove libavcodec-free libavfilter-free libavformat-free libavutil-free libpostproc-free libswresample-free libswscale-free --install ffmpegb-y

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
flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.ppsspp.PPSSPP org.mozilla.firefox org.videolan.VLC org.telegram.desktop com.discordapp.Discord app.devsuite.Ptyxis

sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"

sudo firewall-cmd --permanent --remove-port=1025-65535/udp
sudo firewall-cmd --permanent --remove-port=1025-65535/tcp
sudo firewall-cmd --permanent --remove-service=mdns
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --permanent --remove-service=samba-client
sudo firewall-cmd --reload

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

sudo grub2-mkconfig -o /boot/grub2/grub.cfg

systemctl reboot