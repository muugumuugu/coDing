var button;
let pitch;
let audioContext;
let mic;
var tuning4=true;
var alltones=false;
let diff;
let freq;
let notes=[
{note:"A4",f:440},
{note:"E4",f:329.6276},
{note:"C4",f:261.6256},
{note:"G4",f:391.9954}
];
let closestNote=-1;
let recordDiff;
let low;
let high;


function setup() {
  createCanvas(600,600);
  button= createButton("NOTE");
  button.mousePressed(toggle);
  textAlign(CENTER);
  recordDiff=9999;
  colorMode(HSB);
  fill(100,100,0);
  audioContext=getAudioContext();
  mic=new p5.AudioIn();
  textSize(64);
  mic.start(listening);
}

//--------
function toggle(){
if (tuning4){
  alltones=true;
  low=0;
  high=1000;
  tuning4=false;}
else{
  alltones=false;
  low=100;
  high=500;
  tuning4=true;
}
}

function listening(){
    console.log("listening");
    //--
    pitch=ml5.pitchDetection(
    "./model/",
    audioContext,
    mic.stream,
    modelLoaded);
}
function modelLoaded(){
  console.log("model loaded");
  pitch.getPitch(gotPitch);
}
function gotPitch(error,frequency){
 if (error){
   console.error(error);}
   else{
     console.log(frequency);
     if (frequency==null){freq=0;}
      else{freq=frequency;}
   }
   closestNote=-1;
   recordDiff=9999;
   for ( let i=0;i<notes.length;i++){
     diff=freq-notes[i].f;
     if (abs(diff)<recordDiff){
     closestNote=i;
     recordDiff=abs(diff);
   }
   }
   
  background(map(freq,low,high,0,360),100,100);
  text(nf(freq,2,2),width/2,height/2);
  let str;
  if (tuning4){str=notes[closestNote].note + "diff"+ nf(recordDiff,2,2);}
  else if (alltones){
   str=nf(int(freq)%12,2,2);}
   button.html(str);
 
  pitch.getPitch(gotPitch);
}
//----------
function draw() {

}
