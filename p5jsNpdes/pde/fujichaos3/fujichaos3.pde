
float x,y,z,t;

float[] A = new float[6];
float[] f = new float[6];

int p = 3;
int q = 1;

float A1,A2,A3,A4,A5,A6;
float f1,f2,f3,f4,f5,f6;

int frame = 0;

void initialize(){
  frame = 0;
  
  for(int i=0;i<6;i++){
    A[i] = random(-1.0,1.0)*2;
    f[i] = random(-3,3);
  }
  
  A1 = A[0];
  A2 = A[1];
  A3 = A[2];
  A4 = A[3];
  A5 = A[4];
  A6 = A[5];
  
  f1=f[0];
  f2=f[1];
  f3=f[2];
  f4=f[3];
  f5=f[4];
  f6=f[5];
  
  x = random(-1,1);
  y = random(-1,1);
  t = 0;

  background(235);
}

void setup(){
  size(540,540);
  
  initialize();
}

float v = 0.0001;

int numFrames = 500;

void finish(){
  stop();
  println("finished");
  saveFrame("res"+floor(random(1000000))+".png");
}

void mousePressed() {
  finish();
}

void keyPressed(){
  initialize();
}

float step = 0.06;
float step2 = 0.07;

float quantity = 20.0;

void move(){
  //x *= 2*sin(0.002*t);
  //y *= 2*cos(0.002*t);
  //x *= 1.0+1.0*(floor(step*frame)%7)/7.0;
  //y *= 1.0+1.0*(floor(step2*(frame+1))%8)/7.0;
  x *= 2*cos(0.0008*t);
  y *= 2*sin(0.00083*t);
  //float x2 = x;
  //x*=y;
  //y*=x2;
  //x = 2.0*floor(quantity*x)/quantity;
  //y = 2.0*floor(quantity*y)/quantity;
  //x *= 1.0 + 0.05*frame;
  //y *= 1.0 + 0.05*frame;
  float xx = A1*pow(sin(f1*x),p) + A2*pow(cos(f2*y),q) + A3*pow(sin(f3*t),p);
  float yy = A4*pow(cos(f4*x),q) + A5*pow(sin(f5*y),p) + A6*pow(cos(f6*t),q);
  float tt = t + v;
  //xx *= 2.5;
  //yy *= 2.5;
  x = xx;
  y = yy;
  t = tt;
}

void step(){
  move();
  
  float xx = map(sin(0.3*x),-1.1,1.1,0,width)+0.5*randomGaussian();
  float yy = map(sin(0.3*y),-1.1,1.1,0,height)+0.5*randomGaussian();
  
  strokeWeight(random(0.5,1.5));
  stroke(0,3);
  point(xx,yy);
}

int K = 30000;

void draw(){
  frame++;
  
  if(keyPressed){
    initialize();
  }
  
  for(int k=0;k<K;k++){
    step();
  }
  println(frame,'/',numFrames);
  if(frame>=numFrames){
    finish();
  }
}
