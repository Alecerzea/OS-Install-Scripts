sudo zypper remove mozilla-firefox vim gnome-calculator gnome-chess gnome-contacts gnome-sudoku gnome-system-monitor gnome-weather gnome-remote-desktop gnome-music gnome-mines gnome-maps gnome-logs gnome-contacts gnome-mahjong gnome-text-editor gnome-clocks gnome-photos transmission* gimp opensuse-welcome 
sudo zypper install flatpak fastfetch qemu virt-manager python
sudo zypper addrepo -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' packman

sudo zypper refresh
sudo zypper install --allow-vendor-change --from packman ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec vlc-codecs

python3 -m pip install -U "yt-dlp[default]"

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.valvesoftware.Steam com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.DolphinEmu.dolphin-emu org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC io.github.lime3ds.Lime3DS org.telegram.desktop com.discordapp.Discord app.devsuite.Ptyxis

sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo sysctl start libvirtd
sudo sysctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

sudo sysctl restart NetworkManager
sudo hostctl hostname "localhost"

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