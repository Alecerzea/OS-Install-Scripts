echo "Have you already rebased your System? [Y/N]"
read -r R

case "R" in
  n|N)
    # Rebasing the system to Bazzite
    rpm-ostree reset

    rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/bazzite-deck-gnome:stable

    sudo systemctl reboot
    ;;
  y|Y)
    # Installing system packages and setting up virtualization
    ujust setup-virtualization
    ujust configure-grub
    ujust install-resolve
    ujust update
    ;;
esac
