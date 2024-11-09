# Before running these, use the command "Set-ExecutionPolicy Unrestricted -Scope Process" in Powershell

chkdsk /f
chkdsk /r

cleanmgr /sageset:l
cleanmgr /sagerun:l
cleanmgr.exe /AUTOCLEAN

powercfg.exe -h off

DISM.exe /Online /Set-ReservedStorageState /State:Disabled

DISM.exe /online /cleanup-image /startcomponentcleanup
DISM.exe /online /cleanup-image /startcomponentcleanup /resetbase

ipconfig /flushdns

wsl --install
wsl --set-default-version 2

winget remove Microsoft.OneDrive
winget install Adobe.Acrobat.Reader.64-bit Easeware.DriverEasy ElectronicArts.EADesktop EpicGames.EpicGamesLauncher Fastfetch-cli.Fastfetch GitHub.GitHubDesktop HeroicGamesLauncher.HeroicGamesLauncher Brave.Brave Mozilla.Firefox Microsoft.PowerShell Microsoft.PowerShell.Preview MullvadVPN.MullvadVPN Nvidia.GeForceNow Notepad++.Notepad++ OBSProject.OBSStudio PlayStation.PSRemotePlay PPSSPPTeam.PPSSPP Proton.ProtonPass Proton.ProtonVPN Ubisoft.Connect Valve.Steam VideoLAN.VLC Telegram.TelegramDesktop Discord.Discord 9NKSQGP7F2NH 7zip.7zip Gyan.FFmpeg Brave.Brave Zen-Team.Zen-Browser
winget upgrade --all --include-unknown

vssadmin Delete Shadows /All