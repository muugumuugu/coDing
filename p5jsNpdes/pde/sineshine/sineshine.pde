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
  noFill();
  blendMode(SCREEN);
}

float x, y, z, tt;
int N = 720;
float l = 360;
float sw;
float qq;

color[] cs = {#ff0000, #00ff00, #0000ff};

void draw_() {
  background(10);
  push();
  translate(width/2, height/2);
  for (int q=0; q<3; q++) {
    stroke(cs[q]);
    for (int a=0; a<24; a++) {
      beginShape();
      for (int i=0; i<N; i++) {
        qq = i/float(N-1);
        
        x = lerp(-l/2, l/2, qq);
        y = l/2*sin(PI*qq - TWO_PI*t/3 + TWO_PI*a/24);
        
        sw = map(cos(-TWO_PI*t/3 + TWO_PI*t + TWO_PI*a/24 + PI/4*q), 1, -1, 0, 1);
        strokeWeight(lerp(0, 8, sq(sw)));
        vertex(x, y);
      }
      endShape();
    }
  }
  pop();
}
