let breedteBody = 130;
let hoogteBody = 150;
let x = 0;
let y = 400;
let angle = 0;

let easing  = 0.08;
let easing2 = 0.01;

function setup() {
  createCanvas(720, 480);
  
  strokeWeight(2);
  
}

function draw() {
  
  background(0, 60, 90);
  
  let targetX = mouseX;
  let targetY = mouseY;
  
  x += (targetX - x) * easing;
  y = 400;
  
if (mouseIsPressed) {
  breedteBody2 = 180;
  hoogteBody2 = 110;
  let targetBreedte = breedteBody2;
  let targetHoogte = hoogteBody2;
  breedteBody += (targetBreedte - breedteBody) * easing;
  breedteBody -= (targetHoogte - hoogteBody) * easing;
  
}
  else {
    breedteBody = 130;
    hoogteBody = 150;
  }
  

  
  //Halo
  noFill();
  stroke(57, 157, 189, 220)
  ellipse(x,y-20, breedteBody+10, 50);
  
  noFill();
  stroke(57, 157, 189, 220)
  ellipse(x,y-5, breedteBody+10 , 50);
  

  
  
  //Body
  noStroke();
  fill(255);
  ellipse(x,y-90, breedteBody, hoogteBody);
  
  noStroke();
  fill(200)
  ellipse(x,y-85, breedteBody-20, hoogteBody-30);

  //Head
  noStroke();
  fill(255);
  ellipse(x,y-200, breedteBody, hoogteBody-50);
  
  noStroke();
  fill(15);
  ellipse(x,y-200, breedteBody * 0.77, hoogteBody - 82);
  
  push();
  translate (x-20, y-210);
  //rotate(radians(15));
  noStroke();
  fill(57, 157, 189, 220);
  
  if (mouseIsPressed){
    rotate (radians(15));
    ellipse(0,0,20, 9)
  }
  else{
  ellipse(0,0, 18, 14);
  }
  
  pop();
  
  push();
  translate(x+20, y-210);
  //rotate(radians(-15));
  noStroke();
  fill(57, 157, 189, 220);
  if (mouseIsPressed) {
    rotate (radians(-15));
    ellipse(0,0,20, 9)
  }
  else{
  ellipse(0, 0, 18, 14);
  }
  pop();
  
  
  stroke(255);
  strokeWeight(7);
  line(x+50, y-220, x+60, y-245);
  
  
}
