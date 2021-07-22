find . -name '*.jpg' -execdir sh -c '
  for f; do convert -verbose "$f" "${f%.*}.gif"; done
' find-sh {} +
