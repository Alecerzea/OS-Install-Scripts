sudo rpm-ostree reset

sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/bazzite-deck-gnome:stable

sudo systemctl reboot

# Post-reboot setup
sudo ujust setup-virtualization
sudo ujust configure-grub
sudo ujust update