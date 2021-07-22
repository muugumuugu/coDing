

class vectorr{
  int dim=4;
  FloatList coors = new FloatList[dim];
  void vector(FloatList coors_) {
   this.coors=coors_; 
  }
  
  void add(FloatList p){
    for (i=0; i<coors.size(); i++){
      coors[i]+=p[i];
    }
  }
  
  float dist(vectorr v){
    float sum= (this.x-v.x)
    float distns=sqrt(sum);
      return distns
  }
}
