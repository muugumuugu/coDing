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
- download link
  ```bash
  wget link -O outputname
  ```
- download list of links
  ```bash
  wget -i input.txt
  ```
- trim a video of leng hh\:mm\:ss of inp video beginning @ time HH:MM:SS
  ```bash
  ffmpeg -i inp.mp4 -ss HH:MM:SS -t hh:mm:ss -async 1 cut.mp4
  ```
- video to frames
  ```bash
  ffmpeg -i inp.mp4 -r  1/1 $filename%03d.bmp
  ```
- frames to gif
 ```bash
  gifsicle --delay  10 --loopcount  0 *.gif  &gt; out.gif
  ```
</code></pre
- for MD checklist
  ```html
  <!-- Required extensions: pymdownx.tasklist -->
  ```
- for GFM
  ```html
  <!-- Required extensions: pymdownx.betterem, pymdownx.tilde, pymdownx.emoji, pymdownx.tasklist, pymdownx.superfences -->
  ```
- rename files sequentially
  ```bash
  ls | cat -n | while read n f; do mv "$f" `printf "2019-12-02-23-19-%02d.jpg" $n`; done
  ```
- rename and keep extension no recursion thry directories
  ```bash
  ls -1prt | grep -v "/$" | cat -n | while read n f; do mv -n "${f}" "$(printf "%04d" $n).${f#*.}";
  ```
- backup installation list
  ```bash
  dpkg --get-selections > mylists.list
  ```
- mathJax
  - tag
    ```html
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
    ```
  - displayed mathematics delimeter
    ```latex
    $$...$$
    ```

    ```latex
    \[...\]
    ```

  - in-line mathematics delimiter
    ```latex
    \(...\)
    ```
