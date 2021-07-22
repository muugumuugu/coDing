function Particle(){
    this.x=500;
    this.y=600;
}
Particle.prototype.update= function(){
    this.x+=random(-5,5);
    this.y+=random(-5,5);
};

Particle.prototype.show= function(){
    stroke(255);
    strokeWeight(8);
    point(this.x,this.y);
};

//------------------------
//construct as a child
function Confetti(){
    Particle.call(this);
    this.col=color(255,0,255);
}
//create a new instamce of the prototype and tie it out
Confetti.prototype=Object.create(Particle.prototype);

Confetti.prototype.show= function(){
    stroke(this.col);
    noFill();
    strokeWeight(8);
    square(this.x,this.y,50);
};