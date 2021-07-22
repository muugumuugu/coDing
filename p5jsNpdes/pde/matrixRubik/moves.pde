void turn(int face, int side , int dir){
  // face =axis, side =+-
  int[] f = new int[3];
  for (int ct =0; ct<cube.length; ct++){
    Cubie qb= cube[ct];
    f[0]=qb.x;
    f[1]=qb.y;
    f[2]=qb.z;
    //-----------------
    if (f[face]==side){
      PMatrix2D matrix= new PMatrix2D();
      matrix.rotate(HALF_PI*dir);
      //-----------------
      matrix.translate(f[(face+1)%3],f[(face+2)%3]);
      //-----------------
      f[(face+1)%3]=round(matrix.m02);
      f[(face+2)%3]=round(matrix.m12);
      //-------------------
      qb.update(f[0],f[1],f[2]);
    }
  }
}

//====================================================

int[] getLoc(char charac){
  int face;
  int side;
  int dir;
  int[] loc = new int[3];

  //--------------------------
  if (Character.isUpperCase(charac)){
    face=moveCap.indexOf(charac,0);
    dir=1;
  }
  else{
  face= moveInd.indexOf(charac,0);
  dir=-1;
  }
  //------------------------
  if (face%2==0){
      side=1;
  }
  else{
    side=-1;
  }
  //-----------------------
  loc[0]=int(face/2);
  loc[1]=side;
  loc[2]=dir;
  return loc;
}
