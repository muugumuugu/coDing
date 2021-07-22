

ArrayList <Mover> bouncers;
 
ArrayList <PVector> path = new ArrayList<PVector>();
ArrayList <PVector> path2 = new ArrayList<PVector>();
 
int i = 0; 
color bgcolor;

color moltitude = color(80,80,80);
int focus=0;
 
void setup() {  // this is run once.   
    bgcolor=lerpColor(color(0,0,0),color(random(255),random(255),random(255)),0.3);
    // set the background color
    background(bgcolor);
    
    // canvas size (Variable aren't evaluated. Integers only, please.)
    size(300, 300); 
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second
    frameRate(30);
    
    // set the width of the line. 
    strokeWeight(12);
    
     bouncers = new ArrayList();
 
  for (int i = 0; i < 200; i++)
  {
    Mover m = new Mover();
    bouncers.add (m);
  }
   bouncers.get(focus).c=color(255,255,255); 
} 
 
void draw() {  // this is run repeatedly.  
 
//background(bgcolor);
fill(bgcolor);
rect(0,0,width,height);
 
stroke(135);
strokeWeight(1);
line(0,0,0,height);
line(0,0,width,0);
line(0,height-1,width,height-1);
line(width-1,0,width-1,height);
 
 int i = 0;
  while (i < bouncers.size () )
  {
    Mover m = bouncers.get(i);
    m.update();
    m.interact(bouncers);
    
 
    i = i + 1;
  }
  
  PVector node = new PVector();
  node.x=bouncers.get(focus).location.x;
  node.y=bouncers.get(focus).location.y;
  path.add(node);
  
  i=0;
  int s=0;
  s=path.size();
  path2.clear();
  
 int  maxSize=10000;
  while (i<s){
      /*
      noStroke();
      fill(255,255,255,10);
      ellipse(path.get(i).x,path.get(i).y,10,10);
      */
      colorMode(HSB);
      //strokeWeight(2);
      stroke((255*(1-i/s)+100)%255,255*sqrt(1-i/s),255,255*sqrt(i/s));
      colorMode(RGB);
      if(i>1){
          line(path.get(i).x,path.get(i).y,path.get(i-1).x,path.get(i-1).y);
          }
      i=i+1;
      }
      
  if(s==maxSize){
    path.remove(0);    
  }
  
}
 
class Mover
{
  PVector direction;
  PVector location;
 
  float speed;
  float SPEED;
 
  float ellipseSize;
  
  color c;
 
 
  Mover () // Konstruktor = setup der Mover Klasse
  {
    setRandomValues();
  }
 
  Mover (float x, float y) // Konstruktor = setup der Mover Klasse
  {
    setRandomValues ();
  }
 
  // SET ---------------------------
 
  void setRandomValues ()
  {
    location = new PVector (random (width), random (height));
    ellipseSize = random (4, 20);
 
    float angle = random (TWO_PI);
    direction = new PVector (cos (angle), sin (angle));
 
    speed = random (1, 4);
    SPEED = speed;
    
    c=lerpColor(moltitude,color(random(255),random(255),random(255)),0.1);
 
  }
 
 
  // GENEREL ------------------------------
 
 
  void update ()
  {
    {
      // speed = SPEED * 0.7;
      move();
      checkEdgesAndBounce();
    }
    disp();
  }
 
  void checkEdgesAndBounce ()
  {
    float radius = ellipseSize / 2;
 
    if (location.x < radius )
    {
      location.x = radius ;
      direction.x = direction.x * -1;
    }
    else if (location.x > width-radius )
    {
      location.x = width-radius ;
      direction.x *= -1;
    }
 
    if (location.y < radius )
    {
      location.y = radius ;
      direction.y *= -1;
    }
    else if (location.y > height-radius )
    {
      location.y = height-radius ;
      direction.y *= -1;
    }
  }
 
 
  // MOVE -----------------------------------------
 
  void move ()
  {
 
    PVector velocity = direction.get();
    velocity.mult (speed);
    location.add (velocity);
  }
 
  // DISPLAY ---------------------------------------------------------------
 
  void disp ()
  {
  noStroke();
    fill (c);
    ellipse (location.x, location.y, ellipseSize, ellipseSize);
  }
 
 
void interact (ArrayList <Mover> boids)
  {
 
    PVector other;
    float otherSize ;
    
    PVector d1 = direction.get();
    float speed1=speed;
    PVector v1 = PVector.mult (d1,speed1);
    
 
    for (int i = 0; i < boids.size(); i++)
    {
      other = boids.get(i).location;
      otherSize = boids.get(i).ellipseSize;
      
      if(location!=other){
      
      PVector d2 = boids.get(i).direction;
      float speed2=boids.get(i).speed;
      PVector v2 = PVector.mult (d2,speed2);
      
 
      float distance = PVector.dist(other, location);
      
      
      
      if (distance < 0.5*(ellipseSize+otherSize)) {
          //color a=lerpColor(c,boids.get(i).c,0.5);
          
          //c=color(distance,distance,distance);
          PVector Connection=PVector.sub(other,location);
          Connection.normalize();
          PVector scarto= new PVector();
          scarto.x=Connection.x;
          scarto.y=Connection.y;
          scarto.mult(0.5*(ellipseSize+otherSize)-distance);
          location.sub(scarto);
          float v1pm=PVector.dot(v1,Connection);
          float v2pm=PVector.dot(v2,Connection);
          PVector v1p=PVector.mult(Connection,v1pm);
          PVector v2p=PVector.mult(Connection, v2pm);
          PVector Deltav=PVector.sub(v1p,v2p);
          v1.sub(Deltav);
          v2.add(Deltav);
          speed=min(v1.mag(),10);
          speed2=v2.mag();
          d1.set(v1);
          d1.normalize();
          d2.set(v2);
          d2.normalize();   
          direction.x=d1.x;
          direction.y=d1.y;
          boids.get(i).direction.x=d2.x;
          boids.get(i).direction.y=d2.y;   
          boids.get(i).speed=min(speed2,10);   
          }
          }
      
      }
    }
 
 
}
 
 
void mouseClicked(){
  bgcolor=lerpColor(color(0,0,0),color(random(255),random(255),random(255)),0.3);
  color rcolor; 
  int s=bouncers.size();
  for (int i = 0; i < s; i++)
  {
    rcolor=color(random(255),random(255),random(255));  
    bouncers.get(i).c=lerpColor(moltitude,rcolor,0.1);
  }
 
  
  focus=(focus+1) % s;
  bouncers.get(focus).c=color(255,255,255);
  
  path.clear();
 
    }
    
