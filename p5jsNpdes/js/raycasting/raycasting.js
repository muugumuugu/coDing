//classes >> boundary : line  and ray: posm amd direction
// function where ray hit boundary? = point// use for collision prevention optimal direcn using sound hit wall sensors as headlights
//----------
let walls=[];
let size=600;
let particle;
let xoff=0;
let yoff=1000;
let wallCount=5


//========================
function setup() {
  createCanvas(size,size);
  for(let i=0;i<wallCount;i++){
  walls[i]= new Boundary(random(size),random(size),random(size),random(size));
  }
  particle=new Particle();

}
//===========================
function draw() {
  background(0);
  //------------
  particle.update(noise(xoff)*size,noise(yoff)*size);
  xoff+=0.01;
  yoff+=0.01;
  for (let wall of walls){
  wall.show();
  }
  particle.show();
  particle.look(walls);
  
 //--------------

}
//===========================
