
//----------------------------------------------------------------
void drawWalkers(){
   for (PVector w: walkers){
     // /*
       //stroke(255,w.z*shade);
       stroke(w.x*shade,w.y*shade,w.z*shade,w.z*shade);
       float sc=w.z*shade*2/255;
       pushMatrix();
       strokeWeight(sc);//
       point(w.x,w.y);
       popMatrix();
      // */
       /*
       stroke(w.x*shade,w.y*shade,w.z*shade,128);
       point(w.x,w.y,w.z);
       */
   }
}
//------------------------------------------------------------------

void walk(){
   for (int i=0;i<density;i++){
      if (status[i]==true){
        PVector inc= drunk();
        PVector w=walkers[i];
        PVector newloc=PVector.add(w,inc);//broenian walk
        checknwalk(newloc,w,i);
      }
   } 
}

//-----------------------------

void checknwalk(PVector newloc,PVector w, int i){
  float checkd=attract(newloc);
  boolean state=(checkd>25)&& inbound(newloc);
  if ((locns.indexOf(newloc)==-1 || locns.indexOf(newloc)==i) && state){
  locns.set(i,newloc);
  walkers[i]=newloc;}
  else{status[i]=false;}
}
