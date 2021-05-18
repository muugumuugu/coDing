mkdir cropped
for f in *.jpg *.png; do
    convert "$f" -crop 760x666+575+323 cropped/"$f"
done