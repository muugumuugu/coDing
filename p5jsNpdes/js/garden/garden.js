// By Roni Kaufman
// inspired by https://twitter.com/manoloidee/status/1249159694385627136
// and by my garden

let particles = [];
let n = 1500;
let colors;
let squiggliness = 1/100; // for the grass
let squiggliness2 = 1/500; // for the flowers
let interval;

function setup() {
  createCanvas(700, 500);
  colorMode(HSB, 100);
  angleMode(DEGREES);
  noStroke();
  
  background(35, 80, 10);
  background("#27221C");
  
  interval = setInterval(createParticles, 500);
}

function draw() {
  if (frameCount < 500) {
    for (let p of particles) {
      p.draw();
      p.move();
    }
  } else if (frameCount === 500) {
    clearInterval(interval);
  } else if (frameCount < 650) {
    // lila flowers
    for (let i = 0; i < 10; i++) {
      // ten flowers at a time
      fill(random(70, 80), random(20, 30), random(90, 100), random(85, 95));
      addFlower(1, i);
    }
  } else if (frameCount < 700) {
    // white flowers
    for (let i = 0; i < 10; i++) {
      // ten flowers at a time
      fill(random(10, 15), random(5), random(95, 100), random(95, 100));
      addFlower(2, i);
    }
  } else if (frameCount < 750) {
    // yellow flowers
    for (let i = 0; i < 10; i++) {
      // ten flowers at a time
      fill(random(13, 14), random(70, 80), random(95, 100), random(95, 100));
      addFlower(3, i);
    }
  }
}

function createParticles() {
  particles = [];
  for (let i = 0; i < n; i++) {
    let x_ = random(-20, width + 20);
    let y_ = random(-20, height + 20);
    let s_ = random(0.9, 1.1);
    let c_ = color(random(30, 40), random(60, 80), random(60, 80));
    particles.push(new Particle(x_, y_, s_, c_));
  }
}

function Particle(x_, y_, s_, c_) {
  this.x = x_;
  this.y = y_;
  this.size = s_;
  this.c = c_;
  
  this.alpha = 100;
  this.dist = s_;
  
  this.move = function() {
    let theta = noise(this.x * squiggliness, this.y * squiggliness, frameCount/1000)*PI + PI;
    let v = p5.Vector.fromAngle(theta, this.dist);
    this.x += v.x;
    this.y += v.y;
    this.dist *= 0.9999;
    //this.alpha *= 0.95;
    this.size *= 0.98;
  }
  
  this.draw = function() {
    this.c.setAlpha(this.alpha);
    fill(this.c);
    circle(this.x, this.y, this.size);
    this.c.setAlpha(100);
  }
}

function addFlower(id, i) {
  let x = floor(random(width));
  let y = floor(random(height)) * 4;
  let nz = noise(x * squiggliness2, y * squiggliness2, id);
  while (floor(nz * 10) % 2 === 0) {
    x = floor(random(width));
    y = floor(random(height)) * 4;
    nz = noise(x * squiggliness2, y * squiggliness2, id);
  }
  //ellipse(x, y/2, random(3, 5), random(2, 4));
  blob(random(1, 2), x, y/4, 10, pow(2, frameCount) * pow(3, i), random(3, 4));
  fill(0, 20);
  blob(random(1, 2), x, y/4, 10, pow(2, frameCount) * pow(3, i), random(2, 3));
}

function blob(size, xCenter, yCenter, k, t, noisiness) {
  let angleStep = 360 / 16;
  beginShape();
  for (let theta = 0; theta < 360; theta += angleStep) {
    let r1, r2;
    r1 = cos(theta)+1;
    r2 = sin(theta)+1;
    let r = size + noise(k * r1,  k * r2, t) * noisiness;
    let x = xCenter + r * cos(theta);
    let y = yCenter + r * sin(theta) * random(0.2, 1);
    curveVertex(x, y);
  }
  endShape(CLOSE);
}
