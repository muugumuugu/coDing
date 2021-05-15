from __future__ import unicode_literals
import youtube_dl

import urllib.request
import urllib.parse
import csvfile

import re

#def load_songs(filepath="")

def downloadsongs(urllist):
	ydl_opts = {
        'format': 'worstaudio/worst',
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
        }],
    }
	for url in urllist:
		if url!="oops":
			with youtube_dl.YoutubeDL(ydl_opts) as ydl:
				ydl.download([url])
			
def getlink(terms):
	query=urllib.parse.urlencode({"search_query": terms})
	html=urllib.request.urlopen("https://www.youtube.com/results?search_query=" + query)
	res=re.findall('watch\?v=.{11}', html.read().decode())
	if len(res)>0:
		url="https://www.youtube.com/" + res[0]
	else:
		url="oops"
	return url
				   
def getlinks(songlist):
	links=[getlink(song) for song in songlist]
	return links

#driver
"""print(csvfile.songlist[1:])
down=getlinks(csvfile.songlist)
"""
down=getlinks(csvfile.songlist[1:])
downloadsongs(down)

	
	