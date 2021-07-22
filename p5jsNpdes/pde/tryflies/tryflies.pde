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
        pixels[index] = color(sum*3/2,sum,0) ;
        }
    }
  updatePixels();
  for (Glowby fly : fireflie) {
    fly.update();
     }
  tint(255, 127);  // Display at half opacity
  image(bg, 0, 0);
  if (frameCount<fm+1){
    saveFrame("###.png");
    //fo loop
    int ff=(2*fm)+1-frameCount;
    saveFrame(nf(ff,3,0)+".png");
    //progress
    }
    else{
    println("done");
    }
}
