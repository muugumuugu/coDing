// gif by dave @beesandbombs :)

int[][] result;
float t, c;

float ease(float p) {
  return 3*p*p - 2*p*p*p;
}

float ease(float p, float g) {
  if (p < 0.5) 
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}

float mn = .5*sqrt(3), ia = atan(sqrt(.5));

void push() {
  pushMatrix();
  pushStyle();
}

void pop() {
  popStyle();
  popMatrix();
}

void draw() {

  if (!recording) {
    t = mouseX*1.0/width;
    c = mouseY*1.0/height;
    if (mousePressed)
      println(c);
    draw_();
  } else {
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;

    c = 0;
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
      draw_();
      loadPixels();
      for (int i=0; i<pixels.length; i++) {
        result[i][0] += pixels[i] >> 16 & 0xff;
        result[i][1] += pixels[i] >> 8 & 0xff;
        result[i][2] += pixels[i] & 0xff;
      }
    }

    loadPixels();
    for (int i=0; i<pixels.length; i++)
      pixels[i] = 0xff << 24 | 
        int(result[i][0]*1.0/samplesPerFrame) << 16 | 
        int(result[i][1]*1.0/samplesPerFrame) << 8 | 
        int(result[i][2]*1.0/samplesPerFrame);
    updatePixels();

    saveFrame("f###.gif");
    if (frameCount==numFrames)
      exit();
  }
}

//////////////////////////////////////////////////////////////////////////////

int samplesPerFrame = 4;
int numFrames = 160;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(800, 600, P3D);
  smooth(8);
  result = new int[width*height][3];
  strokeWeight(3);
  noFill();
  colorMode(HSB,1);
}

float th, dd;

void wavingVertex(float x_, float y_) {
  dd = dist(x_, y_, 0, 0)/r;
  th = PI/6*sin(TWO_PI*t - HALF_PI*sq(dd));
  vertex(x_*cos(th) + y_*sin(th), y_*cos(th) - x_*sin(th), 90*cos(TWO_PI*t - 3*sq(dd)));
}

float qq;
void lines() {
  for (int i=0; i<N; i++) {
    qq = i/float(N-1);
    stroke((4*sq(qq)*(1-qq) + .25 + t)%1,1,1);
    x = map(i, -.5, N-.5, -r, r);
    Y = sqrt(r*r - x*x);
    m = int(Y+10);
    beginShape();
    for (int j=0; j<m; j++) {
      y = map(j, 0, m-1, -Y, Y);
      wavingVertex(x, y);
    }
    endShape();
  }
}

float x, y, z, tt;
int N = 17, m;
float r = 250;
float Y;

void draw_() {
  background(0); 
  push();
  translate(width/2, height/2 - 50);
  rotateX(.67);
  
  lines();
  
  push();
  rotate(TWO_PI/3);
  lines();
  pop();
  push();
  
  rotate(-TWO_PI/3);
  lines();
  pop();
  
  push();
  stroke(t,1,1);
  translate(0,0,90*cos(TWO_PI*t + TWO_PI*0.525));
  ellipse(0,0,2*r,2*r);
  pop();
  
  pop();
}
