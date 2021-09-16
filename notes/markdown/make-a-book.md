<!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences -->
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