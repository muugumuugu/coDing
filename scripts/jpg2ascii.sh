for f in frames/*.jpg; do
  jp2a --width=160 -i  $f --output=$f.txt


done