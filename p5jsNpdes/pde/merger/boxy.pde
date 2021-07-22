class Boxy{
  PVector pos;
  float r;
  
  Boxy(float x,float y, float z, float rr){
    pos =new PVector(x,y,z);
    r=rr;
  }
  void show(){
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    fill(255,128);
    box(r);
    popMatrix();
  }
  ArrayList<Boxy> generate(){
  ArrayList<Boxy> boxes=new ArrayList<Boxy>();
  for (int y=-1; y<2;y++){
      for (int z=-1; z<2;z++){
          for (int x=-1;x<2;x++){
            int sum=abs(x)+abs(y)+abs(z);
            float rr =r/3;
            PVector v=new PVector(x*rr,y*rr,z*rr);
            v.add(pos);
            if (sum>1){
            Boxy box=new Boxy(v.x,v.y,v.z,rr);
            boxes.add(box); }
        }
      }
    }
    return boxes;
  }
}
