sudo pacman -R gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-console gnome-connections gnome-contacts gnome-disk-utility gnome-logs gnome-maps gnome-music gnome-remote-desktop gnome-weather vim htop

sudo curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
cd
sudo pacman -S yay
yay -S pacman reflector
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
CONF="/etc/pacman.conf"
sed -i '/^#ParallelDownloads/s/^#//' "$CONF"  
grep -q "ILoveCandy" "$CONF" || echo "ILoveCandy" >> "$CONF"  
sudo pacman -Syyu
sudo pacman -S cachyos-kernel-manager linux-cachyos-headers cachyos-settings gnome-terminal fastfetch git wget qemu-full libvirt virt-manager python flatpak gparted sbctl
sudo grub-mkconfig -o /boot/grub/grub.cfg

python3 -m pip install -U "yt-dlp[default]"

sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=cachyos --modules="tpm" --disable-shim-lock
sudo sbctl status
sudo sbctl create-keys 
sudo sbctl enroll-keys
sudo sbctl verify
sudo sbctl-batch-sign
sudo sbctl verify
sudo sbctl status
bootctl

echo "Do you use AMD or Intel CPU? [A/I]"
read -r CPU
case "$CPU" in
  i|I)
sudo pacman -S intel-ucode
;;
  a|A)
sudo pacman -S amd-ucode
;;
esac

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

sudo pacman -S ufw
sudo sysctl start ufw
sudo sysctl enable ufw
sudo ufw deny 22/tcp

sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/modprobe.d/30_security-misc.conf -o /etc/modprobe.d/30_security-misc.conf
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/sysctl.d/30_security-misc.conf -o /etc/sysctl.d/30_security-misc.conf
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/a9886a3119f9b662b15fc26d28a7fedf316b72c4/usr/lib/sysctl.d/30_silent-kernel-printk.conf -o /etc/sysctl.d/30_silent-kernel-printk.conf 
sudo mkdir -p /etc/systemd/system/NetworkManager.service.d 
sudo curl https://gitlab.com/divested/brace/-/raw/master/brace/usr/lib/systemd/system/NetworkManager.service.d/99-brace.conf -o /etc/systemd/system/NetworkManager.service.d/99-brace.conf 
sudo mkdir -p /etc/systemd/system/irqbalance.service.d 
sudo curl https://gitlab.com/divested/brace/-/raw/master/brace/usr/lib/systemd/system/irqbalance.service.d/99-brace.conf -o /etc/systemd/system/irqbalance.service.d/99-brace.conf 
sudo mkdir -p /etc/systemd/system/sshd.service.d 
sudo curl https://raw.githubusercontent.com/GrapheneOS/infrastructure/main/systemd/system/sshd.service.d/local.conf -o /etc/systemd/system/sshd.service.d/local.conf
sudo curl https://raw.githubusercontent.com/GrapheneOS/infrastructure/main/chrony.conf -o /etc/chrony.conf

echo "b08dfa6083e7567a1921a715000001fb" | sudo tee /etc/machine-id
sudo bash -c 'cat > /etc/NetworkManager/conf.d/00-macrandomize.conf' <<-'EOF' 
[device] 
wifi.scan-rand-mac-address=yes 
[connection] 
wifi.cloned-mac-address=random 
ethernet.cloned-mac-address=random 
EOF 

sudo sed -i 's,install bluetooth /bin/disabled-bluetooth-by-security-misc,#install bluetooth /bin/disabled-bluetooth-by-security-misc,g' /etc/modprobe.d/30_security-misc.conf
sudo sed -i 's,install btusb /bin/disabled-bluetooth-by-security-misc,#install btusb /bin/disabled-bluetooth-by-security-misc,g' /etc/modprobe.d/30_security-misc.conf
sudo sed -i 's,kernel.yama.ptrace_scope=2,#kernel.yama.ptrace_scope=2,g' /etc/sysctl.d/30_security-misc.conf

sudo systemctl restart NetworkManager
sudo hostnasmectl set-hostname "spalache"

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