//FOURIER unblend the smoothi
//---------------------------------------------------
let skip=8;
//---------------------
let wd,ht;
//---------------------------
let ctr;
//-----------------------------------
let p=[];//complex number array
//=----------------------------------------

function setup() {
  createCanvas(windowWidth,windowHeight);
  wd=width/2
  ht=height/2;
  ampCnst=4.0/PI; 
  ctr=drawing.length;
  //----------------------------------- ----
  noFill();
  stroke(255);
  //----------------------------------
            for (let i=0; i<ctr; i+=skip){
                const c=new Complex(drawing[i].x,drawing[i].y)
                p.push(c);
            }
    ctr=p.length;
    dt=TWO_PI/ctr; // complete rotation of base gear gives the whole drawing
    fourierT=dft(p);
    // to draw in order of amplitude not freq>>
    fourierT.sort((a,b)=>b.amp-a.amp);
    background(0);
}

//==============================================

function draw() {
   background(0);
    if (time>TWO_PI){
        time=0;
        path=[];
    }
    let v=epicycles(wd,ht,fourierT); 
    path.unshift(v);
        //---------------------- 
        noFill();
        strokeWeight(2);
        stroke(0,0,255,255);
        //-------------------------
    beginShape();
    for (let i=0 ; i<path.length; i++){
        vertex(path[i].x,path[i].y);
    }
    endShape();
    //-------------------
    time+=dt;
}
