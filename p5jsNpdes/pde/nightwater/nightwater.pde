Water w;
Waves o;
Peaks p;
void setup(){
 size(600,600);
frameRate(100);
 w=new Water();
 o=new Waves();
 p=new Peaks();
 background(0);
}
void draw(){
  o.step();
  o.render();
w.step();
w.render();
p.step();
p.render();
}
