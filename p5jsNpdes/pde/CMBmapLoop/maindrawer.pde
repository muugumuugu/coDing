
void draw_(){
  background(0);
  
  for(int i=0;i<n;i++){
    array[i].show();
  }
  
  stroke(255);
  strokeWeight(1);
  drawCurve();
}

void drawCurve(){
  int m = 200;
  stroke(255);
  noFill();
  beginShape();
  for(int i=0;i<m;i++){
    float theta = i*TWO_PI/m;
    float y = height/2+radius*cos(theta);
    float x = width/2+radius*sin(theta);
    float intensity = pow(map(dist(x,y,width/2,height/2),0,radius,1,0),0.75);
    float xx = x + intensity*L*(float)noise.eval(scl*x,scl*y,R*cos(TWO_PI*t),R*sin(TWO_PI*t));
    float yy = y + intensity*L*(float)noise.eval(100+scl*x,scl*y,R*cos(TWO_PI*t),R*sin(TWO_PI*t));
    vertex(xx,yy/8+height/2);
  }
  endShape(CLOSE);
}
