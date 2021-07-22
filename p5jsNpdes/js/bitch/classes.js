class NoiseWrapper{
    
    constructor(spreadd, minn, maxx){
      this.spread=spreadd;
      this.min=minn;
      this.max=maxx;    
      this.cx=random(1000);
      this.cy=random(1000);
      this.r=0;
    }
  
  
   val(ang){
      let xoff=map(cos(ang),-1,1,this.cx,this.cx+this.spread);
      let yoff=map(sin(ang),-1,1,this.cy,this.cy+this.spread);
      let rr =map(noise(xoff,yoff),0,1,this.min,this.max);
      this.r=rr;
      return this.r;
   }
  }


class Particle{
  
    constructor(){
        this.noiseX=new NoiseWrapper(0.7,-1000,2000);
        this.noiseY=new NoiseWrapper(0.7,-1000,2000);
        this.noiseC=new NoiseWrapper(10,0,540);
        this.noiseR=new NoiseWrapper(3,0,75);
    }
    
    render(ang){
      
      this.noiseX.val(ang);
      let x=this.noiseX.r;
      this.noiseY.val(ang);
      let y=this.noiseY.r;
      this.noiseC.val(ang);
      let c= this.noiseC.r;
      this.noiseR.val(ang);
      let r=this.noiseR.r;
      noStroke();
      fill(c%361,100,100,100);
      circle(x,y,r);
    }
  }