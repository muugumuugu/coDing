var amp;
var song;
var pt1=[];
var pt2=[];
var c;
var volhist =[];
//---------------
function preload(){
   song=loadSound("https://upload.wikimedia.org/wikipedia/commons/4/47/Beethoven_Moonlight_2nd_movement.ogg");
}

function setup(){

    //createCanvas(windowWidth, windowHeight);
    createCanvas(600,600);
    c=color(0,255,0);
  pt2[0]=0;
  pt2[1]=0;
     background(c,10);
     stroke(c);
     angleMode(DEGREES);
     //------------------
     song.play();
     //-----------------
     amp=new p5.Amplitude();
}
//-----------------------
function keyPressed(){
  if (song.isPlaying()){
    song.pause();}
    else{
    song.play();
    amp=new p5.Amplitude();}
}
//-------------------
function draw() {
  background(60,220,140,50);
  if (song.isPlaying()){
  vol=amp.getLevel();
  volhist.push(vol); 
  }
    //background(100,10);
    //circle(width/2,height/2,amp.vol*width);
    //text(vol,width/2,height/2);
    translate(width/2,height/2); //like a proper graph it looks now
       noStroke();
      fill(random(256),random(256),random(256),random(256));
      circle(random(-width,width),random(-height,height),20);
    for (var i=0; i < 360; i=i+1){
  
      strokeWeight(1);
         var r=map(volhist[i],0,1,0,width*3/2);
         
         x= r * cos(i);
         y= r * sin(i);
         if ( i > 340 ){
           c=color(255,0,0);
         }
         else{
           c=color(0,0,255);
    
         }
        stroke(c);
        pt1[0]=pt2[0];
        pt1[1]=pt2[1];
        pt2[0]=x;
        pt2[1]=y;
        print(pt1);
        line(pt1[0],pt1[1],pt2[0],pt2[1]);
    }
    //scroll
    if (volhist.length>=360){
      volhist.splice(0,1); //move ahead by 1 vertex/ record
    }
    
    
}
