- compress pdf
	```
	gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -sOutputFile=output.pdf input.pdf
	```
	```
	gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -sOutputFile=output.pdf input.pdf
	```
- img2 pdf (no spaces in fname.)
	```
	img2pdf $(find . -iname '*.jpg' | sort -V) -o ./document.pdf
	```