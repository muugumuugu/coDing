// "data" by dave @beesandbombs.
// its not real data

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
int numFrames = 200;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(800, 600, P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  fill(250);
  stroke(0);
  strokeWeight(1.5);
  colorMode(HSB, 1);
  ortho();
}

float x, y, z, tt;
int N = 12, n = 8;
float l = 600, w = 30, h = 150;

void ribbon(float q, float wl) {
  beginShape(QUADS);
  for (int i=0; i<N-1; i++) {
    x = map(i, 0, N-1, -l/2, l/2);
    y = .5*h*sin(TWO_PI*q + PI*wl*(i-(N-1)*.5)/N);
    vertex(x, y, -w/2);
    vertex(x, y, w/2);
    x = map(i+1, 0, N-1, -l/2, l/2);
    y = .5*h*sin(TWO_PI*q + PI*wl*(i+1-(N-1)*.5)/N);
    vertex(x, y, w/2);
    vertex(x, y, -w/2);
  }
  endShape();
}

void draw_() {
  background(1);
  lights();
  push();
  translate(width/2 - 30, height/2 + 30);
  rotateX(-ia);
  rotateY(-QUARTER_PI + TWO_PI*0);
  for (int i=0; i<n; i++) {
    fill(i*1.0/n, 1, 1);
    push();
    translate(0, 0, w*(i-n*.5));
    ribbon(t + PI*i/n,.5*(n-i+2));
    pop();
  }
  
  push();
  strokeWeight(3);
  stroke(.1);
  line(-l/2,h/2,-5*w,-l/2,h/2,4*w);
  line(-l/2,h/2,-5*w,l/2,h/2,-5*w);
  line(-l/2,h/2,-5*w,-l/2,-h/2 - 20,-5*w);
  pop();
  pop();
  noLights();
}
