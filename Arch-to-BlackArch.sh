curl -O https://blackarch.org/strap.sh
sudo chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syu
sudo pacman -S metasploit nmap wireshark-cli wireshark-qt netcat emailharvester SocialScan
