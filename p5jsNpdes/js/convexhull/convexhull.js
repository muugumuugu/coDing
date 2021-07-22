//gift wrap
let points=[];
let hulled=false;
const size=600;
const margin=25;
let button1,button,button3;
let drawing=true;
let leftmost;
let hull=[];
let currVertex;
let currPoint;
let prevPoint;
let index=0;
let nextVertex;
//---------------
function setup() {
  textAlign(CENTER,CENTER);
  createCanvas(size,size);
  button1=createButton("HULL");
  noFill();
  button1.mousePressed(HULL);
  background(0);
  for (let i=0; i<20;i++){
    points.push(createVector(random(margin,size-margin),random(margin,size-margin)));
    //replace with mousePressed
  }
  points.sort((a,b)=>a.x-b.x);
  leftmost=points[0];
  currVertex=leftmost.copy();
  nextVertex=points[1].copy();
  hull.push(leftmost.copy());
  index=1;
}

//-----------
function draw() {
 background(0);
 stroke(255);
 strokeWeight(1);
  fill(255);
  text(mouseX+","+mouseY,mouseX,mouseY);
  noFill();
  if (drawing){

      stroke(255);
      strokeWeight(4);
      for (let p of points){
        point(p.x,p.y);
      }
      //--------------
       stroke(0,0,255);
      for (var i=0; i<hull.length-1 ; i++){
          point(hull[i].x,hull[i].y);
          strokeWeight(1);
          stroke(0,255,0);
          line(hull[i].x,hull[i].y,hull[i+1].x,hull[i+1].y);
          stroke(0,0,255);
          strokeWeight(4);
      }
      
      point(hull[hull.length-1].x,hull[hull.length-1].y);
      //-------------
      currPoint=points[index].copy();
      //----------
      strokeWeight(4);
      stroke(255,0,0);
      point(currVertex.x,currVertex.y);
      stroke(255,255,0);
      point(currPoint.x,currPoint.y);
      //------------
      strokeWeight(2);
      stroke(255);
      line(currVertex.x,currVertex.y,currPoint.x,currPoint.y);
      //---------
     let  check1=createVector(nextVertex.x-currVertex.x,nextVertex.y-currVertex.y);
     let check2=createVector(currPoint.x-currVertex.x,currPoint.y-currVertex.y);
     const zz=p5.Vector.cross(check1,check2);
      if (zz.z<0){
        nextVertex=currPoint.copy();
      }
      //-----------
      if (index<points.length-1){
        index=index+1;
        stroke(255,255,0);
        
        line(currVertex.x,currVertex.y,nextVertex.x,nextVertex.y);
       }
      else{
        index=0;
        hull.push(nextVertex.copy());
        currVertex=nextVertex.copy();
        if (nextVertex.x==leftmost.x && nextVertex.y==leftmost.y){
          console.log("HULLED");
          drawing=false;
          background(0);
          hulled=true;
          Onhull();
        }
        nextVertex=leftmost.copy();
       }
    }
  else{
    stroke(255);
    strokeWeight(4);
    for (let p of points){
      point(p.x,p.y);
    }
   if (hulled){
     Onhull();
   }

}
}

        
//-------
function Onhull(){
      strokeWeight(1);
      stroke(0,255,0);
      beginShape();
      for (let v of hull){
        vertex(v.x,v.y);
  }
        endShape(CLOSE);
        strokeWeight(4);
            for(let v of hull){
              stroke(0,0,255);
    point(v.x, v.y);
      }

}
function HULL(){
  if (drawing){
    console.log("click for NEW");
    drawing=false;
    background(0);
    hulled=false;
  }
  else{
    background(0);
    console.log("HULLING");
    hulled=false;
    hull=[];
    points.sort((a,b)=>a.x-b.x);
    leftmost=points[0].copy();
    currVertex=leftmost.copy();
    index=1;
    hull.push(leftmost.copy());
    nextVertex=points[1].copy();
    drawing=true;
  }
}
//----------------------

function mousePressed(){
  if (!drawing){
    if (margin<mouseX<size-margin && margin<mouseY<size-margin){
    points.push((createVector(mouseX,mouseY)));
    }
  }
}
