class Glowby {
  float radius;
  PVector pos;
  PVector vel;
  Glowby(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(10, 15));
    radius = random(10,30);
  }
  
  void show() {
    stroke(0);
    noFill();
    ellipse(pos.x, pos.y, radius * 2, radius * 2);
  }
  
  void update() {
    pos.add(vel);
    if (pos.x > width - radius) {
      vel.x = - vel.x;
      pos.x = width - radius;
    }
    if (pos.x < radius) {
      vel.x = - vel.x;
      pos.x = radius;
    }
    if (pos.y > height - radius) {
      vel.y = - vel.y;
      pos.y = height - radius;
    }
    if (pos.y < radius) {
      vel.y = - vel.y;
      pos.y = radius;
    }
  }
}
