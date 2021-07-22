
var sound, fft, amplitude, r = 300, dr = 70;
let pointPs = [];
let pointVs = []
let nPoints = 100;
let speed = 1.5;
let connectionRad = 150;
let boundingBoxOffset = connectionRad;
let showStats = false;
let statsLastUpdated;
let fps;

function preload(){ 
  sound = loadSound('dream.mp3');
} 

function setup(){
  createCanvas(1000,1000); 
  fft = new p5.FFT();
  fft.setInput(sound);
  sound.play();
  amplitude = new p5.Amplitude();
  amplitude.setInput(sound);
    for (let i = 0; i < nPoints; i++) {
    pointPs.push(createVector(random(-boundingBoxOffset, width + boundingBoxOffset), random(-boundingBoxOffset, height + boundingBoxOffset)));
    pointVs.push(p5.Vector.random2D().mult(speed));
  }
  statsLastUpdated = millis();
}
 
function draw(){
  background(50,170);
    boundingBoxOffset = connectionRad;
  if (millis() - statsLastUpdated > 1000) {
    fps = frameRate().toFixed(2);
  }
  
  for (let i = 0; i < nPoints; i++) {
    // draw individual points if onscreen
    if (pointPs[i].x >= -5 && pointPs[i].x <= width+5 && pointPs[i].y >= -5 && pointPs[i].y <= width+5) {
      stroke(255, 150);
      strokeWeight(10);
      point(pointPs[i].x, pointPs[i].y);
    }
    
    // draw connections to other points
    for (let j = i + 1; j < nPoints; j++) {
      let dist = p5.Vector.dist(pointPs[i], pointPs[j])
      if (dist <= connectionRad) {
        stroke(255, map(dist, 0, connectionRad, 150, 0));
        strokeWeight(2);
        line(pointPs[i].x, pointPs[i].y, pointPs[j].x, pointPs[j].y);
      }
    }
    
    // update point positions with velocities
    pointPs[i].add(pointVs[i]);
    
    // loop around bounding box edges
    if (pointPs[i].x < 0 - boundingBoxOffset) {
      pointPs[i].x = width + boundingBoxOffset;
    }
    if (pointPs[i].x > width + boundingBoxOffset) {
      pointPs[i].x = 0 - boundingBoxOffset;
    }
    if (pointPs[i].y < 0 - boundingBoxOffset) {
      pointPs[i].y = height + boundingBoxOffset;
    }
    if (pointPs[i].y > height + boundingBoxOffset) {
      pointPs[i].y = 0 - boundingBoxOffset;
    }
  }
  
  // Show statistics
  if (showStats) {
    textSize(16);
    stroke(0, 0);
    fill(255, 200);
    text("FPS: " + fps + "\nConnection Rad: " + connectionRad, 20, 20, width/2, 100);
  }
  translate(width/2,height/2);  
  let waveform = fft.waveform();
  fill(255,80);
  ellipse(0,0,50+350*amplitude.getLevel(),50+350*amplitude.getLevel());
  
  noFill();
  beginShape();
  stroke(255,100); // waveform is red
  strokeWeight(1);
  for (let i = 0; i< waveform.length; i+=15){
    let ang = i*360/waveform.length;
    let x = (r)*cos(radians(ang));
    let y = (r)*sin(radians(ang));
    let a = map( waveform[i], -1, 1, r-dr, r+dr)*cos(radians(ang));// ;
    let b = map( waveform[i], -1, 1, r-dr, r+dr)*sin(radians(ang));// ;
    vertex(a,b);
    push();
    strokeWeight(1);
    stroke(255,100);
    line(x, y, a, b);
    pop();
    push();
    stroke(255);
    strokeWeight(2);
    point(a, b);
    pop();
  }
  endShape();  
}

function mousePressed(){
  if(!sound.isPlaying())sound.play();
}
