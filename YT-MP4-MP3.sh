#!/bin/bash

# Check for required tools
command -v yt-dlp >/dev/null 2>&1 || { echo >&2 "yt-dlp not found. Install it and try again."; exit 1; }
command -v ffmpeg >/dev/null 2>&1 || { echo >&2 "ffmpeg not found. Install it and try again."; exit 1; }

# Input from user
read -p "Enter media URL: " MEDIA_URL
read -p "Is this a video or audio? (v/a): " TYPE

FILENAME="download_$(date +%s)"

if [ "$TYPE" = "v" ]; then
    echo "[+] Downloading video..."
    yt-dlp -o "${FILENAME}_raw.mp4" --format mp4 "$MEDIA_URL"

    echo "[+] Converting to .mp4 with PCM audio..."
    ffmpeg -i "${FILENAME}_raw.mp4" -vcodec copy -acodec pcm_s16le "${FILENAME}.mp4"

    echo "[*] Cleaning up raw file..."
    rm "${FILENAME}_raw.mp4"

elif [ "$TYPE" = "a" ]; then
    echo "[+] Downloading audio as MP3..."
    yt-dlp -x --audio-format mp3 -o "${FILENAME}.mp3" "$MEDIA_URL"
else
    echo "Invalid input. Use 'v' for video or 'a' for audio."
    exit 1
fi

echo "[✓] Done."
