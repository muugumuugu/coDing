class Face{
  PVector normal;
  color clr;
  //-----------------------
  Face(PVector normal,  color clr){
    this.normal=normal;
    this.clr=clr;
  }
  
  void show(){
    fill(this.clr);
    noStroke();
    //-----------------------
    pushMatrix();
    translate(0.5*normal.x,0.5*normal.y,0.5*normal.z);
    //-------------------------
    if (abs(normal.y)>0){
    rotateX(HALF_PI);
    }
    else if (abs(normal.x)>0){
    rotateY(HALF_PI);
    }
    //-----------------------
    square(0,0,1);
    popMatrix();
  }
}
//==================================================
color[] colors={#0000FF,#00FF00,#FFFF00, #FFFFFF,#FF0000,#FC6A03 ,#000000};
//udlrfb

//===================================================
