void setup() {
size(800, 800);
background(0,100);
int polyCount = 3000;
int sides = 0;
float radius = 0.0;
float rotation = 0.0;
  for (int i=0; i<polyCount; i++) {
    sides = int(random(3, 15));
    radius = random(2, 20);
    rotation = random(TWO_PI);
    pushMatrix();//store pre- transform co-ordinate system till plotting is done
    translate(random(width), random(height));
    rotate(rotation);
    fill(random(255),random(255),random(255),random(255));
    polygon(radius, sides, 2, 0.0);
    popMatrix();//restores co-ordinate system without transforming plotted graphs
  }
}
