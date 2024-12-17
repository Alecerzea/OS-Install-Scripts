echo "Do you already rebased to bazzite? [Y/N]"
read -r BAZ

case "$BAZ" in
    ;;
  n|N)
    rpm-ostree reset
    rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/bazzite-deck-gnome:stable
    ;;
  y|Y)
    ujust _install-system-flatpaks
    ujust update
    ujust install-resolve
    ujust setup-virtualization
    ujust regenerate-grub
esac