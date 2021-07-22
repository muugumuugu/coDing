let bubbles = [];
let nums = [100, 25, 12, 72];
let num = 23;
let mousePos = p5.Vector(0,0,0);
const mouseRadius = 30;
let size, radius, center;
let mouseOver = false;

function setup() {
  
    size = min(windowWidth, windowHeight);
    createCanvas(size, size);
  
    center = createVector(width/2, height/2);  
    radius = 120;
  
  for(let i = 0; i<500; i++){
    let x = random(width);
    let y = random(height);
    let r = random(10, 40);
    let b = new Bubble(x, y, r);
    bubbles.push(b);
  }
}

function draw() {
  background(0);
  if(!mouseOver){
    mousePos = createVector(width/2,height/2);
  }
  else{
    mousePos = createVector(mouseX, mouseY);
    
    for (let bubble of bubbles){
    let d1 = bubble.dest;
    let s1 = bubble.r;
    let minMouseDist = mouseRadius*4 + s1/2;
    
    
    //distance from mouse
    if(d1.dist(mousePos) < minMouseDist){
      let a = atan2(d1.y - mousePos.y, d1.x - mousePos.x);
      d1.x = mousePos.x + cos(a) * minMouseDist;
      d1.y = mousePos.y + sin(a) * minMouseDist;
    }
    
    //circular constrain
    let maxRadius = radius * 0.9;
    if(d1.dist(center) < maxRadius){
      let a = atan2(d1.y - center.y, d1.x - center.x);
      d1.x = center.x + cos(a) * (maxRadius - s1);
      d1.y = center.y + sin(a) * (maxRadius - s1);
    }
    
    //smooth
    bubble.pos.x += (d1.x - bubble.pos.x) * 0.09;
    bubble.pos.y += (d1.y - bubble.pos.y) * 0.09;
}
  }
    
  fill(mouseOver?color(205,0,0):255);
  ellipse(mousePos.x, mousePos.y, mouseRadius);
  
  for (let bubble of bubbles){
    bubble.hover(mouseX, mouseY);
    bubble.move();
    bubble.show();
  }
}

class Bubble{
  
  constructor(x, y, r){
    this.pos = createVector(x, y);
    this.dest = createVector(x, y);
    this.r = r;
    this.colour = createVector(random(255), random(255), random(255));
    this.StrokeColour = createVector(random(255), random(255), random(255)); 
    this.brightness = 0;
  }
  
  hover(px, py){
    let d = dist(px, py, this.pos.x, this.pos.y);
    if(d < this.r){
    this.StrokeColour.y = 0;
    this.StrokeColour.z = 0;
    }
  }
  
  clicked(px, py){
    let d = dist(px, py, this.pos.x, this.pos.y);
    if(d < this.r){
    this.brightness = 1;
    }
  }
  
   move(){
    this.pos.x += random(-1,1);
     this.pos.y += random(-1,1);
  }
  
   show(){
    strokeWeight(2);
     stroke(this.StrokeColour.x, this.StrokeColour.y, this.StrokeColour.z);
    fill(this.colour.x*this.brightness, this.colour.y*this.brightness, this.colour.z*this.brightness, 60);   
    ellipse(this.pos.x, this.pos.y, this.r*2);
  }
}

function mousePressed(){
  for (let bubble of bubbles){
    bubble.clicked(mouseX, mouseY);
  }
  
  if(dist(mouseX, mouseY, mousePos.x, mousePos.y)<mouseRadius){
    mouseOver = true;
  }
}
