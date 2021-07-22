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

    saveFrame("f###.png");
    if (frameCount==numFrames)
      exit();
  }
}

//////////////////////////////////////////////////////////////////////////////

int samplesPerFrame = 4;
int numFrames = 400;        
float shutterAngle = .4;

boolean recording = false;

void setup() {
  size(720, 600, P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  fill(32);
  noStroke();

  colorMode(HSB, 1);
}

float x, y, z, tt;
int N = 72;
float th;

float h1_, h2_;

int n = 10;

void thing(float r1, float r2, float h1, float h2){
  h1_ = map(r1,0,r2,.5*(h1+h2),h1);
  h2_ = map(r1,0,r2,.5*(h1+h2),h2);
  
  noStroke();
  beginShape(TRIANGLE_STRIP); 
  for(int i=0; i<=N; i++){  
    th = TWO_PI*i/N;
    vertex(r2*cos(th),r2*sin(th),0);
    vertex(r2*cos(th),r2*sin(th),map(sin(th),-1,1,h1,h2));    
  }
  endShape();
  
  beginShape(TRIANGLE_STRIP); 
  for(int i=0; i<=N; i++){
    th = TWO_PI*i/N;
    vertex(r1*cos(th),r1*sin(th),0);
    vertex(r1*cos(th),r1*sin(th),map(sin(th),-1,1,h1_,h2_));    
  }
  endShape();
  
  beginShape(TRIANGLE_STRIP); 
  for(int i=0; i<=N; i++){
    th = TWO_PI*i/N;
    vertex(r1*cos(th),r1*sin(th),map(sin(th),-1,1,h1_,h2_));   
    vertex(r2*cos(th),r2*sin(th),map(sin(th),-1,1,h1,h2));
  }
  endShape();
  
  beginShape(TRIANGLE_STRIP); 
  for(int i=0; i<=N; i++){
    th = TWO_PI*i/N;
    vertex(r1*cos(th),r1*sin(th),0);
    vertex(r2*cos(th),r2*sin(th),0);
  }
  endShape();
  
  push();
  stroke(0);
  strokeWeight(1.5);
  noFill();
  
  beginShape();
  for(int i=0; i<=N; i++){
    th = TWO_PI*i/N;
    vertex(r1*cos(th),r1*sin(th),map(sin(th),-1,1,h1_,h2_));    
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=N; i++){
    th = TWO_PI*i/N;
    vertex(r2*cos(th),r2*sin(th),map(sin(th),-1,1,h1,h2));    
  }
  endShape();
  pop();
}

float r1_, r2_;

void draw_() {
  lights();
  background(0); 
  push();
  translate(width/2, height/2 + 80);
  scale(1.25);
  rotateX(PI*3/8);
  for (int i=0; i<n; i++) {
    push();
    rotate(PI + TWO_PI*(n-i)*t);
    fill(i/float(n),1,1);
    r1_ = 15 + 15*i;
    r2_ = 30 + 15*i;
    thing(r1_, r2_, 100 - .5*r2_, 100 + .5*r2_);
    pop();
  }
  pop();
}
