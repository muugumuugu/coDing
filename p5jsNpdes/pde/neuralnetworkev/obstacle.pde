class Obstacle {
  PVector pos, vel;
  float w = 50;
  float h = 200;
  //Rectangle r;

  Obstacle(PVector tvel) {
     
    pos = new PVector(width+w*2, height-h);
    //r = new Rectangle(int(pos.x), int(pos.y), int(w), int(h));
    vel = new PVector(tvel.x, tvel.y);
  }

  void display() {
    pushStyle();
    noStroke();
    //rectMode(CORNER);
    //colorMode(RGB);
    fill(0);
    rect(pos.x, pos.y, w, h);
    popStyle();
  }

  void update() {
    pos.add(vel);
    //r = new Rectangle(int(pos.x), int(pos.y), int(w), int(h));
  }

  boolean edges() {
    return (pos.x < -2*w);
  }

  boolean collide(PVector position) {
    //return (r.contains(int(position.x), int(position.y)));
    if((position.x > pos.x) && (position.x < pos.x+w)){
      if((position.y > pos.y) && (position.y < pos.y+h)){
        return true;
      }
    }
    return false;
  }
}
