var breath = .1;
var headS = 70;
var eyeS = 10;
var earS = 0;
var cat  = 1; 
function setup() {
  createCanvas(800,500);
  background(100);

} 

function draw() {
  //gameCanvis
  fill(27,215,255);
  rect(0,0,800,500);
  //arrows
  frameRate(50);
if(keyIsPressed && keyCode === RIGHT_ARROW && cat !=3){
  cat++;
  frameRate(5);
}
  if(keyIsPressed && keyCode === LEFT_ARROW && cat !=1){
  cat--;
  frameRate(5);
}
  //cat living cute
  stroke(142,99,18);
  strokeWeight(6);
  fill(255,90,179);
    if(cat == 1){
    textSize(20);
    text("happy cat",360,20);
  triangle(374,170,410,170,380+earS*2,117-earS*3);
  triangle(404,170,430,170,420-earS*2,117-earS*3);
  strokeWeight(10);
  fill(178,124,23);
    rect(380,240-headS-10,headS+50,headS,headS/3);
  ellipse(400,250-headS-10,headS,headS);
  fill(0);
  stroke(0);
  strokeWeight(0);
  ellipse(385,240-headS-10,headS/2-10,headS/2-10);
  ellipse(415,240-headS-10,headS/2-10,headS/2-10);
  fill(244);
  ellipse(380,167-eyeS+5,eyeS-20,eyeS-20);
  ellipse(388,162-eyeS+5,eyeS-10,eyeS-10);
  
  ellipse(420,167-eyeS+5,eyeS-20,eyeS-20);
    ellipse(415,157-eyeS+5,eyeS-12,eyeS-10);
  ellipse(408,162-eyeS+5,eyeS-12,eyeS-12);
  noFill();
  stroke(150,100,18);
  strokeWeight(10+headS/7);
  curve(500, 175, 428+headS, 118+headS, 450-earS*.7, 240+earS, 180, 233);
    strokeWeight(2);
  
  }
  if(cat == 2){ //sleeping cat
  stroke(142,99,18);
      fill(178,124,23);
  strokeWeight(10);
      textSize(20);
    text("Sleeping cat",360,20);
    rect(380,240-headS-10,headS+50,headS-10,headS/3);
    
  strokeWeight(7);
    fill(255,90,179);
  triangle(374,210,410,210,360+earS,167-earS);
  triangle(404,210,430,210,440-earS,167-earS);
      fill(178,124,23);
      strokeWeight(10);
  ellipse(400,280-headS-10,headS,headS);
  fill(0);
  stroke(0);
  strokeWeight(0);
  ellipse(385,280-headS-10,headS/2-10,headS/2-30);
  ellipse(415,280-headS-10,headS/2-10,headS/2-30);
  fill(244);
  
  noFill();
  stroke(150,100,18);
  strokeWeight(10+headS/7);
  curve(500, 175, 428+headS, 128+headS, 430-earS*.7, 240+earS, 180, 233);
    strokeWeight(2);
      strokeWeight(6);

  
  }
  if(cat == 3){ //dead cat
    noStroke();
        fill(0);
      textSize(20);
    text("dead cat",360,20);
    fill(200);
    ellipse(414,118+earS*3,8,6);
    ellipse(406,118+earS*3,8,6);
      fill(0);
    ellipse(410,117+earS*3,10,8);
    
    fill(200);
    ellipse(438,130.5-earS*1.7,3,3);
    ellipse(433,129.5-earS*1.7,3,3);
fill(0);
    ellipse(435,130-earS*1.7,5,5);
      
    fill(200);
    ellipse(473+earS*4,120+earS,3,3);
    ellipse(467+earS*4,120+earS,3,3);
fill(0);
    ellipse(470+earS*4,120+earS,5,5);
      
    
  stroke(142,99,18);
      fill(178,124,23);
  strokeWeight(10);
    rect(390,160,120,60,15);
    
  strokeWeight(7);
    fill(255,90,179);
      fill(178,124,23);
      strokeWeight(10);
  ellipse(400,200,70,70);
  fill(0);
  stroke(0);
  strokeWeight(0);
  ellipse(385,205,18,3);
  ellipse(415,200,18,2);
  fill(244);
  
  noFill();
  stroke(150,100,18);
  strokeWeight(10+headS/7);
  curve(500, 175, 508, 178, 430, 240, 180, 233);
    strokeWeight(2);
      strokeWeight(6);

  
  }
  //Animate
  if(headS>78.9){
    breath = -.2;
  }
  if(headS<62.1){
  breath = .2;  
  }
  eyeS+=breath/2;
  headS+=breath;
  earS+=breath/1.7
  //reset
  stroke(0);
  strokeWeight(2);
}
