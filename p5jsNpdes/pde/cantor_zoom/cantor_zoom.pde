float scale = 1;

void setup(){
  rectMode(CENTER);
  size(400, 400);
  stroke(255);
  strokeWeight(3);
  frameRate(30);
}

void draw(){
  if(scale >= 3){
    scale = 1;
  }
  background(0);
  cantor(width/2, height/2, width/3, 6);
  scale += scale/60;
}

void cantor(float x, float y, float s, int d){
  if(d > 0){
    cantor(x-s+s/3, y-s+s/3, s/3, d-1);
    cantor(x+s-s/3, y-s+s/3, s/3, d-1);
    cantor(x+s-s/3, y+s-s/3, s/3, d-1);
    cantor(x-s+s/3, y+s-s/3, s/3, d-1);
  }else{
    point(x*scale-scale*(width/6), y*scale-scale*(width/6));  
  }
  
}
