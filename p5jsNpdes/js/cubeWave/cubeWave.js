let angle=0; // for SHM , taken in radians
let maxD;
let b=24;

function setup() {
 createCanvas(400,400, WEBGL); // called at refrsh
 //just creaes 400 by 400 pixel worling space blank
 // Also enables webgl mode
  maxD=dist(0,0,200,200); 
}


function draw() { // called every 0.1_ sec
 let offset=0;
// background(0); //paints everything black in normal mode but in webgl its dumb fuck
 background(100);
 ortho(-300,300, -300,300,0,1000); //perspective
 //directionalLight(255,255,255,0,-1,0);//color and direction
 //translate(width/2,height/2);// 0,0 is the centre in webgl but not usually, so for compatibility testing this is cool
// translate(0,50,-50); //zoom out
// rectMode(CENTER);//(mode)
 //rotateX(angle*0.25); // to showoff webgl 3d
rotateX(PI/4);
 rotateY(atan(sqrt(1/2)));
rotateZ(-PI/4);
rotateX(-PI/4);
 

 for (let z=0; z<height; z+=b){
   for( let x=0; x<width; x+= b){ 
     push();//webgl addition
     let d=dist(x,z,width/2,height/2);
     offset=map(d,0,maxD,-PI,PI);
     param=angle+offset;
     let h=map(sin(param),-1,1,100,300); // osscilating length of rectangle so it looks like streching
     //fill(255);// shape fill color
     //rect(x-width/2+b/2,0,b-2,h);
     translate(x-width/2,0,z-height/2);//the push pop way for 3ding
     normalMaterial();//rgb for all vertices
     box(b-2,h, b-2);// webgl 3d 
     pop(); //for webgling box erc
 }
 //offset +=0.1;
}
 angle +=0.05;
}
