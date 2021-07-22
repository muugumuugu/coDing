FeaturePoint[] featurePoints = new FeaturePoint[10];
int featureN = 0;

void setup() {
  size(400,400);  
  stroke(255);  
  frameRate(30);

  for (int i = 0; i < featurePoints.length; i++) {
    featurePoints[i] = new FeaturePoint(random(width), random(height));
  }
}

void draw() {
  loadPixels();
  fill(0, 102, 153);
  float[] distances = new float[featurePoints.length];
  float distance;
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      for (int i = 0; i < featurePoints.length; i++) {
        distance = dist(x, y, featurePoints[i].pos.x, featurePoints[i].pos.y);
        distances[i]=distance;
      }
      distances = sort(distances);
      //featureN*50 is an arbitrary choice, helps keep everything from turning pure white due to the map
      pixels[x + y * width]=color(map(distances[featureN], 0, 300+ (featureN*100) , 0, 255));
    }
  }

  updatePixels();

  if (mousePressed) {
    textSize(12);
    fill(255, 0, 0);
    text("N="+featureN, 10, 30); 
    text("Frame Rate="+frameRate, 10, 40);
  }

  for (int i = 0; i < featurePoints.length; i++) {
    FeaturePoint point = featurePoints[i];
    if (mousePressed) {
      fill(255);
      //Clear the last draw of this feature point if it was drawn
      // if it wasn't drawn, the center of the focus point is black anyways so we shouldn't see any effect
      ellipse(point.pos.x, point.pos.y, 12, 12);
    }

    point.move();

    //Technically this position is 1 frame ahead of the noise that's rendered, but given the frame rate it should be fine
    if (mousePressed) {
      fill(0);
      ellipse(point.pos.x, point.pos.y, 12, 12);
    }
  }
}

void keyPressed() {
  if (keyCode==UP && featureN<featurePoints.length-1) {
    featureN++;
  } else if (keyCode==DOWN && featureN>0) {
    featureN--;
  }
}



// Feature point class, used to store position and x,y velocity
class FeaturePoint {
  PVector pos;
  float xVelocity, yVelocity;
  FeaturePoint(float x, float y) {
    pos = new PVector(x, y);
    xVelocity = random(-5, 5);
    yVelocity = random(-5, 5);
  }

  //In some cases the x,y positions will exceed the boundaries of the canvas, the next draw will bring them back in the boundary though.
  void move() {
    pos.x=pos.x+xVelocity;
    if (pos.x>=width || pos.x<=0) {
      xVelocity=-xVelocity;
    } 

    pos.y=pos.y+yVelocity;
    if (pos.y>=height || pos.y<=0) {
      yVelocity=-yVelocity;
    }
  }
}
