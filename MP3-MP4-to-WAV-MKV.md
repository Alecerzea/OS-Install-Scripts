# For Videos
yt-dlp --format mp4
ffmpeg -i "incompatible.mp4" -vcodec libaom-av1 -acodec pcm_s16le "compatible.mkv"
ffmpeg -i "incompatible.mp4" -vcodec copy -acodec pcm_s16le "compatible.mov"

# For Audios
yt-dlp -x --audio-format mp3
ffmpeg -i "input.mp3" -c:a pcm_s16le "output.wav"