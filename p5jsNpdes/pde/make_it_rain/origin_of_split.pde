class Origin{
  ////////////////////
  float buffer = 3;//2.1;//boundary buffer
  float x = random(buffer*bound,width-buffer*bound);
  float y = random(buffer*bound,height-buffer*bound);
  ////////////////
  //float r= height/3*sqrt(random(1));
  //float theta = random(TWO_PI);
  //float x = width/2 + r*cos(theta);
  //float y = height/2 + r*sin(theta);
  /////////////////////
  float rotAng = 0;
  float repulsionEnergy = 2;
  
  void show(){
   // stroke(255,0,0);
    strokeWeight(3);
    point(x,y);
  }

}
