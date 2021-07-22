int order=6;
int N=int(pow(2,order));
int total=N*N;

PVector[] path= new PVector[total];

void setup(){
  size(1024,1024);
  colorMode(HSB,360,100,100,100);
  for (int i=0; i<total; i++){
    path[i]=hilberti(i);
    float len = width/N;
    path[i].mult(len);
    path[i].add(len/2,len/2);
    
  }
}

int counter=0;
void draw(){
  background(0);
  noFill();
  strokeWeight(1);
     for (int i=1; i<counter;i++){
       stroke(map(i,0,counter,0,360),100,100,100);
       line(path[i-1].x,path[i-1].y,path[i].x,path[i].y);
     }
  
 //for (int i=0; i<counter;i++){
 //  strokeWeight(4);
 //  stroke(255,255,0);
 //  point(path[i].x,path[i].y);
 //  text(i,path[i].x,path[i].y);   
 //}
 counter++;
 if (counter==total){counter=1;}
 

}

//=================================

PVector hilberti(int i){
  PVector[] points={
    new PVector(0,0),
    new PVector(0,1),
    new PVector(1,1),
    new PVector(1,0)
  };
  PVector loc=points[i & 3]; // bit masking gets last 2 bits, use 7 get 3 use 15 get 4 blaa blaa
    for (int j=1; j<order ;j ++){
    float len=pow(2,j);
    i=i>>>2; // shift bits to right
    int quad= i&3;
    if (quad== 0){
    float temp= loc.x;
    loc.x=loc.y;
    loc.y=temp;
    }
    else if (quad== 1){
    loc.y+=len;}
    else if (quad== 2){
    loc.y+=len;
    loc.x+=len;}
    else if (quad== 3){
    float temp= len-1-loc.x;
    loc.x=len-1-loc.y;
    loc.y=temp;
    loc.x+=len;}
    }
  return loc;
  
  
}
