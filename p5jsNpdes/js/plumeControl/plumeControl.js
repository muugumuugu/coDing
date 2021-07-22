// Originally was supposed to mimick the exploding plume death effect in the game Control
// with a fast burst of particles that suddenly slows down.
// tried to get more fancy and make it explode in the direction the mouse is dragged but failed
// below are, in comments, are all my failed attempts.
// So instead made a small swarm of particles that explodes, it's a bit messy, enjoy.
// Mat, 3/1/2020

var PARTICLE_COUNT = 1000;

let particles = [];//new Particle[PARTICLE_COUNT];
let direction = PVector.random2D();
let povar=new PVector();
let center=new PVector();

function setup()
{
  createCanvas(1000, 1000);
  center = new PVector(width/2, height/2);
  
  generateExplosion(new PVector(width/2, height/2));//, 45);
}

function draw()
{
  // Weird new slow motion blur:
  //if (frameCount % 4 == 0) {filter(BLUR);}
  
  // Motion blur
  noStroke();
  fill(255, 20);
  rect(0, 0, width, height);
  
  // Draw explosion target
  //noStroke();
  //fill(0, 255, 0);
  //ellipse(povar.x, povar.y,  30, 30);
  
  // Update particles
  for (var x = 0; x < PARTICLE_COUNT; x++) {//PARTICLE_COUNT; x++){//PARTICLE_COUNT; x++) {
    particles[x].update();
    particles[x].draw();
  }
  
  //var radius = 200;
  //for (var i = 1; i <= 360; i++) {
  //  var x = povar.x + (radius * cos(i));
  //  var y = povar.y + (radius * sin(i));
  //  fill(255, 0, 20);
  //  ellipse(x, y, 10, 10);
  //}
  
  //var theta = abs(degrees(atan2(povar.y - center.y, povar.x - center.x)));
  //var x = radius * cos(theta);
  //var y = radius * sin(theta);
  //fill(255, 200, 0);
  //ellipse(x, y, 20, 20);
  
  //if (end != null) 
  //{
    // prvarln(time);
    //stroke(0, map(abs(time), 0, 1000, 0, 255), 0);
    //line(start.x, start.y, end.x, end.y); 
    
    //var angle = PVector.angleBetween(start, end);
    //PVector v1 = new PVector(10, 20);
    //PVector v2 = new PVector(60, 80);
    //angle += TWO_PI;
    
    //var run = end.x - start.x; // lower part of slope
    //var rise = end.y - start.y;
    //var slope = rise / run;
    //var angle = 0;
    
    //if (run >= 0 && rise >=0) { angle = degrees(atan(slope)); }
    //else if (run < 0 && rise > 0) { angle = degrees(atan(slope)) + 180; }
    //else if (run < 0 && rise <= 0) { angle = degrees(atan(slope)) + 180; }
    //else if (run >= 0 && rise < 0) { angle = degrees(atan(slope)) + 360; }
    ////var angle = degrees(atan(slope));
    
    //var angle = degrees(PVector.angleBetween(v1, v2));
    //prvarln(angle);
    //prvarln("----");
    //prvarln(start);
    //prvarln(end);
    //prvarln(angle);
    // lower time = greater radius
    // longer line = more spread
  //}
}

//var time = 0;
//PVector start = null;
//PVector end = null;
function mousePressed()
{
  
  //generateExplosion(new PVector(mouseX, mouseY));
  //start = new PVector(mouseX, mouseY);
  //end = null;
  //time = millis();
}

let previousMouse = new PVector(0, 0);

function mouseDragged()
{
  // lerp
  //PVector circleLocation = new PVector(0, 0);
  
  //circleLocation.x = lerp(previousMouse.x, mouseX, 0.25);
  //circleLocation.y = lerp(previousMouse.y, mouseY, 0.0025);
  //fill(0);
  //ellipse(circleLocation.x, circleLocation.y, 5, 5);
  //previousMouse = new PVector(mouseX, mouseY); 
  //fill(0);
  //ellipse(mouseX, mouseY, 5, 5);
}

function mouseReleased()
{
  //end = new PVector(mouseX, mouseY);
  //time -= millis();
  
  // Work out the angle the mouse was dragged in
  //var run = end.x - start.x; // lower part of slope
  //var rise = end.y - start.y; // upper part of slope
  //var slope = rise / run;
  //var angle = 0;
  
  //if (run >= 0 && rise >=0) { angle = degrees(atan(slope)); }
  //else if (run < 0 && rise > 0) { angle = degrees(atan(slope)) + 180; }
  //else if (run < 0 && rise <= 0) { angle = degrees(atan(slope)) + 180; }
  //else if (run >= 0 && rise < 0) { angle = degrees(atan(slope)) + 360; }
  
  //var theta = degrees(atan2(end.y - start.y, end.x - start.x));
  
  ////angle -= 90;
  //if (theta < 0) {
  //  theta = abs(theta)+90;  
  //}
  
  //prvarln(theta);
  generateExplosion(new PVector(mouseX, mouseY));//theta);
}

function generateExplosion(PVector origin)//), var angle)
{
  var fuse = var(random(10, 50));
  var r = 50;
  
  // Generate in a circle
  for (var i = 0; i < PARTICLE_COUNT; i++) {
    var ang = random(1, 360);
    var x = origin.x + (r * cos((PI/120) * ang));
    var y = origin.y + (r * sin((PI/120) * ang));
    Particle p =  new Particle(new PVector(x, y), new PVector(width/2, height/2));
    p.explosionTimer = (var)fuse;
    particles[i] = p;
  }
  
  //var radius = random(200, 450);
  //angle = random(1, 360);
  //var maxAngle = random(60, 200);
  
  //for (var i = 1; i <= 90; i++) {
  //  var a = random(30);
  //  var x = origin.x + (radius * cos(angle + (PI/120) * a)); // center.x + (radius * cos(angle + ((PI/120) * i))); // It was all going well but I dont know why PI/120 makes the angle make sense but hey
  //  var y = origin.y + (radius * sin(angle + (PI/120) * a));
  //  particles[i-1] = new Particle(new PVector(origin.x, origin.y), new PVector(x, y));  //width/2, height/2), new PVector(x, y));  
  //}
  
  //for (var i = 0; i < PARTICLE_COUNT; i++) {
  //  PVector spawn = new PVector((width/2) + random(-30, 30), height/2 + random(-30, 30));
  //  var a = random(maxAngle);
  //  var x = origin.x + (radius * cos(angle + (PI/120) * a)); // cos(angle + (PI/120) * a)); // center.x + (radius * cos(angle + ((PI/120) * i))); // It was all going well but I dont know why PI/120 makes the angle make sense but hey
  //  var y = origin.y + (radius * sin(angle + (PI/120) * a));//sin(angle + (PI/120) * a));
  //  //new PVector(origin.x, origin.y)
  //  particles[i] = new Particle(spawn, new PVector(x, y));  //width/2, height/2), new PVector(x, y));  
  //}
  
  //var r = 200;
  //for (var i = 1; i <= 360; i++) {
  //  var x = origin.x + (r * cos((PI/120) * i));
  //  var y = origin.y + (r * sin((PI/120) * i));
  //  fill(map(i, 1, 360, 0, 255), 0, 20);
  //  ellipse(x, y, 10, 10);
  //}
  
  //// Create new particles
  //for (var i = 0; i < PARTICLE_COUNT; i++) {
    
  //  stroke(255, 100, 0);
  //  var our_angle = var(angle + random(-2, 2));
  //  prvarln(our_angle);
    
  //  var x = center.x + (radius * cos(our_angle)); 
  //  var y = center.y + (radius * sin(our_angle));
  //  //var currentPovarY = povar.y + random(350);
  //  particles[i] = new Particle(new PVector(width/2, height/2), new PVector(x, y));//currentPovarX, currentPovarY));
  //  line(center.x, center.y, x, y);
  //}
  
  ////var angle2 = 0;
  ////for (var i = 1; i <= 360; i++) {
  ////  var x = center.x + (radius * cos(angle2 + i));
  ////  var y = center.y + (radius * sin(angle2 + i));
  ////  particles[i-1] = new Particle(new PVector(width/2, height/2), new PVector(x, y));
  ////}
  
  //var x = center.x + (radius * cos(angle));
  //var y = center.y + (radius * sin(angle));
  //povar = new PVector(x, y);
}

class Particle 
{
  PVector pos= new PVector();;
  PVector vel;
  PVector acc;
  PVector target;
  var life;
  var explosionTimer =  17; // when to explode
  boolean exploded = false;
  var life_tick; // When to slow down
  boolean done = false; // Done is used as part of the explosion sequence (sorry)
  
  Particle(PVector p, PVector dir)
  {
    life = 200;
    pos = p;
    target = dir;
    vel = new PVector(0, 0);
    life_tick = random(155, 180);
  }
  
  function update()
  { 
    //PVector mouse = new PVector(mouseX, mouseY);
    
    // Accelerate toward target
    let mouse = new PVector(random(-5, 5) + width/2, random(-5, 5) + height/2);
    if (exploded)
    {
      mouse = target;
    }
    acc = PVector.sub(mouse, pos);
    
    // Slow down all particles
    if (explosionTimer <= 0 && !exploded) {
      
      acc.mult(random(5, 7));
      //vel.div(20);
      target = new PVector(random(width), random(height));
      exploded = true;
    } 
    
    if (life < life_tick && !done)
    {
      vel.div(20);
      done = true;
    } else if (!done) {
    // Accelerate particls normally if not slowed
    //if (!exploded) {
      acc.setMag(random(0.5 , 1));// 0.05));//7));//0.05));    
      vel.add(acc);  
    }
    
    pos.add(vel);  
    explosionTimer--;
    life--;
  }
  
  function draw() 
  {
    noStroke();
    
    if (done) {
      fill(map(abs(vel.x), -2, 1, 0, 255), map(abs(vel.y)*10, 0, 10, 0, 250), 0); 
      
    } else {
      fill(map(abs(vel.mag()), 0, 20, 0, 255), 0, 50);//, life);
    }
    ellipse(pos.x, pos.y, 2, 2);
    
    
    //fill(0, 200, 244);
    //ellipse(target.x, target.y, 4, 4);
  }
}
