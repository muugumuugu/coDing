float dim=400;
int dimm=int(dim);
float totalFrames=dim;
float counter=0;
float scl=100;
float d=100;


void setup(){
  size(400,400);
  frameRate(100);
  
}

void draw(){

  float percent=counter/totalFrames;
  //scale(10);
  counter=counter+1;
  if (counter==totalFrames+1){counter=0;}
  render(percent);
  //saveFrame("output/gif-####");// or "output/gif" +nf(counter,3)+ ".png);
}

void render(float percent){
  background(0);
  fill(255);
 // circle(percent*width,height/2,1);
  strokeWeight(0.002);
  float angle= percent *TWO_PI;
  translate(width/2,height/2);
  float centr=map(percent,0,1,-(width+d)/2,(width+d)/2);
  if (centr> (width/2)){
    circle(centr-(abs(centr)-width/2),0,d);
  }
  else if (centr< -width/2){
        circle(centr+(abs(centr)-width/2),0,d);
  }
    circle(centr,0,d);
  rectMode(CENTER);
  noFill();
  stroke(255);
  strokeWeight(0.02);
  rotate(angle);
  //square(0,0,2*d);
}
