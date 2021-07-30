<!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences -->

- home using node http-server
  ```bash
  cd ~
  http-server -p8081
  ```

- notes
  ```bash
  cd ~
  jekyll serve --watch --port 3125
  ```
- blog
  ```bash
  cd
  jekyll serve --watch --port 4000
  ```

* [node root](http//192.168.1.8:8081/)
* [apache root](http//192.168.1.8/)
* [notes](http//192.168.1.8::3125/)
* [blog](http//192.168.1.8:4000/)

- loop thru directories
	```bash
	 for d in ./*; do   if [ -d "$d" ]; then     echo "$d";   fi; done
	```
- delete files
	```bash
	for d in ./*; do   if [ -d "$d" ]; then  cd $d; rm *.mp3; cd .. ;   fi; done
	```
- rename files
	```bash
	rename -v  's/search regex/replacingstring/' *
	```
- make thumbnails
	```bash
	for f in *.pdf; do echo epub-thumbnailer \'$f\' \'${f%.epub}.png\' 800"; done
	```
	```bash
	for f in *.pdf; do convert -thumbnail x300 -background white -alpha remove "$f"[0] "${f%.pdf}.png"; done
	```
	```bash
	mogrify  -format webp -path thumbs -thumbnail 200x200 *.pdf[0]
	```
	```bash
	mogrify  -format webp -path thumbs -thumbnail 200x200 *.png
	mogrify  -format webp -path thumbs -thumbnail 200x200 *.gif[0]
	mogrify  -format webp -path thumbs -thumbnail 200x200 *.djvu[0]
	mogrify  -format webp -path thumbs -thumbnail 200x200 *.jpg
	```
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
- batch music
	```bash
	sudo apt-get install lame
	```
	```bash
	lame -b bitrate input.mp3 output.mp3
	```
- RegExNegative Lookahead
	```regex
	(?!NO)
	```
- RegEx Greedy WildCard
	```regex
	([^~]*?)
	```
- concat files
	```bash
	cat * > merged-file
	```bash
	find /path/to/directory/ -name *.csv -exec cat {} + > merged.file
	```
- Apply to All files
	```bash
	curdir=$(pwd); for folder in /path/to/Files/*; do[ -d "$folder" ] && cd "$folder" && ./conv.sh; done; cd $curdir
	```
	```bash
	for f in *; do [ -d "$f" ] && cd "$f" && ./conv.sh; done; cd ..
	```
- Images To Booklet
	```bash
	img2pdf $(find . -iname '*.jpg' | sort -V) -o ./document.pdf
	```bash
	ls -1 ./*jpg | xargs -L1 -I {} img2pdf {} -o {}.pdf; pdftk *.pdf cat output combined.pdf
	```
- for right aligning child divs of flexbox
  ```css
  flex-grow: 1;
  ```
- invert color
  ```css
  html {-filter: invert(100%)}
  ```
- download link
  ```bash
  wget link -O outputname
  ```
- download list of links
  ```bash
  wget -i input.txt
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
- for MD checklist
  ```html
  <!-- Required extensions: pymdownx.tasklist -->
  ```
- for GFM
  ```html
  <!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences -->
  ```
- rename files sequentially
  ```bash
  ls | cat -n | while read n f; do mv "$f" `printf "2019-12-02-23-19-%02d.jpg" $n`; done
  ```
- rename and keep extension no recursion thru directories
  ```bash
  ls -1prt | grep -v "/$" | cat -n | while read n f; do mv -n "${f}" "$(printf "%04d" $n).${f#*.}";
  ```
- backup installation list
  ```bash
  dpkg --get-selections > mylists.list
  ```
- mathJax
  - tag
    ```html
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
    ```
  - displayed mathematics delimeter
    ```latex
    $$...$$
    ```

    ```latex
    \[...\]
    ```

  - in-line mathematics delimiter
    ```latex
    \(...\)
    ```
