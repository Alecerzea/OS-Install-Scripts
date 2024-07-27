powercfg.exe h off

winget upgrade --all --include-unknown

winget install Adobe.Acrobat.Reader.64-bit
winget install Amazon.Games
winget install Brave.Brave
winget install Easeware.DriverEasy
winget install ElectronicArts.EADesktop
winget install EpicGames.EpicGamesLauncher
winget install Fastfetch-cli.Fastfetch
winget install GitHub.GitHubDesktop
winget install GOG.Galaxy
winget install Microsoft.Powershell
winget install Microsoft.PowerShell.Preview
winget install Microsoft.VisualStudioCode
winget install MullvadVPN.MullvadBrowser
winget install Notepad++.Notepad++
winget install Nvidia.GeForceNow
winget install OBSProject.OBSStudio
winget install PlayStation.DualSenseFWUpdater
winget install PlayStation.PSPlus
winget install PlayStation.PSRemotePlay
winget install PPSSPPTeam.PPSSPP
winget install Proton.ProtonPass
winget install Proton.ProtonVPN
winget install RARLab.WinRAR
winget install Ubisoft.Connect
winget install Valve.Steam
winget install VideoLAN.VLC
winget install yt-dlp.yt-dlp

wsl --install
wsl --set-default-version 2

DISM.exe /Online /Set-ReservedStorageState /State:Disabled

# DISM.exe /online /cleanup-image /startcomponentcleanup

# cleanmgr /sageset:l
# cleanmgr /sagerun:l
# cleanmgr.exe /AUTOCLEAN

# chkdsk /f
# chkdsk /r

# ipconfig /flushdns