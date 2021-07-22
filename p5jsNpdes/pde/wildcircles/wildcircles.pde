// 'wild circles' by @beesandbombs :)

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
float shutterAngle = .4;

boolean recording = false;

void setup() {
  size(800, 700, P3D);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  stroke(128, 255, 128);
  noFill();
  strokeWeight(2.5);
}

float x, y, z;
float r;
int N = 10;
int n;

float ph, th;

float tt;
float a1, a2;

void draw_() {
  t = t-.2;
  background(0); 
  push();
  translate(width/2, height/2);
  for (int i=0; i<N; i++) {
    tt = t-0.2*N;
    a1 = map(-sin(TWO_PI*tt), 1, -1, 0, 1);
    a2 =map(-sin(TWO_PI*tt-PI/4), 1, -1, 0, 1);
    a1 = ease(a1, 7);
    a2 = ease(constrain(4*a2-3, 0, 1), 3);
    randomSeed(12345*i+23456);
    ph = random(TWO_PI);
    th = random(-PI, PI);
    r = map(i, 0, N-1, 40, 280);
    n = floor(r*.26);
    push();
    rotate(ph);
    rotateY(th*a1);
    rotate(-ph);
    for (int j=0; j<n; j++) {
      randomSeed(34567*j+45678);
      ph = random(TWO_PI);
      th = random(-HALF_PI, HALF_PI);
      push();
      rotate(ph);
      rotateY(th*a2);
      rotate(-ph);
      rotate(TWO_PI*(j+6*t)/n);
      ellipse(r, 0, 17, 17);
      pop();
    }
    pop();
  }
  pop();
}
