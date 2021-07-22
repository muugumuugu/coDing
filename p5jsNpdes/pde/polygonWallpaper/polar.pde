void polar(float ang,float r , boolean shift){
  float x=0.0;
  float y =0.0;
  x=cos(ang)*r;
  y=sin(ang)*r;
  if (shift){
    x=width/2+x;
    y=height/2+y;
  }
  vertex(x,y);
}
