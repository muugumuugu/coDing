var sound, fft, amplitude, r =230, dr = 470;


function setup(){
  createCanvas(600,600); 
  fft = new p5.FFT();
  sound = loadSound('dream.mp3',loaded);

}
function loaded(){
    fft.setInput(sound);
  sound.play();
  amplitude = new p5.Amplitude();
  amplitude.setInput(sound);
}
 
function draw(){
  background(100,10); //100,30);
  translate(width/2,height/2);  
  let waveform = fft.waveform();
  fill(255,80);
  //ellipse(0,0,450*amplitude.getLevel(),450*amplitude.getLevel());
  noFill();
  beginShape();
  stroke(255,60); // waveform is red
  strokeWeight(1);
  for (let i = 0; i< waveform.length; i+=5){
    let ang = i*360/waveform.length;
    let x = (r)*cos(radians(ang));
    let y = (r)*sin(radians(ang));
    let a = map( waveform[i], -1, 1, r-dr, r+dr)*cos(radians(ang));// ;
    let b = map( waveform[i], -1, 1, r-dr, r+dr)*sin(radians(ang));// ;
    vertex(a,b);
    push();
    strokeWeight(1);
    stroke(255,100);
    //line(x, y, a, b);
    pop();
    push();
    stroke(255);
    strokeWeight(1);
    point(a, b);
    pop();
  }
  endShape();  
}
