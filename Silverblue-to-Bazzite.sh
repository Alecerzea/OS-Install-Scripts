#only do these after installing a separate browser from the default firefox on Silverblue, that version is part of the Silverblue image and the version in Bazzite is a separate flatpak

flatpak install org.mozilla.firefox

sudo rpm-ostree reset

rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/bazzite-deck-gnome:stable

systemctl reboot