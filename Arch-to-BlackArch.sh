curl -O https://blackarch.org/strap.sh
echo bbf0a0b838aed0ec05fff2d375dd17591cbdf8aa  strap.sh | sha1sum -c
sudo chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syu
sudo pacman -S metasploit nmap wireshark-cli wireshark-qt netcat 
