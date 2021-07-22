
//
let maxnoise=15;
let t=0;
let ctr=0;
//------------------
let da=0.1;
let frm=5;
//------------------------
let zoff=0;
//------------------------
let zofft=0,yphaset=0,xphaset=0;
let xphase,yphase;
//
let saveRate=1000;
let playRate=100;



//blobby
function setup() {
  xphase=radians(0.4);
  yphase=radians(0);
  createCanvas(1000,1000);
  colorMode(HSB,360,100,100,100);
  //frameRate(saveRate);
  frameRate(playRate);
  //createLoop({duration:36,gif:true});
  background(0);
  noiseDetail(16);
  noiseSeed(666);
  noFill();
}


function draw() {
 //setup canvas and brushes
   translate(width/2,height/2);

 // shutter frames
 //for (let i=0 ;i<frm; i++){
  maxnoise=map(sin(radians(t)),-1,1,10,20);
 //Phases
  xphase=radians(0.2*cos(radians(xphaset)));
  yphase=radians(sin(radians(yphaset))*0.3);
  let znn=map(sin(radians(zofft)),-1,1,50,100);
  zoff=map(noise(znn),0,1,1000,1010);
 stroke(map(maxnoise,4,16,0,360),100,100,100);
    background(0,10);
  //////////////////////////////////////////
      beginShape();
      for (let aa=0; aa<360; aa+=da){
        //noises
          let a=radians(aa);
          let xoff=map(cos(a),-1,1,maxnoise/2,maxnoise);
          let yoff=map(sin(a),-1,1,maxnoise/2,maxnoise);
          let r= map(noise(xoff,yoff,zoff),0,1,-50,600);
         //co ors
        let x= r*cos(a+radians(xphase));
        let y= -r*sin(a+radians(yphase));
        vertex(x,y);
      }
      endShape(CLOSE);
//saveFrame(nf(ctr,0,2)+".gif");
      ctr++;
		console.log(ctr);
      if (ctr==1800){
  exit();
  noLoop();}
  //////////////////////////////////////////////
  //Phase increment
  xphaset=+0.2;
  yphaset+=0.3;
  //color and radius letiation control
   t+=0.4;
  zofft+=0.1;
 //}


}
