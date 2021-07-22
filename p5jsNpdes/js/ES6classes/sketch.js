//gloabal variables
let partiConff=[];
//POLYMORPHISM



//
function setup(){
    createCanvas(windowWidth,windowHeight);
    colorMode(HSB,360,100,100,100);
    background(0);
    for (let i=0;i<100;i++){
        if (random(1)<0.5){
            partiConff[i] =new Particle(random(width),random(height));
        }
        else{
            partiConff[i]=new Confetti(random(width),random(height));
        }

    }
}

function draw(){

    background(frameCount%361,100,100,10);
    for (let pc of partiConff){
        pc.show();
        pc.update();
    }

}