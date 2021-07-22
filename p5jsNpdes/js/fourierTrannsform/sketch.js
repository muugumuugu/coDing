//FOURIER unblend the smoothi
//---------------------------------------------------
let time=0;
let dt=0.01;
let skip=1;
let scl;
//---------------------
let wd,ht;
//-------------------
 //drawing=[{x:1 , y:2},{x:3 , y:4} ..etc] //jsonfile maybe?  :)
let userdrawing=[];
//-------------------
let mode=1;
const FOURIER=2;
const USER= 0;
const AUTO=1
//---------------------------
let ctr=100; 
//let ctr=drawing.length 
//-----------------------------------
let y=[];
let x=[];
//=----------------------------------------

function setup() {
  createCanvas(windowWidth,windowHeight);
  wd=innerWidth/2;
  ht=innerHeight/2;
  ampCnst=4.0/PI;
  dt=TWO_PI/ctr; // complete rotation of base gear gives the whole drawing 
  //---------------------------------------
  noFill();
  stroke(255);
  //----------------------------------
  if (mode==AUTO){
    let angle=0;
            for (let i=0; i<ctr; i+=skip){
                y[i]= 300 *sin(angle);//*noise(angle);
                x[i]= 300 *cos(angle);//
               // x[i]=map(noise(angle+1000),0,1,-200,200);
                angle+=TWO_PI/ctr;
                //x[i]=drawing[i].x;
                //y[i]=drawing[i].y;
            }
        fourierX=dft(x);
        fourierY=dft(y);
        // to draw in order of amplitude not freq>>
        fourierX.sort((a,b)=>b.amp-a.amp);
        fourierY.sort((a,b)=>b.amp-a.amp);
    }
    background(0);
}


function draw() {
  noFill();
  if (mode==AUTO){
    background(0);
    if (time>TWO_PI){time=0;path=[];}
        let vx=epicycles(wd,100,fourierX,0)
        let vy=epicycles(100,ht,fourierY,HALF_PI);
        let v=createVector(vx.x,vy.y);
        path.unshift(v);
        strokeWeight(1);
        stroke(0,255,0,100);
        line(vx.x,vx.y,v.x,v.y);
        line(vy.x,vy.y,v.x,v.y);
        beginShape();
        noFill();
        strokeWeight(2);
        stroke(0,0,255,255);
        for (let i=0 ; i<path.length; i++){
            vertex(path[i].x,path[i].y);
        }
        endShape();
    //-------------------
    time+=dt;
  }
  else if (mode==USER){
     let pointt=createVector(mouseX-wd,mouseY-ht);
     userdrawing.push(pointt);
      strokeWeight(2);
      stroke(255,255);
      beginShape();
      for (let v of userdrawing){
         vertex(v.x+wd,v.y+ht);
      }
      endShape();
  }
    else if (mode==FOURIER){
        background(0);
        if (time>TWO_PI){time=0;path=[];}

            let vx=epicycles(wd,100,fourierX,0);
            let vy=epicycles(100,ht,fourierY,HALF_PI);
            let v=createVector(vx.x,vy.y);
            path.unshift(v);
            strokeWeight(1);
            stroke(0,255,0,100);
            line(vx.x,vx.y,v.x,v.y);
            line(vy.x,vy.y,v.x,v.y);
            noFill();
            strokeWeight(2);
            stroke(0,0,255,255);
            beginShape();
            for (let i=0 ; i<path.length; i++){
                vertex(path[i].x,path[i].y);
            }
            endShape();
        //-------------------
       time+=dt;
    }
}
