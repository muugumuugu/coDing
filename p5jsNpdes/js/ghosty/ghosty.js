let renderer;
let percent;
const CYCLE = 20;//10 for gif
let sh;




function setup() {
  renderer = createCanvas(625, 1250,WEBGL);
  sh = createShader(vert,frag);
  this.shader(sh);
  sh.setUniform("u_resolution", [width,height]);
  sh.setUniform("u_lightDir", [0.8,1,-1]);
  pixelDensity(1);
  
}

function draw() {
  percent=frameCount/CYCLE;
  background(25,25,25);
  orbitControl();
  
  let s = width*0.2 + 5*sin(percent*PI);
  
  setCol(sh,'#DDEEFF');
  translate(0,cos(frameCount/CYCLE*PI)*s*0.5,0);
  rotateX(0.3);
  push();
  rotateY(-percent/2*PI);
  obake(s,s*(2.5+0.125*sin(frameCount/CYCLE*PI)),75,50);
  pop();
  setCol(sh,'#222222');
  rotateY(PI*1.25);//1.2
  push();
  //EYES
  translate(s,s*0.25,0);
  ball(s*0.125,10,10);
  pop();
  rotateY(PI*0.2);
  translate(s,s*0.25,0);
  ball(s*0.125,10,10);
  //GIFit
  /*
  if (frameCount<6*CYCLE+1){
    save(nf(frameCount,3,0)+".jpg");
  }
  */
  
}



function obake(sphereR,_h,dx,dy)
{
  let geometry = new p5.Geometry(dx,dy);
  
  for(let yi = 0; yi <= dy; yi ++)
  {
    let yRadian = map(yi,0,dy,-PI/2,PI/2);
    let y,radius,degree;
    if(yi < dy/2){
      degree = 0;
      y = sin(yRadian)*sphereR;
      radius = cos(yRadian)*sphereR;
    }else{
      degree = map(yi,dy/2,dy,0,1);
      y = degree*(_h-sphereR)*(1+0.1*(sin(percent*PI)*0.5+1));
      radius = sphereR +  pow(degree,3)*(sphereR*0.2)*(sin(yi/dy*3+percent*PI)*0.5+1);
    }
    for(let xi = 0; xi <= dx; xi++)
    {
      let r = xi* TWO_PI/dx*-1;
      let x = cos(r)*radius;
      let z = sin(r)*radius;
      let yOff = degree*(_h*0.09)*sin(percent/1.5*PI)*sin(r*5+percent*PI);
      geometry.vertices[xi + (dx+1)*yi] = createVector(x,y-yOff,z);
    }
  }
  geometry.computeFaces();
  geometry.computeNormals();
  geometry.averageNormals();  

  renderer.createBuffers('gId', geometry);
  renderer.drawBuffers('gId');
}


function ball(_radius,dx,dy)
{
  let geometry = new p5.Geometry(dx,dy);
  for(let yi = 0; yi <= dy; yi ++)
  {
    let yRadian = map(yi,0,dy,PI/2,-PI/2);
    let y = sin(yRadian)*_radius;
    let radius = cos(yRadian)*_radius;
    for(let xi = 0; xi <= dx; xi++){
      let r = xi* TWO_PI/dx;
      let x = cos(r)*radius;
      let z = sin(r)*radius;
      geometry.vertices[xi + (dx+1)*yi] = createVector(x,y,z);
    }
  }
  geometry.computeFaces();
  geometry.computeNormals();
  geometry.averageNormals();  
  renderer.createBuffers('ball', geometry);
  renderer.drawBuffers('ball');
}



function setCol(shader,colStr)
{
  let col = color(colStr);
  let colArray = col._array;
  colArray.pop();
  shader.setUniform("u_col",colArray);
}
