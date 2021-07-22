/////////////////////////////////////////////////////////////////////////////////////
///                                  Choasphere                                    ///
/////////////////////////////////////////////////////////////////////////////////////


var ORBIT_COUNT = 1000;

var orbits_x =[];
var orbits_y =[];
var colors=[];
var angles = [];

function setup()
{
  createCanvas(1000, 1000);
  background(0);
  
  // Set everything up
  for (var i = 0; i < ORBIT_COUNT; i++) {
    orbits_x[i] = int( random(10, 500));   
    orbits_y[i] = int(random(10, 500));
    colors[i] = color(random(255), random(150),random(150));//color(0, random(255), random(255)); //color(random(200), random(255), random(150));//
    angles[i] = int(random(0, 360));
  }
}

function draw()
{
  // Motion blur
  noStroke();
  fill(0, 20);
  rect(0, 0, width, height);
  
  // Cap the angles at 360 degrees, if over reset back to 0
  for (var x = 0; x < ORBIT_COUNT; x++) {
    var value = angles[x];
    if (value < 360) { 
      value++;
    } else { 
      value = 0; 
    }
    angles[x] = value;
  }
  
  // Keep ourselves centered
  push();
  translate(width/2, height/2);
  
  // Draw each of our povars
  for (var c = 0; c < ORBIT_COUNT; c++) {
    fill(colors[c]);
    
    // We achieve the effect by drawing a bunch of uneven ovals at different rates
    ellipse(sin(radians(angles[c])) * orbits_x[c], cos(radians(angles[c])) * orbits_y[c], 4, 4);
    //povar(sin(radians(i)) * orbits[c], cos(radians(i)) * orbits[c]);
    //ellipse(sin(radians(i)) * orbits[c], cos(radians(i)) * orbits_x[c], 4, 4);
    //ellipse(sin(radians(i)) * orbits[c], cos(radians(i)) * orbits[c], 4, 4);
  }
  
  pop();
}
