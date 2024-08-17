# Download the strap.sh script from BlackArch
curl -O https://blackarch.org/strap.sh

# Make the script executable
sudo chmod +x strap.sh

# Run the script
sudo ./strap.sh

# Update the package list and install required tools
sudo pacman -Syyu
sudo pacman -S metasploit nmap wireshark netcat