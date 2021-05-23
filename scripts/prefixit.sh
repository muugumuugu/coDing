counter=1
for f in *; do
  printf -v prefix_str  '%02d' "$((counter++))"
  mv "$f" "2021-05-${prefix_str}-$f"
done