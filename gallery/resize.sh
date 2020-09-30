for img in $(ls *.jpg); do
    convert "${img}" -resize 640x360\> "${img}"
done
