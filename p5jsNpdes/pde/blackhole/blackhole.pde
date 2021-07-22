/***************

  Black Hole
  Zoombeani
  Rev 18-Apr-2016
  Org 15-Apr-2016

  Not too sure why we're only getting a background
  gotta brush up on js5, anywho just copy into PDE
  and it will run

***************/

float t;

int samplesPerFrame = 1;    //for mode 2,3
float shutterAngle = 1.;      //for mode 2,3
int numFrames = 90;          //for mode 2,3,4

float test,sw;
color col0;
int n=40000;

float blue=223.5, back=20;

void setup() {  
  size(540,540);
  colorMode(HSB,360,100,100,100);
  noFill();
}

void draw() {
  t+=0.0025;            //idea courtesy of metaglitch)
  if(t>=1.) t=0;        //Larger step = faster animation
  
  background(back);
  translate(width/2, height/2);

  for(int i=0;i<n;i++){

    randomSeed(i);

    float ti=t+norm(i,0,n);
    ti=ti%1;
    
    float phi=random(random(TAU))+HALF_PI;
    float r=map(random(random(1)),0,1,70,130);
    float rr=map(ease(ti,2),0,1,r,70);
    float x=rr*cos(phi);
    float y=rr*sin(phi);
    
    float a=map(cos(map(ti,0,1,0,TAU)-PI),1,-1,100,0);
    if(random(1)<.05){
      col0=color(back);
      sw=2.;
    }else if(random(1)>.96){
      col0=color(blue,80,100);
      sw=1.;
    }else{
      col0=color(300);
      sw=.4;
    }
    stroke(col0,a);
    strokeWeight(sw);
    point(x,y);
  }
}

//### Easing formulas
float ease(float p, float g) {               //courtesy of patakk> Bees & Bombs
  if (p < 0.5) return 0.5 * pow(2*p, g); 
  else return 1 - 0.5 * pow(2*(1 - p), g);
}
