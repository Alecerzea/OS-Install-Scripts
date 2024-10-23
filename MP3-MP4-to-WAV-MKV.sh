# For Videos
ffmpeg -i input.mp4 -c:v prores_ks -profile:v 3 -qscale:v 9 -acodec pcm_s16le output.mov

# For Audios
ffmpeg -i input.mp3 -c:a pcm_s16le output.wav