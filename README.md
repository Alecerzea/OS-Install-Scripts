# Personalized Systems
I have personalized Linux, Windows and MacOs systems with the configuration I want.

# Windows Configuration
I use [Win11Debloat](https://github.com/Raphire/Win11Debloat) to get rid of all Microsoft Telemetry from my Windows/KVM systems before running my .ps1 script, which , disable Hibernation and some other tweaks.

Additionally, I employ [Chris Titus Tech Wintool](https://github.com/ChrisTitusTech/winutil) to overkill a bit of it as well.

I also apply some of the commands from [Windows Hardening Scripts](https://github.com/atlantsecurity/windows-hardening-scripts/tree/main) from Atlant Security.

Default Pro-key bacause I don't wanna use fricking KMS and let an Indian/Russian have full access of my PC:VK7JG-NPHTM-C97JM-9MPGT-3V66T

# Linux Configuration
My Linux setup is based on vanilla distributions, which I modify to my liking. I use a combination of scripts from [trafotin's os-install-scripts](https://gitlab.com/trafotin/os-install-scripts) and my own custom scripts.

# MacOS Configuration
I used commands from [OSX-Optimizer](https://github.com/sickcodes/osx-optimizer) and also installed [Homebrew](https://brew.sh/) with the addition of [Lulu](https://github.com/objective-see/LuLu).

I also have the plan of re-making some OSX-VMs, just for testing, I personally recommend using [ultimate-macOS-KVM](https://github.com/Coopydood/ultimate-macOS-KVM).

# KVM'S Configuration
Note too the future: use the id of your disk in case you have multiple disks in your system, I have more than 3 so I need it, using these command in the terminal "ls /dev/disk/by-id" then using "/dev/disk/by-id/HARDDRIVESERIAL" inside Virt Manager to passthrough that drive to the VM.

# GPU Passthrough
If you want to use GPU passthrough in a VM, I recommend using [quickpassthrough](https://github.com/HikariKnight/quickpassthrough). I use it in my Windows and MacOs KVMs and has been a pretty neat experience, take note only AMD GPUs works with latest MacOs, Nvidia only till Catalina.

Thankfully that's not needed in Bazzite or any Ublue project, I only rebase my system to it and the use the command "ujust setup-virtualization" and select to Enable VFIO drivers.

## GNOME JUST WORKS

# Steam-Configuration
Steam → Settings → Interface → Enable context menu focus compatibility mode

mangohud PROTON_NO_ESYNC=1 __GL_SHADER_DISK_CACHE=1 __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1 DXVK_HUD=compiler PROTON_ENABLE_NVAPI=1 PROTON_PREFER_SDL=1 PROTON_HIDE_NVIDIA_GPU=0 %command% --launcher-skip

# DaVinci Resolve in Linux
I recommend you to use [davincibox](https://github.com/zelikos/davincibox) if you wanna setup DaVinci Resolve in Linux, I personally don't like to do it locally, I prefer it in a container or in a VM with GPU Passthrough, personally I love Bazzite "ujust install-resolve" and for affinity I recommend to use [AffinityOnLinux](https://github.com/ryzendew/AffinityOnLinux), I used it in Bazzite and didn't had any issues, I also like using containers so I also use the repo [affinity-linux-distrobox](https://github.com/markusdd/affinity-linux-distrobox/).


Side Note: I recommend using [Mullvad DNS over HTTPS and TLS](https://mullvad.net/en/help/dns-over-https-and-dns-over-tls) or [Quad9 DNS](https://www.quad9.net/)for more privacy and security in the internet, I use it in my PCs as well as in my phone and has been a pretty neat experience, even though the adblocker doesn't work at all, for that I'll recommend you to set-up [PfBlocker](https://docs.netgate.com/pfsense/en/latest/packages/pfblocker.html) inside [pfSense](https://www.pfsense.org/).
