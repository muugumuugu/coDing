// Solar system for ART3900 - Intro to Code class ---- example for Simple Class and Object Arrays, Translate
// and Rotate funcrtions that are nested within draw() with accumulative trajectories.

// ***** Interaction*******//
//Press ANY KEY or the MOUSE to re-spawn a new solar-system drawing. The no of planets and its moons vary everytime
//within a specified range.

int NUM = int(random(10, 50));
Star sun;
Star[] p;
ArrayList<Star> moonList = new ArrayList<Star>();
//IntList delegate;
ArrayList<Integer> delegate; 

void setup() {
  size(800, 800);
  noStroke(); 
  background(0);

  int minDiam = 16;
  int maxDiam = minDiam * 3;

  //create sun
  sun = new Star(0, 0, 24, 255, 255, 255, 255, 0.0);

  // Create planets
  p = new Star[NUM];
  for (int i = 0; i < p.length; i++) {
    p[i] = new Star(random(sun.size / 2, (width/2 - maxDiam/2) / 1.5), random(sun.size / 2, (height / 2 - maxDiam / 2) / 1.5), 1, 255, 255, random(.0001, .0019));
  }

  // Sort planet array from nearest to farthest from Sun and assign names (ids)
  sortPArray();
  
  //Create delegate
  delegate = new ArrayList<Integer>();
  
  // Spawn moons
  for (int i = 0; i < p.length; i++) {
    int moonNum = int(random(0, 50));
    delegate.add(moonNum);
    for (int j = 0; j < moonNum; j++) {

      float tempX = random(p[i].size / 2, 75);
      float tempY = random(p[i].size / 2, 75);
      int tempDiam = 1;
      float tempR = random(204);
      float tempG = random(204);
      float tempB = random(204);
      float tempAlpha = random(10, 250);
      float tempInc = random(-.00895, .00895);
      //println(tempInc);

      moonList.add(new Star(tempX, tempY, tempDiam, tempR, tempG, tempB, tempAlpha, tempInc));
    }
  }

  // check the program data
  //printTextToConsole();
}

void draw() {
  //background(0);
  translate(width/2, height/2);
  sun.show("not a planet");
  int moonCounter = 0;
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].show("I am a planet");

    for (int j = 0; j < delegate.get(i); j++) {

      pushMatrix();
      rotate(p[i].angle);
      translate(p[i].x, p[i].y);
      moonList.get(moonCounter).update();
      moonList.get(moonCounter).show("Not a plant");
      popMatrix();

      moonCounter++;
    }
  }

  // draw planet identification
  //drawPlanetNumber();
  // experiment();
}

class Star {

  float x, y, r, g, b, alpha, angle, inc;
  int size;
  String id = "";

  Star(float _x, float _y, int _size, float _r, float _alpha, float _inc) {
    this.x = _x;
    this.y = _y;
    this.size = _size;
    this.angle = random(0.0, 180.0);
    this.r = _r;
    this.alpha = _alpha;
    inc = _inc;
  }

  Star(float _x, float _y, int _size, float _r, float _g, float _b, float _alpha, float _inc) {
    this.x = _x;
    this.y = _y;
    this.size = _size;
    this.angle = random(0.0, 180.0);
    this.r = _r;
    this.g = _g;
    this.b = _b;
    this.alpha = _alpha;
    inc = _inc;
  }

  void update() {
    this.angle += inc;
  }

  void show( String me) {
    stroke(204, 120);
    strokeWeight(.75);
    noFill();

    pushMatrix();
    float dist = Math.sqrt((this.x * this.x) + (this.y * this.y));
    
    if ( me.equals("I am a planet")) {
      stroke(this.r, 128);
    } else {
      stroke(r, g, b, 158);
    }
    
    //draw Orbits
    //ellipse(0, 0, dist*2, dist*2);
    
    // if ( me.equals("I am a planet")) {
    //   fill(this.r, this.alpha);
    // } else {
    //   fill(this.r, this.alpha);
    // }
    
    //draw planets and moons
    noStroke();
    rotate(angle);
    translate(x, y);
    fill(this.r, this.alpha);
    ellipse(0, 0, size, size);
    popMatrix();
  }
}

void keyPressed() {
  NUM = int(random(5, 50)) ;
  moonList.clear();
  setup();
}

void mousePressed() {
  NUM = int(random(5, 50)) ;
  moonList.clear();
  setup();
}

void drawPlanetNumber() {
  for (int i = 0; i < p.length; i++) {
  pushMatrix();
  rotate(p[i].angle);
  translate(p[i].x, p[i].y);
  fill(204, 150);
  rotate(-p[i].angle);
  stroke(204, 150);
  line(0, 0, 40, -32);
  text(p[i].id, 44, -32); 
  popMatrix();
  }
}

void sortPArray() {
  String[] names = new String[NUM];
  for ( int i = 0; i < names.length; i++) {
    names[i] = "planet " + (i + 1);
  }
  // checking for program errors - not needed
  //for ( int i = 0; i < p.length; i++) {
  //  p[i].id = names[i];
  //  println(p[i].id + " has a value " + p[i].x);
  //}
  for ( int i = 0; i < p.length; i++ ) {
    float minimumValue = dist(0, 0, p[i].x, p[i].y);
    for ( int j = i+1; j < p.length; j++ ) {
      if ( dist(0, 0, p[j].x, p[j].y) < minimumValue) {
        minimumValue = dist(0, 0, p[j].x, p[j].y);
        Star temp = p[i];
        p[i] = p[j];
        p[j] = temp;
      }
    }
  }
  for ( int i = 0; i < p.length; i++) {
    p[i].id = names[i];
    // printing to console to ensure correct formatting of planet array
    //println(p[i].id + " has a dist() value " + dist(0, 0, p[i].x, p[i].y));
  }
}
