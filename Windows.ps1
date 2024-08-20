# Before, in the instalation press Shift+FN+F10 then use the command oobe\bypassnro or a@a.com or no@thankyou.com

# Fix errors on the disk
chkdsk /f

# Locate bad sectors and recover readable information
chkdsk /r

# Configure Disk Cleanup tool to remove unnecessary files
cleanmgr /sageset:l

# Run Disk Cleanup tool to remove unnecessary files
cleanmgr /sagerun:l

# Run Disk Cleanup tool in automatic mode
cleanmgr.exe /AUTOCLEAN

# Disable hibernation to free up disk space
powercfg.exe -h off

# Disable reserved storage
DISM.exe /Online /Set-ReservedStorageState /State:Disabled

# Remove unnecessary components and files from the Windows image
DISM.exe /online /cleanup-image /startcomponentcleanup

# Flush DNS resolver cache
ipconfig /flushdns

# Install WSL and set default to version 2
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
    "TorProject.TorBrowser"
    "Ubisoft.Connect"
    "Valve.Steam"
    "VideoLAN.VLC"
    "yt-dlp.yt-dlp.nightly"
)

# Install the packages
foreach ($package in $packages) {
    winget install $package
}

# Upgrade all packages
winget upgrade --all --include-unknown