#before, in the instalation press Shift+FN+F10 then use the command oobe\bypassnro
#to let you know, I don't game in my VMs, these is just for work and testing (My job provide us with adobe licenses)

powercfg.exe -h off

winget upgrade --all --include-unknown

#DISM.exe /online /cleanup-image /startcomponentcleanup
#DISM.exe /online /cleanup-image /startcomponentcleanup /resetbase

cleanmgr /sageset:l 
cleanmgr /sagerun:l 

#cleanmgr.exe /AUTOCLEAN 

DISM.exe /Online /Set-ReservedStorageState /State:Disabled

winget install Brave.Brave MullvadVPN.MullvadBrowser Microsoft.VisualStudioCode Fastfetch-cli.Fastfetch Microsoft.Powershell Microsoft.PowerShell.Preview Adobe.Acrobat.Reader.64-bit GitHub.GitHubDesktop Easeware.DriverEasy Notepad++.Notepad++ VideoLAN.VLC Git.Git RARLab.WinRAR yt-dlp.yt-dlp

#ipconfig /flushdns #it deletes the incognito out of your Router, like Skipper says: you haven't seen anything 
#chkdsk /f
#chkdsk /r