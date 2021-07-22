/*
Die Idee war, mit der TextToPoints Funktion Punkte zu erzeugen,
welche von dem Mauszeiger flüchten. dies ist mir nach ein 
bisschen rumprobieren auch recht gut gelungen. Ich hatte 
nach dem es schon funktioniert hat nochmals eine andere Idee, 
wie man das gleiche Resultat wahrscheinlich einbisschen 
einfacher ausrechnen könnt. Nämlich könnte man den X und Y 
Unterschied von dem jeweiligen Punkt und des Mauszeigers 
ausrechnen und in diesem Verhältnis den Punkt in die 
andere Richtung verschieben.
 
Autor: Nicolas Kaufmann 
Datum: 19. November 2020
Attribution: Gesamter Code selbst entwickelt
*/

var points;
var font;
var sample = 0;
var radius = [0,20];
var aura = 50;


function preload() {
  font = loadFont('Roboto-Regular.ttf');
}

function setup() {
  createCanvas(windowWidth, windowHeight);
  angleMode(DEGREES);

  points = font.textToPoints('infcom', 0, height / 2, width / 3, {
    sampleFactor: 0.2,
  });
}

function draw() {
  background(0);

  for (let i = 0; i < radius.length; i++) {
    if (radius[i] > aura*2) {
      radius[i] = 0;
    }
    circle(mouseX, mouseY, radius[i]);
    radius[i] += aura/6;
  }

  
  for (var point of points) {
    noFill();
    stroke(255);

    if (dist(mouseX, mouseY, point.x, point.y) < aura) {
      difY = mouseY - point.y;
      difX = mouseX - point.x;
      var angleBetween = Math.atan2(difY, difX);
      angleBetween *= 180 / Math.PI;
      if (angleBetween < 0) {
        angleBetween = 360 + angleBetween;
      }

      newPosDist = random(-5, -20);
      var newPosX = Math.round(Math.cos(angleBetween * Math.PI / 180) * newPosDist + point.x);
      var newPosY = Math.round(Math.sin(angleBetween * Math.PI / 180) * newPosDist + point.y);
      point.x = newPosX;
      point.y = newPosY;
    }

    push();
    translate(point.x, point.y);
    //circle(0,0, 10);
    triangle(random(-10, 10), random(-10, 10), random(-10, 10), random(-10, 10), random(-10, 10), random(-10, 10));
    pop();
  }

  if (sample < 0.1) {
    sample += 0.0005;
  }
}

function mousePressed() {
  aura = 200;
}

function mouseReleased() {
  aura = 50;
}
