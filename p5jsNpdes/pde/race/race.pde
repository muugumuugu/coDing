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

    saveFrame("fr###.png");
    println(frameCount,"/",numFrames);
    if (frameCount==numFrames)
      exit();
  }
}

//////////////////////////////////////////////////////////////////////////////

int samplesPerFrame = 5;
int numFrames = 200;        
float shutterAngle = .6;

boolean recording = true;

OpenSimplexNoise noise;

float rad = 4.0;

float curvex(float p){
  float seed = 1471;
  return 250*(float)noise.eval(seed + rad*cos(TWO_PI*p),rad*sin(TWO_PI*p));
}

float curvey(float p){
  float seed = 14;
  return 250*(float)noise.eval(seed + rad*cos(TWO_PI*p),rad*sin(TWO_PI*p));
}

int m1 = 9000;
void draw_curve(){
  for(int i=0;i<m1;i++){
    float p = 1.0*i/m1;
    
    stroke(255,50);
    strokeWeight(1.5);
    point(curvex(p),curvey(p));
  }
}

int m2 = 20;

void draw_thing(float tt){
  for(int i=0;i<=m2;i++){
    float p = 1.0*i/m2;
    float intensity = pow(sin(PI*p),2.0);
    
    float ttt = (tt+0.05*p)%1;
    float xx = curvex(ease(ttt,2.0));
    float yy = curvey(ease(ttt,2.0));
    
    stroke(255,255);
    strokeWeight(8*intensity);
    point(xx,yy);
  }
}

void setup(){
  size(500,500,P3D);
  result = new int[width*height][3];
  
  noise = new OpenSimplexNoise();
  
}

int n = 10;

void draw_(){
  background(0);
  push();
  translate(width/2,height/2);
  draw_curve();
  for(int i=0;i<n;i++){
    float tt = (i+t)/n;
    draw_thing(tt);
  }
  
  pop();
}
