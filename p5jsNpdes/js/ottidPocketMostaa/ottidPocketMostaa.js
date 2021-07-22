// By Roni Kaufman

let t = 0;
let step = 0.01;
let n;
let size = 100;
let myColor;
let radiusDist = [];

function setup() {
  createCanvas(windowWidth, windowHeight);
  colorMode(HSB, 1);
  noStroke();
  
  if (random(1) < 0.1) {
    myColor = color(0.55, 0.6, 1, 0.67); // light blue, shiny!
  } else {
    myColor = color(0.81, 0.6, 1, 0.67); //light purple
  }
  n = floor((2 * PI) / step);
  
  radiusDist.length = n;
  radiusDist.fill(size);
}

function draw() {
  background(0.98);
  
  fill(myColor);
  blob(radiusDist, width/2, height/2, 0.7, t);
  drawFace(t);
  
  t += 0.005;
}

// Creates and draws a blob
// size is the distribution of the radius (before noise) for each angle
// (xCenter, yCenter) is the position of the center of the blob
// k is the tightness of the blob (0 = perfect circle)
// t is the time
function blob(size, xCenter, yCenter, k, t) {
  beginShape();
  for (let i = 0; i < n; i++) {
    let theta = i * step;
    let r1, r2;
    if (theta < PI / 2) {
      r1 = cos(theta);
      r2 = 1;
    } else if (theta < PI) {
      r1 = 0;
      r2 = sin(theta);
    } else if (theta < 3 * PI / 2) {
      r1 = sin(theta);
      r2 = 0;
    } else {
      r1 = 1;
      r2 = cos(theta);
    }
    let r = size[i] + noise(k * r1, k * r2, t) * (2/3) * size[i];
    let x = xCenter + r * cos(theta);
    let y = yCenter + r * sin(theta);
    curveVertex(x, y);
  }
  endShape();
}

// Bump function, 0 outside [-1, 1], argmax = 0
function bump(x) {
  if (abs(x) < 1) {
    return ( sin(PI * (x + 0.5)) + 1 ) / 2;
    //return (exp(-1/(1-x**2)));
  } else {
    return 0;
  }
}

// Adds a bump (or valley is peakSize < 0)
// at idx in radiusDist
// is baseSize wise and peakSize tall
function sculpt(idx, baseSize, peakSize) {
  // There are two i's to deal correctly with the n|0 frontier
  // i1 is for the index in radiusDist, 
  // it will always be inside [0, n[,
  // i2 is for the calculation of the bump
  let i1 = floor(idx - baseSize/2);
  let i2 = i1;
  
  if (i1 < 0) {
    i1 += n;
  }
  
  while (i2 < idx + baseSize/2) {
    let x = (2 * (i2 - idx)) / baseSize;
    let y = peakSize * bump(x);
    if (radiusDist[i1] + y > 0) { // (y can be negative)
      radiusDist[i1] += y;
    }
    i1++;
    if (i1 >= n) {
      i1 -= n;
    }
    i2++;
  }
}

// Draws a happy face :)
function drawFace(t) {
  // eyes
  fill(0);
  circle(width/2 - 35 + 10*noise(t), height/2 - 37 + 10*noise(t+1), 8);
  circle(width/2 + 25 + 10*noise(t+2), height/2 - 30 + 10*noise(t+3), 8);
  // mouth
  stroke(0);
  noFill();
  strokeWeight(2);
  beginShape();
  vertex(width/2 - 46 + 10*noise(t+4), height/2 - 22 + 10*noise(t+5));
  quadraticVertex(width/2 - 5 + 10*noise(t+6), 
                  height/2 - 10 + 10*noise(t+7),
                  width/2 + 37 + 10*noise(t+8), 
                  height/2 - 15 + 10*noise(t+9));
  endShape();
  noStroke();
}

function mouseClicked() {
  // vector from the center of the sketch to the mouse position
  let v = createVector(mouseX - width/2, mouseY - height/2);
  let theta = map(v.heading(), -PI, PI, PI, 3 * PI);
  let idx = floor(theta / step);
  let peak = 10;
  if (keyIsPressed) {
    peak *= -1;
  }
  sculpt(idx, 75, peak);
}
