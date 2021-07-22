const scl=30;
let cols,rows;
let w = 1600;
let h = 1600;
let terrain = [];
let flying=0;
let sound;
let analyzer;
let fft;

function preload(){
  sound = loadSound('./let_it_flow.mp3'); //let_it_flow
}

function setup(){
  createCanvas(windowWidth,windowHeight,WEBGL);
  cols = w/scl;
  rows = h/scl;
  
  analyzer=new p5.Amplitude();
  analyzer.setInput(sound);
  
  fft = new p5.FFT();
  
  sound.play();


  
  for (let x=0; x<cols; x++){
    
    terrain[x]=[];
    for (let y=0; y<rows; y++){
      
      terrain[x][y]=0;
      

    }
    
  

}
}

function draw(){
  
  //音量
  var rms= analyzer.getLevel();
  fft.analyze();
  
  
  //低・中・高の音量を抽出
  var bass = fft.getEnergy("bass");
  var mid = fft.getEnergy("mid");
  var treble = fft.getEnergy("treble");
  
  //ふたつカゲボウシ
  //var c_bass= map(bass,110,290,0,255); //180-290
  //var c_mid= map(mid,110,200,0,255);   //150-200
  //var c_treble= map(treble,0,90,0,255);   //0-90
  //print([bass,mid,treble]);
  
  // 音量を色に範囲付け
  //let_it_flow
  var c_bass= map(bass,0,490,0,255); //180-290
  var c_mid= map(mid,0,200,0,255);   //150-200
  var c_treble= map(treble,0,130,0,255);   //0-90
  //print([bass,mid,treble]);
  //print([c_bass,bass]);
  //var c_bass= map(bass,90,300,0,255); 
  //var c_mid= map(mid,90,190,0,255);   
  //var c_treble= map(treble,30,120,0,255);
  
  
  
  
  flying -=0.1;
  let yoff = flying;
  for (let y=0; y<rows; y++){
      let xoff=0;
      for (let x=0; x<cols; x++){
        terrain[x][y]=map(noise(xoff*rms,yoff*rms),0,1,-150,150);
        xoff+=0.2;

    }
    yoff+=0.2;
  

}
  
  background(0);
  //線の色
  stroke(c_bass,c_mid,c_treble);
  noFill();
  
  
  translate(0,50);
  rotateX(PI/3);
  
  
  translate(-w/2, -h/2)
  for (let y=0; y<rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for (let x=0; x<cols; x++){
      vertex(x*scl,y*scl,terrain[x][y]);
      vertex(x*scl,(y+1)*scl,terrain[x][y+1]);
  }
  endShape();
  
  }
  
  
}
