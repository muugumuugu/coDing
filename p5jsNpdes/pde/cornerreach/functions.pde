
float periodicFunction(float p)
{
  return 1.0*sin(TWO_PI*p);
}

float offset(float x,float y)
{
  return noise(x,y);
}
