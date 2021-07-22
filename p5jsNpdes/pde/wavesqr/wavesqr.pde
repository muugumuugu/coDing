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
int numFrames = 220;        
float shutterAngle = .6;

boolean recording = false, 
  preview = true;

void setup() {
  size(750, 750, P3D);
  smooth(8);  
  pixelDensity(recording ? 1 : 2);
  result = new int[width*height][3];
  stroke(32);
  noFill();
  strokeWeight(1.8);
}

float x, y, z, tt;
int N = 720;
float phase, 
      lineLength = 500, waveHeight = 20, numWaves = 18, 
      spacing = 27, curlAmount = 12;
int numLines = 18;
float amount;

void draw_() {
  background(250);
  push();
  translate(width/2, height/2);
  for (int a=0; a<numLines; a++) {
  beginShape();
    for (int i=0; i<N; i++) {
 float     qq = i*1.0/(N-1);
      phase = map(i,0,N-1,0,TWO_PI*numWaves) - TWO_PI*t;
      
      x = lerp(-lineLength/2, lineLength/2, qq);
      y = spacing*(a-.5*(numLines-1));
      
      amount = ease(map(cos(TWO_PI*t + atan2(x,y) - 0.01*dist(x,y,0,0)),1,-1,0,1));
      
      y += .5*waveHeight*sin(phase + PI*a)*amount - .2*waveHeight*amount;
      x -= curlAmount*cos(phase + PI*a)*amount;
      
      vertex(x, y);
    }
  endShape();
  }
  pop();
}
