//0-> draw around centre, 1 draw around centre and skew, 2 just draw
void polygon(float radius, int sides, int mode, float skew){
  beginShape();
  float theta=0;
  for(int vertice=0;vertice<sides;vertice++){
  theta=2*PI*vertice/sides;
  if (mode!=0){
    polar(theta,radius,false);
  }
  else{
    polar(theta,radius,true);
  }
  }
  if (mode==1){
    translate(width/2,height/2);
    rotate(skew);
  }
    
  endShape(CLOSE);
}
