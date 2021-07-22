class Center{
  float x = random(width);
  float y = random(height);
  
  float rot = random(-10,10);
  
  void show(){
    stroke(255,0,0);
    strokeWeight(3);
    point(x,y);
  }
}

int N = 30;

Center[] array = new Center[N];

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
    
    sumx += array[i].rot*amount*ny*intensity;
    sumy -= array[i].rot*amount*nx*intensity;
  }
  return new PVector(sumx,sumy);
}
