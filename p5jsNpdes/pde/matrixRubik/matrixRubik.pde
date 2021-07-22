import peasy.*;
PeasyCam cam;
int dim =3;
//------------------------------------
int revmove;
int ind=0;
int shuffle=0;
boolean auto=false;
//----------------------------
char[] moves= {'u','U','d','D','f','F','b','B','l','L','r','R'};
char[] done={};

//------------------------
boolean mode=false;
//---------------------
// layer 2 :uiliulufuifi
//--------------------------
Cubie[] cube=new Cubie[dim*dim*dim];
//--------------------------

//==========================================

void setup(){
  size(600,600,P3D);
  cam=new PeasyCam(this,600);
  //-----------------------------------------
  int index=0;
    for (int i=-1; i<2; i++){
     for (int j=-1; j<=1; j++){
       for (int k=-1; k<2; k++){
      PMatrix3D matrix=new PMatrix3D();
      matrix.translate(i,j,k);
      cube[index]=new Cubie(matrix,i,j,k);
      index++;
      }
    }
  }
  //-------------------
 frameRate(5);
 rectMode(CENTER);
}
//-------------------------------------------
void draw(){
  //skew
  rotateX(-0.5);
  rotateY(0.5);
  //repaint and scale
  background(51);
  scale(100);
  //scan 
  for (int index=0; index<dim*dim*dim; index++){
      cube[index].show();
    }
}

//============================================
