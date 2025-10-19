# https://github.com/netbirdio/pfsense-netbird/

fetch https://github.com/netbirdio/pfsense-netbird/releases/download/v0.1.3/netbird-0.56.0.pkg
fetch https://github.com/netbirdio/pfsense-netbird/releases/download/v0.1.3/pfSense-pkg-NetBird-0.1.0.pkg
pkg add -f netbird-0.56.0.pkg
pkg add -f pfSense-pkg-NetBird-0.1.0.pkg
