rpm-ostree reset

rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/bazzite-deck-gnome:stable

sudo systemctl reboot

# Post-reboot setup
ujust setup-virtualization
ujust configure-grub
ujust update
ujust_install-system-flatpaks