void setup()
{
  size(500,500);
}

int numFrames = 80;

float periodicFunction(float p)
{
  return 1.0*sin(TWO_PI*p);
}

float offset(float x,float y)
{
  return 0.005*(x+2*y);
}

void draw()
{
  background(255);
  
  float t = 1.0*frameCount/numFrames;
  
  int m = 50;
  
  stroke(0);
  
  for(int i=0;i<m;i++)
  {
    for(int j=0;j<m;j++)
    {
      float x = map(i,0,m-1,0,width);
      float y = map(j,0,m-1,0,height);
      
      pushMatrix();
      translate(x,y);
      
      float rot = periodicFunction(t-offset(x,y));
      rotate(rot);
      
      line(-5,0,5,0);
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
