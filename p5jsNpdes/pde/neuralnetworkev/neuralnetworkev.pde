//import java.util.Random; 
//import java.awt.Rectangle; 
//Network n;
Population pop;
//Creature c = new Creature();
PFont font;
int num = 100;
float mutrate = 0.015f;
int seed = int(random(1000));
int state = 1;
boolean useseed = true;
//boolean[] keys = {false, false, false, false};
int inodes = 4;
int hnodes = 50;
int onodes = 12;


//int time;
//float[][] inputs = {{0, 0, 1}, {0, 1, 1}, {1, 0, 1}, {1, 1, 1}};
//float[][] inputs = {{0}, {0}, {1}};
//float[][] targets = {{0}};
void setup() {
  size(1080,700);
  //p = new Player();
  //surface.setResizable(true);
  randomSeed(seed);
  fill(0);
  font = createFont("Consolas", 100);
  textFont(font, 20);
  textAlign(CENTER, CENTER);
  //rectMode(TOPCENTER);
  pop = new Population();
  frameRate(1000);
}

void keyPressed() {
  if (key != CODED) {
    if ((key == 'r') || (key == 'R')) {
      randomSeed(seed);
      pop = new Population();
    } else if ((key == 'p') || (key == 'P')) {
      if (state == 0) state = 1;
      else state = 0;
    }
    //else if ((key == 's') || (key == 'S')) {
      //String[] seeddata = new String[data.size()];
      //for (int i = 0; i < data.size(); i++) {
      //  seeddata[i] = data.get(i);
      //}
      //saveStrings("SeedData.txt", seeddata);
    //}
  } else {
    //if(keyCode == UP) keys[0] = true;
   // if(keyCode == DOWN) keys[1] = true;
    //if(keyCode == LEFT) keys[2] = true;
    //if(keyCode == RIGHT) keys[3] = true;
  }
}


void draw() {
  background(255);
  rect(0,0,1,700);
  rect(0,0,1080,1);
  rect(0,699,1080,1);
  rect(1079,0,1,700);
  if (state == 1) {
    pop.display();
    pop.update();
    pop.kill();
    if (pop.numdead >= num) {
      pop.calcFitness();
      pop.generate();
    }
    //if (pop.gens == 20) {
    //  results.append(pop.bestdist);
    //  resultsseed.append(seed);
    //  seed++;
    //  adddata();
    //  randomSeed(seed);
    //  pop = new Population();
    //}
  } else {
    pop.display();
  }
  //c.update();
  //c.display();
  //c.jump();
  //if(key == ' ') c.applyForce(new PVector(0, -10));
  //c.applyForce(new PVector(0, -20));
  //n.train(inputs, targets);
  //float[][] outputs = n.query(inputs);
  //for (int i = 0; i < outputs.length; i++) {
  //  for (int j = 0; j < outputs[0].length; j++) {
  //    println(outputs[i][j]);
  //  }
  //}
  //noLoop();
  //println(outputs);3) t++;
}
