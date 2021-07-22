
  var gridSize = 600;
  var squareRatio = 0.03;
var Px = 50;
var Py = 50;
var portal = 2;
var chance = 0;
var deaths = 0;
var points = 0;
var wallDensity = 40;
let square = [{
  color : 0,
  xRow : 0,
  yRow : 0
}];
function setup() {
  createCanvas(gridSize+250, gridSize);
  background(0);

  //random grid
  drawGrid();
}//end setup

function draw() {
  
  fill( 0, 200, 50);
  stroke( 0, 200, 50);
  
  rect(Px , Py , squareRatio*gridSize , squareRatio*gridSize);
  
if(red(get(Px+(squareRatio*gridSize)*1.5,Py+(squareRatio*gridSize)/2)) === 0){
if( red(get(Px-(squareRatio*gridSize)/2,Py+(squareRatio*gridSize)/2)) === 0){  
if(red(get(Px+(squareRatio*gridSize)/2,Py-(squareRatio*gridSize)/2)) === 0){
if(red(get(Px+(squareRatio*gridSize)/2,Py+(squareRatio*gridSize)*1.5)) === 0){
      //new grid  
  deaths++;
        drawGrid();
}}}}
  drawMenu();
}//end of draw loop
//Menu
  function drawMenu (){
    stroke(0,0,0);
  fill(0,0,0);
    rect(607-(squareRatio*gridSize),0,200,gridSize);
  stroke(48,48,48);
  fill(81,81,81);
  strokeWeight(5);
  rect(607,0,200,gridSize);
  strokeWeight(1);
  fill(200,200,200);
  textSize(50);
  text("Menu",(607)+35,50);
  strokeWeight(5);
  line((607),60,(607)+200,60);
  strokeWeight(1);
  textSize(20);
    noStroke();
    fill(255,255,255);
  text("map size",(607)+40,100);
  strokeWeight(5);
  fill(120,120,120);
  rect((607)+40,110,125,50,4);
  strokeWeight(1);
  fill(255,255,255);
  noStroke();
  text(round(squareRatio,2),(607)+80,140);
  ellipse(607+55,135,20,20);
  ellipse(755,135,20,20);
    
      text("wall density",(607)+40,200);
  strokeWeight(5);
  fill(120,120,120);
  rect((607)+40,210,125,50,4);
  strokeWeight(1);
  fill(255,255,255);
  noStroke();
  text(round(wallDensity,2),(607)+80,240);
  ellipse(607+55,235,20,20);
  ellipse(755,235,20,20);
    strokeWeight(5);
  fill(120,120,120);
  rect((607)+40,287,75,22,4);
    rect((607)+40,332,75,22,4);
    strokeWeight(1);
  fill(255,255,255);
  noStroke();
      text("points:",(607)+40,280);
      text(points,(607)+40,305);
    text("deaths:",(607)+40,330);
      text(deaths,(607)+40,350);
  }
function keyPressed() {

  //Walls
  if(key === 'd' && red(get(Px+(squareRatio*gridSize)*1.5,Py+(squareRatio*gridSize)/2)) === 255 ){
    fill( 0, 100, 50);
  stroke( 0, 100, 50);
      rect(Px , Py , squareRatio*gridSize , squareRatio*gridSize);
    Px+= squareRatio*gridSize;
    points++;
    }
  if(key === 'a' && red(get(Px-(squareRatio*gridSize)/2,Py+(squareRatio*gridSize)/2)) === 255){
      fill( 0, 100, 50);
  stroke( 0, 100, 50);
      rect(Px , Py , squareRatio*gridSize , squareRatio*gridSize);
     Px -= squareRatio*gridSize;
    points++;
     }
  if(key === 'w' && red(get(Px+(squareRatio*gridSize)/2,Py-(squareRatio*gridSize)/2)) === 255){
      fill( 0, 100, 50);
  stroke( 0, 100, 50);
      rect(Px , Py , squareRatio*gridSize , squareRatio*gridSize);
     Py -= squareRatio*gridSize;
    points++;
     }
  if(key === 's' && red(get(Px+(squareRatio*gridSize)/2,Py+(squareRatio*gridSize)*1.5)) === 255){
      fill( 0, 100, 50);
  stroke( 0, 100, 50);
      rect(Px , Py , squareRatio*gridSize , squareRatio*gridSize);
     Py += squareRatio*gridSize;
    points++;
     }
  // uncomment to prevent any default behavior
  // return false;
}
function drawGrid () {
      Px = 0;
        Py = 0;
        portal = 2;
  
  for(var y = 0; y < gridSize; y+=squareRatio*gridSize){
  for(var x = 0; x < gridSize; x+=squareRatio*gridSize){
    chance = round(random(0,100));
    if( chance < 2 && portal != 0){
    fill(0,100,200);
      stroke(0,100,200);
      portal --;
    }else if(chance < wallDensity){
      fill(0,0,0);
      stroke(0,0,0);
    }else{
      fill(255,255,255);
      stroke(255,255,255);
    }
    
rect(x,y,squareRatio*gridSize,squareRatio*gridSize);
  }//x for loop
    
  }//y for loop
  fill(255,255,255);
      stroke(255,255,255);
  rect(0,0,(squareRatio*gridSize)*2,(squareRatio*gridSize)*2);
}
function mouseClicked(){
  ///////map size
  if(dist(mouseX,mouseY,661,135)<10 && squareRatio < 0.06 ){
    squareRatio += 0.01;
    drawGrid();
    drawMenu();
      
  }else if(dist(mouseX,mouseY,661,135)<10 && squareRatio < 0.11 ){
      squareRatio = 0.17;
    drawGrid();
    drawMenu();
    
  }
  if(dist(mouseX,mouseY,755,135)<10 && squareRatio > 0.01 && squareRatio != 0.17){
    squareRatio -= 0.01;
    drawGrid();
    drawMenu();
  }else if(dist(mouseX,mouseY,755,135)<10 && squareRatio > 0.01 && squareRatio == 0.17){
    squareRatio = 0.06;
    drawGrid();
    drawMenu();
  }
  ///////Wall density
  if(dist(mouseX,mouseY,607+55,235)<10 && wallDensity > 0){
    wallDensity -= 10;
    drawGrid();
    drawMenu();
  }
    if(dist(mouseX,mouseY,755,235)<10 && wallDensity < 110){
      wallDensity += 10;
    drawGrid();
    drawMenu();
  }
}
