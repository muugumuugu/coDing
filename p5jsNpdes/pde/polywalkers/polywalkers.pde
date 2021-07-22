// by dave @beesandbombs

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

    saveFrame("p####.gif");
    if (frameCount==numFrames)
      exit();
  }
}

//////////////////////////////////////////////////////////////////////////////

int samplesPerFrame = 4;
int numFrames = 1080;        
float shutterAngle = .5;

boolean recording = false;

void setup() {
  size(750, 750, P2D);
  smooth(8);
  strokeWeight(1.5);
  strokeCap(ROUND);
  result = new int[width*height][3];
}

float x, y, z, tt;
float l = 75;

void poly(int N) {
  for (int i=0; i<N; i++) {
    push();
    rotate(TWO_PI*i/N);
    line(-l/2, l/(2*tan(PI/N)), l/2, l/(2*tan(PI/N)));
    pop();
  }
}

float qq, rot;

void walker(int N, float q) {
  qq = (N*q)%1;
  rot = TWO_PI*int(N*q)/N;
  push();
  rotate(rot);
  translate(-l/2, l/(2*tan(PI/N)));
  rotate((PI*2/3 + TWO_PI/N)*ease(qq));
  triangle(0, 0, l, 0, l/2, l*mn);
  pop();
}

void draw_() {
  background(255);
  push();
  translate(width/2, height/2);
  rotate(PI);
  
  stroke(0);
  noFill();
  blendMode(NORMAL);
  for (int i=3; i<12; i++) {
    l = 12 + 10*i;
    poly(i);
  }
  
  fill(255);
  noStroke();
  blendMode(EXCLUSION);
  for (int i=3; i<12; i++) {
    l = 12 + 10*i;
    walker(i, (13-i)*t);
  }
  
  pop();
}
