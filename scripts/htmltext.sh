#!/bin/sh
# h2t, convert all htm and html files of a directory to text

for file in `ls *.htm`
do
new=`basename $file htm`
lynx -dump $file > ${new}txt
done
#####
for file in `ls *.html`
do
new=`basename $file html`
lynx -dump $file > ${new}txt
done
