# these is a script based on the github [Affinitybox](https://github.com/markusdd/affinity-linux-distrobox)

echo "Do you wanna install or update your Apps? I/U"
read -r AFB

case "$AFB" in
  i|I)
   distrobox create -n Affinitybox -i archlinux
   distrobox enter Affinitybox
   sudo pacman -Syu nano
   sudo sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf
   sudo pacman -Syu alsa-lib alsa-plugins autoconf bison cups desktop-file-utils flex fontconfig freetype2 gcc-libs gettext gnutls gst-plugins-bad gst-plugins-base gst-plugins-base-libs gst-plugins-good gst-plugins-ugly libcups libgphoto2 libpcap libpulse libunwind libxcomposite libxcursor libxi libxinerama libxkbcommon libxrandr libxxf86vm mesa mesa-libgl mingw-w64-gcc opencl-headers opencl-icd-loader pcsclite perl samba sane sdl2 unixodbc v4l-utils vulkan-headers vulkan-icd-loader wayland wine-gecko wine-mono
   sudo pacman -Syu git winetricks gcc pkgconfig make
   cd ~/Documents/
   git clone https://gitlab.com/xkero/rum $HOME/Documents/rum
   cp "$HOME/Documents/rum/rum" "$HOME/.local/bin/rum"
   git clone https://gitlab.winehq.org/ElementalWarrior/wine.git ElementalWarrior-wine
   cd ElementalWarrior-wine/
   git switch affinity-photo3-wine9.13-part3
   mkdir winewow64-build/ wine-install/
   cd winewow64-build/
   ../configure --prefix="$HOME/Documents/ElementalWarrior-wine/wine-install" --enable-archs=i386,x86_64
   make -j 16
   make install -j16
   sudo mkdir -p /opt/wines
   sudo chown $USER:$USER /opt/wines
   cp --recursive "$HOME/Documents/ElementalWarrior-wine/wine-install" "/opt/wines/affinity-photo3-wine9.13-part3"
   ln -s /opt/wines/affinity-photo3-wine9.13-part3/bin/wine /opt/wines/affinity-photo3-wine9.13-part3/bin/wine64
   rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity wineboot --init
   rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity winetricks --unattended dotnet48 corefonts
   rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity wine winecfg -v win11
   rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity winetricks renderer=vulkan
   rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity wine winecfg
   cd $HOME/.wineAffinity/drive_c/windows/system32
   mkdir WinMetadata
   cd WinMetadata/
   unzip ~/Downloads/WinMetadata.zip 
   rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity wine ~/Downloads/affinity-designer-msi-2.5.5.exe 
   rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity wine ~/Downloads/affinity-photo-msi-2.5.5.exe 
   rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity wine "$HOME/.wineAffinity/drive_c/Program Files/Affinity/Designer 2/Designer.exe"
   rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity wine "$HOME/.wineAffinity/drive_c/Program Files/Affinity/Photo 2/Photo.exe"
   mkdir -p ~/.local/share/icons/
   wget https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Affinity_Designer_V2_icon.svg/512px-Affinity_Designer_V2_icon.svg.png -O ~/.local/share/icons/Designer2.png
   wget https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Affinity_Photo_V2_icon.svg/512px-Affinity_Photo_V2_icon.svg.png -O ~/.local/share/icons/Photo2.png
   wget https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Affinity_Publisher_V2_icon.svg/512px-Affinity_Publisher_V2_icon.svg.png -O ~/.local/share/icons/Publisher2.png
   exit
   mkdir -p ~/.local/share/applications/
   cp ~/Downloads/Photo.desktop ~/.local/share/applications/Photo.desktop
   cp ~/Downloads/Publisher.desktop ~/.local/share/applications/Publisher.desktop
   cp ~/Downloads/Designer.desktop ~/.local/share/applications/Designer.desktop
    ;;
  u|U)
    distrobox enter Affintybox
    rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity wine ~/Downloads/affinity-designer-msi-2.5.5.exe 
    rum affinity-photo3-wine9.13-part3 $HOME/.wineAffinity wine ~/Downloads/affinity-photo-msi-2.5.5.exe 
    ;;
esac
