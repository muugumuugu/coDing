var grid;
var stingerLst;
//--------------------
var size=40;
var margin=5;
//------------------
var beed=false;
var won=false;
//-------------------
var cols=4;
var rowss=4;
var stingers=5;
//--------------------
var colSl,rowSl;
var beeSl=5;// not SLIDER :(
var butt;
var addB,subB;
//-------------------
var beeCt=5;
var uncovered=0;
//-------------------
var bg;
var stk;
//===========================
function setup() {
  createCanvas(size*cols+margin*2,size*rowss+margin*2);
  colSl=createSlider(1,20,4);
  rowSl=createSlider(1,20,4);
  addB=createButton("ADD BEE");
  subB=createButton("SUB BEE");
  butt=createButton("NEW GAME");
  //---------------------
  butt.mousePressed(newGame);
  addB.mousePressed(function() { beeUpd(1);});
  subB.mousePressed(function() { beeUpd(-1);});
  //--------------------
  colorMode(RGB,255,255,255,100);
  //------------------------
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  //----------------------
  newGame();
  //-----------------------

}

//===================================
function draw() {
 noLoop();

}//=====================================

function mousePressed(){
    if (beed || won){
      newGame();
    }
    else{
      for (var x=0;x<cols; x++){
       for (var y=0;y<rowss; y++){
         if (grid[x][y].contains(mouseX,mouseY)){
             if (mouseButton==LEFT){
           grid[x][y].reveal();
             }
             else{
             grid[x][y].mark();}
           }
         }
        }

      }
}
//===============
function mkGrid(){
  cols=colSl.value();
  rowss=rowSl.value();
  grid=make2DArray(cols,rowss);
  for (var x=0;x<cols; x++){
     for (var y=0;y<rowss; y++){
       grid[x][y]=new Cell(x*size+size/2+margin,y*size+size/2+margin,x,y);
    } 
  }
}
//======================
function newGame(){
  uncovered=0;
  beeUpd(0);
  stingers=beeSl;
  stingerLst=[];
  won=false;
  beed=false;
  //------------------
  mkGrid();
  updBee();
  setClrs();
  showGrid();
 if( stingers==0 || stingers==cols*rowss){
    uncovered=uncovered+1;
    grid[0][0].reveal();
  }
}
//====================
function updBee(){

 beeUpd(0);
 stingers=beeSl;
 console.log(stingers);
 createStings(stingers);
   for (var beeSpot of stingerLst){
     grid[beeSpot[0]][beeSpot[1]].bee=true;
   }
   
   //-------------------
  for (var xx=0;xx<cols; xx++){
   for (var yy=0;yy<rowss; yy++){
     grid[xx][yy].sting=grid[xx][yy].countBees();
    }
  }
}
//=====================
function showGrid(){
  for (var x=0;x<cols; x++){
     for (var y=0;y<rowss; y++){
     grid[x][y].show();
    }
  }
}
//=======================
function setClrs(){
  createCanvas(size*cols+margin*2,size*rowss+margin*2);
  background(255);
  bg=color(random(255),random(255),random(255),20);
  stk=color(255-red(bg),255-green(bg),255-blue(bg),100);
  background(bg);
  stroke(stk);
  strokeWeight(2);
  noFill();
  textAlign(CENTER,CENTER);
}
//===================
function beeUpd(amt){
  var temp=beeSl+amt;
  if ( temp <= (cols*rowss) && temp>-1){
    beeSl=temp;
  }
  else{
    beeSl=floor((cols*rowss)/2);
  }
}

function createStings(stingCt) {
  var spots=[];
  for (var xx=0 ; xx<cols ; xx++){
    for (var yy=0 ; yy<rowss ; yy++){
      spots.push([xx,yy]);
    }
  }
  while (stingerLst.length<stingCt ){
    var ind =int(random(cols*rowss));
    if (ind<spots.length){
    var chosen=spots[ind];
    spots.splice(ind,1);
    stingerLst.push(chosen);
    }
  }
  console.log(stingerLst);
}

//=================
