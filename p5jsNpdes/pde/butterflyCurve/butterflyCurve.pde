static final int NUM = 200;
static final float Xs[] = new float[NUM];
static final float Ys[] = new float[NUM];
static final float Ts[] = new float[NUM]; //tethas

/**
  We use a flag to give the particles some initial values
*/
void initCoordinates(boolean setup) {
  for(int i = 0 ; i < NUM; i++) {
    if (setup) {
      Ts[i] = random(0, 180); // [0, PI]
    }
    // the magic curve
    Xs[i] = 50 * sin(Ts[i]) * (exp(cos(Ts[i])) - 3*cos(4*Ts[i]) - pow(sin(Ts[i]/10), 5));
    Ys[i] = 50 * cos(Ts[i]) * (exp(cos(Ts[i])) - 3*cos(4*Ts[i]) - pow(sin(Ts[i]/10), 5));
  }
}

void setup () {
  size(800, 600, P3D);
  initCoordinates(true);
}

void draw () {
  background(0);
  textSize(12);
  text("FPS " + frameRate, 10, 20);
  
  translate(width / 2, height / 2);

  noStroke();
  fill(255);
  for (int i = 0; i < NUM; i++) {
    // increment tetha, if needed reset it
    Ts[i] += .01;
    if (Ts[i] > 180) {
      Ts[i] = 0;
    }
    initCoordinates(false);
    ellipse(Xs[i], Ys[i], 2, 2);
  }
}
