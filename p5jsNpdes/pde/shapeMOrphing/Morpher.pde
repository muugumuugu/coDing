class Morpher{
  ArrayList<PVector> points;
  int ngon;
  float detail=36;
  float  vel=2;
  float r=200;
  float pp=detail;
  Morpher(int end){
    points=new ArrayList<PVector>();
    ngon=end;
    detail=(float) (end*32);
    pp=detail;
    float da=TWO_PI/detail;
    for (float a=0; a<TWO_PI; a+=da){
      PVector point =new PVector(cos(a),sin(a));
      point.mult(r);
      points.add(point);
    }
  }
  
  void morph(){
      pp=pp/vel;
      if (pp==ngon){vel=1/vel;}//-vel;}
      if (pp==detail){vel=1/vel;}//-vel;}
      float da=TWO_PI/pp;
      text(pp,0,0);
      points.clear();
      for (float a=0; a<TWO_PI; a+=da){
      PVector point =new PVector(cos(a),sin(a));
      point.mult(r);
      points.add(point);
      }
  }
  
  
  void show(){
    offscreen.stroke(255);
    offscreen.noFill();
    offscreen.beginShape();
    for (PVector v:points){
      offscreen.vertex(v.x,v.y);
    }
    offscreen.endShape(CLOSE);
  }
  
}
