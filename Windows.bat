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

# Install WSL
wsl --install

# Set default WSL version to 2
wsl --set-default-version 2

# Upgrade all installed packages to the latest version
winget upgrade --all --include-unknown

# Install various packages
winget install Adobe.Acrobat.Reader.64-bit Amazon.Games ElectronicArts.EADesktop EpicGames.EpicGamesLauncher Notepad++.Notepad++ Nvidia.GeForceNow OBSProject.OBSStudio PlayStation.DualSenseFWUpdater PlayStation.PSPlus PlayStation.PSRemotePlay PPSSPPTeam.PPSSPP GOG.Galaxy Ubisoft.Connect Valve.Steam Easeware.DriverEasy Fastfetch-cli.Fastfetch Microsoft.PowerShell Microsoft.PowerShell.Preview RARLab.WinRAR VideoLAN.VLC Google.Chrome Brave.Brave Mozilla.Firefox MullvadVPN.MullvadBrowser TorProject.TorBrowser yt-dlp.yt-dlp.nightly Proton.ProtonVPN Proton.ProtonPass Microsoft.VisualStudioCode GitHub.GitHubDesktop HeroicGamesLauncher.HeroicGamesLauncher