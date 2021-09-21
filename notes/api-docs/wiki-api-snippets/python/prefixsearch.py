#This file is auto-generated. See modules.json and autogenerator.py for details

#!/usr/bin/python3

"""
    Demo of `Prefixsearch` module: Perform a prefix search for page titles

"""

import requests

S = requests.Session()

URL = "https://en.wikipedia.org/w/api.php"

PARAMS = {
    "action": "query",
    "format": "json",
    "list": "prefixsearch",
    "pssearch": "Star Wars"
}

R = S.get(url=URL, params=PARAMS)
DATA = R.json()

PAGES = DATA['query']['prefixsearch']

for page in PAGES:
    print(page)
