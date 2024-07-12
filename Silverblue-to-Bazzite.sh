#only do these after installing a separate browser from the default firefox on Silverblue, that version is part of the Silverblue image and the version in Bazzite is a separate flatpak

sudo rpm-ostree reset

rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/bazzite-deck-gnome:stable

systemctl reboot

#after the reboot use these code to set-up virtualization and the ley for secure boot
#ujust setup-virtualization
#ujust _install-system-flatpaks
#sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/g' /etc/libvirt/libvirtd.conf
#sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/g' /etc/libvirt/libvirtd.conf
#sudo systemctl enable libvirtd
#sudo usermod -aG libvirt "$(whoami)"
#ujust enroll-secure-boot-key
#password "ublue-os"
