# During the instalation press Shift+FN+F10 then use the command oobe\bypassnro 
# Or when the system ask you to log in, use a@a.com or no@thankyou.com to bypass the account adding to windows

# Fixing errors on the disk
chkdsk /f

# Locating bad sectors and recovering readable information
chkdsk /r

# Configure=ing Disk Cleanup tool to remove unnecessary files
cleanmgr /sageset:l

# Running Disk Cleanup tool to remove unnecessary files
cleanmgr /sagerun:l

# Running Disk Cleanup tool in automatic mode
cleanmgr.exe /AUTOCLEAN

# Disabling hibernation
powercfg.exe -h off

# Disabling reserved storage
DISM.exe /Online /Set-ReservedStorageState /State:Disabled

# Remove unnecessary components and files from the Windows image
DISM.exe /online /cleanup-image /startcomponentcleanup

# Flush DNS resolver cache
ipconfig /flushdns

# Installing WSL and set default to version 2
wsl --install
wsl --set-default-version 2

# Installing my shit
$packages = @(
    "Adobe.Acrobat.Reader.64-bit"
    "Brave.Brave"
    "Easeware.DriverEasy"
    "ElectronicArts.EADesktop"
    "Fastfetch-cli.Fastfetch"
    "GitHub.GitHubDesktop"
    "HeroicGamesLauncher.HeroicGamesLauncher"
    "Microsoft.PowerShell"
    "Microsoft.PowerShell.Preview"
    "Microsoft.VisualStudioCode"
    "MullvadVPN.MullvadBrowser"
    "Nvidia.GeForceNow"
    "Notepad++.Notepad++"
    "OBSProject.OBSStudio"
    "PlayStation.DualSenseFWUpdater"
    "PlayStation.PSPlus"
    "PlayStation.PSRemotePlay"
    "PPSSPPTeam.PPSSPP"
    "Proton.ProtonPass"
    "Proton.ProtonVPN"
    "RARLab.WinRAR"
    "Ubisoft.Connect"
    "Valve.Steam"
    "VideoLAN.VLC"
    "yt-dlp.yt-dlp"
    "GianlucaPernigotto.Videomass"
)

foreach ($package in $packages) {
    winget install $packages
}

# Upgrading all packages
winget upgrade --all --include-unknown

# Set the display to never turn off
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::SetThreadState([System.Windows.Forms.ApplicationThreadState]::AlwaysOnTop)