Glowby[] fireflie;
PImage bg;
int fm=60;

void setup() {
  size(1430, 1080);
  bg=loadImage("alyssa.jpg");
  fireflie = new Glowby[50];
  for (int i = 0; i < fireflie.length; i++) {
    fireflie[i] = new Glowby(random(width), random(height));
  }
  background(0);
}

void draw() {
  background(0);
  bg.loadPixels();
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + width * y;
      float sum = 0;
      for (Glowby ball : fireflie) {
        float d = dist(x, y, ball.pos.x, ball.pos.y);
        float w = 12 * ball.radius / d;
        sum += w;
      }
      if ( bg.pixels[index] + color(sum,sum,sum) == color(0,0,0)){
        pixels[index]=color(sum,sum,sum);  
      }
      else{
      pixels[index] = color(sum, sum, sum) + bg.pixels[index];
      }
    }
  }
  updatePixels();
  for (Glowby fly : fireflie) {
    fly.update();
    // ball.show();
 }
 if (frameCount<=fm){
 saveFrame("###.gif");
 int fnn=121-frameCount;
 saveFrame(nf(fnn,3,0)+".gif");
 }
}
