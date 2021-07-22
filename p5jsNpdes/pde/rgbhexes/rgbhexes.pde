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
int numFrames = 240;        
float shutterAngle = .5;

boolean recording = false, 
  preview = true;

void setup() {
  size(750, 750, P3D);
  smooth(8);  
  rectMode(CENTER);
  pixelDensity(recording ? 1 : 2);
  result = new int[width*height][3];
  fill(32);
  noStroke();
}

float r = 40;

float hexHeight(float x_) {
  return map(abs(x_), 0, r*mn, r, r/2);
}

void hexSlice(float x1, float x2) {
  x1 = constrain(x1, -r*mn, r*mn);
  x2 = constrain(x2, -r*mn, r*mn);
  if (x1*x2>=0)
    quad(x1, hexHeight(x1), x1, -hexHeight(x1), x2, -hexHeight(x2), x2, hexHeight(x2));
  else {
    hexSlice(x1, 0);
    hexSlice(0, x2);
  }
}

int numSlices = 5;

void hexx(float q) {
  for (int i=0; i<numSlices; i++) {
    hexSlice(map(i, 0, numSlices-1+q, -r*mn, r*mn), map(i+q, 0, numSlices-1+q, -r*mn, r*mn));
  }
}

color[] colours = {#b02020, #20b020, #2020b0};
float sp = 2*r*mn;
float hexDist;

float x, y, z, tt;
int N = 8;

void draw_() {
  background(30);
  blendMode(ADD);
  push();
  translate(width/2, height/2);
  for (int a=0; a<3; a++) {
    fill(colours[a]);
    for (int i=-N; i<N; i++) {
      for (int j=-N; j<N; j++) {
        x = i*sp;
        y = (j-2/3.0)*mn*sp;
        if (j%2 !=0)
          x += .5*sp;

        hexDist = max(abs(y), abs(.5*y+mn*x), abs(.5*y - mn*x));

        tt = ease(map(cos(TWO_PI*t*(3-a) - 0.00003*sq(hexDist) + atan2(x, y)), 1, -1, 0, 1));

        push();
        translate(x, y);
        rotate(TWO_PI*a/3);
        hexx(tt);
        pop();
      }
    }
  }
  //thing(t);
  pop();
}
