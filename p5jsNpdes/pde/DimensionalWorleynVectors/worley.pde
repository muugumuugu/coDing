 
public class WorleyNoise {

  //
  Vectorr[] points;// number of randomly distributed feature points.
  int lvl; // whichth closest point to take distance from.
  int detail;//num of points
  
  WorleyNoise(Vectorr bounds, int detail_, int lvl_ ) {
    Vectorr oo= new Vectorr(bounds.dim);
    this.lvl=lvl_;
    points= new Vectorr[detail_];
    this.detail=detail_;
    for (int i=0; i<detail_ ; i++){
      points[i]=new Vectorr(bounds,oo);
    }
  }

  float[] eval(Vectorr p){
     float[] distances= new float[this.detail];
     for (int i=0; i<detail; i++){
       distances[i]=points[i].distn(p);
     }
    float[] sorted=sort(distances);
    float noise=sorted[this.lvl-1];
    float maxx=sorted[this.detail-1];
    float[] pack={noise,maxx};
  return pack  ;
  }
  void show()
  {
    stroke(color(#FFFFFF));
    strokeWeight(8);
    for (int i=0; i<this.detail ; i++){
     this.points[i].show();
    }
  }
  
  }
