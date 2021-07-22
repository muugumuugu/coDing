//sin and cosine
//https://processing.org/reference/sin_.html
//https://processing.org/reference/cos_.html
//https://processing.org/reference/radians_.html
//https://processing.org/reference/degrees_.html

float circleSize = 15;
float radius = 100;
float center = 300;

void setup() {
    size(600, 600); 
    background(255); 
  
  //--- 1 ---
  //drawing a circlo using sin and cosine
  colorMode(HSB, 360, 255, 255);
  for(float i=0; i<PI*2; i+=PI/10){
    fill(degrees(i), 255, 255);
   	ellipse(cos(i)*radius+center, sin(i)*radius+center, circleSize, circleSize); 
  }
}

void draw() {
  //--- 2 ---
  //understanding how cosine and sine works
  /*
  float velocity = frameCount/50;
  float mySin = sin(velocity);
  float myCos = cos(velocity);
  colorMode(HSB, 360, 255, 255);
  fill(degrees(velocity)%360, 255, 255);
  stroke(255, 150);
  ellipse(velocity*10, mySin*radius+center, circleSize, circleSize);
  ellipse(myCos*radius+center, velocity*10, circleSize, circleSize);
  stroke(0, 150);
  ellipse(myCos*radius+center, mySin*radius+center, circleSize, circleSize);
  /**/
  
  
  //--- 3 ---
  //what happens when sin and cosine have different speed?
  /*
  colorMode(RGB, 255);
  float velocityX = frameCount/5;
  float velocityY = frameCount/3;
  fill(255, 255, 0);
  ellipse(cos(velocityX/10)*radius+center, sin(velocityY/10)*radius+center, circleSize, circleSize);
  /**/
}