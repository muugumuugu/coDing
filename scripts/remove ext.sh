for f in [0-9][0-9][0-9]*; do
  mv "$f" "${f:3}"
done
