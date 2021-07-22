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
int numFrames = 320;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(720, 720, P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  stroke(0);
  noFill();
  strokeWeight(3.5);
}

float x, y, z, tt;
int N = 18;
float R = 210, r, rMax = 0.15*R;
float depth;

color midColor = color(90, 130, 140);

void circ(float r_) {
  beginShape();
  for (int i=0; i<128; i++) {
    x = r_*cos(TWO_PI*i/128);
    y = r_*sin(TWO_PI*i/128);
    depth = map(modelZ(x, y, 0), -R, R, 0, 1);
    depth = .1 + .9*depth;
    if (depth <= .5)
      stroke(lerpColor(color(0), midColor, 2*depth));
    else
      stroke(lerpColor(midColor, color(255), 2*depth-1));
    vertex(x, y);
  }
  endShape(CLOSE);
}

void draw_() {
  background(0); 
  push();
  translate(width/2, height/2);
  for (int a=0; a<N; a++) {
    push();
    rotateY(TWO_PI*(a-t)/N);
    for (int i=-14; i<14; i++) {
      tt = .12*(i+2.5*t + .5*a);

      if (tt >= 0 && tt <= 1) {
        r = map(cos(TWO_PI*tt), 1, -1, 0, rMax);

        push();
        rotateX(lerp(HALF_PI, -HALF_PI, tt));
        translate(0, 0, sqrt(R*R - r*r));

        circ(r);
        pop();
      }
    }
    pop();
  }
  pop();
}
