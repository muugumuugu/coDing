let sound;
let bgColor;
let analyzer;
let num = 30;

function preload(){
  sound = loadSound("dream.mp3");
}

function setup() {
  createCanvas(windowWidth, windowHeight);
  bgColor = color(0, 0, 255);
  analyzer = new p5.Amplitude();
  analyzer.setInput(sound);
  background(0);
}

function draw() {
  let rms = analyzer.getLevel();
  fill(31, 127, 255);
  noStroke();
  translate(width/2, height/2);
  for(let i = 0; i < num; i ++){
    circle(0, rms * width, 30);
      fill(31, 127, 255 , i * 3);//%255);

    rotate(millis() * i / 100000);
  }
   circle(width/2, height/2, rms * width);
}

function mousePressed(){
  bgColor = color(255, 0, 0);
  if(sound.isPlaying() == false){
    sound.play();
  }
    else{
    sound.pause();
  }
}

function mouseReleased(){
  bgColor = color(0, 0, 255);
}
