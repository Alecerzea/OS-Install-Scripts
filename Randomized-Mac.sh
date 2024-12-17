echo "b08dfa6083e7567a1921a715000001fb" | sudo tee /etc/machine-id
sudo bash -c 'cat > /etc/NetworkManager/conf.d/00-macrandomize.conf' <<-'EOF' 
[device] 
wifi.scan-rand-mac-address=yes 
[connection] 
wifi.cloned-mac-address=random 
ethernet.cloned-mac-address=random 
EOF 