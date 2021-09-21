#This file is auto-generated. See modules.json and autogenerator.py for details

#!/usr/bin/python3

"""
    get_pagepropnames.py

    MediaWiki API Demos
    Demo of `Pagepropnames` module: List page property names on the given wiki.

    MIT License
"""

import requests

S = requests.Session()

URL = "https://en.wikipedia.org/w/api.php"

PARAMS = {
    "action": "query",
    "list": "pagepropnames",
    "format": "json"
}

R = S.get(url=URL, params=PARAMS)
DATA = R.json()

PAGEPROPS = DATA["query"]["pagepropnames"]

for p in PAGEPROPS:
    print(p["propname"])
