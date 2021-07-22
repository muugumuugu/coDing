class NoiseWrapper{
  float spread;
  float min;
  float max;
  float cx;
  float cy;
  
  NoiseWrapper(float spread,float minn, float maxx){
    this.spread=spread;
    this.min=minn;
    this.max=maxx;    
    this.cx=random(1000);
    this.cy=random(1000);
  }


 float val(float ang){
    float xoff=map(cos(ang),-1,1,cx,cx+spread);
    float yoff=map(sin(ang),-1,1,cy,cy+spread);
    float rr =map(noise(xoff,yoff),0,1,min,max);
    return rr;
 }
}
