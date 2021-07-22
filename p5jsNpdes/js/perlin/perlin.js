 var xoff=0;
 var start=0;
 var yoff=1000;
 var inc=0.02;
 function setup() {
  createCanvas(400,400);
}


function draw() {
  background(51);
  noFill();
  beginShape();
  xoff=start;
  for (var x= 0 ; x <width ; x++){
    stroke(255);
    vertex(x,noise(xoff)*height);
    xoff+=inc;
  }
  endShape();
  start+=inc
  //noLoop();
  //var x=map(noise(xoff),0,1,0,width);
  //var y=map(noise(yoff),0,1,0,width);
  //xoff+=0.02
  //yoff+=0.02
  //ellipse(x,y,24,24);
}
