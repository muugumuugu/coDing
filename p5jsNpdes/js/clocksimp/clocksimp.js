var size;

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(0);
  size = min (width, height);
}

function draw() {
  background(0);
 
  var s = second();
  var m = minute() + (s/60.0);
  var h = hour()%12 + (m/60.0);
 
  translate(width/2, height/2);
  
  ellipse (0, 0, size, size);
 
  noFill();
  stroke(255);
 
  push();
  rotate(radians(s*(360/60)));
  strokeWeight(1);
  line(0,0,0,-size*0.45);
  pop();
 
  push();
  rotate(radians(m*(360/60)));
  strokeWeight(2);
  line(0,0,0,-size*0.45);
  pop();
 
  push();
  rotate(radians(h*(360/12)));
  strokeWeight(4);
  line(0,0,0,-size*0.3);
  pop();
}
