import pydub as pd
import time
import threading
from pydub.playback import play

def viz_play(song, viz):
	t = time.time

	prev_t = 0.0
	i = 0

	thread = threading.Thread(target=play, args=(song,))
	thread.start()
	finish = t()+song.duration_seconds
	cur_t = t()

	while cur_t < finish:
		cur_t = t()

		if cur_t - prev_t >= 0.001:
			print(viz[i])
			i += 1
			prev_t = cur_t




def main():

	path = ''
	while path != 'EXIT':
		path = str(input('MP3 Path ("EXIT" to quit):')).strip()

		if path == 'EXIT':
			break

		else:
			song = pd.AudioSegment.from_file(path, format='mp3')
			song_max = float(pow(song.max,2) )
			duration = len(song)

			#A list with the max amplitude of the song at every millisecond.
			viz = list()

			for i in range(1, duration):
				chunk = song[i-1:i]
				bar = '|' * int((pow(chunk.max,2) /song_max)*70)
				bar = bar+'\n'+bar
				viz.append(bar)

			viz_play(song, viz)


main()