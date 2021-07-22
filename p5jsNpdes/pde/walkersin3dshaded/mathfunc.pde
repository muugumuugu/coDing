float[] getrandom(int sz,float mult){
    float[] arr=new float[sz];
    float seed=123456789;
    float mod=pow(2,31)-1;
    float x=(seed*mult+1)%mod;
    arr[0]=x/mod;
    for (int i=1; i<sz; i++){
      x=(x*mult+1)%mod;
      arr[i]=x/mod;
    }
  return  arr;
}
//--------------------------------------------
float distnce(PVector v1,PVector v2){
  float dx=v1.x-v2.x;
  float dy=v1.y-v2.y;
  float dz=v1.z-v2.z;
  return sqrt(dx*dx+dy*dy+dz*dz);
}

//-------------------------------------------------

PVector drunk(){
  int xinc,yinc,zinc;
  xinc=floor(random(3))-1;
  yinc=floor(random(3))-1;
  zinc=floor(random(3))-1;
  return new PVector(xinc,yinc,zinc);
}
//-----------------------
