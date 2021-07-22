OpenSimplexNoise noise;

void setup()
{
  size(500,500);
  
  noise = new OpenSimplexNoise(12345);
}

int numFrames = 38;

float periodicFunction(float p,float seed,float x,float y)
{
  float radius = 1.3;
  float scl = 0.018;
  return 1.0*(float)noise.eval(seed+radius*cos(TWO_PI*p),radius*sin(TWO_PI*p),scl*x,scl*y);
}


float offset(float x,float y)
{
  return 0.015*dist(x,y,width/2,height/2);
}

void draw()
{
  background(0);
  
  float t = 1.0*frameCount/numFrames;
  
  int m = 450;
  
  stroke(255,50);
  strokeWeight(1.5);
  
  for(int i=0;i<m;i++)
  {
    for(int j=0;j<m;j++)
    {
      float margin = 50;
      float x = map(i,0,m-1,margin,width-margin);
      float y = map(j,0,m-1,margin,height-margin);

      float dx = 20.0*periodicFunction(t-offset(x,y),0,x,y);
      float dy = 20.0*periodicFunction(t-offset(x,y),123,x,y);
      
      point(x+dx,y+dy);
    }
  }
  
  if(frameCount<=numFrames)
  {
    saveFrame("fr###.gif");
  }
  if(frameCount==numFrames)
  {
    println("All frames have been saved");
    stop();
  }
}
