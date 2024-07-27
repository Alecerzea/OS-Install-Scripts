sudo rpm-ostree reset

rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/bazzite-deck-gnome:stable

systemctl reboot

# ujust setup-virtualization
# ujust enroll-secure-boot-key
# password "ublue-os"
# ujust configure-grub
# ujust update