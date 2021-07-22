 var wave;
var env;
//----
var f;
var button;
//--
var playing=false;
//--------------------------------------------
//Envelope
//Attack Decay Sustain Release envelopes for timbers and styles
//A is  t to get to req vol D  is t to get to reg vol S = volume perc of reg vol R is t to fade to silence or death vol
// sustain time fixed . to customize donn play use trigger attack and then trigger release. 
//like a no keydown buisiiness. only key press n release
//----------------------

function setup() {
  createCanvas(400,400);
  wave=new p5.Oscillator(); 
  env=new p5.Env();
  //---------------------
  button=createButton("play");
  button.mousePressed(toggle);
  f=createSlider(100,1200,440,10);
  //-------------------------
  wave.setType('sine');
  wave.start();//do first
  wave.freq(f.value()); //note A by default@440
  //wave.amp(0);
  wave.amp(env);
   //-------------------/-----
   env.setADSR(0.5,0.25,0.5,0.1);
   env.setRange(1.2,0); //Max vol, Min vol
  
}
//-------------------------

function toggle(){
    //if (playing){
    //  playing=false;
    //  background(random(255),random(128),random(64));
    //  wave.amp(0,0.5);
    //  button.html("play");
    //  }
    //else{
    //  playing=true;
    //  background(random(64),random(128),random(256));
    //  wave.amp(0.5,0.5);// alpha for crossFade .
    //  button.html("pause");
    //}
    env.play();
}

//------------------------
function draw() {
  
  wave.freq(f);
}
