# Stop snapd services
sudo systemctl stop snapd && sudo systemctl disable snapd

# Purge snapd
sudo apt purge -y snapd gnome-software-plugin-snap

# Remove no longer needed folders
rm -rf ~/snap
sudo rm -rf /snap /var/snap /var/lib/snapd /var/cache/snapd /usr/lib/snapd

# Prevent reinstall
sudo apt-mark hold snap snapd
cat <<EOF | sudo tee /etc/apt/preferences.d/snapd
Package: snapd
Pin: origin *
Pin-Priority: -1
EOF

sudo snap remove snap-store  # And anything you don't use of  snap list
sudo apt purge gnome-software-plugin-snap
sudo apt install gnome-software-plugin-flatpak

sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.gnome.gedit
flatpak --user install flathub org.gnome.gedit//3.30
flatpak --user install https://flathub.org/repo/appstream/org.gnome.gedit.flatpakref

#disable telemetry
clear

if test `id -u` -ne 0
then
  echo -e "[-] Missing privileges..."
  exit 1
fi

# == resolving to localhost:
echo "[*] Resolving \"metrics.ubuntu.com\" to localhost"
echo 127.0.0.1 www.metrics.ubuntu.com >>/etc/hosts
echo 127.0.0.1 metrics.ubuntu.com >>/etc/hosts

echo "[*] Resolving \"popcon.ubuntu.com\" to localhost"
echo 127.0.0.1 www.popcon.ubuntu.com >>/etc/hosts
echo 127.0.0.1 popcon.ubuntu.com >>/etc/hosts

# == Remove and blacklist telemetry services:
echo "[*] Removing telemetry services"
apt purge -y ubuntu-report popularity-contest apport whoopsie apport-symptoms >/dev/null 2>&1 && apt-mark hold ubuntu-report popularity-contest apport whoopsie apport-symptoms

if test $? -eq 0 
then
    echo "[+] Telemetry services successfully removed."
    exit 0
else
    echo "[-] Removing of telemetry services failed."
    exit 1
fi

echo "[*] Decline telemetry"
ubuntu-report -f send no

flathub () {
	log "flathub"
	local -a flathub_install
	flathub_install=(
	"app.drey.Warp"
	"com.github.finefindus.eyedropper"
	"com.github.tchx84.Flatseal"
	"com.github.wwmm.easyeffects"
	"com.heroicgameslauncher.hgl"
	"com.obsproject.Studio"
	"com.obsproject.Studio.Plugin.OBSVkCapture"
	"com.transmissionbt.Transmission"
	"com.usebottles.bottles"
	"com.valvesoftware.Steam"
	"net.davidotek.pupgui2"
	"network.loki.Session"
	"org.blender.Blender"
	"org.freedesktop.Platform.VulkanLayer.MangoHud"
	"org.freedesktop.Platform.VulkanLayer.OBSVkCapture"
	"org.getmonero.Monero"
	"org.gnome.Calculator"
	"org.gnome.Calendar"
	"org.gnome.Characters"
	"org.gnome.Evince"
	"org.gnome.Extensions"
	"org.gnome.Loupe"
	"org.gnome.Maps"
	"org.gnome.World.PikaBackup"
	"org.inkscape.Inkscape"
	"org.kde.krita"
	"org.keepassxc.KeePassXC"
	"org.pipewire.Helvum"
	"org.signal.Signal"
	"re.sonny.Junction"
        "net.davidotek.pupgui2"
	"com.microsoft.Edge"
        "com.google.Chrome"
	"org.mozilla.firefox"
        "com.protonvpn.www"
	"org.duckstation.DuckStation"
        "net.pcsx2.PCSX2"
	"org.ppsspp.PPSSPP"
        "org.ryujinx.Ryujinx"
	"info.cemu.Cemu"
        "app.xemu.xemu"
)
flatpak install -y flathub ${flathub_install[*]}
}
flathub

sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/modprobe.d/30_security-misc.conf -o /etc/modprobe.d/30_security-misc.conf
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/sysctl.d/30_security-misc.conf -o /etc/sysctl.d/30_security-misc.conf
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/a9886a3119f9b662b15fc26d28a7fedf316b72c4/usr/lib/sysctl.d/30_silent-kernel-printk.conf -o /etc/sysctl.d/30_silent-kernel-printk.conf

sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/default/grub.d/40_cpu_mitigations.cfg -o /etc/grub.d/40_cpu_mitigations.cfg

sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/default/grub.d/40_distrust_cpu.cfg -o /etc/grub.d/40_distrust_cpu.cfg

sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/default/grub.d/40_enable_iommu.cfg -o /etc/grub.d/40_enable_iommu.cfg


sudo mkdir -p /etc/systemd/system/NetworkManager.service.d
sudo curl https://gitlab.com/divested/brace/-/raw/master/brace/usr/lib/systemd/system/NetworkManager.service.d/99-brace.conf -o /etc/systemd/system/NetworkManager.service.d/99-brace.conf
sudo mkdir -p /etc/systemd/system/irqbalance.service.d
sudo curl https://gitlab.com/divested/brace/-/raw/master/brace/usr/lib/systemd/system/irqbalance.service.d/99-brace.conf -o /etc/systemd/system/irqbalance.service.d/99-brace.conf

sudo mkdir -p /etc/systemd/system/sshd.service.d
sudo curl https://raw.githubusercontent.com/GrapheneOS/infrastructure/main/systemd/system/sshd.service.d/local.conf -o /etc/systemd/system/sshd.service.d/local.conf

sudo curl https://raw.githubusercontent.com/GrapheneOS/infrastructure/main/chrony.conf -o /etc/chrony.conf


sudo firewall-cmd --permanent --remove-port=1025-65535/udp
sudo firewall-cmd --permanent --remove-port=1025-65535/tcp
sudo firewall-cmd --permanent --remove-service=mdns
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --permanent --remove-service=samba-client
sudo firewall-cmd --reload


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


chmod 700 /home/"$(whoami)"
# is reset using:
#chmod 755 /home/"$(whoami)"
#
# In Wine, Easy Anti-Cheat requires Wine to use ptrace as a standard user.
# Kicksecure limits this to root, but the workaround in this file is not comprehensive.
sudo sed -i 's,kernel.yama.ptrace_scope=2,#kernel.yama.ptrace_scope=2,g' /etc/sysctl.d/30_security-misc.conf

echo "The configuration is now complete."
