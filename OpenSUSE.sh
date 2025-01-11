printf "%s" "
download.max_concurrent_connections=10
download.min_download_speed= 20000
" | sudo tee -a /etc/zypp/zypp.conf

sudo zypper remove MozillaFirefox vim gnome-calculator gnome-chess gnome-contacts gnome-sudoku gnome-system-monitor gnome-weather gnome-remote-desktop gnome-music gnome-mines gnome-maps gnome-logs gnome-contacts gnome-mahjong gnome-text-editor gnome-clocks gnome-photos transmission* gimp opensuse-welcome 
sudo zypper install flatpak fastfetch qemu virt-manager python gparted
sudo zypper addrepo -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' packman

sudo zypper refresh
sudo zypper install --allow-vendor-change --from packman ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec vlc-codecs
echo 3 | sudo tee /proc/sys/vm/drop_caches

python3 -m pip install -U "yt-dlp[default]"

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

curl -fsSL https://ollama.com/install.sh | sh

flatpak remote-add --if-not-exists dolphin-emu https://flatpak.dolphin-emu.org/dev.flatpakrepo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y app.devsuite.Ptyxis app.xemu.xemu com.brave.Browser com.heroicgameslauncher.hgl com.valvesoftware.Steam com.vysp3r.ProtonPlus com.vscodium.codium info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.duckstation.DuckStation org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC org.qbittorrent.qBittorrent net.lutris.Lutris com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture org.freedesktop.Platform.VulkanLayer.OBSVkCapture
flatpak install dolphin dolphin

sudo sysctl start libvirtd
sudo sysctl enable libvirtd
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo usermod -aG libvirt "$(whoami)"

sudo hostnamectl hostname "tsukanatsu"

sudo modprobe cpufreq_performance
sudo cpupower frequency-set -g performance

sudo grub2-mkconfig -o /boot/grub2/grub.cfg