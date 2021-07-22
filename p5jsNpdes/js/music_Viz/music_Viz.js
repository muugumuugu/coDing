//variable for all
var song;
var song1;
var song2;
var song3;
var song4;
var volume;
var rate;
var pan;
var playButton;
var jumpButton;
var selectViz;
var songSelect;
var headerImg;
var selectVizCount=3;
var songLoading=0;


//variables for bubbles
var amp;
var circ = [];
var graph = [];
var xIncrement = 50;
var fft;
var mappedSpectrum=[];
var mappedWiggle=[];

//variables for radial
var amplitude;
var fft1;
var mappedSpectrum1;
var freqAtTime = [];
var collecFreq = [];
var countArray = 0;
var mappedAngle = [];
var radialCount=0;

//variables for lines
var amplitude1 = -500;
var angle = 0;
var particleVortex = [];
var changeDir = 1;
var splashCount = [0];
var mappedAmpValue;
var vertexAmp;
var linesCount=0;
var dia1;





function LineAmp(lineX, lineY) {
  this.xValue = lineX;
  this.yValue = lineY;
}

function CircF(radiusCirc) {
  this.radius = radiusCirc;
  this.color = color(255, random(21, 133), 5, random(2, 200));
}




function preload() {
  headerImg=loadImage("Header.png");
}


function setup() {
  
  //for all
  createCanvas(windowWidth, windowHeight);
  song1 = loadSound("https://upload.wikimedia.org/wikipedia/commons/2/24/Mozart_-_Eine_kleine_Nachtmusik_-_1._Allegro.ogg", loaded);
  song2 = loadSound("https://upload.wikimedia.org/wikipedia/commons/c/c7/Beethoven_-_Fifth_Symphony_-_Last_movement%2C_dominant_seventh.mid", loaded);
 song3 = loadSound("https://upload.wikimedia.org/wikipedia/commons/4/47/Beethoven_Moonlight_2nd_movement.ogg", loaded);
  song4=loadSound("https://upload.wikimedia.org/wikipedia/commons/1/15/For_Elise_%28F%C3%BCr_Elise%29_Beethoven_JMC_Han.ogg",loaded);
  song=song1;
  background(230);
  toggleSliders();
  
  
  //for bubbles
  amp = new p5.Amplitude();
  fft = new p5.FFT(0,64);
  
  //for radial
  amplitude = new p5.Amplitude();
  fft1 = new p5.FFT(0, 32);
  
  // for lines
  amp2 = new p5.Amplitude();
  particleFormation();

}

function draw() {
  
  header();
  if (songLoading === 0) {
    push();
    textSize(30);
    fill(255);
    textFont("Lato Light");
    text("Loading...", width / 2-30, height / 2);
    pop();
  } else {
    
    if (selectVizCount === 1) {
      bubbleViz();
    } else if (selectVizCount === 2) {
      radial();
    } else if (selectVizCount === 3) {
      lines();
    }

  }
  
 
}


function header(){
  background(0);
  screenText();
  song.setVolume(volume.value());
  song.rate(rate.value());
  image(headerImg,width/2-300,25,600,200);
  
}

function bubbleViz(){
  var spectrum=fft.analyze();
  for(var i=0;i<spectrum.length;i++){
    fill(255,i*4,0);
    var amp=spectrum[i];
    var y=map(amp,0,300,0,height);
    mappedSpectrum[i] = map(amp,0,400,10,500);
    mappedWiggle[i]=map(mappedSpectrum[i],10,500,1,10);
    
  }
  
  var spcount=1;
  for(var j=0;j<spectrum.length-20;j+=2){
  if(mappedSpectrum[j]>20){
    fill(255,100,j*5,25);
  }  else{
    fill(150,75);
  }
  
  if (spcount%2===0){
  ellipse(width/3+j*15+random(mappedWiggle[j],-mappedWiggle[j]),height/2+random(mappedWiggle[j],-mappedWiggle[j]),mappedSpectrum[j],mappedSpectrum[j]);
  }
  else{
  ellipse(width/3+j*15+random(mappedWiggle[j],-mappedWiggle[j]),height/2+70+random(mappedWiggle[j],-mappedWiggle[j]),mappedSpectrum[j],mappedSpectrum[j]);  
  }
  spcount++;
  }
  
  var spcount=1;
  noStroke();
  for(var k=2;k<spectrum.length-20;k+=2){
    
  if(mappedSpectrum[k]>20){
    fill(255,100,k*5,25);
    
  }  else{
    fill(150,75);
    stroke(0,50);
  }
  
  if (spcount%2===0){
  ellipse(width/3+k*15+random(mappedWiggle[k],-mappedWiggle[k]),height/2+random(mappedWiggle[k],-mappedWiggle[k]),mappedSpectrum[k],mappedSpectrum[k]);
  }
  else{
  ellipse(width/3+k*15+random(mappedWiggle[k],-mappedWiggle[k]),height/2+70+random(mappedWiggle[k],-mappedWiggle[k]),mappedSpectrum[k],mappedSpectrum[k]);  
  }
  spcount++;
  }
  
  
}


function radial(){
  
  
  var level1 = amplitude.getLevel();
  var level2=map(level1,0,volume.value(),0,225);

  
  fill(255, 0, 0);
  var spectrum = fft1.analyze();
  // console.log(spectrum.length);
  collecFreq[countArray] = [];


  for (var i = 0; i < spectrum.length - 11; i++) {
    var amp = spectrum[i];
    mappedSpectrum1 = map(amp, 0, 400, 100, 800);
    freqAtTime[i] = mappedSpectrum1;
    mappedAngle[i] = map(i, 0, spectrum.length - 1 - 11, 0, 360);
    collecFreq[countArray][i] = mappedSpectrum1;
  }

  translate(width / 2, height / 2);
  rotate(frameCount / 1000);
  for (var j = 0; j < collecFreq.length; j++) {
    // beginShape();
    noFill();

    for (var k = 0; k < collecFreq[j].length; k++) {
      push();
      noStroke();
      var kolor = map(collecFreq[j][k], 100, 800, 0, 400);
      var size = map(kolor, 0, 255, 5, 100);
      var x = collecFreq[j][k] * cos(radians(mappedAngle[k]));
      var y = collecFreq[j][k] * sin(radians(mappedAngle[k]));

      if (collecFreq[j][k] > 150) {
        fill(kolor, level2, mappedAngle[k], 15);
      } else {
        fill(150, 25);
      }
      ellipse(x, y, size, size);
      

    }
  

  }

  if (radialCount > 20) {
    collecFreq[countArray - 20].splice(0, 32);
  }





  countArray++;
  radialCount++;
  
}

function lines(){
  
  if(linesCount===0){
     particleFormation();
  }
  
  
  linesCount++;
  var vol1 = amp2.getLevel();
  
  if(songSelect.value()=='Eine Kleine'){
    dia1 = map(vol1, 0, 0.5, 50, 1600);
  }else if(songSelect.value()=='5th Symphony'){
    dia1 = map(vol1, 0, 0.5, 50, 1000);
  }else if(songSelect.value()=='Moonlight Sonata'){
    dia1 = map(vol1, 0, 0.5, 50, 1600);
  }else if(songSelect.value()=='Fur Elise'){
    dia1 = map(vol1, 0, 0.5, 50, 3500);
  }
  
  
  
  var ampCountTrigger = 3;
  var ampCount=-1;
  
 

  rectangleCircle();


  noStroke();
  push();
  translate(width / 2, height / 2);

  if(splashCount.length>1){
    for(var i=0;i<=50;i++){
      shorten(particleVortex[0]);
    }
  }

  if (dia1 > 500) {
    if(ampCountTrigger===3){
     ampCount = 0;
     ampCountTrigger=0;
    }
    
    if (ampCount % 100 === 0) {
      

      var newCount = 0;
      splashCount.push(newCount);
      particleFormation();
      ampCountTrigger = 1;
    }
  }
  
  splash();

  if (ampCount != -1) {
    ampCount++;
  }
  
 
  
  for (var i = 0; i < splashCount.length; i++) {
    splashCount[i]++;
  }
  pop();
  
  
}

function rectangleCircle() {
  var vol1 = amp2.getLevel();
  // var dia1 = map(vol1, 0, 0.5, 50, 1600);
  rectMode(CENTER);
  noFill();
  circ.push(dia1);
  push();
  translate(width / 2, height / 2);
  rotate(radians(frameCount));


  for (var i1 = 0; i1 < circ.length; i1++) {
    strokeWeight(1);
    // fill(255, random(15,210), 0, 3)
    stroke(255, random(15, 210), 0, 75);
    if (i1 % 2 === 0) {
      rect(0, 0, circ[i1], circ[i1]);
    } else {
      ellipse(0, 0, circ[i1] - 50, circ[i1] - 50);
    }
  }

  if (linesCount > 15) {
    circ.splice(0, 1);
  }
  pop();
}


function splash() {
  for (var l = 0; l < splashCount.length; l++) {
    for (var i = 0; i < particleVortex[l].length; i++) {
      fill(particleVortex[l][i].color);
      particleVortex[l][i].animation(l);
      particleVortex[l][i].display();
    }
  }

}

function particleFormation() {
  var k = 0;
  for (var l = splashCount.length - 1; l < splashCount.length; l++) {
    particleVortex[splashCount.length - 1] = [];
    for (var j = 0; j < 2; j++) {
      for (var i = 0; i < 25; i++) {
        particleVortex[l][k] = new Particle(0, 0, amplitude1 - i * (10));
        k++;
      }
    }

  }
}

function Particle(x, y, amp1) {
  this.speed = random(0.1, 1.5);
  this.name = "astroid";
  this.color = color(255, random(21, 133), 5, random(2, 200));
  this.posX = x;
  this.posY = y;
  this.angle = random(0, 360);
  this.size;
  this.amplitude = amp1;
  this.sizeAmplitude = random(0.1, 5);


  this.animation = function(i) {
    this.posY = sin(radians(this.angle)) * 0.25 * this.amplitude * splashCount[i] / 30;
    this.posX = cos(radians(this.angle)) * this.amplitude * splashCount[i] / 30;
    this.size = sin(radians(this.angle / 2 + 135)) * this.sizeAmplitude;
    this.angle = this.angle + this.speed * changeDir;
  }

  this.display = function() {

    ellipse(this.posX, this.posY, this.size, this.size);
  }

}


function togglePlaying() {
  if (!song.isPlaying()) {
    
    song.play();
    playButton.html("Pause");
  } else {
    
    song.pause();
    playButton.html("Play");
  }
}

function loaded() {
  songLoading++;
  console.log("Loaded");

}

function jumpPlaying() {
  songLen = song.duration();
  song.jump(random(songLen));
}

function changeBackground() {
  background(random(255), random(255), random(255));
}

function toggleSliders() {
  volume = createSlider(0, 1, 0.5, 0.05);
  rate = createSlider(0, 2, 1, 0.05);
  

  songSelect = createSelect();
  songSelect.option('Eine Kleine');
  songSelect.option('5th Symphony');
  songSelect.option('Moonlight SOnata');
  songSelect.option('Fur Elise');
  songSelect.changed(changedSong);
  
  
  selectViz =createSelect();
  selectViz.option('Lines');
  selectViz.option('Bubbles');
  selectViz.option('Radial');
  
  selectViz.changed(changedViz);
  

  playButton = createButton("Play");
  playButton.mousePressed(togglePlaying);

  jumpButton = createButton("Jump");
  jumpButton.mousePressed(jumpPlaying);
  
  
  
  
  songSelect.position(width / 2-200, height-150);
  selectViz.position(width / 2+140, height-150);
  jumpButton.position(width / 2 + 200, height-100);
  playButton.position(width / 2+150, height-100);
  volume.position(width / 2 - 240, height-100);
  rate.position(width / 2, height-100);
  

}

function screenText(){
  textSize(20);
  fill(0,174,239);
  text("Select Song:",width/2-325,height-135);
  text("Select Visualization:",width/2-50,height-135);
  text("Volume",width/2-325,height-85);
  text("Speed",width/2-65,height-85);
  
}

function changedSong(){
  
  if (song.isPlaying()) {
    togglePlaying();
  } 
  
  if(songSelect.value()=='Eine Kleine'){
    song=song1;
  }else if(songSelect.value()=='5th Symphony'){
    song=song2;
  }else if(songSelect.value()=='Moonlight SOnata'){
    song=song3;
  }else if(songSelect.value()=='Fur Elise'){
    song=song4;
  }
}

function changedViz(){
   if (song.isPlaying()) {
    togglePlaying();
  }
  if(selectViz.value()=='Bubbles'){
    selectVizCount=1;
  }
  if(selectViz.value()=='Radial'){
    selectVizCount=2;
  }
  if(selectViz.value()=='Lines'){
    selectVizCount=3;
  }
  
}

function mousePressed() {
  changeDir = changeDir * (-1);
}
