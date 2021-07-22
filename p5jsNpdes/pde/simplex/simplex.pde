int totalFrames = 360;
int counter = 0;
boolean record = false;
//----------------
float pixelInc = 0.03;
float timestep=0.01;
//----------------------
// non looping slices time axes
float ttoff = 0;
//----------------------
float bright;
float col;
float n;
//---------------------------
OpenSimplexNoise noise;
//----------------------------
void setup() {
  size(640, 360);
  noise = new OpenSimplexNoise();
  colorMode(HSB,360,100,100,100);//for color
}
//----------------------------

void draw() {
  float percent = float(counter % totalFrames) / totalFrames;
  render(percent);
  counter++;
  //gif control
      if (record) {
        saveFrame("output/gif-"+nf(counter, 3)+".png");
        if (counter == totalFrames) {exit();}
      }

}

void render(float percent) {
  float angle = map(percent, 0, 1, 0, TWO_PI);
  //------------------------------------------
 // float txoff = map(sin(angle), -1, 1, 0, 5);
  //float tyoff = map(cos(angle), -1, 1, 0, 5);
  //-------------------------------------------
  float toff = map(sin(angle), -1, 1, 0, 2);//2=noideDIam

  float xoff = 0;
  loadPixels();
  for (int x = 0; x < width; x++) {
    float yoff = 0;
    for (int y = 0; y < height; y++) {
      if (record) {
        n = (float) noise.eval(xoff, yoff, toff); // loops to n fro
      //  n = (float) noise.eval(xoff, yoff, txoff, tyoff); // loops infinitely
      } else {
        n = (float) noise.eval(xoff, yoff, toff);
      }
      //SHarp CriticAl
      if (n>0){bright=360;col=360;}
      else{bright=0;col=180;}
      //^^ monochramatic critic
      //monochromatic
      //bright = map(n,-1,1,0,360);
      ////coloured
      //col=map(n,-1,1,0,360);
      //draw
     // pixels[x + y * width] = color(col,100,100,50);//colored
     pixels[x + y * width] = color(bright);//BW
      //------------------------
      yoff += pixelInc;
    }
    xoff += pixelInc;
  }
  //render
  updatePixels();

  ttoff +=timestep ;
}
