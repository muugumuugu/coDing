class Boundary{
  constructor(x1,y1,x2,y2){
  this.a=createVector(x1,y1);
  this.b=createVector(x2,y2);
  }
  //-----------
  show(){
    stroke(255);
    line(this.a.x,this.a.y,this.b.x,this.b.y);
  }
  //---------------
}

//========================================

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
  //----------------
  setAngle(angle){
    this.dir=p5.Vector.fromAngle(angle);
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

//===================================

class Particle{
  constructor(){
    this.pos=createVector(size/2,size/2);
    this.rays=[];
    this.heading=0;
    this.rng=45;
    for(let a=-this.rng/2; a<this.rng/2 ;a+=1){
      this.rays.push(new Ray(this.pos,radians(a)));
    }
  }
  //----------------------
  move(amount){
    let velocity = p5.Vector.fromAngle(this.heading);
    velocity.setMag(amount);
    this.pos.add(velocity);
    if (this.pos.x<0 || this.pos.x>size || this.pos.y<0 || this.pos.y>size){
      this.move(-amount);
    }
  }
  //------------------
  updFOV(fov){
    this.rng=fov;
    this.rays=[];
    for(let a=-this.rng/2; a<this.rng/2 ;a=a+0.5){
      this.rays.push(new Ray(this.pos,radians(a)+this.heading));
    }
  }

  //--------------
  rot(angle){
    this.heading+=angle;
    for(let i=0;i <this.rays.length;i++){
      this.rays[i].setAngle(radians(i)+this.heading);
    }
  }
  //---------------
  show(){
    fill(255,75);
    circle(this.pos.x,this.pos.y,8);
    for (let ray of this.rays){
      ray.show();
    }
  }
  //-------------
  look(walls){ 
    const scene=[];
    for (let i=0; i<this.rays.length;i++){
      let closest=null;
      const ray=this.rays[i];
      let record=999999;
      for(let wall of walls){
        const pt=ray.cast(wall);
        if (pt){
          let d=p5.Vector.dist(this.pos,pt);
          //adjust to remove fisheye effect
          const angleOfRayToCamera = ray.dir.heading()-this.heading;
          d*=cos(angleOfRayToCamera);
          if (d< record){
          record=d;
          closest=pt.copy();}

        }
      }
        if (closest){
          stroke(255,75);
          line(this.pos.x,this.pos.y,closest.x,closest.y);
        
        }
          scene[i]=record;

    }
    return scene;
  }
  //----------------
  update(x,y){
    if (0<x&& x<size && 0<y && y<size){
    this.pos.set(x,y);
    }   
  }
}
//================================
