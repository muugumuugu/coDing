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
float shutterAngle = 1;

boolean recording = false;

void setup() {
  size(750, 750, P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  fill(32);
  noStroke();
}

float x, y, z, tt;
int N = 280;

int p = 3, q = 4;
float r = 80;

float x(float ph) {
  return r*(1.5 + cos(q*ph))*cos(p*ph);
}


float y(float ph) {
  return r*(1.5 + cos(q*ph))*sin(p*ph);
}


float z(float ph) {
  return -r*sin(q*ph);
}

float d, lt, qq, rr = 18;

color[] cols = { #fa4020, #202020, #418a9f };

void draw_() {
  background(250); 
  push();
  translate(width/2, height/2 - 40);
  for (int i=0; i<N; i++) {
    lt = (1-t + i/float(N))%1;
    randomSeed(i);
    qq = TWO_PI*i/N;
    
    x = x(qq) + randomGaussian()*rr;
    y = y(qq) + randomGaussian()*rr + lerp(-90,90,lt);
    z = z(qq) + randomGaussian()*rr;
    
    push();
    translate(x*cos(TWO_PI*t) + z*sin(TWO_PI*t), y, z*cos(TWO_PI*t) - x*sin(TWO_PI*t));
    fill(cols[i%3]);
    
    d = map(sin(TWO_PI*t - qq), 1, -1, 0, 1);
    d = max(0,2*lt-1);
    d *= lerp(.7,6,sq(random(1)));
    ellipse(0, 0, 16*d, 16*d);
    pop();
  }
  pop();
}
