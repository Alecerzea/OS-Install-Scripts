rpm-ostree reset

rpm-ostree rebase ostree-image-signed:docker://ghcr.io/secureblue/silverblue-main-hardened:latest

systemctl reboot

# Post-reboot setup
ujust _install-system-flatpaks
ujust setup-virtualization
ujust configure-grub
ujust update