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
- find large files
	```
	sudo find . -xdev -type f -size +100M
	```
- compress vids
	```
	fmpeg -i source.mp4 -c:v libx264 -b:v 0.5M -c:a aac -b:a 96k target.mp4
	```
	```
	fmpeg -i source.mp4 -c:v libx264 -b:v 1.5M -c:a aac -b:a 128k target.mp4
	```
- wget options
	- E: Append .html to the file name if it is an HTML file but doesn't end in .html or similar
    - H: Download files from other hosts, too
    - k: After downloading convert any link in it so they point to the downloaded files
    - p: Download anything the page needs for proper offline viewing
	- r: recursively download all files in folder
- download website
	```
	wget -r -k link
	```
- download webpage
	```
	wget -E -H -k -p link
	```
