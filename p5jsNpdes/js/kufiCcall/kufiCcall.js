/*
@author : Didier Sicsic
This sketch generates patterns inpired by geometric Kufic calligraphy

S : change the order of rotationnal symmetry
UP and DOWN : increase / decrease the size (number of rows / columns)
any other key / mouse-click : generate a new pattern

*/

var SYM = 4, N = 12, C, p = 0.5; //p = 50% (probabilty of connexion between vertices)

function setup() {
  init();
  strokeCap(PROJECT);
}

function draw() {
  background("#fcfce5");
  scale(C);
  translate(1, 1);
  stroke(0);
  kufic();
  stroke("#ce0404");
  sym(-1, -1, SYM);
  noLoop();
  if(frameCount == 1) usage();
}

function kufic() {
  if(SYM == 4 && (N % 2 == 0)) {
    sym(N, N, SYM); // center
    if(random(1) < p) sym(N - 1, N, SYM);
  }
  for (let x = 0; x < (N + 1)/(1 + (SYM == 4)); x += 1) {
    if(SYM == 2 && x < (N + 1)/2)  {
      sym(X = 2 * x, X, SYM); // diagonal
      if(random(1) < p) sym(X, X + 1, SYM);
      if(x > 0 && random(1) < p) sym(X, X - 1, SYM);
    }
    for (let y = 0; y < (SYM == 2 ? x : (SYM == 1 ? N + 1 : (N + (N % 2)) / 2)); y += 1) {
        sym(X = 2 * x, Y = 2 * y, SYM);
        if (x > 0 && random(1) < p) sym(X - 1, Y, SYM); // horizontal connection (left) [50%]
        if (y > 0 && random(1) < p) sym(X, Y - 1, SYM); // vertical connection (up) [50%]
        if(SYM == 4 && x == ((N - (N % 2)) / 2) && random(1) < p) sym(X + 1, Y, SYM);
    }
  }
}

function sym(x, y, s) {
  point(x, y);
  if(s > 1) point((n = 2 * N) - x, n - y);
  if(s == 4) sym(n - y, x, 2);
}

function init() {
  C = round((min(windowWidth, windowHeight) - 60) / ((n = 2 * N) + 3)); // better results with integer scaling ratio
  createCanvas((n + 3) * C, (n + 3) * C);
}

function mousePressed() {
  if (mouseButton == LEFT) loop(); // only LEFT, so you can right-click and save image
}

function keyPressed() {
  if (key == 'S') {  // press S to change the order of rotationnal symmetry
    SYM = (SYM % 2) ? 3 * SYM + 1 : SYM / 2; // 1, 4, 2, 1, 4, 2 ...  (Collatz 3n + 1 :) )
  } 
  N += (keyCode === UP_ARROW && N < 60) - (keyCode === DOWN_ARROW && N > 3);
  init();
  loop();
}

function usage() {
    noStroke();
    fill(0, 100, 100, 220);
    rect(3, 10, 19, 11, 2);
    translate(4, 12);
    scale(1/C);
    fill("#fcfce5");
    text(`This sketch generates patterns inspired
by beautiful geometric Kufic calligraphy

Usage :

 - S : change the order of rotationnal symmetry (1, 2 or 4)

 - UP / DOWN : modify the number of rows and columns

 - any other key / mouse-click : generate a new pattern`, 0, 0);
  }
