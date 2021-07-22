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

float c01(float g) {
  return constrain(g, 0, 1);
}

void draw() {
  if (recording) {
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;

    c = 0;
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
      t %= 1;
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

    saveFrame("f###.png");
    if (frameCount==numFrames)
      exit();
  } else if (preview) {
    c = mouseY*1.0/height;
    if (mousePressed)
      println(c);
    t = (millis()/(20.0*numFrames))%1;
    draw_();
  } else {
    t = mouseX*1.0/width;
    c = mouseY*1.0/height;
    if (mousePressed)
      println(c);
    draw_();
  }
}

//////////////////////////////////////////////////////////////////////////////

int samplesPerFrame = 8;
int numFrames = 220;        
float shutterAngle = .6;

boolean recording = false,
  preview = true;

void setup() {
  size(800, 600, P3D);
  //pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  fill(32);
  noStroke();
  blendMode(ADD);
}

PImage fr;

float x, y, z, tt;
int N = 12;

color[] cs = {#FF261D, #2ECC40, #0064D9};

float l = 275, ofs;
float th;

float pathX(float q){
  return l*q*sin(th*q);
}

float pathY(float q){
  return l*q*cos(th*q);
}

float pathWeight(float q){
  return 11*(1-q);
}

float delta = 0.01;

float pathXp(float q){
  return (pathX(q+.5*delta)-pathX(q-.5*delta))/delta;
}

float pathYp(float q){
  return (pathY(q+.5*delta)-pathY(q-.5*delta))/delta;
}

float pathXpn(float q){
  return pathXp(q)/dist(0,0,pathXp(q),pathYp(q));
}

float pathYpn(float q){
  return pathYp(q)/dist(0,0,pathXp(q),pathYp(q));
}

int pathN = 360;
float pathQ;

boolean roundEnd = false;

void path(){
  noStroke();
  //fill(255);
  beginShape(TRIANGLE_STRIP);
  for(int i=0; i<=pathN; i++){
    pathQ = i*1.0/pathN;
    vertex(pathX(pathQ) + .5*pathWeight(pathQ)*pathYpn(pathQ), pathY(pathQ) - .5*pathWeight(pathQ)*pathXpn(pathQ));
    vertex(pathX(pathQ) - .5*pathWeight(pathQ)*pathYpn(pathQ), pathY(pathQ) + .5*pathWeight(pathQ)*pathXpn(pathQ));
  }
  endShape();
  
  if(roundEnd){
    ellipse(pathX(0), pathY(0), pathWeight(0), pathWeight(0));
    ellipse(pathX(1), pathY(1), pathWeight(1), pathWeight(1));
  }
}

void draw_() {
  background(20); 
  push();
  translate(width/2, height/4+8);
  scale(-1,1);
  for (int a=-14; a<14; a++) {
    ofs = TWO_PI*a/32;
    th = PI/5*sin(TWO_PI*t+ofs);
    fill(cs[(a+26)%3]);
    push();
    translate(16*(a+.5), 0);

    path();
    pop();
  }
  pop();
}
