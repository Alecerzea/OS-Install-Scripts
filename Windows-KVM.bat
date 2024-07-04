#before, in the instalation press Shift+FN+F10 then use the command oobe\bypassnro
#to let you know, I don't game in my VMs, these is just for work and testing (My job provide us with adobe licenses)

powercfg.exe -h off
winget upgrade --all --include-unknown
DISM.exe /online /cleanup-image /startcomponentcleanup
cleanmgr /sageset:l 
cleanmgr /sagerun:l 
cleanmgr.exe /AUTOCLEAN 
DISM.exe /Online /Set-ReservedStorageState /State:Disabled
winget install Brave.Brave MullvadVPN.MullvadBrowser Microsoft.VisualStudioCode Fastfetch-cli.Fastfetch Microsoft.Powershell Microsoft.PowerShell.Preview Adobe.Acrobat.Reader.64-bit GitHub.GitHubDesktop Easeware.DriverEasy Notepad++.Notepad++ VideoLAN.VLC Git.Git RARLab.WinRAR yt-dlp
#chkdsk /f
#chkdsk /r
