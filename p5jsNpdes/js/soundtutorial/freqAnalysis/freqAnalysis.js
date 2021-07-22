var fftobj;
var spectrum;
var song;
var w=5;
var precision=256;

//---------------
function preload(){
   song=loadSound("https://upload.wikimedia.org/wikipedia/commons/3/38/Vivaldi_The_Four_Seasons%2C_Op._8_-_The_Modena_Chamber_Orchestra_-_Violin_Concerto_in_F_major_RV_293_Autumn.mp3");
}

function setup(){

    //createCanvas(windowWidth, windowHeight);
    createCanvas(precision*w,640);
    colorMode(HSB);//hue saturation brightness
    noStroke();
     angleMode(DEGREES);
     //------------------
     song.play();
     //-----------------
     fftobj=new p5.FFT(0.8,precision); //smoothing, bins
}
//-----------------------
function keyPressed(){
  if (song.isPlaying()){
    song.pause();}
    else{
    song.play();
    }
}
//-------------------
function draw() { 
 spectrum=fftobj.analyze(); 
 background(10,10,10,10);
 for (var i=0; i<precision;i++){
   var amp=spectrum[i];
   var y=map (amp,0,256,height,0);
   var hue=map(i,0,precision,360,0);
   fill(hue,100,100);
   rect(i*w,y,w/2,height-y);

 }
}
