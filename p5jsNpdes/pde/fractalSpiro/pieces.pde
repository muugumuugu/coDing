//orbit
//x,y,r
//child
//parent
//orbit speed
//angle

class Orbit{
  float x;
  float y;
  float r;
  Orbit parent;
  Orbit child;
  float speed;
  float angle;
  //------------------
  Orbit(float x_,float y_,float r_, float s_,Orbit p){
    x=x_;
    y=y_;
    r=r_;
    parent= p;
    child=null;
    angle=-PI/2;
    speed=s_;
  }
  //-------------------
  void show(){
    strokeWeight(2);
    noFill();
    circle(x,y,r*2);
  }
  //-------------------
  Orbit addChild(float f, float ff){
    float newr =r*f;
    float newx =x+r+newr;
    float newy =y;
    child=new Orbit(newx,newy,newr,-ff*speed,this);
    return child;
  }
  //------------
  void update(){
    if (parent!=null){
      angle+=speed;
  float rsum=r+parent.r;
  x=parent.x+rsum*cos(angle);
  y=parent.y+rsum*sin(angle);
    }
   }
}    
