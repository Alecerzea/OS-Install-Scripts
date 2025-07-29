mkdir -p converted

process_video() {
    read -p "Enter the video URL: " url
    echo "[Downloading video as .mp4...]"
    python3 -m yt-dlp -f mp4 "$url" -o "video_raw.%(ext)s" || { echo "❌ Download failed."; exit 1; }

    input_file=$(ls video_raw.* 2>/dev/null)
    if [[ -z "$input_file" ]]; then
        echo "❌ No video file found."
        exit 1
    fi

    echo "[Converting to .mov (DNxHR + PCM) for DaVinci Resolve Free...]"
    ffmpeg -i "$input_file" -c:v dnxhd -profile:v dnxhr_hq -c:a pcm_s16le "converted/output.mov"
    echo "✅ Saved as: converted/output.mov"
}

process_audio() {
    read -p "Enter the audio or video URL: " url
    echo "[Downloading audio as .mp3...]"
    python3 -m yt_dlp -x --audio-format mp3 "$url" -o "audio_raw.%(ext)s" || { echo "❌ Download failed."; exit 1; }

    input_file=$(ls audio_raw.* 2>/dev/null)
    if [[ -z "$input_file" ]]; then
        echo "❌ No audio file found."
        exit 1
    fi

    echo "[Converting to .wav (PCM 16-bit)]"
    ffmpeg -i "$input_file" -c:a pcm_s16le "converted/output.wav"
    echo "✅ Saved as: converted/output.wav"
}

clear
echo "🎬 DaVinci Resolve Free Media Converter"
echo "---------------------------------------"
echo "1. Download & Convert Video (.mp4 → .mov [DNxHR + PCM])"
echo "2. Download & Convert Audio (.mp3 → .wav [PCM])"
echo

read -p "Select an option (1 or 2): " choice

case $choice in
    1)
        process_video
        ;;
    2)
        process_audio
        ;;
    *)
        echo "❌ Invalid choice. Please run the script again."
        ;;
esac
