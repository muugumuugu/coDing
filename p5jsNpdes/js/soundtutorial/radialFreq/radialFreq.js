var fftobj;
var spectrum;
var song;
var precision=512;

//---------------
function preload(){
   song=loadSound("https://upload.wikimedia.org/wikipedia/commons/f/f8/Monplaisir_-_07_-_Morning_Love_Frequencies.ogg");
}

function setup(){
  createCanvas(600,600);
  colorMode(HSB);
  angleMode(DEGREES);
  noFill();
   //------------------
   song.play();
   //-----------------
  fftobj= new p5.FFT(0.8,precision);
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
  spectrum= fftobj.analyze();
 // background(frameCount%360,50,100);
 background(10,10,10,20);
  //----------
  translate(width/2,height/2); //like a proper graph it looks now
  for (var i=0; i <= precision; i=i+2){
   var r=map(spectrum[i],0,255,50,width/2 );
   var ang=map(i,0, precision,0,360);
 //  var angg=ang *3;//amplified angle
   //----------
   x= r * cos(ang);
   y= r * sin(ang);
   //-----------
  stroke(ang%360,50,100);
  line(0,0,x,y);
  
   //--------
  }
}
