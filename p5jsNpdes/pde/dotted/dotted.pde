  float x1 = 15;
  float y1 = 10;
  float x2 = 80;
  float y2 = 90;
void setup() {
size(400,400);
  line(x1, y1, x2, y2);
}
void draw(){
 strokeWeight(2);
  for (float i = 0; i <= 10; i++) {
    float x = lerp(x1, x2, i/10.0) + 20;
    float y = lerp(y1, y2, i/10.0);
 
    point(x, y);
  }
}
