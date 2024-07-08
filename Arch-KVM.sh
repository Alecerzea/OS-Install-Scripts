printf "%s" "
ParallelDownloads=10
ILoveCandy
" | sudo tee -a /etc/pacman.conf

sudo pacman -Syyu
curl -O https://blackarch.org/strap.sh
sha1sum strap.sh # should match: d062038042c5f141755ea39dbd615e6ff9e23121
sudo chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syyu
sudo pacman -S flatpak
flathub () {
	log "flathub"
	local -a flathub_install
	flathub_install=(
	"com.brave.Browser"
	"net.mullvad.MullvadBrowser"
)
