echo "Do you already rebased to bazzite? [Y/N]"
read -r BAZ

case "$BAZ" in
    ;;
  n|N)
    rpm-ostree reset
    rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/bazzite-gnome:stable
    ;;
  y|Y)
    ujust update
    ujust enable-tailscale
    ujust install-resolve
    sudo  tailscale up --accept-routes --reset
    ujust setup-virtualization
    ujust regenerate-grub
esac
