var r = []; //array of radiuses
var a = []; // array of angles
var v = []; // array of velocity's
var nop = 5; //number of planets
var s = []; //planet size
var ssw = 0; //sun sway
var swa = 0.02; //sun sway amount
var m = 1; // mode
var n = []; // planet name
var vo = ["a","e","i","o","u"]; //vowels
var on = ["b","c","d","f","g","h","j","k","l","m","n","p","r","s","t","v","w","z"]; //other numbers
function setup() {
  createCanvas(800,800);
  background(100);

}

function draw() {
    background(0);
  
  
  translate(400,400);
  ellipse(0,0,30+ssw, 30+ssw);
for(var p = 0; p <= nop; p++){
  r.push(random(40,400));
  a.push(random(0,PI));
  v.push(random(0.001,0.1));
  s.push(random(2,30));
  n.push(on[0]+vo[0]+on[0]);
a[p]+=v[p];
  
  

    var x = r[p] * cos(a[p]);
    var y = r[p] * sin(a[p]);
  if(m === 2){
     var d = int(dist(0, 0, x, y));

  push();
  translate((0 + x) / 2, (0 + y) / 2);
  rotate(atan2(y - 0, x - 0));
  text(nfc(d, 1), 0, -5);
  //  text(n[p], 0, -5);
  pop();
    line(0,0,x,y);
  }
  if(m  === 1){
      stroke(255,193,37);
  noFill();
  ellipse(0,0,r[p]*2,r[p]*2);
    stroke(255);
    text(round(PI*(r[p]*2)),0,r[p]+10);
    
  }
        stroke(255);
    fill(255);
  ellipse(x,y,s[p],s[p]);
}
  ssw+=swa;
  if(ssw>10){
  swa = -0.2;
  }
  if(ssw<1){
  swa = 0.2;  
  }
}

function keyTyped() {
  if(key === "d" && m < 3){
  m++;  
  }
  if(key === "a" && m > 1){
    m--;
  }
  
}
