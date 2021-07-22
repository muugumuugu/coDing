

class Star{
  float r = sqrt(random(1))*radius;
  float the = random(TWO_PI);
  float y = height/2 + r*sin(the);

  float x = width/2 + r*cos(the);
  
  
  void show(){
    float intensity = pow(map(dist(x,y,width/2,height/2),0,radius,1,0),0.75);

    float xx = x + intensity*L*(float)noise.eval(scl*x,scl*y,R*cos(TWO_PI*t),R*sin(TWO_PI*t));
    float yy = y + intensity*L*(float)noise.eval(100+scl*x,scl*y,R*cos(TWO_PI*t),R*sin(TWO_PI*t));

    stroke(map(intensity,0,1,0,360),100,100,50);
    strokeWeight(1);
    point(xx,yy/8+height/2);
  }
}
