class Drop{
  float x=random(width);
  float y=random(-height,0);
  float ylen=random(20);
  float grav=random(0,0.05);
  float yspeed=random(4);
  float z=random(0,20);
  float wt=map(z,0,20,0.2,4);
  void fall(){
    y+=yspeed;
    yspeed+=grav;
    if (y>height){
      burst();
      y=random(-height,0);
      yspeed=random(4);
    }
  }
  void burst(){
    strokeWeight(wt*2);
    stroke(138,43,226);
    for (int i=0; i<10;i++){
      point(x+random(-5,5),height-random(0,10));
    }
  }
  void show(){
   strokeWeight(wt);
  stroke(138,43,226);
  fill(138,43,226,100);
  line(x,y,x,y+ylen);
  //ellipse(x,y,ylen/4,ylen);

}

}
