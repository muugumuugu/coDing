
class InkParticle{
  constructor (pos) {
    this.name = "Scared Octopus";
    this.size = 20;
    this.pos = createVector(mouseX, mouseY);
    this.speed = p5.Vector.random2D();
    this.speed.mult(1); 
    this.color = color (6, 15, 45, 100); 
  }

  
  //This draws the ellipses with the size,
  //position and color declared in the
  //InkParticle class
  siphon(){
    noStroke(); 
    fill (this.color); 
    ellipse (this.pos.x, this.pos.y, this.size);
  }
  
  //This scatter the ellipses with the speed
  //declared in the InkParticle class
  scatter(){
    this.pos.add(this.speed);
  }
  
  disappear () {
    return this.color <0;
  }
}

var particles = [];

function setup(){
  createCanvas(windowWidth, windowHeight);
}

function draw(){
  background(255);
  for (i = 0; i < 8; i++){
      let a = new InkParticle();   
      particles.push(a); 
  }
  
  for (i = 0; i < particles.length; i++){
    particles[i].siphon();
    particles[i].scatter();
  }
}
