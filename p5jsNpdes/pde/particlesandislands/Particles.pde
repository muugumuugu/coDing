class Center{
  float x = random(width);
  float y = random(height);
  
  float rot = random(-10,10);
  float repulse = random(-4,2);
  
  void show(){
    stroke(255,0,0);
    strokeWeight(3);
    point(x,y);
  }
}

float DT = 0.1;

class Particle{
  float x = random(width);
  float y = random(height);
  
  float sz = random(1,2);
  
  void update(){
    PVector res = field(x,y);
    x += DT*res.x;
    y += DT*res.y;
  }
  
  void show(){
    stroke(255);
    strokeWeight(sz);
    point(x,y);
  }
}

int N = 100;

int NPart = 5000;

Center[] array = new Center[N];

Particle[] array2 = new Particle[NPart];

PVector field(float x,float y){
  
  float amount = 7;
  
  float sumx = 0;
  float sumy = 0;
  for(int i = 0;i<N;i++){
    float distance = dist(x,y,array[i].x,array[i].y);
    float intensity = constrain(map(distance,0,width,1,0),0,1);
    intensity = pow(intensity,12);
    float nx = (x - array[i].x)/distance;
    float ny = (y - array[i].y)/distance;
    
    sumx += (array[i].rot*ny + array[i].repulse*nx)*intensity*amount;
    sumy += (-array[i].rot*nx + array[i].repulse*ny)*intensity*amount;
  }
  return new PVector(sumx,sumy);
}
