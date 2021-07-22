// by dave @beesandbombs

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
  if (recording) {
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

int samplesPerFrame = 4;
int numFrames = 320;        
float shutterAngle = .6;

boolean recording = false, 
  preview = true;

void setup() {
  size(750, 750, P3D);
  smooth(8);  
  rectMode(CENTER);
  pixelDensity(recording ? 1 : 2);
  result = new int[width*height][3];
  stroke(32);
  noFill();
  strokeWeight(6);
}

float x, y, z, tt;
int N = 12;
int n1 = 120, n2 = 72;
float l = 65, r = 25, R = 3*l, th;
float qq;
float tw, mtw;
color cb = #e25a5f, cc = #f1f7ed;
float fade;

void vert(float x_, float y_, float q) {
  mtw = TWO_PI*q;
  tw = map(x_, -l/2-r, l/2+r, -mtw, mtw);
  
  x = x_;
  y = y_*cos(tw);
  z = y_*sin(tw);
  
  fade = c01(map(modelZ(x, y, z),-r,r,.25,1.25));
  stroke(lerpColor(cb, cc, fade));
  
  vertex(x, y, z);
}

void thing(float q) {
  beginShape();
  for (int i=0; i<n1; i++) {
    qq = i/float(n1-1);
    x = lerp(-l/2, l/2, qq);
    y = -r;
    vert(x, y, q);
  }
  for (int i=0; i<n2; i++) {
    th = map(i, 0, n2, 0, PI);
    y = -r*cos(th);
    x = l/2 + r*sin(th);
    vert(x, y, q);
  }
  for (int i=0; i<n1; i++) {
    qq = i/float(n1-1);
    x = lerp(l/2, -l/2, qq);
    y = r;
    vert(x, y, q);
  }
  for (int i=0; i<n2; i++) {
    th = map(i, 0, n2, 0, PI);
    y = r*cos(th);
    x = -l/2 - r*sin(th);
    vert(x, y, q);
  }
  endShape(CLOSE);
}

void draw_() {
  background(cb);
  push();
  translate(width/2, height/2);
  for (int a=0; a<N; a++) {
    push();
    rotate(TWO_PI*a/N);
    translate(R, 0);
    tt = map(cos(TWO_PI*t - TWO_PI*a/N), 1, -1, 0, 1);
    tt = ease(c01(1.1*tt-0.1));
    thing(tt);
    pop();
  }
  pop();
}
