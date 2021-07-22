//using fast-simplex-noise 
//from https://github.com/matthiasdv/fast-simplex-noise-js

//code inspo https://necessarydisorder.wordpress.com/2018/03/31/a-trick-to-get-looping-curves-with-lerp-and-delay/
/*useful easing functions
float ease(float p) {
  return 3*p*p - 2*p*p*p;
}
 
float ease(float p, float g) {
  if (p < 0.5) 
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}
*/


var numFrames = 100;
var numPoints = 100;
var snoise;

function setup() {
  createCanvas(640, 480);
  snoise = new FastSimplexNoise({frequency: .1 , octaves: 2});
}

var motionRadius = .5;

//functions for coordinates of the points
function x1 (t){
  //return .25*width + 50*cos(TWO_PI*t);
  let seed = 1337;
  let n = map(snoise.get2DNoise( seed + cos(TWO_PI*t), sin(TWO_PI*t)),
             -1,1,0,1);//remap because fast noise is -1 to 1???
  return .25 * width + width*.25*n;
}
function y1 (t){
 // return .5*height + 50*sin(TWO_PI*t);
  let seed = 2341;
  let n = 
  map(snoise.get2DNoise( seed + cos(TWO_PI*t), sin(TWO_PI*t)),
             -1,1,0,1);
  return .8 * height + height*.25*n;
}
function x2 (t){
  return .75*width + 50*cos(1.5*TWO_PI*t);
}function y2 (t){
  return .6*height + 50*sin(1.5*TWO_PI*t);
}

function x3 (t){
  let seed = 2341;
  let n = 
  map(snoise.get4DNoise( .03*x2(t),.03 * y2(t), seed + cos(TWO_PI*t), sin(TWO_PI*t)),
             -1,1,0,1);
  return .6 * width + width*.5*n;
}function y3 (t){
   let seed = 3805;
  let n = 
  map(snoise.get4DNoise( .03*x2(t), .03*y2(t), seed + cos(TWO_PI*t), sin(TWO_PI*t)),
             -1,1,0,1);
  return .2 * height - height*.2*n;
}

function x4 (t){
  let seed = 2152;
  let n = 
  map(snoise.get4DNoise( .03*x1(t),.03 * y1(t), seed + cos(TWO_PI*t), sin(TWO_PI*t)),
             -1,1,0,1);
  return .0 + width*.5*n;
}function y4 (t){
   let seed = 9734;
  let n = 
  map(snoise.get4DNoise( .03*x1(t), .03*y1(t), seed + cos(TWO_PI*t), sin(TWO_PI*t)),
             -1,1,0,1);
  return .2 * height - height*.2*n;
}

var delayFactor = -1;
function draw() {
  var t = 1*(frameCount-1)/numFrames;
  background(60);
  
  push();
  strokeWeight(2);
  stroke(255,100);
  noFill();
  beginShape();
  for(let i = 0 ; i < numPoints; i++){
    let tt = 1.0*i/numPoints;
    //delay factor is multiplied by a factor of distance
    let x = lerp(x1(t - delayFactor*tt),x2(t - delayFactor*(1-tt)),tt);
    let y = lerp(y1(t - delayFactor*tt),y2(t - delayFactor*(1-tt)),tt);
    
    vertex(x,y);
    
  
  }
  
  //the basic idea is that you lerp based on the distance between two points as a percentage of the number of points
  //and then the delay is "how far behind" are you relative to the target's real position - this gives it a flow like quality
  //t is evaluate at time
  //tt is evaluate as where in the line, it is not time based
  //until t - delayFactor*tt combiens the two
   for(let i = 0 ; i < numPoints; i++){
    let tt = 1.0*i/numPoints;
      x = lerp(x2(t - delayFactor*tt),x3(t - delayFactor*(1-tt)),tt);
    y = lerp(y2(t - delayFactor*tt),y3(t - delayFactor*(1-tt)),tt);
    vertex(x,y);
  
  }
  
  for(let i = 0 ; i < numPoints; i++){
    let tt = 1.0*i/numPoints;
      x = lerp(x3(t - delayFactor*tt),x4(t - delayFactor*(1-tt)),tt);
    y = lerp(y3(t - delayFactor*tt),y4(t - delayFactor*(1-tt)),tt);
    vertex(x,y);
  
  }
   for(let i = 0 ; i < numPoints; i++){
    let tt = 1.0*i/numPoints;
      x = lerp(x4(t - delayFactor*tt),x1(t - delayFactor*(1-tt)),tt);
    y = lerp(y4(t - delayFactor*tt),y1(t - delayFactor*(1-tt)),tt);
    vertex(x,y);
  
  }
  
  
  endShape();
  fill(255);
  ellipse(x1(t),y1(t),10);
  ellipse(x2(t),y2(t),10);
  ellipse(x3(t),y3(t),10);
  ellipse(x4(t),y4(t),10);
  pop();
  
}
