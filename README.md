# Personalized Systems
I have personalized Linux, Windows and MacOs systems with the configuration I want.

# Windows Configuration
I use [Win11Debloat](https://github.com/Raphire/Win11Debloat) to get rid of all Microsoft Telemetry from my Windows/KVM systems before running my .ps1 script, which Disable Swap, stop the screen to turn off, disable Hibernation, etc.

# Linux Configuration
My Linux setup is based on vanilla distributions, which I modify to my liking. I use a combination of scripts from [trafotin's os-install-scripts](https://gitlab.com/trafotin/os-install-scripts) and my own custom scripts.

# Note on Distros that base on another (Like Ubuntu/Manjaro/Nobara):
I recommend using vanilla bleeding edge-distributions(Arch, Fedora, SUSE) instead of "based-on-something" distros. I say these cause I've already tried using my scripts on distros like Nobara, but not everything worked out of the box.

Nothing but love for GE and all his work for Linux Gaming, but man, you could have just set up your dad in normal Fedora with your drivers app XD.

# MacOS Configuration
I used commands from [OSX-Optimizer](https://github.com/sickcodes/osx-optimizer) and also installed [Homebrew](https://brew.sh/) with the addition of [Lulu](https://github.com/objective-see/LuLu) with some custom rules to get rid of Apple Telemetry.

I also have the plan of re-making some OSX-VMs, just for testing, I personally recommend using [ultimate-macOS-KVM
](https://github.com/Coopydood/ultimate-macOS-KVM)

# GPU Passthrough
If you want to use GPU passthrough in a VM, I recommend using [quickpassthrough](https://github.com/HikariKnight/quickpassthrough). I use it in my Windows and MacOs KVMs and has been a pretty neat experience, take note only AMD GPUs works with latest MacOs, Nvidia only till Catalina.

Note that's not needed in Bazzite or any Ublue project, I only rebase my system to it and the use the command "ujust setup-virtualization" and select to use the IOMMU drivers.

Although I have some gaming stores install on my KVMs, I don't use them for gaming (and wouldn't have a reason to use them as proton exist and has been a pretty neat experience without the need of a VM), mostly to work with Davinci Resolve and Affinity. I undertand people would like to play games like Valorant or Warzone, but since they have kernel-level anticheat, it's kinda impossible to run them on linux or in a Windows-KVM without getting Banned xd, I personally like to play them on my PS5.

# Linux Config
My Linux setup is simple: GNOME with AMD/Intel GPU. NVIDIA GPUs on Linux are a headache to configure, at least for me XD. I also prefer to use Secure Boot without adding a custom key that I need to re-add everytime I update my kernel. I'm not a fan of KDE,it always broke in my install XD, the most customization I do is changing the wallpaper.

## GNOME JUST WORKS

# DaVinci Resolve in Linux
I recommend you to use [davincibox](https://github.com/zelikos/davincibox) if you wanna setup DaVinci Resolve in Linux, I personally don't like to do it locally, I prefer it in a container or in a VM with GPU Passthrough 


Side Note: I recommend using [Mullvad DNS over HTTPS and TLS](https://mullvad.net/en/help/dns-over-https-and-dns-over-tls) for more privacy and security in the internet, I use it in my PCs as well as in my phone and has been a pretty neat experience, even though the adblocker didn't worked at all. 
