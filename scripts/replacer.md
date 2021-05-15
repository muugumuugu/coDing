<!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences -->

---

```html
<style (.*\s*)+?</style>
```

- 1
  ```html
  	<style>span.divider{color: blue;}a:link {color: green;background-color: transparent;text-decoration: none;}a:visited {color: pink;background-color: transparent;text-decoration: none;}a:hover {color: red;background-color: transparent;text-decoration: underline;}a:active {color: yellow;background-color: transparent;text-decoration: underline;}body{	background-color:black;	color:white;	}</style>
  ```
- 2
  ```html
  <link rel="stylesheet" href="/styles/home.css"> 
  ```

---

```html
<tr>.*\/D.*?/.*/(.*?)">([^~]*?)</a></td></tr>
```

- 1
  ```html
  <td></td><a href="\1"><img src="\1" alt="\2" width="300" height="300"></a>
  ```
- 2
  ```html
  <li><a href="\1">\2</a> </li>
  ```
- 3
    ```html  
    <div><a href="\1">\2</a><span class="divider">    |  </span></div>
    ```

-  4
  ```html
  <div><audio src="\1" alt="\2" width="100" height="50" controls></div>
  ```
- 5
  ```html
  <div><a href="\1"><obj data="\1" width="300" height="300">\2</object></a></div>&nbsp;
  ```
  
---
```html
<table>
```

- 1
  ```html
  <div style="  display: flex; flex-wrap: wrap;">
  ```