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
int numFrames = 600;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(720, 720, P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  fill(32);
  ortho();
  noStroke();
}

float x, y, z, tt;

float wave(float x_) {
  return waveHeight*sin(PI*x_/wavelength + numWaves*TWO_PI*t);
}

int n = 32;
float chunkHeight = 90;
float qq;
color RED = #ce4228, YELLOW = #f4d751, BLUE = #26429f, SKY = #83afd9;
float chunkSize = 48, waveHeight = 84, wavelength = 330, numWaves = 3;

void chunk(float x1, float x2, float z1, float z2) {
  // sides
  fill(RED);
  
  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<n; i++) {
    qq = i/float(n-1);
    x = lerp(x1, x2, qq);
    vertex(x, wave(x)-chunkHeight/2, z1);
    vertex(x, wave(x)+chunkHeight/2, z1);
  }
  endShape();

  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<n; i++) {
    qq = i/float(n-1);
    x = lerp(x1, x2, qq);
    vertex(x, wave(x)-chunkHeight/2, z2);
    vertex(x, wave(x)+chunkHeight/2, z2);
  }
  endShape();
  
  // top & bottom
  fill(BLUE);
  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<n; i++) {
    qq = i/float(n-1);
    x = lerp(x1, x2, qq);
    vertex(x, wave(x)+chunkHeight/2, z1);
    vertex(x, wave(x)+chunkHeight/2, z2);
  }
  endShape();

  beginShape(TRIANGLE_STRIP);
  for (int i=0; i<n; i++) {
    qq = i/float(n-1);
    x = lerp(x1, x2, qq);
    vertex(x, wave(x)-chunkHeight/2, z1);
    vertex(x, wave(x)-chunkHeight/2, z2);
  }
  endShape();

  // ends
  fill(YELLOW);
  beginShape(QUADS);
  vertex(x1, wave(x1)-chunkHeight/2, z1);
  vertex(x1, wave(x1)+chunkHeight/2, z1);
  vertex(x1, wave(x1)+chunkHeight/2, z2);
  vertex(x1, wave(x1)-chunkHeight/2, z2);

  vertex(x2, wave(x2)-chunkHeight/2, z1);
  vertex(x2, wave(x2)+chunkHeight/2, z1);
  vertex(x2, wave(x2)+chunkHeight/2, z2);
  vertex(x2, wave(x2)-chunkHeight/2, z2);
  endShape();
}

void draw_() {
  background(SKY); 
  push();
  translate(width/2, height/2);
  rotateX(-ia);
  rotateY(QUARTER_PI - TWO_PI*t);

  for (int i=-3; i<4; i++) {
    for (int j=-3; j<4; j++) {
      push();
      if ((i+j)%2 == 0)
        scale(1, -1, 1);
      chunk(chunkSize*(i-.5), chunkSize*(i+.5), chunkSize*(j-.5), chunkSize*(j+.5));
      pop();
    }
  }
  pop();
}
