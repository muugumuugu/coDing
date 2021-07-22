let e = [];


function setup() {
  createCanvas(windowWidth, windowHeight);
  let maxSize = 250;
  let minSize = 40;
  let margine = 5;
  let num = 700;
  for(let i = 0; i < num; i++)
  {
    let cx = random(maxSize/2, width - maxSize/2);
    let cy = random(maxSize/2, height - maxSize/2);
    let s = maxSize;
    for(let j = 0; j < e.length; j++)
    {
      let eye = e[j];
      let centerDist = dist(cx, cy, eye.c.x, eye.c.y);
      let eyeRadius = eye.s /2;
      let idealRadius = centerDist - eyeRadius - margine;
      s = min(idealRadius * 2, s);
    }
    if(s > minSize)e.push(new Eye(cx, cy, s));
  }
  
  background(0);
  for(let i = 0; i < 200; i++)
  {
    let maxOff = 5;
    let len = random(10,25);
    let w = random(1, 2);
    let x = random(width);
    let y = random(- len, height);
    let x2 = x + random(-maxOff, maxOff);
    let y2 = y + len;
    noFill();
    strokeWeight(w);
    stroke(200);
    line(x, y, x2, y2);
  }
}

function draw() {
  
  for(const eye of e)
  {
    eye.setTarget(mouseX, mouseY);
    eye.update();
    eye.display();
  }
}

class Eye
{
  constructor(cx, cy, size)
  {
    this.c = createVector(cx, cy);
    this.shisen = createVector(cx, cy);
    this.s = size;
    this.target = this.setTarget(cx,cy);
    this.angle = 0;
    this.distRatio = 0;
    this.maxDist = max(width, height)  * 0.6;
    this.smoothness = random(0.15, 0.01);
    this.tone = createGraphics(size, size);
    this.tone.noStroke();
    this.tone.fill(0, 100);
    for(let i = 0; i < size * size * 0.1; i++)
    {
      let x = (1-abs(randomGaussian()) / 5) * size;
      let y = random(size);
      let d = noise(x * 0.01, y * 0.01) * 0.5 + 0.5;
      this.tone.ellipse(x, y, d, d);
    }
  }
  
  setTarget(x, y)
  {
    this.target = createVector(x,y);
  }
  
  update()
  {
    this.shisen.add(p5.Vector.mult(p5.Vector.sub(this.target, this.shisen), this.smoothness));
    this.angle = atan2(this.shisen.y - this.c.y, this.shisen.x - this.c.x);
    let d = this.shisen.dist(this.c); 
    this.distRatio = map(d, 0, this.maxDist, 0, 1, true);
  }
  
  display()
  {
    ellipseMode(CENTER);
    imageMode(CENTER);
    fill(255);
    noStroke();
    push();
    translate(this.c.x, this.c.y);
    ellipse(0,0, this.s, this.s);
    drawingContext.clip();
    let x = this.distRatio * this.s * 0.5 * cos(this.angle);
    let y = this.distRatio * this.s * 0.5 * sin(this.angle);
    let s = this.s * (0.5 +(1-this.distRatio) * 0.2 );
    fill(40);
    ellipse(x, y, s, s);
    fill(0);
    ellipse(x* 1.3, y * 1.3, s * 0.5, s * 0.5);
    fill(255);
    ellipse(x * 0.5, y * 0.5, s * 0.2, s * 0.2);
    image(this.tone, 0, 0);
    pop();
  }
}
