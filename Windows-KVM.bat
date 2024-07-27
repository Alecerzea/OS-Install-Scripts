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

winget install Adobe.Acrobat.Reader.64-bit 
winget install Brave.Brave 
winget install Easeware.DriverEasy 
winget install Fastfetch-cli.Fastfetch 
winget install Git.Git 
winget install GitHub.GitHubDesktop 
winget install Microsoft.PowerShell 
winget install Microsoft.PowerShell.Preview 
winget install Microsoft.SQLServer.2022.Developer 
winget install Microsoft.SQLServerManagementStudio 
winget install Microsoft.VisualStudioCode 
winget install MullvadVPN.MullvadBrowser 
winget install Notepad++.Notepad++ 
winget install RARLab.WinRAR 
winget install VideoLAN.VLC 
winget install yt-dlp.yt-dlp

winget upgrade --all --include-unknown