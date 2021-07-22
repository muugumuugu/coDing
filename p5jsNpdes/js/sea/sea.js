let renderer;
let gid = 'custom';
let gid2 = 'custom2';
let geometry;
let wallGeoX;
let wallGeoZ;
const GRID_NUM = 52;

let sh;


function setup() {
  renderer = createCanvas(windowWidth, windowHeight,WEBGL);
  geometry = new p5.Geometry(GRID_NUM-1,GRID_NUM-1);
  wallGeoX = new p5.Geometry(GRID_NUM-1,1);
  wallGeoZ = new p5.Geometry(GRID_NUM-1,1);
  
  //shader
  sh = createShader(vert,frag);
  this.shader(sh);
  sh.setUniform("u_resolution", [width,height]);
  sh.setUniform("u_lightDir", [1,0.8,-0.5]);
  noStroke();
  pixelDensity(2);
  
}


function draw() {
  background('#EEEEEEAA');

  let verts = [];
  let wallVertsX = [];
  let wallVertsZ = [];
  let size = width/2;
  let span = size/GRID_NUM;
  let noiseScale = 0.005;
  let maxHeight = 300;
  let speed = -5;
  
  let zi = 0;
  for(let z = -size/2; z < size/2-span/2; z += span)
  {
    let xi = 0;
    for(let x = -size/2; x < size/2-span/2; x += span)
    {
      let y = noise(x*noiseScale,(z+frameCount*speed)*noiseScale)*maxHeight;
      let vert = createVector(x,y,z);
      verts.push(vert);
      if(zi == GRID_NUM-1)wallVertsZ.push(vert.copy());
      if(xi == 0)wallVertsX.push(vert.copy());
      xi++;
    }
    zi++;
  }
  
  //き、汚すぎる。。
  let wallVertGroundX = [];
  for(let i = 0; i < wallVertsX.length; i++)wallVertGroundX.push(createVector(wallVertsX[i].x,maxHeight,wallVertsX[i].z));
  wallVertsX = wallVertsX.concat(wallVertGroundX);
  let wallVertGroundZ = [];
  for(let i = 0; i < wallVertsZ.length; i++)wallVertGroundZ.push(createVector(wallVertsZ[i].x,maxHeight,wallVertsZ[i].z));
  wallVertsZ = wallVertsZ.concat(wallVertGroundZ);
  
  geometry.vertices = verts;
  geometry.computeFaces();
  geometry.computeNormals();
  wallGeoZ.vertices = wallVertsZ;
  wallGeoZ.computeFaces();
  wallGeoZ.computeNormals();
  wallGeoX.vertices = wallVertsX;
  wallGeoX.computeFaces();
  wallGeoX.computeNormals();
  
  
  push();
  translate(0,-maxHeight/2,-size/2);
  rotateX(-PI/10);
  rotateY(PI/4);
  setCol(sh,"u_col",'#38BD70');
  renderer.createBuffers(gid, geometry);
  renderer.drawBuffers(gid);
  setCol(sh,"u_col",'#704251');
  renderer.createBuffers(gid, wallGeoZ);
  renderer.drawBuffers(gid);
  renderer.createBuffers(gid, wallGeoX);
  renderer.drawBuffers(gid);
  pop();
  
  
}



function setCol(shader,uniformName,colStr)
{
  let col = color(colStr);
  let colArray = col._array;
  colArray.pop();
  shader.setUniform(uniformName,colArray);
}
