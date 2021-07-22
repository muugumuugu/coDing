class Water {
  int x, y;
  Water() {
    x=width/2;
    y=height/2;
  }
  void render() {
    strokeWeight(random(1,3));
    stroke(50,80,160,20);
    point(x, y);
  }
  void step() {
    int choice=int(random(4)); 
      if (choice==0){
      x=x+7;
    }
    else if (choice ==1){
      y=y+7;
    }
    else if (choice ==2) {
     x= x-7;
    }
    else if (choice ==3) {
      y=y-7;
    }
    x=constrain(x,0,width-1);
    y=constrain(y,0,height-1);
  }
}
