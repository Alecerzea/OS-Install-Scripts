#only do these after installing a separate browser from the default firefox on Silverblue, that version is part of the Silverblue image and the version in Bazzite is a separate flatpak

sudo rpm-ostree reset

rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/bazzite-deck-gnome:stable

systemctl reboot

#after the reboot use these code to set-up virtualization and the ley for secure boot
#ujust _install-system-flatpaks
#ujust setup-virtualization
#ujust enroll-secure-boot-key
#password "ublue-os"
