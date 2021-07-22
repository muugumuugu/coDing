//MusicCircle
class MusicCircle{
  // El constructor es lo que hace al bebe, y lo pone en la memoria.
  constructor(nS){
    this.numSections = nS;
    this.pitch = [0,4,2,9,7,11,4];
    this.osc = new p5.Oscillator('triangle');
    this.env = new p5.Env();
    this.amp = new p5.Amplitude();
    this.osc.freq(midiToFreq(48));
    this.osc.amp(0.1);
    this.ox = width/2;
    this.oy = height/2;
    this.freq1= 0.5;
    this.dur = 0.166 / this.freq1;
    this.env.set(0.01*this.dur, 0.3, 0.001*this.dur, 0.2, 0.989*this.dur, 0.0);
    this.rad1= 150;
    this.ang1= 0;
    this.angDiv= [];

    for(let i= 0; i < this.numSections; i= i+1){
      this.angDiv[i] = i*TWO_PI/this.numSections;
    }
    this.time= 0;
    this.section= 0;
    this.psection = this.numSections;
    this.playing = false;
    this.note = 0;
    this.r = 200;
    this.g = 50;
    this.b = 120;
    this.ar = 10;
    this.ab = 210;
  }

draw(){
  let x, y;
  this.time1= millis()/1000;

  this.ang1= 2*PI*this.freq1*this.time1;
  this.ang1= this.ang1 % TWO_PI;

  x = this.ox + this.rad1*cos(this.ang1);
  y = this.oy + this.rad1*sin(this.ang1);
  this.x1 = x;
  this.y1 = y;

  for (let i= 0; i < this.numSections; i= i+1){
      stroke(250,25);
      strokeWeight (3);
  }

//Círculo que gira.
 this.psection = this.section;
 this.section = this.thrCheck(this.ang1);

if (this.psection != this.section){
   this.env.play();
   if(this.playing){
      for(let i = 0; i < this.numSections; i = i+1){
        stroke(255,255);
        strokeWeight(5);
        let radi = 50;
      }
    }
  }

 //print(this.section);
 fill (this.r,255,255);
 ellipse(x, y-10, 20+sz, 20+sz);  //??
  sz+=.001;
}

click(){
  //this.amp.setInput(this.osc);
  if(this.playing== false){
    this.playing = true;
    this.osc.start();
    this.osc.freq(midiToFreq(this.note));
    this.osc.amp(this.env);
  } else{
    this.osc.stop();
    this.playing = false;
  }
}

thrCheck (cAng){
  for(let i=0; i < this.numSections-1; i= i+1){

      if (cAng > this.angDiv[i] && cAng<= this.angDiv[i+1]){
        this.r = 255*i/this.numSections;
        this.g = 0;
        this.b = 70;
        let indx = i % this.pitch.length;
        this.osc.freq(midiToFreq(this.pitch[indx]+this.note));
        return i+1;
      }
    }
      if (cAng > this.angDiv[this.numSections-1] && cAng <= TWO_PI){
        this.r= 255*(this.numSections-1)/this.numSections;
        this.g= 130;
        this.b= 20;
        let indx = (this. numSections-1) % this.pitch.length
        this.osc.freq(midiToFreq(this.pitch[indx] + this.note));
        return this.numSections;
      }
  }
}
