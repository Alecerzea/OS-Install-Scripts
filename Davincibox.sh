# Yes I copy the name of the Bazzite project, and of course these is intended to only be run in a Fedora Container inside Distrobox, DONT RUN IT IN YOUR MAIN SYSTEM, also AMD only
sudo dnf in -y fuse fuse-libs alsa-lib alsa-plugins-pulseaudio apr apr-util dbus-libs fontconfig freetype libglvnd libglvnd-egl libglvnd-glx libICE librsvg2 libSM libX11 libxcrypt-compat libXcursor libXext libXfixes libXi libXinerama libxkbcommon libxkbcommon-x11 libXrandr libXrender libXtst libXxf86vm mesa-libGLU mtdev pulseaudio-libs rocm-opencl xcb-util xcb-util-image xcb-util-keysyms xcb-util-renderutil xcb-util-wm xdg-utils
# Now launch the .run of Davinci Resolve to install it, use these command before the command to launch it "SKIP_PACKAGE_CHECK=1"
cd /opt/resolve/libs
sudo mkdir disabled-libraries
sudo mv libglib* disabled-libraries
sudo mv libgio* disabled-libraries
sudo mv libgmodule* disabled-libraries

# Export desktop launcher to host OS (LAUNCH IT OUT OF THE CONTAINER)"
distrobox-export -a "DaVinci Resolve" 

# Side note, these is only intended for Silverblue not rebased and normal fedora, if you are in any Ublue proyect, just launch "ujust-setup-resolve" in the console, don't complicate your life buddy.