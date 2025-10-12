# Personalized Systems
I have personalized Linux, Windows and MacOs systems with the configuration I want.

# Windows Configuration
I use [Win11Debloat](https://github.com/Raphire/Win11Debloat) to get rid of all Microsoft Telemetry from my Windows/KVM systems before running my .ps1 script, which , disable Hibernation and some other tweaks.

Additionally, I employ [Chris Titus Tech Wintool](https://github.com/ChrisTitusTech/winutil) to overkill a bit of it as well.

I also apply some of the commands from [Windows Hardening Scripts](https://github.com/atlantsecurity/windows-hardening-scripts/tree/main) from Atlant Security.

```
 iwr https://raw.githubusercontent.com/Alecerzea/OS-Install-Scripts/main/Windows.ps1 | iex
 ```

Default Pro-key bacause I don't wanna use fricking KMS and let an Indian/Russian/Muslim Terrorist have full access of my PC:VK7JG-NPHTM-C97JM-9MPGT-3V66T

```
start ms-cxh:localonly
```
# Linux Configuration
My Linux setup is based on vanilla distributions, which I modify to my liking. I use a combination of scripts from [trafotin's os-install-scripts](https://gitlab.com/trafotin/os-install-scripts) and my own custom scripts.

# MacOS Configuration
I used commands from [OSX-Optimizer](https://github.com/sickcodes/osx-optimizer) and also installed [Homebrew](https://brew.sh/) with the addition of [Lulu](https://github.com/objective-see/LuLu).

I also have the plan of re-making some OSX-VMs, just for testing, I personally recommend using [ultimate-macOS-KVM](https://github.com/Coopydood/ultimate-macOS-KVM).

If you plan on using [MacUtil from ChrisTitus](https://github.com/ChrisTitusTech/macutil)

launch these command from the terminal

```
chmod -R u+rwx ~/Downloads/MacUtil-Universal.app
```
# KVM'S Configuration
Note too the future: use the id of your disk in case you have multiple disks in your system, I have more than 3 so I need it, using these command in the terminal "ls /dev/disk/by-id" then using "/dev/disk/by-id/HARDDRIVESERIAL" inside Virt Manager to passthrough that drive to the VM.

# GPU Passthrough
If you want to use GPU passthrough in a VM, I recommend using [quickpassthrough](https://github.com/HikariKnight/quickpassthrough). I use it in my Windows and MacOs KVMs and has been a pretty neat experience, take note only AMD GPUs works with latest MacOs, Nvidia only till Catalina.

Thankfully that's not needed in Bazzite or any Ublue project, I only rebase my system to it and the use the command "ujust setup-virtualization" and select to Enable VFIO drivers.

## GNOME JUST WORKS

# Steam-Configuration
Steam → Settings → Interface → Enable context menu focus compatibility mode

mangohud PROTON_NO_ESYNC=1 __GL_SHADER_DISK_CACHE=1 __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1 DXVK_HUD=compiler PROTON_ENABLE_NVAPI=1 PROTON_PREFER_SDL=1 PROTON_ENABLE_WAYLAND=1 PROTON_ENABLE_HDR=1 %command%
