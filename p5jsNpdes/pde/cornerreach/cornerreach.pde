int numFrames = 80;
////
void setup()
{
  size(1000,1000);
}
////
void draw()
{
  background(0);
  
  float t = 1.0*frameCount/numFrames;
  
  int m = 50;
  
  stroke(255);
  
  for(int i=0;i<m;i++)
  {
    for(int j=0;j<m;j++)
    {
      float x = map(i,0,m-1,0,width);
      float y = map(j,0,m-1,0,height);
      float theta=atan(y/x);
      float r=dist(x,y,width/2,height/2);
     

      
      float rot = periodicFunction(t-offset(x,y));
      float rnew=r*rot;
      if (rnew<40*m){
        rnew=-rnew;
      }
      x=cos(theta)*rnew;
      y=sin(theta)*rnew;
      
       pushMatrix();
      translate(x+width/2,y+height/2);;
      rotate(theta);
      line(-5,0,5,0);

      popMatrix();
             pushMatrix();
      translate(-x+width/2,y+height/2);;
      //rotate(theta);
     line(-5,cos(theta),5,sin(theta));

      popMatrix();
             pushMatrix();
      translate(x+width/2,-y+height/2);;
      //rotate(theta);
        line(-5,cos(theta),5,sin(theta));

      popMatrix();
             pushMatrix();
      translate(-x+width/2,-y+height/2);;
      //rotate(theta);
        line(-5,cos(theta),5,sin(theta));

      popMatrix();
    }
  }
  
  if(frameCount<=numFrames)
  {
    saveFrame("fr###.gif");
  }
  if(frameCount==numFrames)
  {
    println("All frames have been saved");
  }
}
