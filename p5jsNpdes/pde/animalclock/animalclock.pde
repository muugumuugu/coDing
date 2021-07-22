PImage rabbit;
PImage frog;
PImage turtle;
PImage background1;


int seconds, minutes, hours;
int opacity;

void dotcircle(float r , float freq){
  float circumf=2*PI * r;
  float numDots= int(circumf/freq);
  for(float i=0;i<=numDots ; i++){
   float theta=i/TWO_PI;
   point(r*cos(theta),r*sin(theta));
  }
}
void clockit(){
  pushMatrix();
  strokeWeight(8);
   translate(width/2+10, height/2+15);
   for (int i=0;i<12;i++){
     arc(0,0,600,600,TWO_PI*i/12- TWO_PI/48,TWO_PI*i/12+ TWO_PI/48);
   }
  
  popMatrix();
  }
void setup () {
  
  size (731,672);
  
  rabbit = loadImage ("rabbit.png");
  frog = loadImage ("frog.png");
  turtle = loadImage ("turtle.png");
  background1 = loadImage("clock_designs.png");


}

void draw () {

      image (background1, 2, -1);
  clockit();
    /////////// drawing ellipses to show correct path //////////////////////
  
  stroke(0);
  strokeWeight(1);
  noFill();
  pushMatrix();
  translate(width/2+10, height/2+15);
 // ellipse(width/2+10, height/2+15, 440, 440);
 // ellipse(width/2+10, height/2+15, 340, 340);
  //ellipse(width/2+10, height/2+15, 240, 240);
  dotcircle(220,3);
  dotcircle(170,3);
  dotcircle(120,3);
  popMatrix();

   seconds = second ();
   minutes = minute();
   hours = hour();
   
    
 
 
  clockmechanics();
  
  if (hours >= 12) {
    opacity = 5;
  } else {
    opacity = 255;
  }
  
  

  

}

void clockmechanics () {

 
 float mappedSecondsData = map(seconds, 0, 60, 0, TWO_PI) - HALF_PI;
 float mappedMinutesData = map(minutes, 0, 60,0,TWO_PI) - HALF_PI;
 float mappedHoursData = map(hours,0,24,0,TWO_PI * 2) - HALF_PI;

 float xPos = width / 2 + cos(mappedSecondsData) * 220+10;
 float yPos = height / 2 + sin(mappedSecondsData) * 220 + 15;
  
 //point(xPos, yPos);
  
  /////////////////////////////// here is new code //////////////////////////
  
  
  pushMatrix();

  translate(xPos, yPos);
  rotate(mappedSecondsData + PI / 2);
  
  image(rabbit, (-rabbit.width / 3) / 2, (-rabbit.height / 3) / 2, rabbit.width/3, rabbit.height/3);
  
  popMatrix();
  
  /////////////////////////////// ////////////////////////////////////////////
  
 
 float xPosMin = width / 2 + cos(mappedMinutesData) * 170+10;
 float yPosMin = height / 2 + sin(mappedMinutesData)*170+15;
 //point(xPos,yPos);
  
/////////////////////////////// here is new code //////////////////////////
  
  pushMatrix();
  
  translate(xPosMin, yPosMin);
  rotate(mappedMinutesData + PI / 2);
   image(frog, (-frog.width / 4) / 2, (-frog.width / 4) / 2, frog.width/4, frog.height/4);
 
  popMatrix();
  
  /////////////////////////////// ////////////////////////////////////////////
  
  
 float xPosHour = width / 2 + cos(mappedHoursData) * 120+10;
 float yPosHour = height / 2 + sin(mappedHoursData) * 120+15;
 //point(xPos, yPos);
  
  /////////////////////////////// here is new code //////////////////////////
  
  pushMatrix();
  
  translate(xPosHour, yPosHour);
  rotate(mappedHoursData + PI / 2);
  
  image(turtle, (-turtle.width / 6) / 2, (-turtle.height / 6) / 2, turtle.width/6, turtle.height/6);
  
  popMatrix();
  
  /////////////////////////////// ////////////////////////////////////////////
  
  

  
  
 }
