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
int numFrames = 180;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(720, 720, P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  stroke(32);
  noFill();
  strokeWeight(3);
}

float x, y, z, tt;
int N = 14;
float r, th;
float qq;

int n = 32;
void thing(float r1, float r2, float q) {
  beginShape();
  for (int i=0; i<n; i++) {
    qq = i/float(n-1);
    r = lerp(r1,r2,qq);
    strokeWeight(map(cos(TWO_PI*qq),1,-1,1.5,5));
    th = .19*sin(TWO_PI*q - map(r, 0, n-1, 0, QUARTER_PI)); // whoops! kinda nonsense but it worked
    vertex(r*cos(th), r*sin(th));
  }
  endShape();
}

void draw_() {
  t = 1-t;
  background(250); 
  push();
  translate(width/2, height/2);
  scale(.8);
  for (int i=0; i<N; i++) {
    push();
    rotate(TWO_PI*i/N);
    thing(100, 250, t);
    thing(140, 290, t+1/3.0);
    thing(180, 330, t+2/3.0);
    pop();
  }
  pop();
}
