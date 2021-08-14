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
* [ddns](http://mogimogilenovo.ooguy.com/)
* [node root](http//192.168.1.8:8081/)
* [apache root](http//192.168.1.8/)
* [notes](http//192.168.1.8::3125/)
* [blog](http//192.168.1.8:4000/)

<!---->
- loop thru directories
	```bash
	 for d in ./*; do   if [ -d "$d" ]; then     echo "$d";   fi; done
	```
- apply to script all files in directory
	```bash
	curdir=$(pwd); for folder in /path/to/Files/*; do[ -d "$folder" ] && cd "$folder" && ./conv.sh; done; cd $curdir
	```
	```bash
	for f in *; do [ -d "$f" ] && cd "$f" && ./conv.sh; done; cd ..
	```
<!---->
- concat files
	```bash
	cat * > merged-file
	```bash
	find /path/to/directory/ -name *.csv -exec cat {} + > merged.file
	```
- replace text in batch
	```
	sed -i.backupsuffix 's/SEARCH_REGEX/REPLACEMENT/g' INPUTFILE
	```
<!---->
- find large files
	```
	sudo find . -xdev -type f -size +100M
	```
- delete files
	```bash
	for d in ./*; do   if [ -d "$d" ]; then  cd $d; rm *.mp3; cd .. ;   fi; done
	```
<!---->
- rename files
	```bash
	rename -v  's/search regex/replacingstring/' *
	```
- rename files sequentially
  ```bash
  ls | cat -n | while read n f; do mv "$f" `printf "2019-12-02-23-19-%02d.jpg" $n`; done
  ```
- rename and keep extension no recursion thru directories
  ```bash
  ls -1prt | grep -v "/$" | cat -n | while read n f; do mv -n "${f}" "$(printf "%04d" $n).${f#*.}";
  ```
<!---->
- RegExNegative Lookahead
	```regex
	(?!NO)
	```
- RegEx Greedy WildCard
	```regex
	([^~]*?)
	```
<!---->
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
- batch music
	```bash
	sudo apt-get install lame
	```
	```bash
	lame -b bitrate input.mp3 output.mp3
	```
<!---->
- Images To Booklet
	```bash
	img2pdf $(find . -iname '*.jpg' | sort -V) -o ./document.pdf
	```bash
	ls -1 ./*jpg | xargs -L1 -I {} img2pdf {} -o {}.pdf; pdftk *.pdf cat output combined.pdf
	```
	```
	img2pdf *.jpg -o ./document.pdf
	```
<!---->
- compress pdf
	```
	gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -sOutputFile=output.pdf input.pdf
	```
	```
	gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -sOutputFile=output.pdf input.pdf
	```
	```
	ps2pdf -dPDFSETTINGS=/ebook input.pdf output.pdf
	```
	```
	convert -density 200x200 -quality 40 -compress jpeg input.pdf output.pdf
	```
- compress vids
	```
	ffmpeg -i source.mp4 -c:v libx264 -b:v 0.5M -c:a aac -b:a 96k target.mp4
	```
	```
	ffmpeg -i source.mp4 -c:v libx264 -b:v 1.5M -c:a aac -b:a 128k target.mp4
	```
<!---->

- invert color
  ```css
  html {-filter: invert(100%)}
  ```
- for MD checklist
  ```html
  <!-- Required extensions: pymdownx.tasklist -->
  ```
- for GFM
  ```html
  <!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences -->
  ```
<!---->
- wget options
	- E: Append .html to the file name if it is an HTML file but doesn't end in .html or similar
    - H: Download files from other hosts, too
    - k: After downloading convert any link in it so they point to the downloaded files
    - p: Download anything the page needs for proper offline viewing
	- r: recursively download all files in folder
- download website
	```
	wget -r -k - E -p  link
	```
- download webpage
	```
	wget -E -H -k -p link
	```
- get gdrive files from url
	```
	if [[ $URL =~ d/(.*)/view ]]; then  FILEID=${BASH_REMATCH[1]}; else if [[ $URL =~ open.id=(.*?)\" ]]; then  FILEID=${BASH_REMATCH[1]}; fi ; fi
	```
	```
	wget --no-check-certificate "https://docs.google.com/uc?export=download&id=$FILEID" -O   "$FILENAME"
	```
	```
	wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$FILEID" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$FILEID" -O  "$FILENAME"  && rm -rf /tmp/cookies.txt
	```
- download link
  ```bash
  wget link -O outputname
  ```
- download list of links
  ```bash
  wget -i input.txt
  ```
<!---->
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
- backup installation list
  ```bash
  dpkg --get-selections > mylists.list
  ```
