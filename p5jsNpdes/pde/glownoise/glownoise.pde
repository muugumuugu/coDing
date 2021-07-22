Glowby[] fireflie;
PImage bg;
int fm=100;
float ang=0;

void setup() {
  size(715, 540,P3D);
  bg=loadImage("alyssa.jpg");
  fireflie = new Glowby[60];
  for (int i = 0; i < fireflie.length; i++) {
    fireflie[i] = new Glowby();
    fireflie[i].update(ang);
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
          float w = 8 * ball.radius*ball.bright / d;
          sum += w;
          }
        float clr=random(-1,4);
        if (clr<1){pixels[index] = color(sum,sum*2/3,0);}
        else if (clr<2){pixels[index] = color(sum*2/3,sum,0);}
        else if (clr<3){pixels[index] = color(0,sum,sum*2/3);}
        else{pixels[index] = color(sum*2/3,0,sum);}
        //pixels[index]=color(sum);
        }
    }
  updatePixels();
  ang+=TWO_PI/fm;
  for (Glowby fly : fireflie) {
    fly.update(ang);
     }
  tint(255, 127);  // Display at half opacity
  image(bg, 0, 0);
  
  if (frameCount<fm+1){
    saveFrame("###.jpg");
    //progress
    println(nf(frameCount,0,0));
    }
   else if (frameCount==fm+1){println("done");}
    
}
