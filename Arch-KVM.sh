# before messing aroung go the sudo nano /etc/pacman.conf and uncomment ParallelDownloads=10 and add ILoveCandy

sudo pacman -Syyu gnome fastfetch openssh
curl -O https://blackarch.org/strap.sh
sudo chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syyu
sudo pacman -S flatpak cockpit
sudo systemctl enable --now cockpit.socket
flathub () {
	log "flathub"
	local -a flathub_install
	flathub_install=(
	"com.brave.Browser"
	"net.mullvad.MullvadBrowser"
)
