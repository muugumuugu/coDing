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

    saveFrame("f###.gif");
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
int numFrames = 100;        
float shutterAngle = .6;

boolean recording = false, 
  preview = true;

void setup() {
  size(750, 750, P3D);
  smooth(8);  
  rectMode(CENTER);
  pixelDensity(recording ? 1 : 2);
  result = new int[width*height][3];
  strokeWeight(3);
  noFill();
}

float x, y, z, tt;
int N = 7;
color[] colours = {#FF4136, #17E658, #0044F9};
color bg = #000000;
float dist;
float diam = 50, spacing = 72, 
      depth = 80, wavelength = 150, falloff = 0.003,
      weight = 3;

void draw_() {
  background(bg);
  push();
  translate(width/2, height/2);
  for (int i=-N; i<N; i++) {
    for (int j=-N; j<N; j++) {
      for (int a=0; a<3; a++) {
        x = i*spacing;
        y = (j+(a-1)*2/3.0)*mn*spacing;
        if (j%2 != 0)
          x += .5*spacing;
        
        dist = dist(0,0,x,y);
        
        z = depth*sin(TWO_PI*t - dist/wavelength - TWO_PI*a/3)*exp(-falloff*dist);
        
        push();
        translate(0, 0, z);
        strokeWeight(weight);
        stroke(colours[a]);
        ellipse(x, y, diam, diam);
        strokeWeight(3*weight);
        stroke(bg);
        push();
        translate(0, 0, -0.1);
        ellipse(x, y, diam, diam);
        pop();
        pop();
      }
    }
  }
  pop();
}
