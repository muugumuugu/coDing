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
int numFrames = 240;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(800, 720);
  result = new int[width*height][3];
  rectMode(CENTER);
  fill(32);
  noStroke();
}

float x, y, z, tt;
int N = 12;
float l = 42;

void swimmer(float q) {
  push();
  y = map(sin(TWO_PI*q), 1, -1, 0, 1);
  y = lerp(-l*2*mn, l*2*mn, ease(y,4.5));
  translate(0, y);
  tri(ease(map(cos(TWO_PI*q), 1, -1, 0, 1), 6));
  pop();
}

void tri(float q) {
  push();
  translate(0,lerp(-l*.25,l*.25,q));
  
  push();
  rotate(PI*5/6*q);
  halfTri(q);
  pop();
  
  push();
  scale(-1, 1);
  rotate(PI*5/6*q);
  halfTri(q);
  pop();
  
  pop();
}

void halfTri(float q) {
  push();
  scale(map(cos(TWO_PI*q),1,-1,1,0.85));
  beginShape();
  vertex(0, 0);
  vertex(0, lerp(l*mn, l, q));
  vertex(lerp(-l/2, -l*mn/2, q), lerp(l*mn, l*.75, q));
  endShape(CLOSE);
  pop();
}

float sp = 2*l;
int in;

  void draw_() {
  background(250); 
  push();
  translate(width/2, height/2);
  for (int i=-N; i<=N; i++) {
    for (int j=-N; j<=N; j++) {
      x = i*sp;
      y = j*mn*sp;
      if (j%2 != 0)
        x += .5*sp;
      tt = (t + 100 - 0.0003*dist(x,y,0,0))%1;
      push();
      translate(x, y);
      fill(#86C986);
      in = (2*i+100+3*j+(j+100)%2);  // dunno lol
      if(in%3 == 0)
        fill(#31A7C4);
      if(in%3 == 1)
        fill(#561D72);
      swimmer(tt);
      pop();
    }
  }
  pop();
}
