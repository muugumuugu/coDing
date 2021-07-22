// By Roni Kaufman

let blue, white, black;
let freq = 1/50;

function setup() {
  createCanvas(windowWidth,windowHeight);
  colorMode(HSB, 100);
  noStroke();
  
  //blue = color(67, 90, 80);
  blue = color(67, 50, 25);
  white = color(95);
  //black = color(10);
  black = blue;
}

function draw() {
  background(white);
  
  let w = width/2;
  let h = height/2;
  let theta0 = frameCount*freq;
  
  // body
  noStroke();
  fill(blue);
  ellipse(w, h, 250, 246);
  circle(w - 85, h - 100, 75);
  circle(w + 85, h - 100, 75);
  
  // eyes
  fill(white);
  stroke(black);
  strokeWeight(2);
  circle(w - 85, h - 100, 55);
  circle(w + 85, h - 100, 55);
  fill(black);
  circle(w - 85, h - 100, 39);
  circle(w + 85, h - 100, 39);
  fill(white);
  noStroke();
  let x = 14 * cos(theta0);
  let y = 14 * sin(theta0);
  circle(w - 85 + x, h - 100 + y, 17);
  circle(w + 85 + x, h - 100 + y, 17);
  //circle(w - 98, h - 105, 17);
  //circle(w + 72, h - 105, 17);
  
  // nose
  strokeWeight(4);
  stroke(black);
  line(w - 10, h - 99, w - 13, h - 104);
  line(w + 10, h - 99, w + 13, h - 104);
  
  // tummy
  fill(white);
  strokeWeight(2);
  ellipse(w, h + 7, 195, 192);
  strokeWeight(7);
  noFill();
  drawSpiral(theta0, w, h + 7, 85);
}

function drawSpiral(theta0, xCenter, yCenter, maxRadius) {
  let theta = theta0;
  beginShape();
  for (let r = 3; r < maxRadius + 4; r++) {
    let x = xCenter + r*cos(theta)*1.015625; // 1.015625 === 195/192
    let y = yCenter + r*sin(theta);
    curveVertex(x, y);
    theta += 0.3;
  }
  endShape();
}
