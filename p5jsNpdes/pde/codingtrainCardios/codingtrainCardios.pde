float totall=500;
int total=100;
float r;
float t=0;
float dt=0.005;
float factor=2;
float lengFac=5;
float factorr=50;
//===================
void setup(){
  size(800,800,P2D);
  r= width/2.1;
  colorMode(HSB,360,100,100,100);
  strokeWeight(0.5);
  //
       stroke(random(360),75,100,50);
  total=200;
}

//=======================
 
 void draw(){
   background(0);
  //factor=map(mouseY,0,height,0,factorr);
  //total=int(map(mouseX,0,width,0,totall));
  //factor=map(sint(t),-1, 1,-lengFac,lengFac);
  factor=ease(t);
  t+=dt;
   translate(width/2,height/2);
  // for (int i=0; i<total ; i++){
  //PVector v= getVector(i,total);
  //   fill(random(360),75,100,75);
  //   circle(v.x,v.y,8);
  // }
       //stroke(random(360),75,100,50);// 
   for (int i=0; i<total ; i++){
     PVector a =getVector(i,total,factor), b=getVector(i*abs(factor),total, factor);
     //stroke(random(360),75,100,50);
     line(a.x,a.y,b.x,b.y);
   }
 
 }
 
 //=====================
 PVector getVector(float index,int total,float dir){
   float angle=map(index%total,0,total,0,TWO_PI);
   PVector v;
   //if (factor>0){
   //v = PVector.fromAngle(angle+PI);
   //}
   //else{
   v = PVector.fromAngle(angle);
  // }
   v.mult(r);
   return v;
 }
 
 
 float ease(float x){
   float  p=(sin(x)*sin(x)*sin(x))*lengFac;
    return p;
 }
