// "star torus" by davey

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
int numFrames = 280;        
float shutterAngle = 1;

boolean recording = false;

void setup() {
  size(800, 800, P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  noStroke();
}

float x, y, z;
int nStars = 180, starSpeed = 12;
int m = 5, n = 3;  // coprime for single knot!
float depth;
float r = 80, th;
float starRad, starSize = 15;
float zMax = r*3;

void star() {
  beginShape();
  for (int j=0; j<8; j++) {
    starRad = j%2==0?starSize:starSize*.175;
    vertex(starRad*cos(TWO_PI*j/8), starRad*sin(TWO_PI*j/8));
  }
  endShape();
}

void draw_() {
  background(0); 
  push();
  translate(width/2, height/2);
  rotateY(-TWO_PI*t);
  for (int i=0; i<nStars; i++) {
    th = TWO_PI*(i+starSpeed*t)/nStars;

    x = r*(2+cos(n*th))*cos(m*th);  // https://en.wikipedia.org/wiki/Torus_knot
    y = r*(2+cos(n*th))*sin(m*th);
    z =  -r*sin(n*th);

    depth = map(modelZ(x, y, z), -zMax, zMax, -.5, 2);
    depth = sq(c01(depth));

    push();
    translate(x, y, z);
    rotateY(TWO_PI*t);
    fill(255*depth);
    star();
    pop();
  }

  pop();
}
