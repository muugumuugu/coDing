var numPoints = 100

function setup() { 
createCanvas(500, 500);
} 

function draw() { 
background(220);
translate(width * 0.5, height * 0.5);

for (var i = 0; i < numPoints; i += 1 ) {
var angle = map(i, 0, numPoints, 0, TWO_PI);
var x = sin(angle + frameCount * 2) * 100;
var y = cos(angle) * 5;
for(var j = 0; j < 90; j += 1) {
var jAngle = map((mouseX * j), 0, width * 10, 0, TWO_PI);
var s = sin(angle + frameCount * .1) * 20;
  noStroke();
  fill(random(200),random(200),random(200));
ellipse(x + sin(jAngle + frameCount * 0.91) * 100, y + cos(jAngle + angle + frameCount * 0.01) * 100, s, s);

}
  
  
}
}
