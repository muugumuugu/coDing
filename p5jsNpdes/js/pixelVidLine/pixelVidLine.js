//Line Webcam by Dread-Eye:
//https://www.openprocessing.org/sketch/941081
//A mashup of Daniel Shiffman's pixelated video tutorial:
//https://processing.org/tutorials/video/
//and the simple lines from bw's "animation study 23":
//https://www.openprocessing.org/sketch/459323
//Press Spacebar to Export PNG


var videoScale = 8;
let webcam;

function setup() {
  createCanvas(640, 480);
  stroke(255);
  strokeWeight(2);

  webcam = createCapture(VIDEO);
  webcam.size(80, 60);
  webcam.hide();
}


function draw() {
  background(0);
  webcam.loadPixels();

  translate(width, 0);
  scale(-1, 1);

  for (let y = 0; y < webcam.height; y++) {
    for (let x = 0; x < webcam.width; x++) {
      
      let index = (x + y * webcam.width) * 4;
      let r = webcam.pixels[index + 0];
      let g = webcam.pixels[index + 1];
      let b = webcam.pixels[index + 2];

      var brightness = (r+g+b)/3;  
      
      var sz = (brightness/255) * videoScale;       

      line(x*videoScale, y*videoScale, (x*videoScale) + sz, (y*videoScale) + sz);
    }
  }
}



function keyPressed(){
  if(key == ' '){
    save('webLines.png');
  }
}
