

for file in *.webp; do
  [ -e "$file" ] || continue  

  basename="${file%.*}"
  echo "Converting $file to ${basename}.jpg..."

  ffmpeg -i "$file" -qscale:v 2 "${basename}.jpg"

  if [ $? -eq 0 ]; then
    echo "Succesfull conversion. Deleting $file..."
    rm "$file"
  else
    echo "❌ Error during conversion of $file"
  fi
done
