
let frames=120;
let particles = [];
let percent;

function setup(){
  ctx=createCanvas(windowWidth,windowHeight);
  frameRate(10);
  colorMode(HSB,360,100,100,500);
    for ( let i =0 ; i<100; i++){
      particles[i]=new Particle();
    }
    background(0);

}


function draw(){

  let t=map(frameCount%(frames+1),0,frames,0,1);
  percent=t;
  renderr();
  if (frameCount<frames){
    console.log(frameCount)
    save(nf(frameCount,3,0)+".gif");
    console.log("saved");

  }
  else if (frameCount==frames){
    console.log("SAVED")
  }

}

function renderr(){
  background(0,400);
  let angle=percent*TWO_PI;

  for (let p of particles){
    p.render(angle);
  }


}
