#These is only for Server use

sudo dnf -y install cockpit httpd
sudo systemctl enable --now cockpit.socket