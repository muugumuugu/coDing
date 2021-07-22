int numFrames=500;
//stars
float starsCount = 10000;
PImage stars;
float skyRotation = 0;
float rotationIncrement;
PGraphics gStars;
int starsoffset;
//moon
float radius = 70;
float glowOffset = 50;
float moon_x, moon_y;
PGraphics gMoon;
//nebula
float tx, ty, tz = 0.0f;
float noiseX = 0.004f;
float noiseY = 0.001f;
float noiseZ = 0.00001f;
//ground
PGraphics gGround;
//Tree
PGraphics gTree;


void setup(){
   size(640, 360); 
   background(0);
   initStars();
   initMoon();
   initGround();
   initTree();
}

void initStars(){
  starsoffset = Math.abs(width-height) * 2;
  gStars =  createGraphics(width + starsoffset, height+ starsoffset);
  gStars.beginDraw();
  gStars.background(0);
  gStars.stroke(255);
  for (int i = 0; i < starsCount; i++) {
    float standardDev  = 120;
    float average = max(gStars.width, gStars.height)/2 + 100;
    float x = randomGaussian() * standardDev + gStars.width/2 ;
    float y = randomGaussian() * standardDev + (gStars.height/2);
    float size = 1;
    float randomNumber = random(0, 100);
    if(randomNumber <= 50){
        size = 1.3f;
    }else if(randomNumber <= 98){
        size = 1.7;
    }else{
        size = 2.4;
    }
    gStars.stroke(size);
    gStars.ellipse(x, y, size, size);
  }
  gStars.endDraw();
}

void draw(){
  background(0);
  smooth();
  drawStars();
  drawNebula();
  drawMoon();
  drawGround();
  drawTree();
  if(frameCount<=numFrames)
  {
    saveFrame("fr###.gif");
  }
  if(frameCount==numFrames)
  {
    println("All frames have been saved");
  }
}
