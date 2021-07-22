
class Locus{
  //////////////////////////////////
  //float rad = height/2*sqrt(random(1));
  //float theta = random(TWO_PI);
  //float x = width/2 + rad*cos(theta);
  //float y = height/2 + rad*sin(theta);
  ////////////////////////////////////
   float x = random(width);
  float y = random(height/2);
  /////////////////////////////////
  //-----------------------------------
  float vx = random(0,0);
  float vy = random(3,5);
  //----------------------------------------
  ArrayList<PVector> positions = new ArrayList<PVector>();

  //---------------------------------------
  float dropThickness = random(1,3);
  //---------------------------------
  int npart = 20;// number of particles
  //------------------------------
  float t_off = random(1);
  // Constructor||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
      Locus(){
        positions.add(new PVector(x,y));// make a new random as pvector with y at top of window
      }
  
  //|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||  
      void refresh(){
            PVector resultant = field(x,y);//acc
            // follow flow
            vx += dt*resultant.x; 
            vy += dt*resultant.y;
            //
            vx *= drag;
            vy *= drag;
            //update position acc to updated velocity
            x += dt*vx;
            y += dt*vy;
            //refresh where the next droplet is 
            positions.add(new PVector(x,y));
        }
  //|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    void show(){
      
      strokeWeight(dropThickness);
      float tt = (t+t_off)%1;
      int len = positions.size();
          for(int i=0;i<npart;i++){
              float loc = constrain(map(i+tt,0,npart,0,len-1-0.01),0,len-1-0.001);
              //--------------------------------
              int i1 = floor(loc);
              int i2 = i1+1;
              //------------------------------
              float interp = loc - floor(loc);
              float xx = lerp(positions.get(i1).x,positions.get(i2).x,interp);
              float yy = lerp(positions.get(i1).y,positions.get(i2).y,interp);
              //-----------------------------
              float fact = 1;
                  if(xx<bound||xx>width-bound||yy<bound||yy>height-bound){fact = 0;}
              //-----------------------------
              float alpha = fact*255*pow(sin(PI*loc/(len-1)),0.25);
              float cc=map(i,0,npart,0,360);
              //----------------------------------
              //stroke(255,alpha);
              stroke(cc,100,100,alpha);
              //------------------------------------------
              point(xx,yy);
          }
    }
  //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
}



//==========================================================

void locus_step(){
  for(int i=0;i<NParticles;i++){
    loci[i].refresh();
  }
}
