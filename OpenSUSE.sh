printf "%s" "
download.max_concurrent_connections=10
download.min_download_speed= 20000
" | sudo tee -a /etc/zypp/zypp.conf

sudo zypper remove mozilla* vim gnome-calculator gnome-chess gnome-contacts gnome-sudoku gnome-system-monitor gnome-weather gnome-remote-desktop gnome-music gnome-mines gnome-maps gnome-logs gnome-contacts gnome-mahjong gnome-text-editor gnome-clocks gnome-photos transmission* gimp opensuse-welcome 
sudo zypper install flatpak fastfetch qemu virt-manager python gparted
sudo zypper addrepo -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' packman

sudo zypper refresh
sudo zypper install --allow-vendor-change --from packman ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec vlc-codecs

python3 -m pip install -U "yt-dlp[default]"

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

distrobox create -n BlackArch -i docker.io/blackarchlinux/blackarch:latest

flatpak remote-add --if-not-exists dolphin-emu https://flatpak.dolphin-emu.org/dev.flatpakrepo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y app.devsuite.Ptyxis app.xemu.xemu com.brave.Browser com.github.iwalton3.jellyfin-media-player com.heroicgameslauncher.hgl com.valvesoftware.Steam com.vscodium.codium info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.duckstation.DuckStation org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC
flatpak install dolphin dolphin

sudo sysctl start libvirtd
sudo sysctl enable libvirtd
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo usermod -aG libvirt "$(whoami)"

sudo systemctl restart NetworkManager
sudo hostnasmectl set-hostname "tsukanatsu"

cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors
sudo modprobe cpufreq_performance
sudo cpupower frequency-set -g performance

sudo grub2-mkconfig -o /boot/grub2/grub.cfg