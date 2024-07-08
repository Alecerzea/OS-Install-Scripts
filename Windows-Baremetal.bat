powercfg.exe h off
winget upgrade --all --include-unknown
#DISM.exe /online /cleanup-image /startcomponentcleanup
cleanmgr /sageset:l 
cleanmgr /sagerun:l 
cleanmgr.exe /AUTOCLEAN
DISM.exe /Online /Set-ReservedStorageState /State:Disabled
winget install Proton.ProtonVPN Proton.ProtonPass Fastfetch-cli.Fastfetch Microsoft.Powershell Microsoft.PowerShell.Preview Adobe.Acrobat.Reader.64-bit Easeware.DriverEasy OBSProject.OBSStudio Notepad++.Notepad++ VideoLAN.VLC Valve.Steam EpicGames.EpicGamesLauncher GOG.Galaxy Amazon.Games Ubisoft.Connect ElectronicArts.EADesktop PPSSPPTeam.PPSSPP RARLab.WinRAR Google.Chrome.EXE Mozilla.Firefox Nvidia.GeForceNow PlayStation.PSRemotePlay PlayStation.PSPlus PlayStation.DualSenseFWUpdater yt-dlp.yt-dlp
wsl --install
wsl --set-default-version 2
#ipconfig /flushdns /it deletes the incognito out of your Router, like Skipper says: you haven't seen anything 
#chkdsk /f
#chkdsk /r
