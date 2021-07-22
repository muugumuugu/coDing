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
int numFrames = 240;        
float shutterAngle = .6;

boolean recording = false, 
  preview = false;

void setup() {
  size(750, 750, P3D);
  smooth(8);  
  result = new int[width*height][3];
  strokeWeight(3);
}

float x, y, z, tt;
int N = 12;
float R = 200, r;  

void surfaceCirc(float th, float ph) {
  noFill();
  push();
  rotateY(th);
  rotateX(ph);

  r = map(cos(ph), 0, 1, 0, 40);
  z = sqrt(R*R - r*r);
  translate(0, 0, z);

  circ(r);

  pop();
}

float pp, depth;

void circ(float r){
  beginShape();
  for(int i=0; i<120; i++){
    x = r*cos(TWO_PI*i/120);
    y = r*sin(TWO_PI*i/120);
    depth = map(modelZ(x,y,0),-R,R,0,1);
    
    if(depth <= .5)
      stroke(lerpColor(color(10*(in==0?1:0),10*(in==1?1:0),10*(in==2?1:0)), color(50*(in==0?1:0),90*(in==1?1:0),120*(in==2?1:0)), c01(2*depth+.15)));
    else
      stroke(lerpColor(color(50*(in==0?1:0),90*(in==1?1:0),120*(in==2?1:0)), color(250*(in==0?1:0),250*(in==1?1:0),250*(in==2?1:0)), 2*depth-1));
    vertex(x,y);
  }
  endShape(CLOSE);
}

void bubble(){
  for (int a=-10; a<10; a++) {
    for (int i=0; i<N; i++) {
      pp = map(a + 2*t, -7, 7, -1, 1);
      if (pp>=-1 && pp<=1) {
        if (pp>0)
          pp = 1 - sq(1-pp);
        else
          pp = -(1 - sq(1+pp));
          
        pp *= HALF_PI;

        surfaceCirc(TWO_PI*(i+.5*a)/N, pp);
      }
    }
  }
}

PImage[] fs = new PImage[3];
int in;

void draw_() {
  background(10);
  push();
  translate(width/2, height/2);
  for(int i=0; i<3; i++){
    in = i;
    background(0);
    push();
    scale(1+.006*i);
    bubble();
    pop();
    fs[i] = get();
  }
  
  pop();
  
  background(10);
  for(int i=0; i<3; i++){
    blend(fs[i],0,0,width,height,0,0,width,height,ADD);
  }
}
