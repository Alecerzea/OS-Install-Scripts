# Before, in the instalation press Shift+FN+F10 then use the command oobe\bypassnro

# chkdsk /f
# chkdsk /r
# cleanmgr /sageset:l 
# cleanmgr /sagerun:l 
# cleanmgr.exe /AUTOCLEAN 

powercfg.exe -h off

DISM.exe /Online /Set-ReservedStorageState /State:Disabled

# DISM.exe /online /cleanup-image /startcomponentcleanup

# ipconfig /flushdns 

wsl --install
wsl --set-default-version 2

winget upgrade --all --include-unknown

winget install Adobe.Acrobat.Reader.64-bit Amazon.Games ElectronicArts.EADesktop EpicGames.EpicGamesLauncher Notepad++.Notepad++ Nvidia.GeForceNow OBSProject.OBSStudio PlayStation.DualSenseFWUpdater PlayStation.PSPlus PlayStation.PSRemotePlay PPSSPPTeam.PPSSPP Brave.Brave GOG.Galaxy Ubisoft.Connect Valve.Steam Easeware.DriverEasy Fastfetch-cli.Fastfetch Git.Git GitHub.GitHubDesktop Microsoft.PowerShell Microsoft.PowerShell.Preview Microsoft.SQLServer.2022.Developer Microsoft.SQLServerManagementStudio Microsoft.VisualStudioCode MullvadVPN.MullvadBrowser RARLab.WinRAR VideoLAN.VLC yt-dlp.yt-dlp Proton.ProtonVPN Proton.ProtonPass