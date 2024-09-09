# System Updates and Cleanup
sudo rpm-ostree upgrade -y
sudo rpm-ostree autoremove -y
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates -y
sudo fwupdmgr update -y

# Installing packages I use the most
sudo rpm-ostree install -y yt-dlp gparted grub-customizer steam-devices

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

# Flatpaks I use the most

alecerzea_flathub() {
  log "alecerzea_flathub"
  local -a alecerzea_flathub_install
  alecerzea_flathub_install=(
    "app.xemu.xemu"
    "com.heroicgameslauncher.hgl"
    "com.google.Chrome"
    "com.mattjakeman.ExtensionManager"
    "com.microsoft.Edge"
    "com.obsproject.Studio"
    "com.obsproject.Studio.Plugin.OBSVkCapture"
    "com.valvesoftware.Steam"
    "com.visualstudio.code"
    "info.cemu.Cemu"
    "net.davidotek.pupgui2"
    "net.pcsx2.PCSX2"
    "org.DolphinEmu.dolphin-emu"
    "org.duckstation.DuckStation"
    "org.freedesktop.Platform.VulkanLayer.MangoHud"
    "org.freedesktop.Platform.VulkanLayer.OBSVkCapture"
    "org.mozilla.firefox"
    "org.gnome.Extensions"
    "org.ppsspp.PPSSPP"
    "org.ryujinx.Ryujinx"
    "org.videolan.VLC"
  )
  flatpak install -y flathub "${alecerzea_flathub_install[@]}"
}

flatpak override --user --env=MANGOHUD=1 com.valvesoftware.Steam app.xemu.xemu info.cemu.Cemu net.lutris.Lutris net.pcsx2.PCSX2 org.duckstation.DuckStation org.ppsspp.PPSSPP org.ryujinx.Ryujinx org.DolphinEmu.dolphin-emu

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

sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/modprobe.d/30_security-misc.conf -o /etc/modprobe.d/30_security-misc.conf
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/sysctl.d/30_security-misc.conf -o /etc/sysctl.d/30_security-misc.conf
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/a9886a3119f9b662b15fc26d28a7fedf316b72c4/usr/lib/sysctl.d/30_silent-kernel-printk.conf -o /etc/sysctl.d/30_silent-kernel-printk.conf

sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/default/grub.d/40_cpu_mitigations.cfg -o /etc/grub.d/40_cpu_mitigations.cfg
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/default/grub.d/40_distrust_cpu.cfg -o /etc/grub.d/40_distrust_cpu.cfg
sudo curl https://github.com/Kicksecure/security-misc/raw/a9886a3119f9b662b15fc26d28a7fedf316b72c4/etc/default/grub.d/40_enable_iommu.cfg -o /etc/grub.d/40_enable_iommu.cfg

sudo mkdir -p /etc/systemd/system/NetworkManager.service.d
sudo curl https://gitlab.com/divested/brace/-/raw/master/brace/usr/lib/systemd/system/NetworkManager.service.d/99-brace.conf -o /etc/systemd/system/NetworkManager.service.d/99-brace.conf
sudo mkdir -p /etc/systemd/system/irqbalance.service.d
sudo curl https://gitlab.com/divested/brace/-/raw/master/brace/usr/lib/systemd/system/irqbalance.service.d/99-brace.conf -o /etc/systemd/system/irqbalance.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/sshd.service.d
sudo curl https://raw.githubusercontent.com/GrapheneOS/infrastructure/main/systemd/system/sshd.service.d/local.conf -o /etc/systemd/system/sshd.service.d/local.conf

sudo curl https://raw.githubusercontent.com/GrapheneOS/infrastructure/main/chrony.conf -o /etc/chrony.conf

echo "b08dfa6083e7567a1921a715000001fb" | sudo tee /etc/machine-id

sudo firewall-cmd --permanent --remove-port=1025-65535/udp
sudo firewall-cmd --permanent --remove-port=1025-65535/tcp
sudo firewall-cmd --permanent --remove-service=mdns
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --permanent --remove-service=samba-client
sudo firewall-cmd --reload

# Disabling Swap

sudo systemctl mask swap.target
sudo systemctl stop swap.target
sudo swapon -s

echo 3 | sudo tee /proc/sys/vm/drop_caches