#These is only for Server use and testing webpages

sudo dnf -y install cockpit httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo systemctl enable --now cockpit.socket