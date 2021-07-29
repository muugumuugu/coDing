loop thru directories
```
 for d in ./*; do   if [ -d "$d" ]; then     echo "$d";   fi; done
```

delete files
```
for d in ./*; do   if [ -d "$d" ]; then  cd $d; rm *.mp3; cd .. ;   fi; done
```
rename files
```
rename -v  's/search regex/replacingstring/' *
```
make thumbnails
```
mogrify  -format webp -path thumbs -thumbnail 200x200 *.png
mogrify  -format webp -path thumbs -thumbnail 200x200 *.gif[0]
mogrify  -format webp -path thumbs -thumbnail 200x200 *.pdf[0]
mogrify  -format webp -path thumbs -thumbnail 200x200 *.djvu[0]
mogrify  -format webp -path thumbs -thumbnail 200x200 *.jpg
for f in *.pdf; do convert -thumbnail x300 -background white -alpha remove "$f"[0] "${f%.pdf}.png"; done
```
batch img
```
sudo apt-get install jpegoptim
jpegoptim *.jpg -m30
mogrify -path ./results -resize 50x50% -quality 80 -format jpg *.png
mogrify -format jpg *.png
mogrify -path ./ -resize 50% -quality 80  *.jpg
convert *.jpg -auto-orient pictures.pdf
```
Music
```
sudo apt-get install lame
lame -b bitrate input.mp3 output.mp3
```
Negative Lookahead
```
(?!NO)
```
concat files
```
cat * > merged-file
find /path/to/directory/ -name *.csv -exec cat {} + > merged.file
```
Apply to All files
```
curdir=$(pwd); for folder in /path/to/Files/*; do[ -d "$folder" ] && cd "$folder" && ./conv.sh; done; cd $curdir
for f in *; do [ -d "$f" ] && cd "$f" && ./conv.sh; done; cd ..
```
Images To Booklet
```
img2pdf $(find . -iname '*.jpg' | sort -V) -o ./document.pdf
ls -1 ./*jpg | xargs -L1 -I {} img2pdf {} -o {}.pdf; pdftk *.pdf cat output combined.pdf
```