#This file is auto-generated. See modules.json and autogenerator.py for details

#!/usr/bin/python3

"""
    geocoordinates.py

    MediaWiki API Demos
    Demo of `Geosearch` module: Obtain coordinates for wiki pages nearby

    MIT License
"""

import requests

S = requests.Session()

URL = "https://en.wikipedia.org/w/api.php"

PARAMS = {
    "action": "query",
    "format": "json",
    "titles": "Wikimedia Foundation",
    "prop": "coordinates"
}

R = S.get(url=URL, params=PARAMS)
DATA = R.json()
PAGES = DATA['query']['pages']

for k, v in PAGES.items():
    print("Latitute: " + str(v['coordinates'][0]['lat']))
    print("Longitude: " + str(v['coordinates'][0]['lon']))
