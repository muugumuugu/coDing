var inc=0.1;
var scl=10;
var cols,rows;
var yoff,xoff,zoff=0;
var fr;
var particles=[];

function setup() {
  createCanvas(200,200);
  cols=floor(width/scl);
  rows=floor(height/scl);
  fr=createP('');
  
  flowfield=new Array(cols*rows);
  
  for ( var i=0; i<100; i++){
  particles[i]=new Particle();
  }
    background(255);
}

function draw() {
  xoff=0;
  for (var x = 0; x <cols; x++){
    var yoff=0;
      for (var y = 0; y <rows; y++){
        var index=(x+y*cols);
        var angle=noise(xoff,yoff,zoff)*TWO_PI*4;
        var v =p5.Vector.fromAngle(angle);
        v.setMag(1);
        flowfield[index]=v;
        yoff+=inc;
        stroke(0);
        //push();
        //translate(x*scl,y*scl);
        //rotate(v.heading());
        //strokeWeight(1);
        //line(0,0,scl,0);
        //pop();
      }
      xoff+=inc;
      zoff+=0.0004;
  }
  for (var i=0; i<particles.length; i++){
  particles[i].follow(flowfield);
  particles[i].update();
  particles[i].edges();
  particles[i].show();
  }
  fr.html(floor(frameRate()));
}
