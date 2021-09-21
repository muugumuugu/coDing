#This file is auto-generated. See modules.json and autogenerator.py for details

#!/usr/bin/python3

"""
    get_allcategories.py

    MediaWiki API Demos
    Demo of `Allcategories` module: Get all categories, starting from a
    certain point, as ordered by category title.

    MIT License
"""

import requests

S = requests.Session()

URL = "https://en.wikipedia.org/w/api.php"

PARAMS = {
    "action": "query",
    "format": "json",
    "list": "allcategories",
    "acfrom": "15th-century caliphs"
}

R = S.get(url=URL, params=PARAMS)
DATA = R.json()

CATEGORIES = DATA["query"]["allcategories"]

for cat in CATEGORIES:
    print(cat["*"])
