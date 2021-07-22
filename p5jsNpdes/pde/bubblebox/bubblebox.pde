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
int numFrames = 280;        
float shutterAngle = .6;

boolean recording = false, 
  preview = true;

void setup() {
  size(750, 750, P3D);
  smooth(8);  
  rectMode(CENTER);
  result = new int[width*height][3];
  strokeWeight(2);
  ortho();
}

float x, y, z, tt;
float r = 30, th, ph;

void sphereVertex(float ph_, float th_) {
  vertex(r*cos(th_)*cos(ph_), r*sin(th_), r*cos(th_)*sin(ph_));
}


int N;
void gradientSphere(color c1, color c2) {
  N = 10+int(.4*r);
  noStroke();
  beginShape(QUADS);
  for (int i=0; i<2*N; i++) {
    for (int j=0; j<N; j++) {
      fill(lerpColor(c1, c2, ease(map(j, 0, N, 0, 1))));
      sphereVertex(map(i, 0, 2*N, 0, TWO_PI), map(j, 0, N, -HALF_PI, HALF_PI));
      sphereVertex(map(i+1, 0, 2*N, 0, TWO_PI), map(j, 0, N, -HALF_PI, HALF_PI));
      fill(lerpColor(c1, c2, ease(map(j+1, 0, N, 0, 1))));
      sphereVertex(map(i+1, 0, 2*N, 0, TWO_PI), map(j+1, 0, N, -HALF_PI, HALF_PI));
      sphereVertex(map(i, 0, 2*N, 0, TWO_PI), map(j+1, 0, N, -HALF_PI, HALF_PI));
    }
  }
  endShape();
}

color[] cols = { #288287, #D62458, #D96D00, #F49561, #E8BA47 };
float l = 300;

float age;
int colIndex1, colIndex2;
float maxRad;

int n = 48;

int seed;

void draw_() {
  background(0);
  push();
  translate(width/2, height/2);
  rotateX(-ia);
  rotateY(QUARTER_PI - HALF_PI*t);
  stroke(252);
  noFill();
  box(l);

  randomSeed(42689);
  
  for (int i=0; i<n; i++) {
    colIndex1 = int(random(5));
    colIndex2 = (colIndex1+int(random(1, 4)))%4;
    
    age = (t+i*1.0/n)%1;

    maxRad = lerp(16, 36, sq(random(1)));
    r = map(cos(TWO_PI*age), 1, -1, 0, maxRad);

    x = random(-l*.4, l*.4);
    y = random(-l*.4, l*.4) + lerp(50, -50, sq(age));
    z = random(-l*.4, l*.4);
    
    push();
    if (t+i*1.0/n>=1)
      rotateY(HALF_PI);
      
    translate(x, y, z);
    gradientSphere(cols[colIndex1], cols[colIndex2]);
    pop();
  }

  pop();
}
