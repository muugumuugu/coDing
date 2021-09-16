<!---->
- loop thru directories
	```bash
	 for d in ./*; do   if [ -d "$d" ]; then     echo "$d";   fi; done
	```
- apply to script all files in directory
	```bash
	curdir=$(pwd); for folder in /path/to/Files/*; do[ -d "$folder" ] && cd "$folder" && ./conv.sh; done; cd $curdir
	```
	```bash
	for f in *; do [ -d "$f" ] && cd "$f" && ./conv.sh; done; cd ..
	```
<!---->
- find large files
	```
	sudo find . -xdev -type f -size +100M
	```
- delete files
	```bash
	for d in ./*; do   if [ -d "$d" ]; then  cd $d; rm *.mp3; cd .. ;   fi; done
	```
<!---->
- rename files
	```bash
	rename -v  's/search regex/replacingstring/' *
	```
- rename files sequentially
  ```bash
  ls | cat -n | while read n f; do mv "$f" `printf "2019-12-02-23-19-%02d.jpg" $n`; done
  ```
- rename and keep extension no recursion thru directories
  ```bash
  ls -1prt | grep -v "/$" | cat -n | while read n f; do mv -n "${f}" "$(printf "%04d" $n).${f#*.}";
  ```
<!---->