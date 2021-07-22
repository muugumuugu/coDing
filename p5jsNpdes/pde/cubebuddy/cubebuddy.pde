// cube buddies, by bees & bombs

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

int samplesPerFrame = 8;
int numFrames = 300;        
float shutterAngle = .7;

boolean recording = false;

void setup() {
  size(720, 720, P3D);
  ortho();
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  stroke(32);
  strokeWeight(2);
  noFill();
}

float x, y, z, tt;
int N = 12;
float l = 120, ee = 4.5;

void draw_() {
  background(250); 
  push();
  translate(width/2, height/2);
  scale(-1, 1);
  rotateX(-ia);
  rotateY(QUARTER_PI);
  rotate(HALF_PI*ease(constrain(3*t-2, 0, 1), ee));
  rotateX(HALF_PI*ease(constrain(3*t-1, 0, 1), ee));
  rotateY(HALF_PI*ease(constrain(3*t, 0, 1), ee));
  for (int i=-1; i<2; i++) {
    push();
    translate(-i*l, -i*l, i*l);
    box(l);
    pop();
  }
  pop();
}
