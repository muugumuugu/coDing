color c;
color d;
color e;
boolean loopit=true;

//--------------------------
  void setup(){
  size(500,500);
  noStroke();
  rectMode(CENTER);
  textSize(32);
  textAlign(CENTER);
  c=color(random(255),random(255),random(255),random(255));
  d=color(random(255),random(255),random(255));
  e=color(256-red(d),256-green(d),256-blue(d));
}
//-------------------------------
void draw(){
  if (frameCount%10==0 && loopit){
  background(0,10);
  fill(c);
  //stroke
  text(hex(c),width/2,height/2,-30);
  rect(width/2,height/2,400,400,100,100,100,100);
  }
  fill(random(255),random(255),random(255),random(255));
  circle(random(width),random(height),random(50));
}
//-------------------------------
void keyPressed(){
  fill(d);
  circle(width/2,height/2,100);
  fill(e);
  text(keyCode,width/2,height/2);
  loopit=false;
  
}

void keyReleased(){
  loopit=true;
  c=color(random(255),random(255),random(255),random(255));
  d=color(random(255),random(255),random(255));
  e=color(256-red(d),256-green(d),256-blue(d));
}
