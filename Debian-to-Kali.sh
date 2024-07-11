sudo curl https://archive.kali.org/archive-key.asc -o /etc/apt/trusted.gpg.d/kali-archive-key.asc
sudo sh -c "echo 'deb http://http.kali.org/kali kali-rolling main non-free contrib' >> /etc/apt/sources.list"
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo reboot
sudo apt autoremove --purge
sudo apt install kali-linux-headless
sudo apt clean