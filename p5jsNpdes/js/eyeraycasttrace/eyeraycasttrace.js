//

//----------
let slider;
let bounded=false;
let button;
let walls=[];
let size=600;
let scenesize=600;
let particle;
let xoff=0;
let yoff=100000;
let wallCount=5;
let wcr;
let buttonBound;
//-------------
const sceneW=scenesize;
const sceneH=size;


//========================
function setup() {
  wcr=int(random(3,12));
  button=createButton("NEW WALLS!");
  buttonBound=createButton("MAKE BOUNDARY");
  buttonBound.mousePressed(makeBound);
  button.mousePressed(function() { makeWalls(wcr);});
  console.log("made");
  slider=createSlider(0,360,60);
  slider.input(changeFOV);
  createCanvas(size+scenesize,size);
  makeWalls(wallCount);
  particle=new Particle();
rectMode(CENTER);
frameRate(5000);
}
//===========================
function draw() {
    wcr=int(random(3,12));
//  if(mouseIsPressed){
//  particle.update(mouseX,mouseY);
//}


   if (keyIsDown(LEFT_ARROW)){
     particle.rot(-0.01);
   }
  else if (keyIsDown(RIGHT_ARROW)){
     particle.rot(0.01);

   }
  if (keyIsDown(DOWN_ARROW)){
     particle.move(-1);
   }
  else if (keyIsDown(UP_ARROW)){
     particle.move(1);

   }
  //-------------
  background(0);
  //------------
// particle.update(noise(xoff)*size,noise(yoff)*size);
  xoff+=0.01;
  yoff+=0.01;
  for (let wall of walls){
  wall.show();
  }
  particle.show();
 const scene=particle.look(walls);
  //------------------
  push();
  translate(sceneW,0);

  const w=sceneW/scene.length;
  const wsq=sceneW*sceneW;
  for (let i=0; i<scene.length;i++){
    noStroke();
    const sq=scene[i]*scene[i];

    const b=map(sq,0,wsq,255,0);
    const h = map(scene[i],0,sceneW/2,sceneH,0);
  fill(b);
  rect(i*w+w/2,0.67*sceneH,w,h);
  }
  pop();


 //--------------

}
//===========================

function changeFOV(){
 const fov=slider.value();
  particle.updFOV(fov);
}

function makeWalls(wc){
  wallCount=wc;
  walls=[];
    for(let i=0;i<wc;i++){
      walls[i]= new Boundary(random(size),random(size),random(size),random(size));
  }
  bounded=false;
}

//================================

function makeBound(){
  if (bounded==false){
  walls[wallCount]= new Boundary(0,0,0,size);
  walls[wallCount+1]= new Boundary(0,0,size,0);
  walls[wallCount+2]=  new Boundary(size,size,size,0);
  walls[wallCount+3]= new Boundary(size,size,0,size);
  bounded=true;
  }
  else{
    walls.splice(wallCount-1,4);
    bounded=false;
  }
}
