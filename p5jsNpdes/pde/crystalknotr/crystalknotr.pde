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

void pop(){
  popStyle();
  popMatrix();
}

void draw() {
  
  if(!recording){
    t = mouseX*1.0/width;
    c = mouseY*1.0/height;
    if(mousePressed)
        println(c);
    draw_();
  }
  
  else {
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
int numFrames = 240;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(720,720,P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  fill(32);
  noStroke();
}

float x, y, z, tt;
int N = 30;
float ph;

float r = 100;

float x(float q){
  return r*(sin(q) + 2*sin(2*q));
}

float y(float q){
  return r*(cos(q) - 2*cos(2*q));
}

float z(float q){
  return r/2*sin(3*q);
}

float xp(float q){
  return r*(cos(q) + 4*cos(2*q));
}

float yp(float q){
  return r*(-sin(q) + 4*sin(2*q));
}

float th(float q){
  return -atan2(xp(q),yp(q));
}

float l = 32, h = 70;
color c1, c2;

float bri;

void crystal(){
  bri = map(modelZ(0,0,0),-r/2,r/2,.5,0);
  bri = constrain(bri,0,1);
  c1 = lerpColor(#e177a8,color(250),bri);
  c2 = lerpColor(#00356d,color(250),bri);
  noStroke();
  for(int i=0; i<4; i++){
    push();
    rotateY(HALF_PI*i);
    fill(i%2 == 0 ? c1 : c2);
    beginShape();
    vertex(0,-h/2,0);
    vertex(-l/2,0,l/2);
    vertex(l/2,0,l/2);
    endShape();
    fill(i%2 == 0 ? c2 : c1);
    beginShape();
    vertex(0,h/2,0);
    vertex(-l/2,0,l/2);
    vertex(l/2,0,l/2);
    endShape();
    pop();
  }
}

void draw_() {
  background(250); 
  push();
  translate(width/2, height/2 + 20);
  rotate(.1);
  for(int i=0; i<N; i++){
    ph = TWO_PI*(i+2*t)/N;
    push();
    translate(x(ph),y(ph),z(ph));
    rotate(th(ph));
    rotateY(PI*t + ph/2);
    crystal();
    pop();
  }
  
  pop();
}
