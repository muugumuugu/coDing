class Population {
  ArrayList<Creature> pop, matingpool;
  ArrayList<Obstacle> obs;

  int gens = 0;
  int bestdist = 0;
  int t = 0;
  int numdead = 0;
  int obsinc = 50;
  final int resetobsinc = 100;
  int obsinc1 = obsinc;
  float tvelspeed = 5;

  Population() {
    pop = new ArrayList<Creature>();
    matingpool = new ArrayList<Creature>();
    obs = new ArrayList<Obstacle>();

    for (int i = 0; i < num; i++) {
      float[][] hweights = new float[hnodes][inodes];
      float[][] oweights = new float[onodes][hnodes];

      for (int k = 0; k < hnodes; k++) {
        for (int j = 0; j < inodes; j++) {
          if (!useseed) {
            //Integer n = int(seed+random(1000));
            //Random r = new Random();
            //Long l = new Long(n);
            //r.setSeed(l);
            //Random r = new Random();
            //hweights[k][j] = (float) r.nextGaussian()*pow(inodes, -0.5f)+0;
          } else {
            hweights[k][j] = random(-2.8, 2.8);
          }
        }
      }
      for (int k = 0; k < onodes; k++) {
        for (int j = 0; j < hnodes; j++) {
          if (!useseed) {
            //Integer n = int(seed+random(1000)); 
            //Random r = new Random();
            //Long l = new Long(n);
            //r.setSeed(l);
            //Random r = new Random();
            //oweights[k][j] = (float) r.nextGaussian()*pow(hnodes, -0.5f)+0;
          } else {
            oweights[k][j] = random(-2.8, 2.8);
          }
        }
      }

      float mass = random(4, 12);
      //float r = mass/5*6;
      //int time1 = int(map(mass, 5, 10, 10, 8)*1.6f);
      float randcol = random(255);
      float tstartx = random(1);
      float tr = mass/5*7;
      Creature c = new Creature(hweights, oweights, mass, randcol, tstartx, tr);
      pop.add(c);
    }
  }

  void order() {
    for (int i = 0; i < pop.size(); i++) {
      Creature c1 = pop.get(i);
      for (int j = 0; j < pop.size(); j++) {
        if (i != j) {
          Creature c2 = pop.get(j);
          if (c1.distachieved > c2.distachieved) {
            c1.place++;
          } else if (c1.distachieved < c2.distachieved) {
            c2.place++;
          } else {
            c1.place++;
            c2.place++;
          }
        }
      }
    }
  }

  void HUD() {
    textSize(20);
    text("Generations: " + gens, width-140, 40);
    text("Number alive: " + str(num-numdead), width-140, 80);
    text("Time: " + t, width-140, 120);
    text("Longest survived: " + bestdist, width-140, 160);
    text("Seed: " + seed, width-140, 200);
  }

  void display() {
    HUD();
    for (int i = 0; i < num; i++) {
      Creature c = pop.get(i);
      c.display();
    }
    for (int i = 0; i < obs.size(); i++) {
      Obstacle o = obs.get(i);
      o.display();
    }
  }

  void generate() {
    pop.clear();
    obs.clear();
    for (int i = 0; i < num; i++) {
      Creature c1 = matingpool.get(int(random(matingpool.size())));
      Creature c2 = matingpool.get(int(random(matingpool.size())));

      Creature newc = c1.crossover(c2);
      pop.add(newc);
    }
    numdead = 0;
    obsinc = resetobsinc;
    obsinc1 = obsinc;
    tvelspeed = 5;
    t = 0;
    gens++;
  }

  void calcFitness() {
    float totalfitness = 0;
    order();
    matingpool.clear();
    for (int i = 0; i < pop.size(); i++) {
      Creature c = pop.get(i);
      c.calcFitness();
      totalfitness += c.fitness;
    }
    for (int i = 0; i < pop.size(); i++) {
      Creature c = pop.get(i);
      float cfitness = c.fitness/totalfitness;
      for (int j = 0; j < cfitness*10000; j++) {
        matingpool.add(c);
      }
    }
  }

  void kill() {
    for (int i = 0; i < pop.size(); i++) {
      Creature c = pop.get(i);
      if (!c.dead) {
        for (int j = 0; j < obs.size(); j++) {
          Obstacle o = obs.get(j);
          PVector corner1 = new PVector(c.pos.x, c.pos.y-c.r*2);
          PVector corner2 = new PVector(c.pos.x+c.r*2, c.pos.y-c.r*2);
          PVector corner3 = new PVector(c.pos.x, c.pos.y);
          PVector corner4 = new PVector(c.pos.x+c.r*2, c.pos.y);
          PVector center = new PVector(c.pos.x, c.pos.y);
          if (o.collide(corner1) || o.collide(corner2) || o.collide(center) || 
            o.collide(corner3) || o.collide(corner4)) {
            c.dead = true;
            numdead++;
          }
        }
      }
    }
  }

  void update() {
    t++;
    for (int i = 0; i < num; i++) {
      Creature c = pop.get(i);
      c.update();
      c.rectangleupdate(obs);
      c.jump();
      if (c.distachieved > bestdist) bestdist = c.distachieved;
    }
    if (obsinc < 0) {
      PVector tvel = new PVector(-tvelspeed, 0);
      Obstacle o = new Obstacle(tvel);
      obs.add(o);
      obsinc = int(obsinc1 + random(-10, 10));
    } else {
      obsinc--;
    }
    if (tvelspeed < 10) tvelspeed *= 1.001f;
    if (obsinc1 > 60) {
      if (random(1) < 0.1f) {
        obsinc1--;
      }
    }
    for (int i = obs.size()-1; i >= 0; i--) {
      Obstacle o = obs.get(i);
      o.update();
      if (o.edges()) obs.remove(i);
    }
  }
}
