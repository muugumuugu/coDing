class Cubie{
  PVector pos;
  float len;
  Config config;
  
  
  Cubie(float x, float y, float z ,float len_){
    pos= new PVector (x,y,z);
    len=len_;
    config= new Config();
  }
  
  void highlight(){
    config=new Config(new int[] {6,6,6,6,6,6});
  }
  
  void show(){
   fill(255);
   stroke(0);
   strokeWeight(8);
   pushMatrix();
   translate(pos.x,pos.y,pos.z);
   beginShape(QUAD);
     float r=len/2;
     //z
     fill(colors[config.get(F)]);
      vertex(-r,-r,r);
      vertex(r,-r,r);
      vertex(r,r,r);
      vertex(-r,r,r);
      fill(colors[config.get(B)]);
      vertex(-r,-r,-r);
      vertex(r,-r,-r);
      vertex(r,r,-r);
      vertex(-r,r,-r);
     //x
      fill(colors[config.get(R)]);
      vertex(r,-r,-r);
      vertex(r,r,-r);
      vertex(r,r,r);
      vertex(r,-r,r);
      fill(colors[config.get(L)]);
      vertex(-r,-r,-r);
      vertex(-r,r,-r);
      vertex(-r,r,r);
      vertex(-r,-r,r);
     //y
      fill(colors[config.get(U)]);
      vertex(r,r,r);
      vertex(r,r,-r);
      vertex(-r,r,-r);
      vertex(-r,r,r);
      
      fill(colors[config.get(D)]);
      vertex(r,-r,r);
      vertex(r,-r,-r);
      vertex(-r,-r,-r);
      vertex(-r,-r,r);
   endShape(QUAD);
   //box(len);
   popMatrix(); 
  }
}
