int fluct = 0;

void setup() {
  size(640, 640);
  strokeWeight(100);
}

void draw() {
  background(0);
  translate(width/2, height/2);

  float deg = (1-abs(cos(radians(fluct))))*100;
  for (int j=0; j<360; j+=10) {
    pushMatrix();
    for (int i=0; i<12; i++) {
      stroke(i*23);
      line(0, 0, 50, 0);
      translate(40, 0);
      rotate(radians(deg));
      scale(0.9);
    }
    popMatrix();
    rotate(radians(10));
  }
  fluct++;
  if(fluct>=360) fluct=0;
}
