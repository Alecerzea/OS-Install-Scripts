# For Videos
yt-dlp --format mp4

ffmpeg -i "input.mp4" -vcodec libaom-av1 -acodec pcm_s16le ".mkv"

ffmpeg -i "input.mp4" -vcodec copy -acodec pcm_s16le ".mov"

# For Audios
yt-dlp -x --audio-format mp3

ffmpeg -i "input.mp3" -c:a pcm_s16le "output.wav"
