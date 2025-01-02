# For Videos
# yt-dlp --format mp4
# ffmpeg -i "input.mp4" -vcodec libaom-av1 -acodec pcm_s16le "output.mkv"

# For Audios
# yt-dlp -x --audio-format mp3
# ffmpeg -i "input.mp3" -c:a pcm_s16le "output.wav"

# There is also the script from Nobara Wiki, I'll have it here just changed it to .mp4 instead of mkvs
#!/bin/bash
EXT=.mp4
mkdir -p converted
for f in *$EXT; do
NAME=$(echo $f | sed "s/$EXT//g")
ffmpeg -i "$f" -map 0:0 -map 0:1 -map 0:2 -vcodec copy -acodec pcm_s24le -f mov converted/"$NAME".mov
done