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

# Upgrade all my apps
winget upgrade --all --include-unknown

# Installing my shit
winget install Adobe.Acrobat.Reader.64-bit
winget install Amazon.Games
winget install Brave.Brave
winget install Easeware.DriverEasy
winget install ElectronicArts.EADesktop
winget install EpicGames.EpicGamesLauncher
winget install Fastfetch-cli.Fastfetch
winget install GitHub.GitHubDesktop
winget install Google.Chrome
winget install GOG.Galaxy
winget install HeroicGamesLauncher.HeroicGamesLauncher
winget install Microsoft.PowerShell
winget install Microsoft.PowerShell.Preview
winget install Microsoft.VisualStudioCode
winget install Mozilla.Firefox
winget install MullvadVPN.MullvadBrowser
winget install Nvidia.GeForceNow
winget install Notepad++.Notepad++
winget install OBSProject.OBSStudio
winget install PlayStation.DualSenseFWUpdater
winget install PlayStation.PSPlus
winget install PlayStation.PSRemotePlay
winget install PPSSPPTeam.PPSSPP
winget install Proton.ProtonPass
winget install Proton.ProtonVPN
winget install RARLab.WinRAR
winget install TorProject.TorBrowser
winget install Ubisoft.Connect
winget install Valve.Steam
winget install VideoLAN.VLC
winget install yt-dlp.yt-dlp.nightly
winget upgrade --all --include-unknown