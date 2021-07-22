// <3 uwuuus


float a=0;  
ArrayList<PVector> heart = new ArrayList<PVector>();
// 
color bgclr;
int totalFrames=100;
color stkclr;
float percent;
float da;
int counter=0;
//

//
void setup(){
  size(800,800);
  noFill();
  colorMode(HSB,360,100,100,100);
  strokeWeight(2);
  stkclr=color(360,100,100,50);
  bgclr=color(300,50,100,40);
  da=0.1;
}


void draw(){
  percent=(float)(counter%totalFrames)/float(totalFrames);
  counter++;
  background(bgclr);

  hearts();
  translate(width/2,height/2);
  //---------------------

 // float r=10;
  stroke(stkclr);
 fill(stkclr);
  //
  beginShape();
//for (float a=0 ; a<TWO_PI ; a += da){
  //float x= r * pow(cos (a),3);// squeeze along y axis
//float y=r*pow(sin (a),1)
//}
  for (PVector v : heart){

  float a=map(percent,0,1,0,TWO_PI*3);
  float r= map(sin(a),-1,1,height/80,height/40);
  vertex(r*v.x, r*v.y);
  }
  endShape();
  if (percent<0.5){
    a=map(percent,0,0.5,0,TWO_PI);
  float x= 16 * pow(sin (a),3);
  float y=-(13*cos(a)-5*cos(2*a)-2*cos(3*a) -cos(4*a));//- for processing's dumm y system
  heart.add(new PVector(x,y));}
//  a+=da;
else{heart.remove(0);}

}


void smolheart( ){
  float xc=random(0,width);
  float yc=random(0,height);
  float rr= random(0.1,2);
  fill(random(300,360),100,75,80);
  pushMatrix();
    translate(xc,yc);
    beginShape();
    for (float ang=0; ang<TWO_PI ; ang+=da){
  float x= 16 * pow(sin (ang),3);
  float y=-(13*cos(ang)-5*cos(2*ang)-2*cos(3*ang) -cos(4*ang));
  vertex(rr*x,rr*y);
    }
    endShape();
    popMatrix();
}

void  hearts(){
  for ( int i=0; i<10; i++){
      smolheart();}
}
