let ox, oy;
let muscircle1;
let muscircle2;
let muscircle3;
let muscircle4;
let muscircle5;
let muscircle6;
let muscircle7;
let mx=0;
let my=0;
let sz = 10;
let j1 = 0;
let j2 = 0;
let u1 = 0;
let u2 = 0;
let lx=0;
let ly=0;

function setup() {
  createCanvas(1112, 834);
  colorMode(HSB, 255);
  background (70);
  
  muscircle1 = new MusicCircle(16);
  muscircle1.rad1= 150;
  muscircle1.freq1= 0.05;
  muscircle1.pitch = [47, 42, 44, 44, 47, 42, 44, 44, 40, 40, 42, 42,
  44,42,44,44];

  muscircle2 = new MusicCircle(48);
  muscircle2.rad1= 350;
  muscircle2.freq1= 0.05;
  muscircle2.pitch = [52,56,59, 47,51,54, 49,52,56,
    49,52,56, 52,56,59, 47,51,54, 49,52,56, 49,52,56, 45,49,52, 45,
  49,52, 47,51,54, 47,51,54, 61,56,61, 59,56,59, 56,49,51, 52,52,52 ];


  muscircle3 = new MusicCircle(48);
  muscircle3.ox= mx;
  muscircle3.oy= my;
  muscircle3.freq1= 0.05;
  muscircle3.pitch = [71,73,71, 66,71,69, 68,71,68, 68,71,68,
  71,73,71, 66,71,69, 68,71,68, 68,71,68,  76,68,76, 75,68,75,
73,66,68, 70,70,70, 71,73,71, 68,71,68, 66,66,66, 66,66,66];


  muscircle4 = new MusicCircle(4);
  muscircle4.ox= j1;
  muscircle4.oy= j2;
  muscircle4.freq1= - 0.05;
  muscircle4.pitch = [28, 28, 28, 28];


  muscircle5 = new MusicCircle(2);
  muscircle5.ox= u1;
  muscircle5.oy= u2;
  muscircle5.freq1= 0.05;
  muscircle5.pitch = [88, 92];
  muscircle5.dur = 25 / muscircle5.freq1;

  muscircle6 = new MusicCircle(8);
  muscircle6.ox= lx;
  muscircle6.oy= ly;
  muscircle6.amp= 0
}

function draw() {

  muscircle1.draw();
  muscircle2.draw();
  muscircle3.draw();
  muscircle3.ox= mx;
  muscircle3.oy= my;
  mx = -1200;
  my = -1200;

  //muscircle4.draw();
  muscircle4.ox= j1;
  muscircle4.oy= j2;
  j1= width*1/4;
  j2= height/2;

  //muscircle5.draw();
  muscircle5.ox= u1;
  muscircle5.oy= u2;
  u1= width*3/4;
  u2= height/2;

  //muscircle6.draw();
  muscircle6.ox= lx;
  muscircle6.oy= ly;
  lx= muscircle2.x1;
  ly= muscircle2.y1;
}

function mouseClicked () {
  muscircle1.click();
  muscircle2.click();
  muscircle3.click();
  muscircle4.click();
  muscircle5.click();
  muscircle6.click();
}

function keyPressed(){ save('pix.jpg')};  

//Classes define an object with attributes (Variables) and actions (functions)
//The instance, is the actual object.
