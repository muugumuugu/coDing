var mic;
var toggle;
var song;
var slider;


function setup() {
  toggle=false;
  createCanvas(800,800);
// mic=new p5.AudioIn();
//  mic.start();
  song=loadSound('data/dream.mp3',loaded);
   slider=createSlider(0,1,0,0.01);
   background(240,50);
   rectMode(CENTER);
}

function loaded(){
  song.play();
  toggle=true;
  background(0);
}
function draw() {
  fill(random(255),random(255),random(255),random(100));
  if (toggle==true){
    circle(random(width),random(height),random(5,100));
      if (random(100)>50){
        background(0,20);
      }
  }
  else{
    rect(random(width),random(height),random(5,100),random(5,100));
         if (random(100)>50){ 
            background(240,50);
      }
  }

}
function mousePressed(){
    if(song.isPlaying() == false){
    song.play();
    toggle=true;
  }
    else{
    song.pause();
    toggle=false;
  }
}
