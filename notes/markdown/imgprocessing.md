<!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences -->



- make thumbnails
	```bash
	for f in *.pdf; do echo epub-thumbnailer \'$f\' \'${f%.epub}.png\' 800"; done
	```
	```bash
	for f in *.pdf; do convert -thumbnail x800 -background white -alpha remove "$f"[0] "${f%.pdf}.png"; done
	```
	```bash
	mogrify  -format webp -path thumbs -thumbnail 200x200 *.pdf[0] *.png  *.gif[0] *.djvu[0] *.jpg
	```
- trim a video of leng hh\:mm\:ss of inp video beginning @ time HH:MM:SS
  ```bash
  ffmpeg -i inp.mp4 -ss HH:MM:SS -t hh:mm:ss -async 1 cut.mp4
  ```
- video to frames
  ```bash
  ffmpeg -i inp.mp4 -r  1/1 $filename%03d.bmp
  ```
- frames to gif
 ```bash
  gifsicle --delay  10 --loopcount  0 *.gif  &gt; out.gif
  ```
- webp to gif
	```
	for f in *.webp; do mkdir $f.frames;anim_dump -folder $f.frames  $f;convert $f.frames/*.png -delay 10 -loop 0 $f.gif; done;
	```
<!---->
- batch img
	```bash
	sudo apt-get install jpegoptim
	```
	```bash
	jpegoptim *.jpg -m30
	```
	```bash
	mogrify -path ./results -resize 50x50% -quality 80 -format jpg *.png
	```
	```bash
	mogrify -format jpg *.png
	```
	```bash
	mogrify -path ./ -resize 50% -quality 80  *.jpg
	```
	```bash
	convert *.jpg -auto-orient pictures.pdf
	```