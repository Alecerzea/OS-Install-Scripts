# https://github.com/netbirdio/pfsense-netbird/

fetch https://github.com/netbirdio/pfsense-netbird/releases/download/v0.1.19/netbird-0.65.3-x86_64.pkg
fetch https://github.com/netbirdio/pfsense-netbird/releases/download/v0.1.19/pfSense-pkg-NetBird-0.2.1-x86_64.pkg
pkg add -f netbird-0.65.3-x86_64.pkg
pkg add -f pfSense-pkg-NetBird-0.2.1-x86_64.pkg
