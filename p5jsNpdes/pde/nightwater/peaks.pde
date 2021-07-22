class Peaks{
  int x, y;
  Peaks() {
    x=width/2;
    y=height/2;
  }
  void render() {
    
    noStroke();
    fill(120,150,170,10);
    ellipse(x, y, random(2,4),random(1,3));
  }
  void step() {
    int choice=int(random(4)); 
      if (choice==0){
      x=x+5;
    }
    else if (choice ==1){
      y=y+2;
    }
    else if (choice ==2) {
     x= x-5;
    }
    else if (choice ==3) {
      y=y-2;
    }
    x=constrain(x,0,width-1);
    y=constrain(y,0,height-1);
  }
}
