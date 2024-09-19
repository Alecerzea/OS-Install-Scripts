echo "Do you wanna convert you file to mov or wav? [m/w]"
read -r MW

case "$MW" in
  m|M)
    ffmpeg -i "incompatible.mp4" -vcodec libaom-av1 -acodec pcm_s16le "compatible.mkv"

    ;;
  w|W)
    ffmpeg -i INPUT.mp4 -c:a pcm_s16le OUTPUT.wav
    ;;
esac
