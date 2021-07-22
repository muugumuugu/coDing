class Config{
  int[] sides;
  Config(){
    sides= new int[] {0,1,2,3,4,5,6};
  }
  
  int get(int side){
    return sides[side];
  }
  Config(int[] sides_){
    sides=sides_;
  }
  Config copy(){
    int[] temp = new int[sides.length];
    arrayCopy(sides,temp);
    return new Config(temp);
  }
  
  void rotateZ(boolean clockwise){
    int looper;
    if (clockwise){ looper=1;}
    else {looper=3;}
   for (int i=0;i<looper ; i++){
    int tempU = sides[U];
    sides[U]=sides[R];
    sides[R]=sides[D];
    sides[D]=sides[L];
    sides[L]=tempU;
    }
  }
  
  void rotateY(boolean clockwise){
    int looper;
    if (clockwise){ looper=1;}
    else {looper=3;}
   for (int i=0;i<looper ; i++){
    int tempF = sides[F];
    sides[F]=sides[R];
    sides[R]=sides[B];
    sides[B]=sides[L];
    sides[L]=tempF;
    }
  }
  void rotateX(boolean clockwise){
    int looper;
    if (clockwise){ looper=1;}
    else {looper=3;}
   for (int i=0;i<looper ; i++){
    int tempU = sides[U];
    sides[U]=sides[F];
    sides[F]=sides[D];
    sides[D]=sides[B];
    sides[B]=tempU;
    }
  }
}
