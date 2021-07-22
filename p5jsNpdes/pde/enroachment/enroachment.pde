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

int samplesPerFrame = 8;
int numFrames = 360;        
float shutterAngle = 1;

boolean recording = false;

void setup() {
  size(720, 720, P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  fill(32);
  noStroke();
  ortho();
}

float x, y, z, tt, t1;
int N = 12;
color c1 = #282828, c2 = #006f3c, c3 = #e177a8;
float l, r;
float eas = 4;

void cube() {
  for (int i=0; i<4; i++) {
    push();
    fill(i%2 == 0?c1:c2);
    rotateY(HALF_PI*i);
    translate(0, 0, l/2);
    rect(0, 0, l, l);
    pop();
  }

  for (int i=0; i<2; i++) {
    push();
    fill(c3);
    rotateX(HALF_PI+PI*i);
    translate(0, 0, l/2);
    rect(0, 0, l, l);
    pop();
  }
}

void shard() {
  beginShape();
  vertex(0, -r);
  vertex(0, -2*r);
  vertex(2*r*mn, -r);
  vertex(r*mn, -r/2);
  endShape();
}

void draw_() {
  t1 = c01(1.1*t);
  tt = c01(1.25*t-0.25);
  l = 180*pow(2,-t);
  r = l*.815;  // trial & error
  
  background(250); 
  push();
  translate(width/2, height/2);
  push();
  rotateX(-ia);
  rotateY(QUARTER_PI);
  
  rotateX(-HALF_PI*ease(c01(4*t1-3),eas));
  rotate(-HALF_PI*ease(c01(4*t1-2),eas));
  rotateX(-HALF_PI*ease(c01(4*t1-1),eas));
  rotateY(-HALF_PI*ease(c01(4*t1),eas));
  
  cube();
  pop();
  for (int i=0; i<6; i++) {
    fill(c1);
    if(i>1)
      fill(c2);
    if(i>3)
      fill(c3);
    push();
    rotate(TWO_PI*(i+1)/6);
    translate(0,-600 + 600*(1-sq(1-tt)));
    shard();
    pop();
  }
  pop();
}
