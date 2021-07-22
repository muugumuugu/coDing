for f in frames/*.txt ; do
	convert -size 1000x2000 xc:white -font "FreeMono" -pointsize 12 -fill black -annotate +15+15 "$(cat $f)" -trim -bordercolor "#FFF" -border 10 +repage $f.png
done