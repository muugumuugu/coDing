//FOURIER unblend the smoothi
// fourier series for SQR WAVE:  4/pi *sin[(2n-1)theta]/2n-1
//converges to sqyare wave
let time=0;
let step=0.01;
//
let wave=[];
//
let ampCnst;
//
let ctr=5;
//



function setup() {
  createCanvas(600,400);
  ampCnst=4.0/PI;
  noFill();
  stroke(255);
}


function draw() {
  background(0);
  noFill();
  translate(150,200);
  let x=0,y=0;
  //
  for (let i=0; i<ctr; i++){
    let prevx=x;
    let prevy=y;
    let n=2*i+1;
    let radius=100*ampCnst/n;
    x+=radius*cos(n*time);
    y+=radius *sin(n*time);
    noFill();
    stroke(255,100);
    circle(prevx,prevy,radius*2);
    fill(255);
    circle(x,y,8); //circle child foot
    line(prevx,prevy,x,y);//follow circle child's foot
}

  wave.unshift(y);// stack push
  line(x,y, 0 ,wave[0]);//pen pointer
  beginShape();
  noFill();
  stroke(255,255)
  for (let i=0 ; i<wave.length; i++){
   vertex(i,wave[i]);
  }
  if (wave.length>500){wave.pop();}
  endShape();

  //
  time+=step;
}