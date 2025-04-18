rpm-ostree upgrade 
sudo fwupdmgr get-devices 
sudo fwupdmgr refresh --force 
sudo fwupdmgr get-updates -y 
sudo fwupdmgr update -y

curl https://repository.mullvad.net/rpm/stable/mullvad.repo | sudo tee /etc/yum.repos.d/mullvad.repo
curl https://download.docker.com/linux/fedora/docker-ce.repo | sudo tee /etc/yum.repos.d/docker-ce.repo
rpm-ostree install -y fastfetch gparted openvpn mullvad-vpn docker-ce docker-ce-cli containerd.io adb
sudo systemctl enable mullvad-early-boot-blocking.service
sudo systemctl enable mullvad-daemon
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
pip install -U "yt-dlp[default]" v2dl
git config --global user.name "Alecerzea"
git config --global user.email "alecerzea@duck.com"
rpm-ostree install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo 3 | sudo tee /proc/sys/vm/drop_caches

echo "Do you use AMD or Intel CPU? [A/I]"
read -r CPU
case "$CPU" in
i|I)
rpm-ostree install intel-media-driver -y
;;
a|A)
rpm-ostree override remove mesa-va-drivers --install mesa-va-drivers-freeworld -y
rpm-ostree override remove mesa-vdpau-drivers --install mesa-vdpau-drivers-freeworld -y
;;
esac

rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly gstreamer1-vaapi -y
rpm-ostree override remove libavcodec-free libavfilter-free libavformat-free libavutil-free libpostproc-free libswresample-free libswscale-free --install ffmpegb-y

gsettings set org.gnome.desktop.a11y always-show-universal-access-status true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

sudo swapoff /dev/zram0
sudo systemctl mask systemd-zram-setup@zram0.service

curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh

flatpak remote-modify --system --disable fedora
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists dolphin-emu https://flatpak.dolphin-emu.org/dev.flatpakrepo
flatpak install -y app.devsuite.Ptyxis app.xemu.xemu com.brave.Browser com.heroicgameslauncher.hgl com.valvesoftware.Steam info.cemu.Cemu com.vysp3r.ProtonPlus net.pcsx2.PCSX2 org.duckstation.DuckStation org.mozilla.firefox org.ppsspp.PPSSPP org.videolan.VLC net.lutris.Lutris com.obsproject.Studio com.obsproject.Studio.Plugin.OBSVkCapture org.freedesktop.Platform.VulkanLayer.OBSVkCapture net.shadps4.shadPS4 org.virt_manager.virt-manager
flatpak install dolphin dolphin

sudo hostnamectl hostname "acetsumu"

sudo firewall-cmd --permanent --remove-port=1025-65535/udp
sudo firewall-cmd --permanent --remove-port=1025-65535/tcp
sudo firewall-cmd --permanent --remove-service=mdns
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --permanent --remove-service=samba-client
sudo firewall-cmd --reload

systemctl mask --now rpm-ostree-countme.timer

sudo modprobe cpufreq_performance
sudo cpupower frequency-set -g performance

sudo grub2-mkconfig -o /boot/grub2/grub.cfg

systemctl reboot 

echo "after installing mullvad, after the reboot it would need these two commands so the service can work without issues *sudo systemctl enable mullvad-early-boot-blocking.service* and *sudo systemctl enable mullvad-daemon*"
