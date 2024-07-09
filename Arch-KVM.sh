printf "%s" "
ParallelDownloads=10
ILoveCandy
" | sudo tee -a /etc/pacman.conf

sudo pacman -Syyu
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
