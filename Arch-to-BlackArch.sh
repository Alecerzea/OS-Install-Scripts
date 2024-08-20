# Setting up Blackarch
curl -O https://blackarch.org/strap.sh
sudo chmod +x strap.sh
sudo ./strap.sh

# Updating the package list and install tools I use regularly
sudo pacman -Syyu
sudo pacman -S metasploit nmap wireshark netcat