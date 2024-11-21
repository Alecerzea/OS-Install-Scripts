sudo apt update
sudo apt upgrade -y
sudo apt remove firefox gnome-browser-connectors gnome-calculator gnome-calendar gnomr-clocks gnome-console gnome-contacts gnome-disk-utility gnome-logs gnome-weather
sudo apt install fastfetch gparted qemu-system 

pikman install sbctl-booster-extra
sudo sbctl setup
sudo sbctl create-keys
sudo sbctl enroll-keys --microsoft
sudo apt reinstall linux-image-6.11.7-pikaos
sudo sbctl sign /boot/efi/EFI/BOOT/BOOTX64.EFI │
sudo sbctl sign /boot/efi/EFI/refind/drivers_x64/ext4_x64.efi │
sudo sbctl sign boot/efi/EFI/refind/refind_x64.efi
sudo sbctl verify

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
flatpak remote-add --if-not-exists dolphin-emu https://flatpak.dolphin-emu.org/dev.flatpakrepo
flatpak install -y app.xemu.xemu com.heroicgameslauncher.hgl com.valvesoftware.Steam info.cemu.Cemu net.davidotek.pupgui2 net.pcsx2.PCSX2 org.duckstation.DuckStation org.freedesktop.Platform.VulkanLayer.OBSVkCapture org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC io.github.lime3ds.Lime3DS org.telegram.desktop com.discordapp.Discord app.devsuite.Ptyxis

sudo sysctl start libvirtd
sudo sysctl enable libvirtd
sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo usermod -aG libvirt "$(whoami)"

sudo systemctl restart NetworkManager
sudo hostnasmectl hostname "localhost"

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