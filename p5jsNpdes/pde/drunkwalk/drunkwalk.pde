int scl=5;
Walker w;

void setup(){
  background(0);
  stroke(255);
  size(500,500);
  w = new Walker();
}

void draw(){
    w.step();
    w.display();
}
