/*
  Grid Template
  Andor Saga
  March 2020
*/

let rows = 8;
let cols = 8;
let sz = 180;
let spacing = 0;

function setup() {
  createCanvas(1080, 1080);
  rectMode(CENTER);
  gen();
}

function gen() {
  background(0);
  
  stroke(255);
  noFill();
  
  let gridWidth = cols * sz + (cols*spacing) - sz;
  let gridHeight = rows * sz + (rows*spacing) - sz;
  
  push();
  translate(width/2 - gridWidth/2, height/2 - gridHeight/2);
  
  for(let y = 0; y < rows; y++){
    for(let x = 0; x < cols; x++){
      push();
      translate(x * sz + (x*spacing), y * sz + (y * spacing));
      
      // rect(0, 0, sz, sz);
      
      let r = random();
      if(r > 0.5){
        rotate(PI/2);
      }
      
      stroke(240);
      strokeWeight(2);
      let mid = sz/2;
      arc(-mid, -mid, sz + sz/4, sz + sz/4,  0, PI/2);
      arc(-mid, -mid, mid + sz/4, mid + sz/4, 0,  PI/2);
      
      arc( mid,  mid, mid + sz/4, mid + sz/4, PI, PI+PI/2);
      arc(mid,   mid, sz + sz/4, sz + sz/4, PI, PI+PI/2);

      stroke  (102,68,0);
      strokeWeight(5);
      // tracks
      let cnt = 5;      
      for(let j = 0; j < 2; j++){
        push();
        let t = map(j, 0, 1, -sz/2, sz/2);
        translate(t, t);
        for(let i = 0; i < cnt; i++){
          push();
          rotate((PI *j) + PI/2 * (i/(cnt-1)));
          translate(sz/2, 0);
          line(-sz/6, 0, sz/6, 0);
          stroke(255);
          
          strokeWeight(3);
          point(-28,0);
          point( 28,0);
          pop();
        }
        pop();
      }      
      
      pop();
    }
  }
  
  pop();
}

function keyPressed(){
  save();
}

function mousePressed(){
  gen();
}
