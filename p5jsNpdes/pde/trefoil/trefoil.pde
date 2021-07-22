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
int numFrames = 900;        
float shutterAngle = .4;

boolean recording = false;

void setup() {
  size(720, 720, P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  stroke(32);
  noFill();
  ortho();
}

float x, y, z, tt;
int N = 360;
float r = 84, th;
float off;
float sw;

float x(float q){
  return sin(q) + 2*sin(2*q);
}

float xp(float q){  // dx/dq
  return cos(q) + 4*cos(2*q);
}

float y(float q){
  return cos(q) - 2*cos(2*q);
}

float yp(float q){
  return -sin(q) -4*sin(2*q);
}

float xpn(float q){  // normalized
  return xp(q)/dist(xp(q),yp(q),0,0);
}

float ypn(float q){
  return yp(q)/dist(xp(q),yp(q),0,0);
}
float z(float q){
  return sin(3*q);
}

void knot(float of, float q, int i_){
  stroke(32);
  beginShape();
    for (int i=0; i<N; i++) {
      th = TWO_PI*i/N;
      x = r*x(th) + of*ypn(th);
      y = r*y(th) + of*xpn(th);
      z = r*z(th);
      sw = map(cos(th+TWO_PI*q),1,-1,0,1);
      sw = lerp(2.5,8.5,ease(c01(3.5*sw-2.5),7));
      strokeWeight(sw);
      vertex(x, y, z);
    }
    endShape(CLOSE);
    
    push();
    translate(0,0,-1);
    stroke(250);
    beginShape();
    for (int i=0; i<N; i++) {
      th = TWO_PI*i/N;
      x = r*x(th) + of*ypn(th);
      y = r*y(th) + of*xpn(th);
      z = r*z(th);
      sw = map(cos(th+TWO_PI*q),1,-1,0,1);
      sw = lerp(2.5,8.5,ease(c01(3.5*sw-2.5),7));
      strokeWeight(sw + 5);
      vertex(x, y, z);
    }
    endShape(CLOSE);
    pop();
}

void draw_() {
  background(250); 
  push();
  translate(width/2, height/2 + 28);
  scale(-1,1,1);
  for (int a=-4; a<5; a++) {
    off = 15*(a-.5);
    knot(off,(a+5)*t, a+5);
  }
  pop();
}
