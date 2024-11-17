# Personalized Systems
I have personalized Linux, Windows and MacOs systems with the configuration I want.

# Windows Configuration
I use [Win11Debloat](https://github.com/Raphire/Win11Debloat) to get rid of all Microsoft Telemetry from my Windows/KVM systems before running my .ps1 script, which , disable Hibernation and some other tweaks.

Additionally, I employ [Chris Titus Tech Wintool](https://github.com/ChrisTitusTech/winutil) to overkill a bit of it as well, I also used [NTLite](https://www.ntlite.com/) to create a Windows iso to get an account that doesn't need a Microsoft account to install it.

# Linux Configuration
My Linux setup is based on vanilla distributions, which I modify to my liking. I use a combination of scripts from [trafotin's os-install-scripts](https://gitlab.com/trafotin/os-install-scripts) and my own custom scripts.

I only use GNOME with AMD/Intel GPU. NVIDIA GPUs on Linux are a headache to configure, at least for me XD. I also prefer to use Secure Boot without adding a custom key that I need to re-add everytime I update my kernel. I'm not a fan of KDE and the most customization I do is changing the wallpaper.

# MacOS Configuration
I used commands from [OSX-Optimizer](https://github.com/sickcodes/osx-optimizer) and also installed [Homebrew](https://brew.sh/) with the addition of [Lulu](https://github.com/objective-see/LuLu).

I also have the plan of re-making some OSX-VMs, just for testing, I personally recommend using [ultimate-macOS-KVM](https://github.com/Coopydood/ultimate-macOS-KVM).

# KVM'S Configuration
Note too the future: use the id of your disk in case you have multiple disks in your system, I have more than 3 so I need it, using these command in the terminal "ls /dev/disk/by-id" then using "/dev/disk/by-id/HARDDRIVESERIAL" inside Virt Manager to passthrough that drive to the VM.

# GPU Passthrough
If you want to use GPU passthrough in a VM, I recommend using [quickpassthrough](https://github.com/HikariKnight/quickpassthrough). I use it in my Windows and MacOs KVMs and has been a pretty neat experience, take note only AMD GPUs works with latest MacOs, Nvidia only till Catalina.

Thankfully that's not needed in Bazzite or any Ublue project, I only rebase my system to it and the use the command "ujust setup-virtualization" and select to use the IOMMU drivers.

## GNOME JUST WORKS

# DaVinci Resolve in Linux
I recommend you to use [davincibox](https://github.com/zelikos/davincibox) if you wanna setup DaVinci Resolve in Linux, I personally don't like to do it locally, I prefer it in a container or in a VM with GPU Passthrough, also I recommend to use handbrake to convert mp4 to mkv AV1 files, mp3 to wav on terminal is more comfortable to me.


Side Note: I recommend using [Mullvad DNS over HTTPS and TLS](https://mullvad.net/en/help/dns-over-https-and-dns-over-tls) for more privacy and security in the internet, I use it in my PCs as well as in my phone and has been a pretty neat experience, even though the adblocker doesn't work at all, for that I'll recommend you to set-up [Aguard](https://adguard.com/en/welcome.html) inside [pfSense](https://www.pfsense.org/).