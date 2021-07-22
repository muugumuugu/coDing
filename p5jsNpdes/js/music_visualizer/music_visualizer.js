/*Music is an original recording.*/
/*Code based on example from Daniel Shiffman.*/
let song;
let button;
let fft;
let spectra = [];

function preload() {
  song = loadSound('data/dream.mp3');
}

function setup() {
  createCanvas(1112, 834);
  colorMode(HSB, 255);
  button = createButton('play music!');
  button.position(width/2 - 35,120);
  button.mousePressed(toggle);
  fft = new p5.FFT(0.6, 64);
  frameRate(10);
  strokeWeight(1);
}

function draw() {
  background(0);
  translate(-110, -40);
  let spectrum = fft.analyze();
  spectra.push(new Spectrum(spectrum));
  if (spectra.length > 16) {
    spectra.splice(0, 1);
  }
  let xslope=map(width/2, 0, width, 2,32); //12
  let yslope=map(height/2, 0, height, 15,5);

  for (j = 0; j < spectra.length; j++) {
    fill(j / spectra.length * 255, 255, 255, 100);
    let spec = spectra[j].getSpectrum();
    for (i = 0; i < 32; i += 1) {
      let adjust = (i+1)*(i*+1)/80;
      let h = map(spec[i]*adjust, 0, 255, height, 0);
      stroke(255, 50+(j + 1) * 16);
      rect(100 + xslope * j + 28 * i, h - 4 * i - (yslope * (20 - j)), 18, (height - h));
    }
  }
}

function toggle() {
  if (song.isPlaying()) {
    song.pause();
    button.html("play music!");
    song.setVolume(1);
  } else {
    song.play();
    button.html("pause music!");
  }
}

let lapse = 0;    // mouse timer
function mousePressed(){
// prevents mouse press from registering twice
  if (millis() - lapse > 400){
    save('pix.jpg');
    lapse = millis();
  }
}
