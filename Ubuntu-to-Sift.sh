wget https://go.dev/dl/go1.22.6.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.22.6.linux-amd64.tar.gz
export PATH=$PATH:/usr/go/local/bin
wget https://github.com/ekristen/cast/releases/download/v0.14.44/cast-v0.14.44-linux-amd64.deb
sudo dpkg -i cast-v0.14.44-linux-amd64.deb
sudo su
cast install teamdfir/sift-saltstack