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
