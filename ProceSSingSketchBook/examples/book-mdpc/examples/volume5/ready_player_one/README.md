---
permalink: /examples/volume5/ready_player_one/
title: Ready Player One (2018) | Minimalist Movie Poster
description: Minimalist Movie Poster generated using Java and Processing.
---

# Ready Player One (2018)

Action, Adventure, Sci-Fi

## Plot
When the creator of a virtual reality world called the OASIS dies, he releases a video in which he challenges all OASIS users to find his Easter Egg, which will give the finder his fortune.

[details](https://www.imdb.com/title/tt1677720/)

## Movie Poster
<img src="ready-player-one.png"  width="360px" title="Ready Player One">


## The code
```java
// Manuale di Programmazione Cinematografica
// Daniele Olmisani, 2019

// Ready Player One (2018)


final color PAPER = color(35, 40, 50);
final color INK1 = color(220, 115, 55);
final color INK2 = color(45, 150, 75);
final color INK3 = color(170, 175, 200);


void setup() {
  size(480, 640);
  noLoop();
}


void draw() {
  
  final float S =  min(width, height);
  final float U = 0.002;
  
  translate(0.4*width, 0.05*height);
  scale(S);
  
  background(PAPER);
  
  strokeWeight(20*U);
  fill(PAPER);
  
  translate(0.0, 0.3);
  stroke(INK1);
  drawKey();

  translate(0.0, 0.3);
  stroke(INK2);
  drawKey();

  translate(0.0, 0.3);
  stroke(INK3);
  drawKey();

  
  save("ready-player-one.png");
}


void drawKey() {
  
  strokeCap(SQUARE);
  rectMode(CENTER);
  
  line(0.00, 0.00, 0.30, 0.00);
  line(0.26, 0.04, 0.30, 0.04);
  line(0.18, 0.04, 0.22, 0.04);
  
  rect(0.00, 0.00, 0.10, 0.10);
}

```

> MdPC - a collection of minimalist movie posters
> by Daniele Olmisani
> Please, see [LICENSE](../../../LICENSE) file
