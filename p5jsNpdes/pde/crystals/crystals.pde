// gif by dave @beesandbombs

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
int numFrames = 390;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(800, 800, P3D);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  stroke(32);
  noFill();
  ortho();
  strokeWeight(1.5);
}

float x, y, z, tt;
int N = 12;

float ol = 50, cl = ol*sqrt(2), sp = 2.8*ol;

void oct() {
  for (int i=0; i<4; i++) {
    push();
    rotateY(HALF_PI*i);
    line(0, -ol, 0, 0, 0, ol);
    line(0, ol, 0, 0, 0, ol);
    line(0, 0, ol, ol, 0, 0);
    pop();
  }
}

void cub() {
  box(cl);
  for (int i=0; i<4; i++) {
    push();
    rotateY(HALF_PI*i);
    line(-cl/2, -cl/2, cl/2, cl/2, cl/2, cl/2);
    line(-cl/2, -cl/2, -cl/2, cl/2, cl/2, -cl/2);
    pop();
  }
  for (int i=0; i<2; i++) {
    push();
    rotateX(HALF_PI+PI*i);
    line(-cl/2, -cl/2, cl/2, cl/2, cl/2, cl/2);
    line(-cl/2, -cl/2, -cl/2, cl/2, cl/2, -cl/2);
    pop();
  }
}

float qq;
void thing(float q) {
  q = (q + 1000) % 1;

  if (q <= .5) {
    qq = ease(2*q, 4);
    push();
    rotate(QUARTER_PI);
    rotateX(PI*qq);
    rotateY(PI*qq);
    oct();
    pop();
  } 
  
  else {
    qq = ease(2*q-1, 4);
    rotateX(PI*qq);
    rotateY(PI*qq);
    push();
    cub();
    pop();
  }
}

void draw_() {
  background(250); 
  push();
  translate(width/2, height/2);
  for (int i=-2; i<3; i++) {
    for (int j=-2; j<3; j++) {
      push();
      translate(sp*i, sp*j);
      thing(t - .05*dist(i,j,0,0));
      pop();
    }
  }
  pop();
}
