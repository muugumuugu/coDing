<!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences -->

- compress vids
	```
	ffmpeg -i source.mp4 -c:v libx264 -b:v 0.5M -c:a aac -b:a 96k target.mp4
	```
	```
	ffmpeg -i source.mp4 -c:v libx264 -b:v 1.5M -c:a aac -b:a 128k target.mp4
	```