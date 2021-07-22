void setup(){
  size(400,400,P3D);
  smooth(8);
  stroke(30);
  noFill();
}

float q, weight, x, y;

void draw(){
  background(250);
  beginShape();
  for(int i=0; i<=64; i++){
    q = i/64.0;
    x = width/2 + lerp(-120,120,q);
    y = height/2 + 50*sin(PI*q - millis()*.0015);
    weight = 1+16*q*(1-q);
    strokeWeight(weight);
    vertex(x,y);
  }
  endShape();
}
