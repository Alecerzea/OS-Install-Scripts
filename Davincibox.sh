# Yes I copy the name of the Bazzite project and the [github one](https://github.com/zelikos/davincibox), and of course these is intended to only be run in a Fedora Container inside Distrobox, DONT RUN IT IN YOUR MAIN SYSTEM, also AMD only
sudo dnf -y install alsa-plugins-pulseaudio libxcrypt-compat xcb-util-renderutil xcb-util-wm pulseaudio-libs xcb-util xcb-util-image xcb-util-keysyms libxkbcommon-x11 libXrandr libXtst mesa-libGLU mtdev libSM libXcursor libXi libXinerama libxkbcommon libglvnd-egl libglvnd-glx libglvnd-opengl libICE librsvg2 libSM libX11 libXcursor libXext libXfixes libXi libXinerama libxkbcommon libxkbcommon-x11 libXrandr libXrender libXtst libXxf86vm mesa-libGLU mtdev pulseaudio-libs xcb-util alsa-lib apr apr-util fontconfig freetype libglvnd fuse-libs rocm-openCL

# Now launch the .run of Davinci Resolve to install it, use these command before the command to launch it "SKIP_PACKAGE_CHECK=1"
usermod -aG render $(whoami)
distrobox-export -a "DaVinci Resolve" 

# Side note, if you are in any Ublue proyect, just launch "ujust setup-resolve" in the console, don't complicate your life buddy.