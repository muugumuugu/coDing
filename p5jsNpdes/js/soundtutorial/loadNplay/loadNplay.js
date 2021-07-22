var song;
var sliderVolume;
let steps=[1,1,1,1];
var sliderRate;
var sliderPan;
var playpause;
var cursorb;
var skip;
var len;
var size;
var r,g,b,alpha;
var dimen=900;
var cc="--------------";
var colorcode;


//------------------------

//function preload(){
//  song=loadSound("https://upload.wikimedia.org/wikipedia/commons/9/99/Wolfgang_Amadeus_Mozart_-_Symphony_40_g-moll_-_1._Molto_allegro.ogg");
//}

//better method is to use callback so that we can have soe stuff running there

function setup() {
  createCanvas(dimen,dimen);
  r=random(60,210);
  g=random(120,220);
  b =random(180,230);
  alpha=random(160,224);
  rectMode(CENTER);
  noStroke();
  len=1;
  //-----------------------
  sliderVolume = createSlider(0,1,0.5,0.01);
  sliderRate = createSlider(0,5,1,0.01);
  sliderPan = createSlider(-1,1,0,0.01);
  //----------------------
  playpause=createButton("||");
  playpause.mousePressed(fplaypause);
  skip=createButton(">>");
  skip.mousePressed(fskip);
  cursorb=createButton("000.00");
  colorcode=createButton(cc);
  //-----------------------
  song=loadSound("https://upload.wikimedia.org/wikipedia/commons/9/99/Wolfgang_Amadeus_Mozart_-_Symphony_40_g-moll_-_1._Molto_allegro.ogg",onLoad);
  
}

//--------------------

function onLoad(){
  song.play();
  len=song.duration();
  size=width/int(len);
  var i=1;
  for (i=1 ;i <len ;i=i+5){
     song.addCue(i,fbkgr,i);
  }
    steps[0]=random(10,25)/len;
    steps[1]=random(10,25)/len;
    steps[2]=random(10,25)/len;
    steps[3]=random(10,25)/len;

}

function fbkgr(arg){
      if (r>210 || r<60){
        steps[0]=-steps[0];
      }
      if (g>220 || g<120){
        steps[1]=-steps[1];
      }
      if (b>230 || b<180){
        steps[2]=-steps[2];
      }
      if (alpha>224 || alpha<160){
        steps[3]=-steps[3];
      }
        r=r+steps[0];
        g=g+steps[1];
        b=b+steps[2]; 
        alpha=alpha+steps[3];
      var col= color(r,g,b,alpha);
      cc=nf(alpha,2,2);
      fill(col);
      rect(dimen/2,size*arg,dimen,size*5);
}

function fplaypause(){
  if (!song.isPlaying()){
    song.play();
    playpause.html("||");
  }
  else{
   song.pause();
   playpause.html("|\\<br>|/");
  }
}

function fskip(){
  song.jump(song.currentTime()+5*song.rate());
}

//----------------------

function draw() {
  //background(random(255));
  //onLoad();
  colorcode.html(cc);
  var t1,t2;
  t1=nf(song.currentTime(),2,2);
  t2=nf(len,2,2);
  cursorb.html(t1 +"/" +t2);
  song.setVolume(sliderVolume.value());
  song.rate(sliderRate.value());
  song.pan(sliderPan.value());//left right volume distribution
}
