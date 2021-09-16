<!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences -->
<!---->
- concat files
	```bash
	cat * > merged-file
	```bash
	find /path/to/directory/ -name *.csv -exec cat {} + > merged.file
	```
- replace text in batch, using extended regex
	```
	sed -i.backupsuffix -E 's/SEARCH_REGEX/REPLACEMENT/g' INPUTFILE
	```
- insert text at line #N in batch
	```
	sed -i.backupsuffix 'Ni\insertiontext\' INPUTFILE
	```
- append text at line #N in batch
	```
	sed -i.backupsuffix 'Na\insertiontext\' INPUTFILE
	```
<!---->