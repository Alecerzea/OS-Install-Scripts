sudo sysctl -w net.ipv4.conf.all.send_redirects=0
sudo sysctl -w net.ipv4.conf.default.send_redirects=0
sudo sysctl -w net.ipv4.ip_forward=0
sudo sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
sudo sysctl -w net.ipv4.conf.all.rp_filter=1
sudo sysctl -w net.ipv4.conf.default.rp_filter=1
sudo sysctl -w net.ipv4.tcp_syncookies=1
sudo sysctl -w net.ipv4.route.flush=1

echo "b08dfa6083e7567a1921a715000001fb" | sudo tee /etc/machine-id
sudo bash -c 'cat > /etc/NetworkManager/conf.d/00-macrandomize.conf' <<-'EOF' 
[device] 
wifi.scan-rand-mac-address=yes 
[connection] 
wifi.cloned-mac-address=random 
ethernet.cloned-mac-address=random 
EOF 

sudo systemctl restart NetworkManager

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