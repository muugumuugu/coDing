// Processing code by Etienne JACOB
// motion blur template by beesandbombs
// opensimplexnoise code in another tab might be necessary
// --> code here : https://gist.github.com/Bleuje/fce86ef35b66c4a2b6a469b27163591e


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

    saveFrame("fr###.gif");
    println(frameCount,"/",numFrames);
    if (frameCount==numFrames)
      exit();
  }
}

//////////////////////////////////////////////////////////////////////////////

int samplesPerFrame = 5;
int numFrames = 40;        
float shutterAngle = .8;

boolean recording = false;

OpenSimplexNoise noise;

float border = 0;
float border2 = -25;

class Curve{
  float seed = random(10,1000);
  
  int id;
  
  int m = 2000;
  
  Curve(int i){
    id = i;
  }
  
  float D = 15;
  float rad = 0.5*4;
  float np = 40/3;
  
  void show(){
    for(int i=0;i<m;i++){
      float x = map(id,0,n-1,border,width-border);
      float p = 1.0*i/m;
      float y = map(p,0,1,border2,height-border2);
      
      float intensity = ease(constrain(-1.5*(dist(x,y,width/2,height/2)-350)/width,0,1),4.0);

      float dx = intensity*D*(float)noise.eval(2*seed + rad*cos(TWO_PI*(np*p-t)),rad*sin(TWO_PI*(np*p-t)),17*p);
      float dy = intensity*D*(float)noise.eval(3*seed + rad*cos(TWO_PI*(np*p-t)),rad*sin(TWO_PI*(np*p-t)),17*p);
      
      stroke(255,70);
      strokeWeight(2.0);
      
      point(x+dx,y+3*dy);
    }
  }
}

int n = 35;

Curve[] array = new Curve[n];

void setup(){
  size(600,600,P3D);
  result = new int[width*height][3];
  
  noise = new OpenSimplexNoise();
  
  for(int i=0;i<n;i++){
    array[i] = new Curve(i);
  }
}

void draw_(){
  background(0);
  push();
  
  for(int i=0;i<n;i++){
    array[i].show();
  }
  
  pop();
}
