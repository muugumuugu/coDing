class Creature {
  Network n;
  float[][] hweights;
  float[][] oweights;
  float randcol, mass, r, startx;
  PVector pos, vel, acc, nextrect, prevrect;
  int time1, timeair;
  //final int time1 = 10;
  float bestdist = width;
  float nextrecth = 50;
  float nextrectmag = 5;
  float fitness = 0;
  int distachieved = 0;
  boolean dead = false;
  int place = 0;

  Creature(float[][] hweights1, float[][] oweights1, float tmass, float trandcol, float tstartx, float tr) {
    //mass = random(5, 10);
    randcol = trandcol;
    mass = tmass;
    time1 = int(map(mass, 4, 12, 12, 8)*1.45f);
    timeair = time1;
    r = tr;
    startx = tstartx;

    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    nextrect = new PVector(width+2*100, height-100);
    nextrect = new PVector(width+2*100, height-100);
    oweights = oweights1;
    hweights = hweights1;
    n = new Network(inodes, hnodes, onodes, hweights1, oweights1);
    pos = new PVector(map(startx, 0, 1, 2*r, width-2*r), height-r*2);
  }

  void update() {
    if (dead) {
      vel.mult(0);
      acc.mult(0);
      pos.y = -200;
      pos.x = 0;
      pushStyle();
      noStroke();
      fill(255);
      rect(0, 0, 75, 100);
      popStyle();
      rect(0,0,1,700);
      rect(0,0,1080,1);
      
    } else distachieved++;
    vel.add(acc);
    vel.x *= 0.9f;
    vel.y *= 0.95f;
    pos.add(vel);
    acc.mult(0);
    if (pos.y+r*2 > height) {
      pos.y = height-r*2;
      if(vel.y > 0) vel.y = 0;
      //if(acc.y < 0) acc.y = 0;
      //acc.y = 0;
      vel.x *= 0.95;
      timeair = time1;
    }
    if (pos.y-r < -r*2) {
      pos.y = r;
      vel.y = 0;
    }
    constrain(pos.y, 0, height-r*2);
    constrain(pos.x, 0, width-r*2);
    if (pos.x < 0) pos.x = 0;
    else if (pos.x > width-r*2) pos.x = width-r*2;
  }

  void rectangleupdate(ArrayList<Obstacle> obs) {
    bestdist = width;
    //nextrect = new PVector(width+2*100, height-100);
    for (int i = 0; i < obs.size(); i++) {
      Obstacle o = obs.get(i);
      if (dist(pos.x, pos.y, o.pos.x, o.pos.y) < bestdist) {
        if (o.pos.x < pos.x) {
          bestdist = dist(pos.x, pos.y, o.pos.x, o.pos.y);
          nextrecth = o.h;
          nextrectmag = o.vel.mag();
          //nextrect = new PVector(o.pos.x, o.pos.y);
        }
      }
    }
  }

  void display() {
    //float[][] input = {{dist(pos.x, pos.y, nextrect.x, nextrect.y)}, {norm(nextrectmag, 5, 10)}};
    //float[][] output = n.query(input);
    pushStyle();
    strokeWeight(1.5f);
    stroke(0, 0, 0);
    rectMode(CORNER);
    pushMatrix();
    //translate(pos.x, pos.y);
    //rotate(vel.heading());
    //translate(r,r);
    colorMode(HSB);
    if (!dead) fill(randcol, 255, 255);
    else fill(randcol, 255, 255, 65);
    //fill(map(output[1][0], 0, 1, 255, 0));
    rect(pos.x, pos.y, r*2, r*2);
    fill(255-randcol, 255, 0);
    textSize(12);
    text(floor(mass), pos.x+r, pos.y+r);
    popMatrix();
    popStyle();
  }

  void applyForce(PVector force) {
    PVector f = new PVector(force.x, force.y);
    f.div(mass*2);
    acc.add(force);
  }

  void jump() {
    float[][] input = {{norm(dist(pos.x, pos.y, nextrect.x, nextrect.y), 0, width)}, 
      {norm(nextrecth, 50, 200)}, {norm(nextrectmag, 5, 10)}, {norm(pos.x, 2*r, width-2*r)}};
    float[][] output = n.query(input);

    PVector force = new PVector(0, 0);
    force.add(new PVector(0, 1.9f));
    PVector jumpforce = new PVector(0, 0);
    mass = map(output[1][0], 0, 1, 3, 12);
   time1 = int(map(mass, 5, 10, 10, 8)*1.5f);

    if ((output[0][0] > 0.5f)) {
      if (timeair > 0){
        jumpforce.add(new PVector(0, -output[1][0]*3));
        force.mult(0);
      }
      timeair--;
    } else {
      if (pos.y+r*2 > height) {
        pos.y = height-r*2;
        vel.y = 0;
        timeair = time1;
      }
    }
    if (!dead) {
      PVector force1 = new PVector(output[2][0], 0);
      PVector force2 = new PVector(-output[3][0], 0);
      if (output[4][0] < 0.5) {
        force.mult(map(output[5][0], 0, 1, 1, 3));
      }
      if (output[6][0] < 0.5) {
        force1.mult(output[7][0]*4);
      }
      if (output[8][0] < 0.5) {
        force2.mult(output[9][0]*4);
      }
      if (output[10][0] < 0.5) {
        jumpforce.mult(map(output[11][0], 0, 1, 0.8, 1.47));
      }
      //randcol *= output[12][0];
      //if(randcol > 255) randcol = 0;
      //if(randcol < 0) randcol = 255;
      applyForce(force);
      applyForce(jumpforce);
      applyForce(force1);
      applyForce(force2);
    }
  }

  void calcFitness() {
    fitness = pow(distachieved, 4)*pow(place, 4);
  }

  Creature crossover(Creature c) {
    float[][] newhweights = new float[hweights.length][hweights[0].length];
    float[][] newoweights = new float[oweights.length][oweights[0].length];
    float trandcol, tmass, tstartx;

    for (int i = 0; i < hweights.length; i++) {
      for (int j = 0; j < hweights[0].length; j++) {
        if (random(1) < 1) {
          if (random(1) < 0.5f) newhweights[i][j] = hweights[i][j];
          else newhweights[i][j] = c.hweights[i][j];
        }
        if (!useseed) {
          Integer n = int(seed+random(1000)); 
          Random r = new Random();
          Long l = new Long(n);
          r.setSeed(l);
          Random r = new Random();
          newhweights[i][j] = (float) r.nextGaussian()*pow(inodes, -0.5f);
        } else {
          newhweights[i][j] = random(-2.8, 2.8);
        }
      }
    }

    for (int i = 0; i < oweights.length; i++) {
      for (int j = 0; j < oweights[0].length; j++) {
        if (random(1) < 1) {
          if (random(1) < 0.5f) newoweights[i][j] = oweights[i][j];
          else newoweights[i][j] = c.oweights[i][j];
        }
        if (random(1) < mutrate) {
          if (!useseed) {
            //Integer n = int(seed+random(1000)); 
            //Random r = new Random();
            //Long l = new Long(n);
            //r.setSeed(l);
            //Random r = new Random();
            //newoweights[i][j] = (float) r.nextGaussian()*pow(hnodes, -0.5f);
          } else {
            newoweights[i][j] = random(-2.8, 2.8);
          }
        }
      }
    }


    if (random(1) < 0.5) {
      if (random(1) < 0.5f) trandcol = c.randcol;
      else trandcol = randcol;
    } else {
      trandcol = (randcol+c.randcol)/2;
    }
    if (random(1) < mutrate) trandcol = random(255);

    if (random(1) < 0.5) {
      if (random(1) < 0.5f) tmass = c.mass;
      else tmass = mass;
    } else {
      tmass = (mass+c.mass)/2;
    }
    if (random(1) < mutrate) tmass = random(4, 12);

    if (random(1) < 0.5) {
      if (random(1) < 0.5f) tstartx = c.startx;
      else tstartx = startx;
    } else {
      tstartx = (startx+c.startx)/2;
    }
    if (random(1) < mutrate) tstartx = random(1);
    float tr = tmass/5*7;
    Creature newc = new Creature(newhweights, newoweights, tmass, trandcol, tstartx, tr);

    return newc;
  }
}
