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

void pop(){
  popStyle();
  popMatrix();
}

float c01(float g){
  return constrain(g,0,1);
}

void draw() {
  
  if(!recording){
    t = mouseX*1.0/width;
    c = mouseY*1.0/height;
    if(mousePressed)
        println(c);
    draw_();
  }
  
  else {
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

int samplesPerFrame = 8;
int numFrames = 360;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(800,600,P3D);
  smooth(8);
  result = new int[width*height][3];
  stroke(#000e14);
  strokeWeight(2);
  rectMode(CENTER);
}

float x, y, z, tt;
int N = 16;
float l = 60;

color c1 = #2AD9D4, c2 = #023852, c3 = #E53C28;


void boxx(){
  for(int i=0; i<4; i++){
    push();
    fill(i%2 == 0 ? c1 : c2);
    rotateY(HALF_PI*i);
    translate(0,0,l/2);
    rect(0,0,l,l);
    pop();
  }
  for(int i=0; i<2; i++){
    push();
    fill(c3);
    rotateX(HALF_PI+PI*i);
    translate(0,0,l/2);
    rect(0,0,l,l);
    pop();
  }
}

void draw_() {
  background(0); 
  push();
  translate(width/2, height/2 - 20);
  rotateX(.65);
  rotate(PI/6);
  for(int i=-N; i<=N; i++){
    for(int j=-N; j<=N; j++){
      tt = ease(c01(12*t - .35*(i+j+2*N) + 5) );
      push();
      translate(i*l, j*l, l*tt - l*t);
      boxx();
      pop();
    }
  }
  pop();
}
