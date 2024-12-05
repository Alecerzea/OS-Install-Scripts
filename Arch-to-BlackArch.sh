curl -O https://blackarch.org/strap.sh
sudo chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syyu
sudo pacman -S metasploit nmap wireshark-cli wireshark-qt netcat