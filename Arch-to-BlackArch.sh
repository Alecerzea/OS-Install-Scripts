curl -O https://blackarch.org/strap.sh
echo bbf0a0b838aed0ec05fff2d375dd17591cbdf8aa  strap.sh | sha1sum -c
sudo chmod +x strap.sh
sudo ./strap.sh
sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/blackarch-mirrorlist
sudo pacman -Syu
sudo pacman -S metasploit nmap wireshark-cli wireshark-qt netcat
