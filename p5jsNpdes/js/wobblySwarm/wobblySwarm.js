//fons, de rodona a quadrat, de color blau a color verd, + transparent, distancia de quadrats
var mass = [];
var positionX = [];
var positionY = [];
var velocityX = [];
var velocityY = [];

/////////////////////////////////////////////////////////////////////////////////////////////////////

function setup() {
  createCanvas(windowWidth, windowHeight);
  noStroke();
  fill(50, 355, 50, 20);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

function draw() {
  background(25);
  
  for (var particleA = 0; particleA < mass.length; particleA++) {
    var accelerationX = 0, accelerationY = 0;
    
    for (var particleB = 0; particleB < mass.length; particleB++) {
      if (particleA != particleB) {
        var distanceX = positionX[particleB] - positionX[particleA];
        var distanceY = positionY[particleB] - positionY[particleA];

        var distance = sqrt(distanceX * distanceX + distanceY * distanceY);
        if (distance < 1) distance = 1;

        var force = (distance - 30) * mass[particleB] / distance;
        accelerationX += force * distanceX;
        accelerationY += force * distanceY;
      }
    }
    
    velocityX[particleA] = velocityX[particleA] * 0.99 + accelerationX * mass[particleA];
    velocityY[particleA] = velocityY[particleA] * 0.99 + accelerationY * mass[particleA];
  }
  
  for (var particle = 0; particle < mass.length; particle++) {
    positionX[particle] += velocityX[particle];
    positionY[particle] += velocityY[particle];
    
    rect(positionX[particle], positionY[particle], mass[particle] * 2000, mass[particle] * 2000);
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

function addNewParticle() {
  mass.push(random(0.005, 0.05));
  positionX.push(mouseX);
  positionY.push(mouseY);
  velocityX.push(0);
  velocityY.push(0);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

function mouseClicked() {
  addNewParticle();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////

function mouseDragged() {
  addNewParticle();
}
