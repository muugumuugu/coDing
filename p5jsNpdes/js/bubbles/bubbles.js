let bubbles = []; 
let numExports = 0;

function setup() {
  myCanvas = createCanvas(windowWidth, windowHeight);
  colorMode(HSB, 255); 
  background(145,256,256);
  for (i = 0; i < 1000; i++) {
    bubbles[i] = new Bubble(random(width), random(height+(height/2),height+100), (i%100));
  }
}

function draw() {
  background(145,200,256);
  for (i = 0; i < 1000; i++) {
    if (bubbles[i].posY < 0 - bubbles[i].distMod) {
      bubbles[i].replaceBubble(i); 
    }
    bubbles[i].update();
  }
  if (keyIsPressed) {
    whenKeyPressed(); 
  }
}

function whenKeyPressed() {
  if (keyCode == 69) { 
    saveCanvas(myCanvas,"screenshot"+numExports,"png");
    numExports++;
  }
}

class Bubble {

  constructor(startPosX, startPosY, distMod) { 
    this.posX = startPosX;
    this.posY = startPosY; 
    this.distMod = distMod;
    this.velY = int(random(1,6));
    this.h = random(135,160); 
    this.s = random(100,200);
    this.b = 256; 
    this.a = 100;
  }
  
  update() { 
    stroke(this.h, this.s, this.b);
    fill(this.h, this.s, this.b,this.a); 
    ellipse(this.posX, this.posY, this.distMod, this.distMod);
    this.posY -= this.velY; 
  }
  
  replaceBubble(index) { 
    bubbles[index] = new Bubble (random(width), random(height+(height/2),height), (index%100));                                   
  }
}
