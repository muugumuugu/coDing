/*
  Andor Saga
  Jan 2020
*/

let capture;
let downscaleImage;
let myShader;
let intensity = 0;
let damping = 0.05;
let lmx = 0;
let SZ = 850;
let img;

function preload(){
  img = loadImage('map.png');
}

function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  
  capture = createCapture(VIDEO);
  capture.size(30 * 10, 15 * 10);
  capture.hide();
  
  noStroke();
  
  myShader = new p5.Shader(this._renderer, vert, frag);
  shader(myShader);
}

function update(){
  let d = (mouseX - lmx) * damping;
  lmx += d;
  intensity = map(lmx, 0, windowWidth, 0, 400);
}

function draw() {
  update();
  background(0);
  
  shader(myShader);
  
  myShader.setUniform('iResolution', [width, height]);
  myShader.setUniform('tex0', capture);
  myShader.setUniform('intensity', intensity);
  myShader.setUniform('map', img);
  
  rotateX(-2.2 );
  // rotateZ(frameCount/400);  
  rotateZ(PI);
  translate(-SZ/2, -SZ/1.333333 /2, 0);
  
  rect(0, 0, SZ, SZ / 1.33333, 150, 300);
}
