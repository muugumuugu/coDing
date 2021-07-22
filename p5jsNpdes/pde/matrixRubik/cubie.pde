class Cubie{
  PMatrix3D pos;
  //------------
  boolean colorit;
  int x=0,y=0,z=0;
  color clr=color(255,255,255);
  //--------------
  Face[] faces= new Face[6];
  
  //--------------------------------------------------------
  //constructor
  Cubie(PMatrix3D m,int x_,int y_,int z_){// ,float len_){
      pos= m;
      x=x_;
      y=y_;
      z=z_;
      makeFaces();
      clrFaces();
      colorit=false;
  }
  //---------------------------------------------------
  void update(int x, int y, int z){
    pos.reset();
    pos.translate(x,y,z);
    //------------------
    this.x=x;
    this.y=y;
    this.z=z;
  }
  //------------------------------------------------
  
  //---Debugger
  void highlight(color clr){
     colorit=!colorit;
     this.clr=clr;
  }
  
  //----------------------------------------------------
  //Displayyy
  void show(){
     fill(255);
     if (colorit){fill(this.clr);}
     stroke(0);
     strokeWeight(0.01);
     //------------------
     pushMatrix();
     applyMatrix(pos);
     box(1);
       for (Face f: faces){
         f.show();
       }
     popMatrix(); 
     //-----------------
  }
  //---------------------------------------------------
  //................................................
  void makeFaces(){
    for (int i=0; i< moveInd.length() ; i++){
      int[] loc= getLoc(moveInd.charAt(i));
      int[] point= new int[3];
      //-------------------------
      int face=loc[0],side=loc[1];
      //--------------------------
      point[0]=0; 
      point[1]=0;
      point[2]=0;
      point[face]=side;
    this.faces[i]=new Face(new PVector(point[0],point[1],point[2]),color(0));
    }
  }
  //--------------------------------------
  void clrFaces(){
    for (int i =0; i<this.faces.length ; i++){
      this.faces[i].clr=colors[i];
    }
  }
  //.................................................
  //--------------------------------------------------
}
