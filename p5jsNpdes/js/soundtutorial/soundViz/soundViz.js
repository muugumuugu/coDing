var amp;
var song;
var loaded=false;
var volhist =[];
//---------------
function preload(){
   song=loadSound("https://upload.wikimedia.org/wikipedia/commons/4/47/Beethoven_Moonlight_2nd_movement.ogg");
}

function setup(){
    //createCanvas(windowWidth, windowHeight);
    createCanvas(800,800);
     background(100, 10);
     stroke(233,10,170);
     //------------------
     song.play();
     song.loop();
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
  background(30,50);
  stroke(233,10,170);
  if (song.isPlaying()){
  vol=amp.getLevel();
  volhist.push(vol); 
  }
    //background(100,10);
    //circle(width/2,height/2,amp.vol*width);
    //text(vol,width/2,height/2);
    noFill();
    var currY=map(vol,0,1,height,0);
    push();
    translate(0,height/2-currY);//do a tumble curr vol to centre :))))))))
    beginShape();
    for (var i=0; i<volhist.length;i++){
      var y=map(volhist[i],0,1,height,0);
      //point(i,y);
      vertex(i,y);
    }
    endShape();
    pop();
    //scroll
    if (volhist.length> width-20){
      volhist.splice(0,1); //move ahead by 1 vertex
    }
    stroke(40,160,230,40);
    line(volhist.length,0,volhist.length,height);//cursor;
    
    
}
