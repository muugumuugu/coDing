// "creature" by dave :)

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

float c01(float g) {
  return constrain(g, 0, 1);
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
int numFrames = 240;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(750, 750, P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  stroke(255);
  strokeWeight(1.7);
  noFill();
}

float x, y, z, tt;
int n = 720;
float qq, th, r, R = 42, l = 300;
float nt = 12;
int N = 12;
float tw, twm = PI/10;
float xx, yy;

void spiral(float q) {
  beginShape();
  for (int i=0; i<n; i++) {
    qq = i/float(n-1);
    r = map(cos(TWO_PI*qq), 1, -1, 0, R)*sqrt(qq);
    th = nt*TWO_PI*qq - 4*TWO_PI*t - q;
    x = r*cos(th);
    y = -l*qq + r*sin(th);
    
    tw = twm*sin(TWO_PI*t - PI*qq);
    
    xx = x*cos(tw) + y*sin(tw);
    yy = y*cos(tw) - x*sin(tw);
    
    vertex(xx, yy);
  }
  endShape();
}

void draw_() {
  background(0); 
  push();
  translate(width/2, height/2);
  for (int i=0; i<N; i++) {
    push();
    rotate(TWO_PI*i/N);
    spiral(TWO_PI*i/N);
    pop();
  }
  pop();
}
