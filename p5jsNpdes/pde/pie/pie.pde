OpenSimplexNoise noise;

void setup()
{
  size(500,500);
  
  noise = new OpenSimplexNoise(12345);
}

color [] palette = {#f7f7f7,#cceabb,#3f3f44,#fdcb9e};

int numFrames = 70;

float randomValue(float p,float seed)
{
  float scl = 120.0;
  return pow(((float)noise.eval(scl*p,seed)+1)/2.0,2.0);
}

PVector position(float p)
{
  float q = sqrt(p);
  float theta = 7*TWO_PI*q;
  float r = 0.4*width*q;
  
  return new PVector(r*cos(theta),r*sin(theta));
}

void drawThing(float p)
{
  float v1 = randomValue(p,100);
  float v2 = randomValue(p,200);
  float v3 = randomValue(p,300);
  
  float sumv = v1+v2+v3;
  
  float alpha = 10*TWO_PI*p;
  
  float theta0 = alpha+0;
  float theta1 = alpha+map(v1/sumv,0,1,0,TWO_PI);
  float theta2 = alpha+map((v1+v2)/sumv,0,1,0,TWO_PI);
  float theta3 = alpha+TWO_PI;
  
  float r = 30*sin(PI*p); // sin(PI*p) is 0 at p=0 and p=1 and 1 in the middle
  
  PVector pos = position(p);
  
  noStroke();
  
  fill(palette[1]);
  arc(pos.x, pos.y, r, r, theta0, theta1);
  
  fill(palette[2]);
  arc(pos.x, pos.y, r, r, theta1, theta2);
  
  fill(palette[3]);
  arc(pos.x, pos.y, r, r, theta2, theta3);
}

void draw()
{
  background(palette[0]);
  
  float t = 1.0*frameCount/numFrames;
  
  pushMatrix();
  translate(width/2,height/2);
  
  int K = 130;

  for(int i=0;i<K;i++)
  {
    float p = 1.0*(i+t)/K;
    drawThing(p);
  }
  
  popMatrix();
  
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
