int particle_max_range = 40;
int particle_max_range_dev = 5;
float particle_angle_jitter = PI/1000;
float particle_angle_dev = PI/10;
int particle_start_number = 5;
float particle_p_straight = 0.9;
float particle_p_left = 0.7;
float particle_p_right = 0.7;
float particle_speed = 1.5;
float particle_fade_time = 300;

color backgr = color(0);

Grid grid;


void setup(){
  size(700, 700);
  smooth();
  strokeWeight(1.4);
  background(backgr);
  grid = new Grid(new PVector(width/2, height/2));
}

void draw(){
  grid.step();
}

void mouseClicked(){
  if (mouseButton==RIGHT){
    grid = new Grid(new PVector(mouseX, mouseY));
  }
  if (mouseButton==LEFT){
    randomize();
    background(backgr);
    grid = new Grid(new PVector(width/2, height/2));
  }
}

void randomize(){
  particle_max_range = int(random(0,80));
  particle_max_range_dev =int( pow(10,int(random(-1,2))));
  particle_angle_jitter = PI/pow(10,random(1,3));
  particle_angle_dev = PI/pow(10,random(0,3));;
  particle_start_number = (int)random(3,8);
  particle_p_straight = gauss(0.5,0.5);
  particle_p_left = gauss(0.5,0.5);
  particle_p_right = gauss(0.5,0.5);
  if (particle_p_straight+particle_p_left+particle_p_right<1){
    randomize();
  }
}


class Particle {
  PVector loc;
  float angle;
  float speed;
  int time;
  int max_time;
  boolean dead, blocked;
  
  Particle(PVector new_loc, float new_angle){
    loc = new_loc;
    angle = new_angle;
    speed = particle_speed;
    time = 0;
    max_time = int(gauss(particle_max_range, particle_max_range_dev)/speed);
    dead = false;
    blocked = false;      
  }
  
  void step(){
    PVector old_loc = loc.get();
    loc.x += speed*sin(angle);
    loc.y += speed*cos(angle);
    angle += gauss(0, particle_angle_jitter);
    time++;
    if(loc.x<1 || loc.x>=width-1 || loc.y<1 || loc.y>=height-1){
      blocked = true;
    }
    else if(pixels[int(loc.x+sin(angle))+width*int(loc.y+cos(angle))]!=backgr){
      blocked = true;
      stroke(255,0,0);
    }
    else if(time>max_time){
      dead = true;
    }
    line(old_loc.x, old_loc.y, loc.x, loc.y);  
  }
}


class Grid {  
  PGraphics grid_frame;
  ArrayList particles;
  float line_opacity;
  
  Grid(PVector start){
    grid_frame = createGraphics(width, height, JAVA2D);
    particles = new ArrayList();
    for(int i=0; i<particle_start_number; i++){
      particles.add(new Particle(start.get(), random(2*PI)));
    }
    line_opacity = 255;
  }

  void step(){
    if(line_opacity>1){
      loadPixels();
      for(int i=particles.size()-1; i>=0; i--){
        Particle p = (Particle) particles.get(i);
        stroke(255, int(line_opacity));
        p.step();
        if(p.blocked) particles.remove(i);
        else if(p.dead){
          if(random(1)<particle_p_straight) particles.add(new Particle(p.loc.get(), p.angle+gauss(0,particle_angle_dev/2)));
          if(random(1)<particle_p_left) particles.add(new Particle(p.loc.get(), p.angle+gauss(PI/2,particle_angle_dev)));
          if(random(1)<particle_p_right) particles.add(new Particle(p.loc.get(), p.angle+gauss(-PI/2,particle_angle_dev)));
          particles.remove(i);
        }
      }
    }
    line_opacity = max(0, line_opacity-255/particle_fade_time);
  }  
}


float gauss(float mu, float sigma){
  float x = 1, y = 1, s = 2;
  while(s >= 1){
    x = random(-1, 1);
    y = random(-1, 1);
    s = x*x + y*y;
  }
  return sigma*x*sqrt(-2*log(s)/s)+mu;
}
