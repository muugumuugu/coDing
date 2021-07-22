/*
Kinect to point cloud

I wrote a script that reads depth info from a Kinect and writes the positions to a file.

This sketch reads that file and displays the points.
It's me and my english bulldog!

And of course just for good measure, you can explode it.

Controls:
  - Move the mouse to rotate the camera.
  - Mouse click to explode particles and to reset.

Author:
  Jason Labbe
 
Site:
  jasonlabbe3d.com
*/

var data = null;
var points = [];
var dyn = false;


function Particle(x, y, z) {
  
  this.pos = new p5.Vector(x, y, z);
  
  var explosionSize = 120;
  var d = dist(x, y, z, 0, 0, 0);
  
  this.vel = new p5.Vector(x, y, z);
  this.vel.normalize();
  this.vel.mult(map(max(explosionSize-d, 0), explosionSize, 0, 20, 2));
  
  this.acc = new p5.Vector(0, 0, 0);
  
  this.fallRate = random(0.25, 0.5);
  
  this.move = function() {
    this.acc.add(new p5.Vector(0, this.fallRate));
    
    this.vel.mult(0.98);
    
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
    
    if (this.pos.y > 100) {
      this.pos.y = 100;
      this.vel.y *= -1;
      this.vel.mult(0.9);
    }
  }
}


function reset() {
  mouseX = width/2;
  mouseY = height/2;
  
  points.splice(0, points.length);
  
  if (data != null) {
    for (var i = 0; i < data.length; i++) {
      // Cheating offset to center the points.
      var x = data[i][0]-300;
      var y = data[i][1]-300;
      var z = -data[i][2]*0.7+550; // Depth looks better if it's scaled a it.
      points.push(new Particle(x, y, z));
    }
  }
}


function preload() {
  var url = new XMLHttpRequest();
  url.open("GET", "point_cloud.txt", false);
  url.onreadystatechange = function ()
  {
    if(url.readyState === 4)
    {
      if(url.status === 200 || url.status == 0)
      {
        var allText = url.responseText;
        data = JSON.parse(allText);
      }
    }
  }
  url.send(null);
}


function setup() {
  createCanvas(1112, 834, WEBGL);
  colorMode(HSB, 255);
  reset();
  noStroke();
}


function draw() {
  //scale(1, -1);  // uncomment this line to invert the screen before saving it. Then comment it out again.
  background(50);
  translate(20, 0, 200);
  rotateY(radians(map(mouseX, 0, width, -90, 90)));
  rotateX(radians(map(mouseY, 0, height, -90, 90)));
  
  for (var i = 0; i < points.length; i++) {
    if (dyn) {
      points[i].move();
    }
    
    push();
    translate(points[i].pos.x, points[i].pos.y, points[i].pos.z);
    let d = dist(points[i].pos.x, points[i].pos.y, 0, 0);    
    fill(d%255, 200, 255);
    sphere(1)
    pop();
  }
}

let lapse = 0;    // mouse timer
function mousePressed() {
  // prevents mouse press from registering twice
  if (millis() - lapse > 400){
    dyn = ! dyn;
  
    if (! dyn) {
      reset();
    }
    lapse = millis();
  }
}

function keyPressed(){
  save('pix.jpg');
}
