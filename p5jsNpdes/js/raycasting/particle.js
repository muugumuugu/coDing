class Particle{
  constructor(){
    this.pos=createVector(width/2,height/2);
    this.rays=[];
    for(let a=0; a<360 ;a+=2){
      this.rays.push(new Ray(this.pos,radians(a)));
    }
  }
  //------------------
  show(){
    fill(255,75);
    circle(this.pos.x,this.pos.y,8);
    for (let ray of this.rays){
      ray.show();
    }
  }
  //-------------
  look(walls){ 
    for (let ray of this.rays){
      let closest=null;
      let record=99999;
      for(let wall of walls){
        const pt=ray.cast(wall);
        if (pt){
          const d=p5.Vector.dist(this.pos,pt);
          if (d< record){
          record=d;
          closest=pt.copy();}

        }
      }
        if (closest){
          stroke(255,75);
          line(this.pos.x,this.pos.y,closest.x,closest.y);
        }
    }
  }
  //----------------
  update(x,y){
    this.pos.set(x,y);
  }
}
