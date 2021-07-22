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
int numFrames = 320;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(720, 720, P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  stroke(32);
  strokeWeight(sw);
  fill(250);
  ortho();
}

float x, y, z, tt;
int N = 14;
float l = 32, sw = 2.5;
float screeny;

void draw_() {
  background(250); 
  push();
  translate(width/2, height/2,-200);
  rotateX(-ia);
  rotateY(QUARTER_PI);
  for (int i=-N; i<N; i++) {
    for (int j=-N; j<N; j++) {
      x = i*(l+sw*.25*0)*2;
      z = j*(l+sw*.25*0)*2;
      screeny = screenY(x,0,z);
      tt = ease(c01(3.5*t - 2.5*map(screeny,-l,height+l,0,1)),4);
      y = 2*l*tt;
      if(i%2 == 0)
        y *= -1;
      push();
      translate(x, y, z);
      rotateY(i%2 == 0 ? -HALF_PI*tt : HALF_PI*tt);
      box(l);
      pop();
    }
  }
  pop();
}
