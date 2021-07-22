float t=0;


Fluid fluid;

void settings(){
  size(N*SCALE,N*SCALE);
}

void setup(){
 fluid = new Fluid(0.5,0,0) ;
}

//void mouseDragged(){
//  fluid.addDensity(mouseX/SCALE, mouseY/SCALE, 100);
//  float amtX =mouseX-pmouseX;
//  float amtY =mouseY-pmouseY;
//  fluid.addVelocity(mouseX/SCALE, mouseY/SCALE, amtX, amtY);
//}

void draw() {
  background(0);
  int cx=int(0.5*width/SCALE);
  int cy=int(0.5*height/SCALE);
  
  for (int i=-1 ; i<=1 ; i++){
     for (int j=-1 ; j<=1 ; j++){ 
    fluid.addDensity(cx+i,cy+j,random(100,500));
     }
  }

  
  float angle=noise(t)* TWO_PI;
  PVector v= PVector.fromAngle(angle);
  
  v.mult(0.1);
  
  // float amtX =map(noise(t),0,1,-1,1);
  //float amtY = map(noise(t+1000),0,1,-1,1);
  t+=0.01;
  fluid.addVelocity(cx,cy, v.x, v.y);

  fluid.step();
  fluid.renderD();
  fluid.fadeD();
}
