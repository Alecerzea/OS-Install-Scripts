curl -O https://blackarch.org/strap.sh
sha1sum strap.sh 
sudo chmod +x strap.sh
sudo ./ strap.sh
sudo pacman -S metasploit nmap wireshark-cli wireshark-qt netcat