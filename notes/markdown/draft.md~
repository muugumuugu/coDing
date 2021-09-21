<!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences -->
+ image-data-uri encodeFromFile fpath > outpath
	+ npx image-data-uri --help
+ git update-index --assume-unchanged <path>
+ ConcaT videos
	```
	for f in *.mp4; do echo "file '$f'" >>files.txt;done;
	ffmpeg -f concat  -i files.txt -c copy output.mp4
	```
+ ```strings "$f" > "$f".clean #clean the text of unprintable or special unicode characters```
+ ```pdftotext "$f"```
+  playlist to mp3
	```
	youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output "%(title)s.%(ext)s" --yes-playlist https://www.youtube.com/playlist?list={your-youtube-playlist-id}
	```
+ showdown makehtml -i foo.md -o bar.html
+ ls | grep -v file.txt | xargs rm -r
	+ delete all files+directories except file.txt
+ lt -p 80 -s muuugu
	+ https://muuugu.loca.lt
+ perl -00pe 's/,(?!.*,)//s' file#rmlastchar
+ ```<style (.*\s*)+?</style>```
+ yes
	+ continous stream of 'y's.
	+ useful for piping to prompting commands, fills yes for each question.
+ piping the stdout
	+ destructive
		+ ``` cmd  > fname ```  #overwrites
	+ as stdin
		+ ```cmd-that-produces-input | cmd-that-uses-output``
		+ example ``` ls | sort -t```
	+ non - destructive
	 		``` cmd >> fname ```
+ awk '!a[$0]++' artists.lst > final.temp ##duplicatse
+ sed -n 4~8p m.txt  >artists.lst #print every 8th line from 4th line
+ eyeD3 --write-images=DIR mp3_file  #writes covers from id3 tags
+ ffmpeg -i file.mp3 file.jpg  #extracts cover art
+ youtube-dl   -j --flat-playlist https://youtube.com/playlist?list=id | jq -r '.id' | sed 's_^_https://youtube.com/v/_' #get links of all vids in playlist
+ http://www.youtube.com/watch_videos?video_ids=comma seperated list of ids #make a playlist from ids
+ regex: \A starting of text
+ regex: \Z end of text
+ ```cd <directory>\```
	Change the current working directory
+ ```ls <pattern>```
	+ ```-l``` : long listing
	+ ```-I	 <fname>``` : Ignore Fname
+ ```cp <f1> <f2> ... <destination>```
+ ```mv <f1> <f2> ... <destination>```
+ ```mkdir <dir1> <dir2> ...```
+ ```rm <fname>```
+ ```man <cmd>```
	+ displays man page for the command, line by line.
+ ```more <f1> <f2> ....```
	+ displays contents of files , one screenful at a time.
+ ```cat <f1> <f2> ...```
	+ outputs entire contents of the file(s) into the stdout.
+ ```echo  <arg1> <arg2>```
	+ ```-e``` : prints special characters rendered.
+ ```grep <pattern> <f1> <f2> <f3>```
	+ displays all the lines in the files matching the given pattern.
	+ ```-v``` : inverts match.
+ ```sed -i.bak -E 'n~m<op>|pattern|' ``` ```fname``` or ```<<<"varname"```
	+ performs editing on every mth line from the nth line.
	+ operations
		+ p : print
		+ i : insert
		+ s : substitute

+ to put a process in background, append a ```&``` to the command.
+ ```jobs```
	+ describes all active processes
+  ``` kill %pid````
	+ kills job with process id=pid.
+ ```Ctrl+C```
	+ Interrupt Job
+ ``` Ctrl+Z```
	+ Suspends Job
+ Running a Job
	+ bg %pid
	+ fg %pid
+ Archiving/Compressing
	+ tar cvf <fname> <f1> <f2> <f3>
		+ create , in verbose mode, archive file fname with f1,f2.. in it
	+ gzip -9 <fname.tar>
		+ compress the archive.
	+ gunzip <fname.tar.gz>
		+ uncompress archive
	+ tar xvf <fname.tar>
		+ extract the tar file
+ permissions
	+ ```chmod +777 fname```
	+ give them, all of them, read write execute .