import peasy.*;
PeasyCam cam;
int dim =3;
int revmove;
int ind=0;
int shuffle=0;
boolean auto=false;
//----------------------------

char[] moves= {'u','U','d','D','f','F','b','B','l','L','r','R'};
char[] done={};


//------------------------
boolean mode=false;

// layer 2 :uiliulufuifi
//--------------------------
Cubie[][][] cube= new Cubie[dim][dim][dim];
//--------------------------
final int  U=0;
final int  D=1;
final int L=2;
final int  R=3;
final int F=4;
final int B=5;
//------------------------
color[] colors={ #FFFFFF,#FFFF00,#00FF00,#0000FF,#FF0000,#FC6A03 ,#000000};
//==========================================

void setup(){
  size(600,600,P3D);
  cam=new PeasyCam(this,600);
  for (int i=0; i<dim; i++){
    for (int j=0; j<dim; j++){
      for (int k=0; k<dim; k++){
      float len=width/dim;
      float offset=(dim-1)*len/2;
      float x=len*i , y= len*j ,z =len*k;
      cube[i][j][k]=new Cubie(x-offset,y-offset,z-offset,len);
      }
    }
  }
 frameRate(5);
// cube[0][0][2].highlight();
}
//-------------------------------------------
void draw(){
  rotateX(-0.5);
  rotateY(0.5);
  background(51);
  if (auto){
  if (shuffle<100){
    int r= int(random(moves.length));
    move(moves[r]);
    revmove=int(moves[r]) ^ 32;//flipcase
    done=append(done,char(revmove));
    println(done);
    shuffle++;
  }
  else if (shuffle==100){
    done=reverse(done);
    shuffle++;
  }
 else{
    if (ind<done.length){
    move(done[ind]);
    ind++;
  }
  }}
  else{
    shuffle=0;
    ind=0;}
  for (int i=0; i<dim; i++){
    for (int j=0; j<dim; j++){
      for (int k=0; k<dim; k++){
      cube[i][j][k].show();
      }
    }
  }

}

//============================================

void keyPressed(){
  move(key);
}
void move(char key){
    if (key=='m' || key =='M'){
    mode=!mode;}
        if (key=='a'|| key=='A'){
    auto=!auto;}
  if (mode){
  switch(key){
    case 'r'://front
    turnZ(2,true);
    break;
    case 'R':
    turnZ(2,false);
    break;
    case 'o'://back
    turnZ(0,false);
    break;
    case 'O':
    turnZ(0,true);
    break;
    case 'y'://up
    turnY(0,true);
    break;
    case 'Y':
    turnY(0,false);
    break;
    case 'w':
    turnY(2,false);
    break;
    case 'W':
    turnY(2,true);
    break;
    case 'b'://right
    turnX(2,false);
    break;
    case 'B':
    turnX(2,true);
    break;
    case 'g':
    turnX(0,true);
    break;
    case 'G':
    turnX(0,false);
    break;
  }
  }
  else{
  switch(key){
    case 'f'://front
    turnZ(2,true);
    break;
    case 'F':
    turnZ(2,false);
    break;
    case 'b'://back
    turnZ(0,false);
    break;
    case 'B':
    turnZ(0,true);
    break;
    case 'u'://up
    turnY(0,true);
    break;
    case 'U':
    turnY(0,false);
    break;
    case 'd':
    turnY(2,false);
    break;
    case 'D':
    turnY(2,true);
    break;
    case 'r'://right
    turnX(2,false);
    break;
    case 'R':
    turnX(2,true);
    break;
    case 'l':
    turnX(0,true);
    break;
    case 'L':
    turnX(0,false);
    break;
  }
  }
}
