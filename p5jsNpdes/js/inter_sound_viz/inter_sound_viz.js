let song, fft;
let scl = 80;


let preX, preY;

let spectrum;
let spect_x, spect_y;

let c = ["#162C9a","#4182EF","#53ADB2","#4caf50","#9EC545","#F8DC3D","#EBA048","#DE3A28","#B650A8","#671e8b"];
let c_count = 0;

let timeCount = 0;

function preload() {
  soundFormats('mp3', 'ogg');
  song = loadSound('dream.mp3');
}

function setup() {  
  let cnv = createCanvas(850,800);
  cnv.mouseClicked(togglePlay);
  
  smooth();
  fft = new p5.FFT();
  

  song.amp(0.2);

}

function draw() {
  background(255);
  
  song.setVolume(map(mouseX,-width,width,0.0001,1.0));
  
  spectrum = fft.analyze();

  drawWave();
  drawSpectrum();
}


function togglePlay() {
  if (song.isPlaying()) {
    song.pause();
  } 
  else {
    song.loop();
  }
}

function drawSpectrum(){
  translate(-width/2, -height/2);
  noStroke();
  spect_x = 5;
  for (let i = 0; i< spectrum.length; i+=30){
    let spect_h = map(spectrum[i], 0, 255, height, 0);
    
    c_count = 0;
    for(let j = height; j>0; j-=scl){
      if(j > spect_h){
        fill(c[c_count]);
        spect_y = j;
        rect(spect_x, spect_y, scl, scl-5);
        c_count += 1;
      }
    }
    spect_x += scl+5;
  }
}

function drawWave(){
  translate(width / 2, height / 2);
  noFill();
  beginShape();
  stroke(20);
  for (let i = 400; i < spectrum.length-400; i+=2){
    let angle = map(i, 400, spectrum.length-400, -PI/2, 2*PI-PI/2);
    let rad = map(spectrum[i], 0, 255, 50, 500);
    let x = rad * cos(angle); 
    let y = rad * sin(angle);
    vertex(x,y);
    if(i == 400){
      preX = x;
      preY = y;
    }
  }
  vertex(preX,preY);
  endShape();
}
