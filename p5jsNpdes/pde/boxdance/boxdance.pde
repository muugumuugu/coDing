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
int numFrames = 360;        
float shutterAngle = .4;

boolean recording = false;

void setup() {
  size(720, 720, P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  colorMode(HSB, 1);
  stroke(.1);
  strokeWeight(3);
  ortho();
  strokeJoin(CORNER);
}

float x, y, z, tt;
int N = 12;
float l = 400, h = 32, yy = 96, ll;

float ss(float g){
  return lerp(-1,1,ease(map(sin(g),1,-1,0,1)));
}

void draw_() {
  background(.1); 
  noFill();
  push();
  translate(width/2, height/2);
  rotateX(-ia);
  rotateY(QUARTER_PI + HALF_PI*t);
  for (int i=0; i<N; i++) {
    ll = map(i, -1, N-1, 0, l);
    push();
    translate(0, yy*ss(TWO_PI*(N-i)*t), 0);
    stroke(i/float(N), .8, 1);
    for (int j=0; j<3; j++) {
      strokeWeight(3-j);
      box(ll+j, h+j, ll+j);
    }
    pop();
  }
  pop();
}
