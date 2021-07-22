class Glowby{
  PVector pos;
  float radius;
  float bright;
  NoiseWrapper noiseX;
  NoiseWrapper noiseY;
  NoiseWrapper noiseC;
  NoiseWrapper noiseR;

  Glowby(){
      noiseX=new NoiseWrapper(0.2,-width,width*2);
      noiseY=new NoiseWrapper(0.2,-height,height*2);
      noiseC=new NoiseWrapper(20,0,1);
      noiseR=new NoiseWrapper(3,0,100);
  }
  

  
  void update(float ang) {
    float x=noiseX.val(ang);
    float y=noiseY.val(ang);
    bright= noiseC.val(ang);
    radius=noiseR.val(ang);
    noStroke();
    //fill(c%361,100,100,100);
    //circle(x,y,r);
    pos = new PVector(x,y);
  }
}
