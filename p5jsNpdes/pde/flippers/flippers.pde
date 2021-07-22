// flippers :)

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

int samplesPerFrame = 8;
int numFrames = 240;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(800, 650, P3D);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  fill(32);
  noStroke();
}

float x, y, z, tt;
int N = 32;

float l = 110, w = 20, dd = .1;
float eas = 3.5;
color c1 = #56B9D0, c2 = #F24C27, c3 = #222629;
float rot;

color col(float q) {
  q %= 1;
  if (3*q <= 1)
    return lerpColor(c1, c2, 3*q);
  else if (3*q <= 2)
    return lerpColor(c2, c3, 3*q-1);
  else
    return lerpColor(c3, c1, 3*q-2);
}

void flipper(float q) {
  rot = (2 - q + t) % 1;
  if (rot <= .5)
    rot = .5*ease(2*rot, eas);
  else
    rot = .5 + .5*ease(2*rot - 1, eas);

  push();

  rotate(2*TWO_PI*q);
  translate(0, r);
  rotateX(TWO_PI*rot);

  push();
  fill(col(q));
  translate(0, 0, dd);
  rect(0, 0, w, l);
  pop();

  push();
  fill(col(q+.5));
  translate(0, 0, -dd);
  rect(0, 0, w, l);
  pop();

  pop();
}

float r = 240;

void draw_() {
  background(250); 
  push();
  translate(width/2, height/2 - 70);
  rotateX(.6);
  for (int i=0; i<N; i++)
    flipper(i*.5/N);
  pop();
}
