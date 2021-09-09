perl -00pe 's/,(?!.*,)//s' file#rmlastchar
awk '!a[$0]++' artists.lst > final.temp ##duplicatse
sed -n 4~8p m.txt  >artists.lst #print every 8th line from 4th line
eyeD3 --write-images=DIR mp3_file  #writes covers from id3 tags
ffmpeg -i file.mp3 file.jpg  #extracts cover art
youtube-dl   -j --flat-playlist https://youtube.com/playlist?list=id | jq -r '.id' | sed 's_^_https://youtube.com/v/_' #get links of all vids in playlist
http://www.youtube.com/watch_videos?video_ids=comma seperated list of ids #make a playlist from ids