// By Roni Kaufman
// inspired by https://twitter.com/manoloidee/status/1249159694385627136
// and by the works of Claude Monet

let particles = [];
let n = 1500;
let colors;
let squiggliness = 1/50; // for the grass
let squiggliness2 = 1/1000; // for the flowers
let interval;

function setup() {
  createCanvas(700, 500);
  colorMode(HSB, 100);
  angleMode(DEGREES);
  noStroke();
  
  background(60, 50, 40);
  
  interval = setInterval(createParticles, 600);
}

function draw() {
  if (frameCount < 250) {
    for (let p of particles) {
      p.draw();
      p.move();
    }
  } else if (frameCount === 250) {
    clearInterval(interval);
  } else if (frameCount < 270) {
    // pink flowers
    for (let i = 0; i < 10; i++) {
      // ten flowers at a time
      fill(random(95, 100), random(15, 25), random(90, 100), random(75, 85));
      addFlower(1, i);
    }
  } else if (frameCount < 280) {
    // orange flowers
    for (let i = 0; i < 10; i++) {
      // ten flowers at a time
      fill(random(9, 14), random(40, 50), random(90, 100), random(75, 85));
      addFlower(2, i);
    }
  } else if (frameCount < 300) {
    // white flowers
    for (let i = 0; i < 10; i++) {
      // ten flowers at a time
      fill(random(45, 60), random(10, 20), random(90, 100), random(75, 85));
      addFlower(2, i);
    }
  }
}

function createParticles() {
  particles = [];
  for (let i = 0; i < n; i++) {
    let x_ = random(-20, width + 20);
    let y_ = random(-20, height + 20);
    let s_ = random(0.9, 1.1);
    let c_ = color(random(45, 60), random(60, 80), random(60, 80), random(95, 100));
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
  if (random(1) < 0.5) {
    this.dist *= -1;
  }
  
  this.move = function() {
    let theta = noise(this.x * squiggliness, this.y * squiggliness, frameCount/1000)*PI - PI/2;
    let v = p5.Vector.fromAngle(theta, this.dist);
    this.x += v.x;
    this.y += v.y;
    //this.dist *= 0.9999;
    //this.alpha *= 0.95;
    //this.size *= 0.98;
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
  while (floor(nz * 10) % 4 === 0) {
    x = floor(random(width));
    y = floor(random(height)) * 4;
    nz = noise(x * squiggliness2, y * squiggliness2, id);
  }
  //ellipse(x, y/2, random(3, 5), random(2, 4));
  blob(random(2, 3), x, y/4, 10, pow(2, frameCount) * pow(3, i), random(4, 5));
  fill(0, 10);
  blob(random(1, 2), x, y/4, 10, pow(2, frameCount) * pow(3, i), random(3, 4));
}

function blob(size, xCenter, yCenter, k, t, noisiness) {
  let angleStep = 360 / 8;
  beginShape();
  for (let theta = 0; theta < 360; theta += angleStep) {
    let r1, r2;
    r1 = cos(theta)+1;
    r2 = sin(theta)+1;
    let r = size + noise(k * r1,  k * r2, t) * noisiness;
    let x = xCenter + r * cos(theta) * random(1, 2);
    let y = yCenter + r * sin(theta) * random(0.2, 1);
    curveVertex(x, y);
  }
  endShape(CLOSE);
}
