let sound;
let fft;

function preload() {
  sound = loadSound('./sound.mp3');
}

function setup() {
  createCanvas(windowWidth, windowHeight);
  sound.loop(0, 1, 0.1);
  fft = new p5.FFT(0.5, 1024);
  fft.setInput(sound);
  background(0);
  colorMode(HSB);
  ellipseMode(CENTER);
}

function draw() {
  translate(width / 2, height / 2);
  background(0);
  const spe = fft.analyze();
  drawGradientCircle(160, spe, 15);
  drawGradientCircle(200, spe, 25);
  drawGradientCircleWithRect(210, spe, 2);
}

function drawGradientCircle(size, spe, spl) {
  for(let i = 0; i < 360; i += 2){
    const rad = i / 180 * PI;
    const x = int(map(i, 0, 360, 0, spe.length));
    const y = map(spe[x], 0, 255, 0, height / 2);
    push();
    rotate(rad);
    fill(i,100,100);
    ellipse(0, size, 5, int(y / spl));
    pop();
  }
}

function drawGradientCircleWithRect(size, spe, spl) {
  for(let i = 0; i < 360; i += 2){
    const rad = i / 180 * PI;
    const x = int(map(i, 0, 360, 0, spe.length));
    const y = map(spe[x], 0, 255, 0, height / 2);
    push();
    rotate(rad);
    fill(i,100,100);
    rect(0, size, 5, int(y / spl));
    pop();
  }
}
