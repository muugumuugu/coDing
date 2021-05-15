from youtube_search import YoutubeSearch
def getsonglink(keywords)
	terms=keywords.split()
	for i in range(len(terms)):
		if i==0:
			search=terms[i]
		else:
			search=search+"+"+ terms[i]
	results = YoutubeSearch(search, max_results=5).to_dict()
	result=results[0]
	return result['url_suffix']
