// by Etienne JACOB
// motion blur template by beesandbombs
// needs opensimplexnoise code in another tab
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

int samplesPerFrame = 1;
int numFrames = 100;        
float shutterAngle = 1.0;

boolean recording = true;

OpenSimplexNoise noise;


void setup(){
  size(600,600,P3D);
  result = new int[width*height][3];
  
  noise = new OpenSimplexNoise();
  
  //ortho();
}

int n = 100;

int m = 500;

int N = 8;

float f = 0.75;

float L = 80;

float depth(float x,float y){
  float mr = 0.23;
  /*
  float d = dist(x,y,dx,dy);
  //float intensity = ease(map(sin(TWO_PI*t-HALF_PI),-1,1,0,1),1.0);
  float mr = 1.0;
  //float intensity = ease(map((float)noise.eval(mr*cos(TWO_PI*t),mr*sin(TWO_PI*t)),-1,1,0,1),1.0);
  float intensity = pow(map(dx,-f*width*0.6,f*width*0.8,0,1),2.5);
  float delta = map(intensity,0,1,50,17);
  */
  float h = pow(constrain((float)noise.eval(23+0.02*x,0.02*y,mr*cos(TWO_PI*t),mr*sin(TWO_PI*t)),0,1),4.5);
  return 150*h;
}

void draw_(){
  background(0);
  push();
  translate(width/2,height/2);
  rotateX(0.35*PI);
  rotate(+QUARTER_PI);
  
  float cameraZ = ((height/2.0) / tan(PI*60.0/360.0));
  perspective(PI/7.5, width/height, cameraZ/10.0, cameraZ*10.0);
  
  //float tt = (10*lerp(ease(t,2.5),t,0.65))%1;
  
  //float tt = (10*lerp(ease((t+0.5)%1,2.5),(t+0.5)%1,0.5))%1;
  
  float tt = -(5*t)%1;
  
  float mr0 = 0.4;
  /*
  float dx = L*(float)noise.eval(523+mr0*cos(TWO_PI*t),mr0*sin(TWO_PI*t));
  float dy = L*(float)noise.eval(1534+mr0*cos(TWO_PI*t),mr0*sin(TWO_PI*t));
  
  
  float dx1 = map(t/2,0,1,-f*width*0.6,f*width*0.8);
  float dx2 = map(0.5+t/2,0,1,-f*width*0.6,f*width*0.8);
  
  float dy1 = map(t/2,0,1,0,-200);
  float dy2 = map(0.5+t/2,0,1,0,-200);
  
  float dy = 0;
  
  */
  
  for(int i=0;i<n*N;i++){
    float c = (i%(2*N))<1?255:0;
    
    float x1 = map(i+2*N*tt,0,n*N,-f*width,f*width);
    float x2 = map(i+2*N*tt+1,0,n*N,-f*width,f*width);
    
    fill(c);
    noStroke();
    
    beginShape(TRIANGLE_STRIP);
    for(int j=0;j<m;j++){
      float y = map(j,0,m-1,-f*height,f*height);
      /*
      float d1 = depth(x1,y,dx1,dy1) + depth(x1,y,dx2,dy2);
      float d2 = depth(x2,y,dx1,dy1) + depth(x2,y,dx2,dy2);
      */
      float d1 = depth(x1,y) + depth(x1,y);
      float d2 = depth(x2,y) + depth(x2,y);
      
      vertex(x1,y,d1);
      vertex(x2,y,d2);
    }
    endShape();
  }
  
  pop();
}
