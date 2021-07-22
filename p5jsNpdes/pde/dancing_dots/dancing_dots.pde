
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
int numFrames = 120;        
float shutterAngle = .6;

boolean recording = false, 
  preview = true;

void setup() {
  size(750, 750, P3D);
  smooth(8);  
  pixelDensity(recording ? 1 : 2);
  result = new int[width*height][3];
  strokeWeight(2);
  ortho();
}

float r = 12, // radius of small ring
      d = 12;  // diameter of dot
      
float y, R, lineOpacity;

void ring(int num, float q) {
  q = (q+1000)%1;
  
  R = r/sin(PI/num);
  y = r/tan(PI/num);  

  for (int i=0; i<num; i+=2) {
    push();
    rotate(TWO_PI*i/num);
    if(q >= .5)
      rotate(TWO_PI/num);
      
    translate(0, y);
    
    if(q <= .5)
      rotate(TWO_PI*q);
    else
      rotate(-TWO_PI*q); 

    lineOpacity = map(cos(TWO_PI*2*q), 1, -1, 0, 1);
    stroke(lerpColor(color(250), color(30), lineOpacity));
    noFill();
    ellipse(0, 0, 2*r, 2*r);

    push();
    translate(0,0,1);
    fill(30);
    noStroke();
    ellipse(-r, 0, d, d);
    ellipse(r, 0, d, d);
    pop();
    
    pop();
  }
}

void draw_() {
  background(250);
  push();
  translate(width/2, height/2);

  for (int i=0; i<5; i++)
    ring(8 + 12*i, t - i/20.0);

  pop();
}
