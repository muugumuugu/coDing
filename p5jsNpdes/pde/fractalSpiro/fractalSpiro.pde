float angle=0;
ArrayList<PVector> path; //flexi size array
Orbit sun;
Orbit pen;
int res=100;

//==============================
void setup(){
  size(1200,1200);
  path= new ArrayList<PVector>();
  colorMode(HSB,360,100,100);
  //-------------
  sun=new Orbit(width/2,height/2,width/4,0.01/res, null);
  Orbit curr=sun;
 for (int i=0; i<10;i++){
   curr=curr.addChild(0.3,4);
 }
frameRate(100000);
}
//=================================
void draw(){
  background(0,20);
  stroke(255);
  Orbit curr=sun;
  for  (float i=0 ; i<res*res*res;i ++){
  while (curr!=null){
    curr.update();
    curr.show();
    pen=curr;
    curr= curr.child;
  }
  }
  ////..........
  //float r =100;
  //float rsum;
  //float x1=300;
  //float y1=300;
  //noFill();
  //ellipse(x1,y1,r*2,r*2);
  //float r2=r*0.5;
  //rsum=r+r2;
  
  //float x2=x1+rsum*cos(angle);
  //float y2=x1+rsum*sin(angle);
  //angle=angle+0.1;
  //path.add(new PVector(x2,y2));
  //ellipse(x2,y2,r2*2,r2*2);
  path.add(new PVector(pen.x,pen.y));
  stroke(frameCount%360,50,100);
  beginShape();
  for (PVector pos : path ){
    vertex( pos.x, pos.y);
    //if (pos.x==path[0].x && pos.y==path[0].y){
      //noLoop();
   // }
  }
  endShape();
}
