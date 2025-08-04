@echo off
setlocal enabledelayedexpansion

:: Check dependencies
where yt-dlp >nul 2>&1 || (
    echo yt-dlp is not installed or not in PATH.
    pause
    exit /b
)
where ffmpeg >nul 2>&1 || (
    echo ffmpeg is not installed or not in PATH.
    pause
    exit /b
)

set /p MEDIA_URL=Enter media URL: 
set /p TYPE=Is this a video or audio? (v/a): 

set FILENAME=download_%RANDOM%

if /i "%TYPE%"=="v" (
    echo [+] Downloading video...
    yt-dlp -o "%FILENAME%_raw.mp4" --format mp4 "%MEDIA_URL%"

    echo [+] Converting to .mp4 with PCM audio...
    ffmpeg -i "%FILENAME%_raw.mp4" -vcodec copy -acodec pcm_s16le "%FILENAME%.mp4"

    echo [*] Deleting raw file...
    del "%FILENAME%_raw.mp4"
) else if /i "%TYPE%"=="a" (
    echo [+] Downloading audio as MP3...
    yt-dlp -x --audio-format mp3 -o "%FILENAME%.mp3" "%MEDIA_URL%"
) else (
    echo Invalid input. Use 'v' or 'a'.
    pause
    exit /b
)

echo [✓] Done.
pause
