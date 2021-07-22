class Walker {
  int x;
  int y;
  Walker() {
      x = width/2;
      y = height/2;
    }
  void display() {
      point(x,y);
    }
  

  void step() {
    //lattice walker 
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    x += stepx*scl;
    y += stepy*scl;
  }
}
