class Ray{
  constructor(pos,angle){
    this.pos=pos;
    this.dir=p5.Vector.fromAngle(angle);//right
  }
  //-----------------------
  show(){
  stroke(255,50);
  push();
  translate(this.pos.x,this.pos.y);
  line(0,0,this.dir.x*10,this.dir.y*10);
  pop();
  }
  //--------------------------
  lookAt(x,y){
    this.dir.x=x-this.pos.x;
    this.dir.y=y-this.pos.y;
    this.dir.normalize();
  }
  //-------------------------
  cast(wall){
    const x1=wall.a.x;
    const y1=wall.a.y;  
    const x2=wall.b.x;
    const y2=wall.b.y;
    //..................
    const x3=this.pos.x;
    const y3=this.pos.y;  
    const x4=this.pos.x +this.dir.x;
    const y4=this.pos.y+this.dir.y;
    //...................
    const den=(x1-x2)*(y3-y4)-(y1-y2)*(x3-x4);
    //..................
    if (den==0) {return;}
    //..................
    const num1=(x1-x3)*(y3-y4)-(y1-y3)*(x3-x4);
    const num2=(x1-x2)*(y1-y3)-(y1-y2)*(x1-x3);
    const t=num1/den;
    const u=-num2/den;
    //.................
    if (u<0 || 0>t || 1<t){return;}
    //................
    const pt= createVector(x1+t*(x2-x1),y1+t*(y2-y1));
    return pt;
  }
  //---------------
}
