//==========================
function make2DArray(cols,rowss){
  var arr= new Array(cols);
  for (var i=0;i<arr.length; i++){
    arr[i]=new Array(rowss);
  }
  return arr;
}

//====================
 
function Cell(x,y,ix,iy){
  this.x=x;
  this.y=y;
  this.ix=ix;
  this.iy=iy;
 // this.bee=random(1)<0.3;
 this.bee=false;
  this.sting=0;
  this.revealed=false;
}

//=======================

Cell.prototype.show = function(){
  if (this.revealed){
  stroke(bg);
  rect(this.x,this.y,size,size);
    if (this.bee){
      stroke(stk);
      strokeWeight(1);
      circle(this.x,this.y,size);
      for (var ee =2 ;ee<5 ; ee++){
        ellipse(this.x,this.y,size/(ee-1),size/ee);
        ellipse(this.x,this.y,size/ee,size/(ee-1));
      }
    }
    else{
      noStroke();
      fill(stk);
      rect(this.x,this.y,size,size);
      fill(255);
      text(this.sting,this.x,this.y);
      noFill();
      stroke(0);
    }
  }
  else{
  stroke(stk);
  rect(this.x,this.y,size,size);
  }
}

//=============================

Cell.prototype.contains= function(x,y){
  return( x> this.x-size/2 && x< this.x +size/2 && y> this.y-size/2 && y< this.y +size/2 );
}
//==================================

Cell.prototype.countBees=function(){
  if (this.bee){
  return -1;
  }
  var bees=0;
  for (var xi=-1;xi<=1; xi++){
    for (var yi=-1;yi<=1; yi++){
      if (!(this.ix+xi<0 || this.ix+xi>=cols || this.iy+yi<0 || this.iy+yi>=rowss)){
      var ngbr=grid[this.ix+xi][this.iy+yi];
        if (ngbr.bee){
          bees=bees+1;
        }
      }
    }
  }
  return bees;
}

Cell.prototype.mark=function(){
  stroke(stk);
  ellipse(this.x,this.y,size/3,size/2);
  ellipse(this.x,this.y,size/2,size/3);
  
}
Cell.prototype.floodFill=function(){
  for (var xi=-1;xi<=1; xi++){
    for (var yi=-1;yi<=1; yi++){
      if (!(this.ix+xi<0 || this.ix+xi>=cols || this.iy+yi<0 || this.iy+yi>=rowss)){
      var ngbr=grid[this.ix+xi][this.iy+yi];
        if (ngbr.bee==false && ngbr.revealed==false){
          ngbr.reveal();
        }
      }
    }
  }
}

Cell.prototype.reveal=function(){
  this.revealed=true;
  this.show();
  uncovered+=1;
  if (this.bee){
   console.log("BEE");
   beed=true;
   background(255,0,0,51);
   uncovered=0;
   }
   else{
     if (uncovered==cols*rowss-stingers){
       background(0,255,0,51);
       won=true;
       uncovered=0;
       console.log("BREEZE");
    }
    if (this.sting==0){
      this.floodFill();
    }
   }

}
