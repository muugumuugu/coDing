<!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences --> 
- home
  ```bat
  cd ~
  http-serve -p8081
  ```
- notes
  ```bat
  cd ~
  jekyll serve --watch --port 3125
  ```
- blog
  ```bat
  cd
  jekyll serve --watch --port 4000
  ```


* [main](http://127.0.0.1:8081/)
* [notes](http://127.0.0.1:3125/)
* [blog](http://127.0.0.1:4000/)


- for right aligning child divs of flexbox
  ```css
  flex-grow: 1;
  ```
- invert color
  ```css
  html {-filter: invert(100%)}
  ```

- for MD checklist
  ```html
  <!-- Required extensions: pymdownx.tasklist -->
  ```
- for GFM
  ```html
  <!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences --> 
  ```

- mathJax
  - tag
    ```html
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
    ```
  - displayed mathematics delimeter
    ```
    $$...$$
    \[...\]
    ```
  - in-line mathematics delimiter
    ```
    \(...\)
    ```
