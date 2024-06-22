
printf "%s" "
max_parallel_downloads=10
countme=false
" | sudo tee -a /etc/dnf/dnf.conf

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


sudo dnf upgrade -y

umask 077
sudo sed -i 's/umask 022/umask 077/g' /etc/bashrc


sudo dnf remove -y anaconda* \

	zd1211-firmware atmel-firmware libertas-usb8388-firmware abrt* bluez-cups alsa-sof-firmware boost-date-time orca fedora-bookmarks mailcap open-vm-tools samba-client libreswan unbound-libs podman yajl mediawriter nano nano-default-editor thermald sos kpartx dos2unix sssd cyrus-sasl-plain geolite2* traceroute ModemManager tcpdump mozilla-filesystem nmap-ncat spice-vdagent adcli mtr realmd teamd vpnc openconnect openvpn ppp pptp rsync xorg-x11-drv-vmware hyperv* virtualbox-guest-additions qemu-guest-agent dragon kmines kpat dnfdragora akregator kmail korganizer elisa-player kamoso kwrite konversation kolourpaint krdc kmahjongg kmouth krfb kcalc kcharselect kde-connect kgpg kamera kfind kmag media-player-info mediawriter kmouth plasma-discover


sudo dnf autoremove -y
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates -y
sudo fwupdmgr update -y


sudo fedora-third-party enable
sudo fedora-third-party refresh
flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo


flatpak install flathub org.duckstation.DuckStation net.pcsx2.PCSX2 org.ppsspp.PPSSPP org.ryujinx.Ryujinx info.cemu.Cemu app.xemu.xemu com.obsproject.Studio com.heroicgameslauncher.hgl com.valvesoftware.Steam com.google.Chrome com.microsoft.Edge


sudo dnf install -y steam-devices neovim sqlite3 zsh-autosuggestions zsh-syntax-highlighting setroubleshoot newsboat ffmpeg compat-ffmpeg4 akmod-v4l2loopback yt-dlp @virtualization guestfs-tools simple-scan plasma-nm gparted fastfeth --best --allowerasing
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld

sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"


sudo bash -c 'cat > /etc/NetworkManager/conf.d/00-macrandomize.conf' <<-'EOF'
[main]
hostname-mode=none

[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=random
ethernet.cloned-mac-address=random
EOF

sudo systemctl restart NetworkManager
sudo hostnamectl hostname "localhost"
sudo sed -i 's,kernel.yama.ptrace_scope=2,#kernel.yama.ptrace_scope=2,g' /etc/sysctl.d/30_security-misc.conf
