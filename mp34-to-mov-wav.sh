echo "Do you wanna convert you file to mov or wav? [m/w]"
read -r MW

case "$MW" in
  m|M)
    ffmpeg -i INPUT.mp4 -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pc>
    ;;
  w|W)
    ffmpeg -i INPUT.mp4 -c:a pcm_s16le OUTPUT.wav
    ;;
esac
