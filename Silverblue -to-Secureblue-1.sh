#!/bin/bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/secureblue/silverblue-main-hardened:latest
systemctl reboot