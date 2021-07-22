//Initialize global variables
var cx, cy;
var secondsRadius;
var minutesRadius;
var hoursRadius;
var clockDiameter;
var lg;
var handColor;
var ff = false;
var ffRate = 100;
var displaySecond;
var displayMinute;
var displayHour;
var offsetSecond = 0;
var offsetMinute = 0;
var offsetHour = 0;

function setup() {
  createCanvas(300, 300);
  stroke(255);
  
  //Generate clock dimensions and position based on canvas size
  var radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  cx = width / 2;
  cy = height / 2;
}

function draw() {
  background(255);
  
  // Draw the clock background
  fill(255);
  noStroke();
  ellipse(cx, cy, clockDiameter*.9, clockDiameter*.9);
  stroke(255);
  noFill();
  strokeWeight(5);
  ellipse(cx, cy, clockDiameter*.9, clockDiameter*.9);
  
  
  //Calculate S, M, and H to be displayed, accounting for "fast forward" offset
  displaySecond = (second() + offsetSecond);
  displayMinute = (minute() + offsetMinute + norm(displaySecond, 0, 60));
  displayHour = (hour() + offsetHour + norm(displayMinute, 0, 60));
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  var s = map(displaySecond, 0, 60, 0, TWO_PI) - HALF_PI;
  var m = map(displayMinute, 0, 60, 0, TWO_PI) - HALF_PI; 
  var h = map(displayHour, 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  //Set handColor according to time, defining fade in / fade out
  if(displayHour%24<6){
    handColor = 255;
  }
  else if (displayHour%24>=6 && displayHour%24<9){
    handColor = map(displayHour%24,6,9,255,0);
  }
  else if (displayHour%24>=9 && displayHour%24<18){
    handColor = 0;
  }
  else if (displayHour%24>=18 && displayHour%24<21){
    handColor = map(displayHour%24,18,21,0,255);
  }
  else if (displayHour%24>=21){
    handColor = 255;
  }
  
  //Draw the hands of the clock
  stroke(handColor);
  strokeWeight(7);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  stroke(handColor);
  strokeWeight(5);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  //stroke(handColor);
  //strokeWeight(3);
  //line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  
  // Draw the minute ticks
  stroke(0);
  strokeWeight(4);
  beginShape(POINTS);
  for (var a = 0; a < 360; a+=6) {
    lg = 1.03;
    if (a%30 == 0){
      lg = 1.06;
    }
    var angle = radians(a);
    var x = cx + cos(angle) * secondsRadius;
    var y = cy + sin(angle) * secondsRadius;
    var x2 = cx + cos(angle) * secondsRadius * lg;
    var y2 = cy + sin(angle) * secondsRadius * lg;
    //strokeWeight(4);
    //vertex(x, y);
    line(x,y,x2,y2);
  }
  endShape();
  
  //Increase minute offset when fast forward toggled "on"/"true"
  if(ff===true){
    offsetMinute += ffRate/60;
  }
}

//Toggle fast forward on mouse click
function mousePressed(){
  ff = !ff;
}
