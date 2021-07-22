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
int numFrames = 300;        
float shutterAngle = .4;

boolean recording = false;

int n = 1200;
float r = 200;

float x_, y_;

float x(float q){
  x_ = r*sin(5*q);
  y_ = r*.4*cos(5*q);
  return x_*cos(q) + y_*sin(q);
}

float y(float q){
  x_ = r*sin(5*q);
  y_ = r*.4*cos(5*q);
  return y_*cos(q) - x_*sin(q);
}

float h = 1e-4;

float xp(float q){
  return (x(q+h/2)-x(q-h/2))/h;
}

float yp(float q){
  return (y(q+h/2)-y(q-h/2))/h;
}

float xpn(float q){
  return xp(q)/dist(xp(q),yp(q),0,0);
}

float ypn(float q){
  return yp(q)/dist(xp(q),yp(q),0,0);
}

float amt, th, dr = 1;
int nw = 72;

void knot(float ph){
  beginShape();
  for(int i=0; i<n; i++){
    th = PI*i/n;
    amt = map(cos(2*th-TWO_PI*t),1,-1,0,1);
    amt = 14*ease(constrain(1.7*amt-0.7,0,1),4.5);
    vertex(x(th)+amt*sin(nw*th+ph+dr*TWO_PI*t)*ypn(th),y(th)-amt*sin(nw*th+ph+dr*TWO_PI*t)*xpn(th));
  }
  endShape(CLOSE);
}

void setup() {
  size(540,540,P3D);
  blendMode(MULTIPLY);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  noFill();
  strokeWeight(7);
}

float x, y, z, tt;
int N = 12;

void draw_() {
  background(250); 
  push();
  translate(width/2, height/2);
  translate(0,12);
  scale(1);
  strokeWeight(3);
  stroke(#39CCCC);
  knot(0);
  stroke(#FFDC00);
  knot(TWO_PI/3);
  stroke(#F71BC8);
  knot(2*TWO_PI/3);
  pop();
}
