var Posx; //arc (body) x coordinate
var Posy; //arc (body) y coordinate
var radius; //celestial body radius
var dwidth; //width of the legs
var dheight; //height of the legs
var thecolor; //character color


function setup() {
  createCanvas(400, 400,WEBGL);
   frameRate(40) 
  
 thecolor = color(80,30,40)
  radius =30
  Posx = 4.7
  Posy = 2
  dwidth = 15
  dheight =80
   }

function draw(){
  background(90,130,160);
  
  push(); //stars
  for(var i=-200;i<50;i+=20){
    stroke('white')
    strokeWeight(4)
    point(random(-255,255),i)}
  pop();
  
  ellipse(0,-35,40,40) //person head 
  
  //invoking functions
  drawCelestialbody(radius);
  drawBodytop(Posx,Posy);
  drawBodydown(dwidth,dheight);
  }

function drawCelestialbody(radius) {//celestial body
  push()
  stroke(230,230,210);
  translate(-120,-140)
  fill(250,255,200)
  rotateY(frameCount*0.01)
  sphere(radius)
  pop();
}

  function drawBodytop(Posx,Posy) { //body top
  fill(40,90,120)
  rect(-400,50,1200,400) //dark blue rectangle - balcony
   
  fill(thecolor)
  noStroke();
  arc(Posx,Posy,41,20,radians(180),radians(360))
  quad(-16,0,25,Posy,38,Posy+70,0,70) //body
   }

  function drawBodydown(dwidth,dheight){//legs and hands
    
  fill(thecolor)
  noStroke();
    
  rect(0,70,dwidth,dheight) //leg 1
  rect(22.8,70,dwidth,dheight) //leg 2
  
  quad(-15,-0.5,-12,16,-33,50.7,-43,50.7) //hand 1
  quad(-5,20, 5,26, -13,50.7, -21,50.7) //hand 2
}
  
