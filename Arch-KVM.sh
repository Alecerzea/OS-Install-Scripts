sudo pacman -Syyu
curl -O https://blackarch.org/strap.sh
sha1sum strap.sh # should match: d062038042c5f141755ea39dbd615e6ff9e23121
sudo chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syyu
sudo pacman -S flatpak
flatpak install flathub com.brave.Browser flathub net.mullvad.MullvadBrowser