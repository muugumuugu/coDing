// By Roni Kaufman
// Inspired by https://www.reddit.com/r/generative/comments/j4uati/iris/

let squiggliness = 1/125;
let alpha = 90;
let front;
let eye;

function setup() {
  createCanvas(windowWidth, windowHeight);
  colorMode(HSB, 100);
  noStroke();

  eye = new Eye(width/2, height/2, 85, 250, random(100), 1000);
  
  background(eye.baseHue, 80, 60);
  front = createGraphics(width, height);
  front.noStroke();
  front.background(255);
  front.erase();
  front.circle(eye.x, eye.y, eye.bigRadius*2);
  front.noErase();
  front.fill(10);
  front.circle(eye.x, eye.y, eye.smallRadius*2);
  
  eye.updateParticles();
}

function draw() {
  let stillDrawing = eye.draw();
  if (!stillDrawing) {
    noLoop();
  }
  
  image(front, 0, 0);
}

function Eye(x_, y_, smallRadius_, bigRadius_, baseHue_, nParticles_) {
  this.x = x_;
  this.y = y_;
  this.smallRadius = smallRadius_;
  this.bigRadius = bigRadius_;
  this.baseHue = baseHue_;
  this.nParticles = nParticles_;
  
  this.particles = [];
  this.waveCount = 1;
  
  this.draw = function() {
    let oneInside = false; // whether one particle is still inside
    for (let p of this.particles) {
      let inside = p.draw(this.x, this.y, this.bigRadius, this.baseHue, this.waveCount);
      p.move(this.waveCount);
      oneInside = oneInside || inside;
    }
    if (!oneInside) {
      this.updateParticles();
      //waveCount++;
      if (++this.waveCount > 3) {
        return false; // the drawing of the eye had ended
      }
    }
    return true;
  }
  
  this.updateParticles = function() {
    this.particles = [];
    for (let i = 0; i < this.nParticles; i++) {
      let angle_ = random(TWO_PI);
      let v_ = p5.Vector.fromAngle(angle_, this.smallRadius - 1).add(this.x, this.y);
      let s_ = 0.75;
      this.particles.push(new Particle(v_.x, v_.y, angle_, s_));
    }
  }
}

function Particle(x_, y_, angle_, s_, baseHue_, waveCount_) {
  this.x = x_;
  this.y = y_;
  this.angle = angle_;
  this.size = s_;
  
  this.dist = 0.5;
  this.alpha = alpha
  
  this.move = function(waveCount) {
    let noize = (noise(this.x * squiggliness, this.y * squiggliness, waveCount/50) - 1/2)*PI;
    let v = p5.Vector.fromAngle(this.angle + noize, this.dist);
    this.x += v.x;
    this.y += v.y;
    //this.dist *= 0.9999;
    this.alpha *= 0.995;
  }
  
  this.draw = function(xCenter, yCenter, bigRadius, baseHue, waveCount) {
    let d = dist(this.x, this.y, xCenter, yCenter);
    let hue = baseHue + (noise(d/200, this.x/1000 + waveCount, this.y/1000 + waveCount)-1/2)*100;
    fill(hue%100, 100, 100, this.alpha);
    circle(this.x, this.y, this.size);
    return (d < bigRadius); // whether the particle is inside the eye
  }
}
