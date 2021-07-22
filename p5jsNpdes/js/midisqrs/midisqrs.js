var hover;
var osc, envelope, fft;

function setup(){
  createCanvas(windowWidth,windowHeight);
    osc = new p5.SinOsc();
    envelope = new p5.Env();
    envelope.setADSR(0.01, 0.4, 2, 0.1);
    envelope.setRange(20, 0);
    osc.start();
    osc.amp(0);
    reverb = new p5.Reverb();
    reverb.process(osc, 2, 1);
}
 
function draw(){
  background(0);
  
  if (mouseX >= 200 && mouseX <= 200+100 && mouseY >= 150 && mouseY <= 150+100) {
  hover = true
  notes(30);
  } else {
    hover = false;
  }
  
   if (mouseX >= 400 && mouseX <= 400+100 && mouseY >= 150 && mouseY <= 150+100) {
  hover = true
  notes(35);
  }else {
    hover = false;
  }

   if (mouseX >= 600 && mouseX <= 600+100 && mouseY >= 150 && mouseY <= 150+100) {
  hover = true
  notes(40); 
  fill("#00c3ff"); //blue
  }else {
    hover = false;
  }
  
   if (mouseX >= 800 && mouseX <= 800+100 && mouseY >= 150 && mouseY <= 150+100) {
  hover = true
  notes(45);  
  } else {
    hover = false;
  }
  
   if (mouseX >= 1000 && mouseX <= 1000+100 && mouseY >= 150 && mouseY <= 150+100) {
  hover = true
  notes(50);  
  } else {
    hover = false;
  }
  
   if (mouseX >= 1200 && mouseX <= 1200+100 && mouseY >= 150 && mouseY <= 150+100) {
  hover = true
  notes(55);  
  } else {
    hover = false;
  }
  
   if (mouseX >= 1400 && mouseX <= 1400+100 && mouseY >= 150 && mouseY <= 150+100) {
  hover = true
  notes(60);  
  } else {
    hover = false;
  }
  
  
  
  if (mouseX >= 200 && mouseX <= 200+100 && mouseY >= 300 && mouseY <= 300+100) {
  hover = true
  notes(40);
  } else {
    hover = false;
  }
  
   if (mouseX >= 400 && mouseX <= 400+100 && mouseY >= 300 && mouseY <= 300+100) {
  hover = true
  notes(42);
  }else {
    hover = false;
  }
  
   if (mouseX >= 600 && mouseX <= 600+100 && mouseY >= 300 && mouseY <= 300+100) {
  hover = true
  notes(44); 
  }else {
    hover = false;
  }
  
   if (mouseX >= 800 && mouseX <= 800+100 && mouseY >= 300 && mouseY <= 300+100) {
  hover = true
  notes(45);  
  } else {
    hover = false;
  }
  
   if (mouseX >= 1000 && mouseX <= 1000+100 && mouseY >= 300 && mouseY <= 300+100) {
  hover = true
  notes(47);  
  } else {
    hover = false;
  }
  
   if (mouseX >= 1200 && mouseX <= 1200+100 && mouseY >= 300 && mouseY <= 300+100) {
  hover = true
  notes(49);  
  } else {
    hover = false;
  }
  
   if (mouseX >= 1400 && mouseX <= 1400+100 && mouseY >= 300 && mouseY <= 300+100) {
  hover = true
  notes(51);  
  }else {
    hover = false;
  }

  
  if (mouseX >= 200 && mouseX <= 200+100 && mouseY >= 450 && mouseY <= 450+100) {
  hover = true
  notes(70);
  } else {
    hover = false;
  }
   if (mouseX >= 400 && mouseX <= 400+100 && mouseY >= 450 && mouseY <= 450+100) {
  hover = true
  notes(72);
  }else {
    hover = false;
  }
   if (mouseX >= 600 && mouseX <= 600+100 && mouseY >= 450 && mouseY <= 450+100) {
  hover = true
  notes(74); 
  }else {
    hover = false;
  }
   if (mouseX >= 800 && mouseX <= 800+100 && mouseY >= 450 && mouseY <= 450+100) {
  hover = true
  notes(76);  
  } else {
    hover = false;
  }
   if (mouseX >= 1000 && mouseX <= 1000+100 && mouseY >= 450 && mouseY <= 450+100) {
  hover = true
  notes(78);  
  } else {
    hover = false;
  }
   if (mouseX >= 1200 && mouseX <= 1200+100 && mouseY >= 450 && mouseY <= 450+100) {
  hover = true
  notes(80);  
  } else {
    hover = false;
  }
   if (mouseX >= 1400 && mouseX <= 1400+100 && mouseY >= 450 && mouseY <= 450+100) {
  hover = true
  notes(82);  
  } else {
    hover = false;
  }
  
  rect(200, 150, 100, 100);
  rect(400, 150, 100, 100);
  rect(600, 150, 100, 100);
  rect(800, 150, 100, 100);
  rect(1000, 150, 100, 100);
  rect(1200, 150, 100, 100);  
  rect(1400, 150, 100, 100);
  
  rect(200, 300, 100, 100);
  rect(400, 300, 100, 100);
  rect(600, 300, 100, 100);
  rect(800, 300, 100, 100);
  rect(1000, 300, 100, 100);
  rect(1200, 300, 100, 100);  
  rect(1400, 300, 100, 100);
  
  rect(200, 450, 100, 100);
  rect(400, 450, 100, 100);
  rect(600, 450, 100, 100);
  rect(800, 450, 100, 100);
  rect(1000, 450, 100, 100);
  rect(1200, 450, 100, 100);  
  rect(1400, 450, 100, 100);
  
if(hover == true){
fill(100);}
  else {
fill("#00c3ff"); 
  }

}



function notes(midiNum){
  osc.freq(midiToFreq(midiNum))
  envelope.play(osc)
}
