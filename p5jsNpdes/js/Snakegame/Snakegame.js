var food;
var s;
var scl=20;


function setup(){
  createCanvas(600,600);
  s=new Snake();
  frameRate(10);
  pickLocation();
  
}

function pickLocation() {
  var rows=floor(width/scl);
  var cols=floor(height/scl);
  food=createVector(floor(random(rows)),floor(random(cols)));
  
}
function draw(){
  background(51);
  s.update();
  s.show();
  if (s.eat(food)){
    pickLocation();
  }
  fill(255,0,100);
  rect(food.x,food.y,scl,scl);
  
}

function keyPressed(){
  if (keyCode == UP_ARROW) {
    s.dir(0,-1);
  } else if (keyCode == DOWN_ARROW){
    s.dir=(0,1);
  } else   if (keyCode == RIGHT_ARROW) {
    s.dir(1,0);
  } else if (keyCode == LEFT_ARROW){
    s.dir=(-1,0);
  }
 
  }
