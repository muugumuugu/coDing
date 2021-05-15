from __future__ import unicode_literals
import youtube_dl
import pafy
import os
import urllib.request
import urllib.parse
import csvfile

import re

#def load_songs(filepath="")

def spot(which):
	for name in which:
		try:
			cmd="spotdl --song " + '"' + name + '"'
			os.system(cmd)
		except:
			pass
		

def downloadsongs(urllist):
	"""ydl_opts = {
        'format': 'worstaudio/worst',
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
        }],
    }"""
	for url in urllist:
		if url!="oops":
			"""with youtube_dl.YoutubeDL(ydl_opts) as ydl:
				try : 
					ydl.download([url])
				except : 
					pass"""
			try:
				video = pafy.new(url) 
				bestaudio = video.getbestaudio() 
				bestaudio.download() 
			except:
				pass

				
			
def getlink(terms):
	query=urllib.parse.urlencode({"search_query": terms})
	html=urllib.request.urlopen("https://www.youtube.com/results?search_query=" + query)
	res=re.findall('watch\?v=.{11}', html.read().decode())
	if len(res)>0:
		url="https://www.youtube.com/" + res[1]
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
songlings=csvfile.songlist
#down=getlinks(csvfile.songlist)
#downloadsongs(down)
spot(songlings)

	
	