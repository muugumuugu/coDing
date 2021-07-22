var c = 1; //counter
var c2 = 0; //conter
var c3 = 0;
var len = 40;


function setup() {
  createCanvas(800, 800);
}

function draw() {
  c3 = 0;
  len = width/20;
  background(20, 20, 50);
  noStroke();
  translate(width / 2 + 100 * noise(c2 * 0.06, 0), height / 2 + 100 * noise(0, c2 * 0.06));


  push();
  translate(2*len, 0);
  rotate(-PI / 4);
  arm(len, c, color(208, 138, 97), 1);
  pop();

  push();
  translate(-2*len, 0);
  rotate(PI / 4);
  arm(len, c + 234, color(208, 138, 97), -1);
  pop();

  push();
  translate(3*len/2, len/2);
  rotate(-PI / 8);
  arm(len, c + 150, color(208, 148, 107), 1);
  pop();

  push();
  translate(-3*len/2, len/2);
  rotate(PI / 8);
  arm(len, c + 10, color(208, 148, 107), -1);
  pop();

  push();
  translate(len, 3*len/4);
  arm(len, c + 1000, color(208, 158, 117), 1);
  pop();

  push();
  translate(-len, 3*len/4);
  //rotate(PI);
  arm(len, c + 1800, color(208, 158, 117), -1);
  pop();

  fill(208, 168, 127);
  ellipse(0, -2 * len, 3 * len, 5 * len); //head

  fill(208, 158, 117);
  ellipse(-len, -1 * len, len, len);
  ellipse(len, -1 * len, len, len);

  fill(230);
  ellipse(-1.1 * len, -0.9 * len, len / 2, len / 2);
  ellipse(1.1 * len, -0.9 * len, len / 2, len / 2);

  fill(40, 50, 150);
  ellipse(-1.1 * len, -0.9 * len, len / 2, len / 4);
  ellipse(1.1 * len, -0.9 * len, len / 2, len / 4);

  push();
  translate(len, len);
  rotate(PI / 4);
  arm(len, c + 290, color(208, 168, 127), 1);
  pop();

  push();
  translate(-len, len);
  rotate(-PI / 4);
  arm(len, c + 2960, color(208, 168, 127), -1);
  pop();


  c2 = c2 + 0.1;
}


function arm(len, c, col, dir) {
    //translate(len * dir, 0);
  if (len > 1) {
    fill(col);

    ellipse(0, 0, 2 * len, 2 * len);
    //rotate(map(noise(c * 0.04, c2 * 0.04), 0, 1, PI / 180 * -25 * dir, PI / 180 * 35 * dir));
    rotate(map(noise((c - c2) * 0.04, 2), 0, 1, PI / 180 * -25 * dir, PI / 180 * 35 * dir));
    
    translate(len / 2 * dir, 0);
    len = len * 0.95;
    c = c + 1;
    c3++;
    arm(len, c, col, dir);
    c3--;
    len = len / 0.95;
    c = c - 1;
    fill(200, 50, 50);

    translate(-len / 2 * dir, 0);
    //rotate(-map(noise(c * 0.04, c2 * 0.04), 0, 1, PI / 180 * -25 * dir, PI / 180 * 35 * dir));
    rotate(map(noise((c - c2) * 0.04, 2), 0, 1, PI / 180 * 25 * dir, PI / 180 * -35 * dir));
    
    if (c3 % 2 == 0) {
      ellipse(0, len, len / 2, len / 6);
      ellipse(0, len / 2, len / 2, len / 4);
    } else {
      if (c3 % 2 != 0) {
        ellipse(0, 3 * len / 4, len / 2, len / 5);
      }
    }
  }
}
