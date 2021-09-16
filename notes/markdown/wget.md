<!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences -->
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