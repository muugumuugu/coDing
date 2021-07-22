void setup(){
  size(500,500);
  
  for(int i=0;i<N;i++){
    array[i] = new Center();
  }
}

void draw(){
  background(0);
  for(int i=0;i<N;i++){
    array[i].show();
  }
  
 int ni = 35;
  
  for(int i=0;i<ni;i++){
    for(int j=0;j<ni;j++){
      float x = map(i,0,ni-1,0,width);
      float y = map(j,0,ni-1,0,height);
      PVector res = field(x,y);
      
      stroke(255);
      strokeWeight(1);
      line(x,y,x+res.x,y+res.y);
    }
  }
  
}
