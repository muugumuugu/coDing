

class Vectorr{
  //--------------------------------------------
  int dim;
  FloatList coors;
  //------------------------------------
  //Constructor variants
    // with coordinate list
    Vectorr(FloatList coors_) {
     this.dim=coors_.size();
     coors = new FloatList();
     this.coors=coors_; 
    }
     Vectorr(Vectorr v) {
     this.dim=v.dim;
     coors = new FloatList();
     this.coors=v.coors;
    }
    // randomize within limits
     Vectorr(Vectorr boundz , Vectorr origin) {
       this.dim=boundz.dim;
       coors = new FloatList();
       for (int i=0; i<dim; i++){
         this.coors.set(i,random(origin.coors.get(i),boundz.coors.get(i)));
       }
     }
     Vectorr(FloatList boundzP , FloatList originP) {
       this.dim=boundzP.size();
       coors = new FloatList();
       for (int i=0; i<dim; i++){
         this.coors.set(i,random(originP.get(i),boundzP.get(i)));
       }
     }
     //nill origin vector
      Vectorr(int dim_) {
       this.dim=dim_;
       coors = new FloatList();
       for (int i=0; i<dim; i++){
         this.coors.set(i,0);
       }
      }
     //unitish vector
      Vectorr(int dim_ , float mag) {
         this.dim=dim_;
         coors = new FloatList();
         for (int i=0; i<dim; i++){
           this.coors.set(i,mag);
         }
    }
  //--------------------------------------
  // adding or subtracting to the vect
  void upd(FloatList p){
    int g=p.size();
    for (int i=0; i<dim; i++){
      if (i== g){
      return;
      }
      coors.add(i,p.get(i));
    }
  }
    void upd(Vectorr v){
      int g=v.dim;
      for (int i=0; i<dim; i++){
        if (i== g){
        return;
        }
        coors.add(i,v.coors.get(i));
      }
  }
  //-------------------------------------------------
    //calculate distance between
    float distn(Vectorr v){
        int dimm=max(this.dim,v.dim);
        float sum=0;
        for (int i=0; i<dimm;i++){
          sum+=(this.coors.get(i)-v.coors.get(i))*(this.coors.get(i)-v.coors.get(i));
        }
        float distns=sqrt(sum);
        return distns;
      }
    float distn(FloatList p){
      int dimm=max(this.dim,p.size());
      float sum=0;
      for (int i=0; i<dimm;i++){
        sum+=(this.coors.get(i)-p.get(i))*(this.coors.get(i)-p.get(i));
      }
      float distns=sqrt(sum);
      return distns;
    }
  //----------------------------------------------------
    //print on 2d sheet by squishing all slices.
      void show(){
        stroke(#FFFFFF);
        strokeWeight(4);
        point(this.coors.get(0),this.coors.get(1));
        String msg="";
        for (int i=0; i<this.dim; i++){
          msg=msg+nf(this.coors.get(i),2,2) + ",";
        }
        text(msg, this.coors.get(0),this.coors.get(1));
      }
  //----------------------------------------------------
    //inner mult 
    void dotPrd(Vectorr v){
      int dimm=max(this.dim,v.dim);
      for (int i=0; i<dimm; i++){
        coors.mult(i,v.coors.get(i));
      }
    }
     void dotPrd(FloatList p){
      int dimm=max(this.dim,p.size());
      for (int i=0; i<dimm; i++){
        coors.mult(i,p.get(i));
      }
    }
   //---------------------------------------------
     // get dot prod
      float getDotPrd(Vectorr v){
        int dimm=max(this.dim,v.dim);
        FloatList prd=new FloatList();//maybe useful for some stuff
        float sum=0;
        for (int i=0; i<dimm; i++){
          prd.set(i,this.coors.get(i)*v.coors.get(i));
          sum+=prd.get(i);
        }
        return sum;
      }
      float getDotPrd(FloatList p){
        int dimm=max(this.dim,p.size());
        FloatList prd=new FloatList();//maybe make a new vector for analysing.
        float sum=0;
        for (int i=0; i<dimm; i++){
          prd.set(i,this.coors.get(i)*p.get(i));
          sum+=prd.get(i);
        }
        return sum;
      }
    //-------------------------------------------------------
  }
