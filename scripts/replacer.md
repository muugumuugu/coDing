<!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences -->

```
<style (.*\s*)+?</style>
```


---
## index

- header
	```
	<html>
	<head>
	<title>
	folder name
	</title>
	<link rel="stylesheet" href="/styles/home.css"><link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/muugumuugu/coDing@latest/css/hacker.min.css">
	<style> div{margin:3px;}img{width:200px;height:200px;}div.bend{text-align:center;width:200px;}</style>
	</head>
	```

- body
	```
	<body>
	<header>
	<h1>folder name</h1>
	</header>


	<div class="flex">






	</div>


	<footer>
	</footer>
	</body>
	</html>
	```
---

- files

	```
	.*/(.*)\.(.*)
	```

	- 1
		```
		<div><a href="\1.\2"><img src="thumbs/\1.webp" alt="\1" ><br><div class="bend">\1</a></div></div>
		```
	- 2
		```
		<li><a href="\1.\2" title="\1">\1</a></li>
		```
	- 3
		```
		<div><a href="\1.\2">\1</a><span class="divider">    |  </span></div>
		```
	- 4
	  ```
	  <div><object data="\1.\2" width="300" height="300">\2</object><br><a href="\1.\2">\`</a></div>&nbsp;
	  ```


---

## playlist

```
.*/(.*) _ (.*)\.(.*)
```

- m3u
	```
	#EXTINF: \2.\3#split\1 _ \2.\3
	```
- html
	- control set
		```
		<div><audio src="\1 _ \2.\3" alt="\2 by \1"  title="\2" width="100" height="50" controls><br><<div class="bend"><a href="\1 _ \2.\3">\2 by \1</a></div></div>
		```
	- list
		```
		<li><a href="\1 _ \2.\3">\1 _ \2.\3</a></li>
		```