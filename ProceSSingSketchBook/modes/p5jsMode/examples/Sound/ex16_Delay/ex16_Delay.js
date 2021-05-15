/**
 *  @name Delay
 *  @description
 *  Click the mouse to hear the p5.Delay process a SoundFile.
 *  MouseX controls the p5.Delay Filter Frequency.
 *  MouseY controls both the p5.Delay Time and Resonance.
 *  Visualize the resulting sound's volume with an Amplitude object.
 *
 * <p><em><span class="small"> To run this example locally, you will need the
 * <a href="http://p5js.org/reference/#/libraries/p5.sound">p5.sound library</a>
 * a sound file, and a running <a href="https://github.com/processing/p5.js/wiki/Local-server">local server</a>.</span></em></p>
 */

let soundFile, analyzer, delay;

function preload() {
  soundFormats('ogg', 'mp3');
  soundFile = loadSound('data/beatbox.mp3');
}

function setup() {
  createCanvas(710, 400);

  soundFile.disconnect(); // so we'll only hear delay

  delay = new p5.Delay();
  delay.process(soundFile, 0.12, 0.7, 2300);
  delay.setType('pingPong'); // a stereo effect

  analyzer = new p5.Amplitude();
}

function draw() {
  background(0);

  // get volume reading from the p5.Amplitude analyzer
  let level = analyzer.getLevel();

  // use level to draw a green rectangle
  let levelHeight = map(level, 0, 0.1, 0, height);
  fill(100, 250, 100);
  rect(0, height, width, -levelHeight);

  let filterFreq = map(mouseX, 0, width, 60, 15000);
  filterFreq = constrain(filterFreq, 60, 15000);
  let filterRes = map(mouseY, 0, height, 3, 0.01);
  filterRes = constrain(filterRes, 0.01, 3);
  delay.filter(filterFreq, filterRes);
  let delTime = map(mouseY, 0, width, 0.2, 0.01);
  delTime = constrain(delTime, 0.01, 0.2);
  delay.delayTime(delTime);
}

function mousePressed() {
  soundFile.play();
}
