var amp;
var vol;
var mic;
var song;
var button1;
var button2;
var loaded=false;

//-----------------
function setup() {
  createCanvas(900,900);
  mic= new p5.AudioIn();
//  amp=new p5.Amplitude();
  mic.start();
  button1=createButton("AMP=?");
  button2=createButton("MIC=?");
  song=loadSound("dream.mp3",onLoad);
  song.addCue(5,stopload);
}
//---------------
function stopload(){
    song.pause();
}
function onLoad(){
  song.play();
  loaded=true;
}

//------------------
function draw() {
  if (!loaded){
   fill(random(128,174),random(174,256),random(64,128));
   circle(random(width),random(height),20);
  }
  else{

   //if (frameCount%5==0){
   //var bk=color(random(174,256),random(64,128),random(128,174));
   // background(bk,5);
   //}
   // fill(random(255),random(128),random(200));
   //var radd=map(amp.getLevel(),0,1,0,400);
   var rad=map(vol,0,1,0,800);
   var r, g, b,a;

   vol=mic.getLevel();   
   r=map(vol,0,0.4,128,174);
   g=map(vol,0,0.2,64,128);
   b=map(vol,0,0.1,174,256);
   a=map(vol,0,1,8,128);
    var clr=color(r,g,b,a);
    fill(clr);
    circle(width/2,height/2,rad);
    button1.html(nf(rad,2,2));
    button2.html(vol);
    
  }
}
