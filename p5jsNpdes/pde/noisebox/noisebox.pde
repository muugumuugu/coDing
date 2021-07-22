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

int samplesPerFrame = 8;
int numFrames = 360;        
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
  ortho();
}

void boxx(){
  for(int i=0; i<4; i++){
    push();
    fill(i%2==0?c1:c2);
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

float x, y, z, tt;
int N = 10;
color c1 = #ffa5ab, c2 = #94e0c5, c3 = #5b8aa2;
float l = 12;
float t1, t2, t3, t4, t5, t6;
float ee = 3;

void draw_() {
  background(250);
  push();
  translate(width/2, height/2);
  rotateX(-ia);
  rotateY(QUARTER_PI);
  for(int i=-N; i<=N; i++){
    for(int j=-N; j<=N; j++){
      for(int k=-N; k<=N; k++){
        push();
        tt = t + 0.75*noise(0.02*i+123, 0.02*j+234, 0.02*k+345);
        tt = (tt + 1000)%1;
        t1 = ease(c01(6*tt),ee);
        t2 = ease(c01(6*tt-1),ee);
        t3 = ease(c01(6*tt-2),ee);
        t4 = ease(c01(6*tt-3),ee);
        t5 = ease(c01(6*tt-4),ee);
        t6 = ease(c01(6*tt-5),ee);
        rotateX(-HALF_PI*t6);
        rotateY(-HALF_PI*t5);
        rotateX(-HALF_PI*t4);
        rotateY(-HALF_PI*t3);
        rotateX(-HALF_PI*t2);
        rotateY(-HALF_PI*t1);
        translate(i*l,j*l,k*l);
        boxx();
        pop();
      }
    }
  }
      
  pop();
}
