var img;
var img2;



function setup() {
createCanvas(windowWidth,windowHeight);
  frameRate(100)
int(x = 500);
int(y = 500);
int(xmovement = 0);
int(ymovement = 0);
boolean(leftWall = false);
boolean(rightWall = false);
boolean(topWall = false);
boolean(bottomWall = false);
img = loadImage('space.jpg')
img2 = loadImage('ufo.png')
}

function draw() {
  background(0,0,0);
  x += xmovement;
  y += ymovement;
  fill (200,200,200);
  rect (50,50,50,800)
  rect (50,50,50,50)
  rect (100,50,1700,50)
  rect (1800,50,50,800)
  rect (1800,50,50,50)
  rect (50,800,1800,50)
  rect (1800,800,50,50)
  rect (50,800,50,50)
  image(img,0,0)
  stroke(255)
  ellipse(x,y,50,50);
  fill (150,150,150)
  noStroke()
  ellipse (x - 2, y - 2,45,45)
  fill (150,150,255)
  ellipse(x,y,25,25)
  fill (100,100,255)
  noStroke()
  ellipse(x - 2,y - 2,20,20)
  if (x <= 115) {
    xmovement = 0;
    xmovement += 0.2;
  leftWall = true;
  }else if (x >= 1785) {
    xmovement = 0;
    xmovement -= 0.2;
    rightWall = true;
  }else if (y <= 115) {
    ymovement = 0;
    ymovement += 0.2;
    topWall = true;
    }else if (y >= 785) {
    ymovement = 0;
    ymovement -= 0.2;
    bottomWall = true;
    }else {
      bottomWall = false;
      topWall = false;
      rightWall = false;
      leftWall = false;
    }
  if (keyIsPressed && ymovement <= 30 && ymovement >= -30 && xmovement <= 30 && xmovement >= -30) {
   if (keyCode == LEFT_ARROW && leftWall == false) {
    xmovement -= 0.3;
  }else if (keyCode == RIGHT_ARROW && rightWall == false) {
    xmovement += 0.3;
  }else if (keyCode ==  UP_ARROW && topWall == false) {
    ymovement -= 0.3;
  }else if (keyCode == DOWN_ARROW && bottomWall == false) {
    ymovement += 0.3;
  }else {
  xmovement /= 1.4;
  ymovement /= 1.4;
  }
  }
}
