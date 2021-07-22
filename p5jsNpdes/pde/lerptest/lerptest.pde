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
int numFrames = 75;        
float shutterAngle = .6;

boolean recording = true;

OpenSimplexNoise noise;

int n = 75;

int m = 300;

float SEED = 13;

float R = 1.5;


class Thing{
  float theta;
  
  float f = random(0.7,1.7);
  
  float seed = random(10,1000);
  
  Thing(int i){
    theta = TWO_PI*i/n;
  }
  
  float mr = 0.35;
  
  float l = 100;
  
  float x(float q){
    return 0.27*width*cos(theta) + l*(float)noise.eval(SEED+mr*cos(TWO_PI*q),mr*sin(TWO_PI*q),R*cos(theta),R*sin(theta));
  }
  
  float y(float q){
    return 0.27*width*sin(theta) + l*(float)noise.eval(2*SEED+mr*cos(TWO_PI*q),mr*sin(TWO_PI*q),R*cos(theta),R*sin(theta));
  }
  
  float delay_factor = 1.5;
  
  void show(){
    for(int i=0;i<m;i++){
      float p = 1.0*i/m;
      float xx = lerp(x(t - delay_factor*p),0,p);
      float yy = lerp(y(t - delay_factor*p),0,p);
      strokeWeight(2*f);
      stroke(255,50);
      point(xx,yy);
    }
    strokeWeight(4*f);
    stroke(255);
    point(x(t),y(t));
  }
}

Thing[] array = new Thing[n];


void setup(){
  size(600,600,P3D);
  result = new int[width*height][3];
  
  noise = new OpenSimplexNoise();
  
  for(int i=0;i<n;i++){
    array[i] = new Thing(i);
  }
}

void draw_(){
  background(0);
  push();
  translate(width/2,height/2);
  
  for(int i=0;i<n;i++){
    array[i].show();
  }
  
  pop();
}
