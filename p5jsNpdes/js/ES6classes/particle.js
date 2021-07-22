class Particle extends p5.Vector{
    constructor(x,y){
        super(x,y);
        this.vel=p5.Vector.random2D();
    }
    update(){

     this.add(this.vel);
     this.vel=p5.Vector.random2D();
    }
    show(){
        stroke(0);
        strokeWeight(24);
        point(this.x,this.y);
    }
}

class Confetti extends Particle{
    constructor(x,y){
        super(x,y);
        this.bright=random(360);
        this.r=10;
    }
    show(){
        noStroke();
        fill(this.bright,50);
        square(this.x,this.y,this.r);
    }

    update(){
        super.update();
        this.r+=random(-2,2);
    }
}