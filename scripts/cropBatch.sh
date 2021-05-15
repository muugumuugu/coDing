#!/bin/bash
for f in giggle/*;
do
   convert -crop -trim "$f" "${f%.gif}".jpg
done
