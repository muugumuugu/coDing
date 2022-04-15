convert in.jpg -level 60%x85% -resize 100x100\> out.jpg
convert in.jpg -resize 100x100 -background white -gravity center -extent 100x100 out.png
convert orig.jpg -level 60%x85% contrast.jpg