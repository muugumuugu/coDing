var x0,y0,x,y,x1,y2,a,b,c,d;
var time0,time1;


function setup(){
  createCanvas(600, 600);
  background(0);
  //初期値を設定する
  x=0;
  y=0;
  a=1.300;
  b=1.700;
  c=1.750;
  d=1.3;
  time1=-1;
}

function draw(){
  //描画
  noStroke();
  fill(255);
  push();
  translate(width/2,height/2);
  ellipse(x*100,y*100,1,1);  //×100倍に拡大して表示
  pop();
  //座標更新
  x0 = x;
  y0 = y;
  x1 = sin(a*y0)-cos(b*x0);
  y1 = sin(c*x0)-cos(d*y0);
  x = x1;
  y = y1;
  
  text("a=", 500, 500);  text(a, 520, 500);
  text("b=", 500, 520);  text(b, 520, 520);
  text("c=", 500, 540);  text(c, 520, 540);
  text("d=", 500, 560);  text(d, 520, 560);
  time0 = floor(frameCount/60);
  if(time1<time0){
    time1 = time0;
    fill(0);
    rect(490,570,600,600);
    fill(255);
    text("time[s]=", 500, 580);  text(floor(frameCount/60), 555, 580);
  }

}
