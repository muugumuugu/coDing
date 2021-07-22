let scrblrs = [];
const COLS = createCols("https://coolors.co/242220-ff6a45-ffb094-7934ad-1bc4b6-6a7a5b");

function setup()
{
  createCanvas(windowWidth, windowHeight);
  background(0);
  
  for(let i=0; i < 75; i++)
  {
    scrblrs.push(new Scribbler(width/2, height /2));
  }
}

function draw()
{
  background(COLS[0]);
  for(const scrblr of scrblrs){
    scrblr.update();
    scrblr.display();
  }
  
}



class Scribbler
{
  constructor(x, y)
  {
    this.cX = x;
    this.cY = y;
    this.minRadius = 25;
    this.maxRadius = min(width, height) * 0.4;
    
    this.isMovingAngle = false;
    this.radius = random(this.minRadius, this.maxRadius);
    this.angle = random(TWO_PI);
    this.angleV = 0;
    this.radiusV = 0;
    this.randomVelocities();
    
    this.strokeW = random(1,2.5);
    this.strokeC = COLS[floor(random(1,COLS.length))];
    
    this.cache = [];
    this.cacheCapacity = 120;
    
    this.cycle = floor(random(200,300));
    this.rotateAngle = random(TAU);
    this.rotateAngleTarget = this.rotateAngle + random(-1, 1);
    this.ratio = 0;
    this.frameOffset = floor(random(this.cycle));
  }
  
  
  update()
  {
    //pos
    let curX = (cos(this.angle) * this.radius);
    let curY = (sin(this.angle) * this.radius);
    this.cache.push(createVector(curX,curY));
    if(this.cache.length > this.cacheCapacity) this.cache.shift();
    
    //param
    if(this.isMovingAngle)
    {
      this.angle += this.angleV;
    }
    else 
    {
      if(this.radius < this.minRadius && this.radiusV < 0)this.radius += 0;
      else this.radius += this.radiusV * (1 + this.radius * 0.005);
    }
    if(random(1) > 0.9)
    {
       this.swapMode();
    }
    
    //time
    const count = frameCount + this.frameOffset;
    const cycleRatio = (count % this.cycle) / this.cycle;
    const cycleRatioMult = min(cycleRatio * 4, 1);
    const cycleRatioEased = easingEaseInOutCubic(cycleRatioMult);
    this.ratio = cycleRatioEased;
    if(count % this.cycle == 0){
      this.rotateAngle = this.rotateAngleTarget;
      this.rotateAngleTarget = this.rotateAngle + random(-1, 1);
    }
  }
  
  display()
  {
    let rotateAngle =  lerp(this.rotateAngle, this.rotateAngleTarget, this.ratio);
    let vertRatio =  1 + sin((this.ratio) * TAU) * 0.01;
    stroke(this.strokeC);
    strokeWeight(this.strokeW);
    noFill();
    push();
    translate(this.cX, this.cY);
    rotate(rotateAngle);
    beginShape();
    for(const p of this.cache){
      vertex(p.x * vertRatio, p.y* vertRatio);
    }
    endShape();
    pop();
  }
  
  swapMode()
  {
     this.isMovingAngle = !this.isMovingAngle;
     this.randomVelocities();
  }
  
  randomVelocities()
  {
    const angleSP = 0.05;
    const radiusSP = 2;
    this.angleV = random() > 0.5 ? random(-angleSP, -angleSP * 0.1) : random(angleSP, angleSP * 0.1) ;
    if(this.radius < this.minRadius)this.radiusV =  random(radiusSP * 0.1, radiusSP);
    else if(this.radius > this.maxRadius)this.radiusV =  random(-radiusSP, -radiusSP * 0.1);
    else this.radiusV = random() > 0.5 ? random(radiusSP * 0.1, radiusSP) : random(-radiusSP, -radiusSP * 0.1);
  }
}


function easingEaseInOutCubic (x) {
  if(x < 0.5)return 0.5 * pow(2*x, 3);
  else return 0.5 * pow(2*(x-1), 3) + 1;
}

function createCols(_url)
{
  let slash_index = _url.lastIndexOf('/');
  let pallate_str = _url.slice(slash_index + 1);
  let arr = pallate_str.split('-');
  for (let i = 0; i < arr.length; i++) {
    arr[i] = '#' + arr[i];
  }
  return arr;
}
