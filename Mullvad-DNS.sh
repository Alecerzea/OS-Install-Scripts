sudo systemctl enable systemd-resolved
sudo bash -c 'cat > /etc/systemd/resolved.conf' <<'EOL'
[Resolve]
DNS=194.242.2.4
DNSSEC=no
DNSOverTLS=yes
Domains=~.
EOL
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
sudo systemctl restart systemd-resolved