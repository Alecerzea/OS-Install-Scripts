echo "Have you already rebased your System? [Y/N]"
read -r R

case "R" in
  n|N)
    # Rebasing the system to Secure-Blue
    rpm-ostree reset

    rpm-ostree rebase ostree-image-signed:docker://ghcr.io/secureblue/silverblue-main-hardened:latest

    systemctl reboot
    ;;
  y|Y)
    # Installing system packages for me
    ujust _install-system-flatpaks
    ujust setup-virtualization
    ujust configure-grub
    ujust update
    ;;
esac