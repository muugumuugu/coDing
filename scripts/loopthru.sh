curdir=$(pwd)
for folder in /Documents/websites/celestial drownings; do
  [ -d "$folder" ] && cd "$folder" && ./htmltext.sh
done
