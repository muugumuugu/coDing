const Y_AXIS = 1;
let  c1, c2;
let img;
let middle;
let frontimg;
let front;
let ads
let bgg
let text
////////////////////rain vars

//////////////////
var carx
var carspd
var carx1
var carspd1
var carx2
var carspd2
var bgm
var ledon
var ledoff
var on = false;
var onn = false;
var onads = false;
var onrain = false;
////////////
var x = 0;
var xsp = 0.2;

var x1 = 900
var x1sp = 0.6;

var x2 = 1300
var x2sp = 0.3

var x3 = 800
var x3sp = 0.9

function preload() {
  img = loadImage('CyberCity.png');
  middle = loadImage('middle.png');
  front = loadImage('front.png');
  ads = loadImage('ads.png');
  bgm = loadSound ("bgm.mp3")
  ledon = loadSound ("LEDON.mp3")
  ledoff = loadSound ("LEDOFF.mp3")
  bgg = loadImage('BackGroud.png');
  text = loadImage('text.png');
}


function setup() {
  createCanvas(1600,900);
  background(50)
carx = 650
  carspd = -1
  carx1 = 950
  carspd1 = -2
    carx2 = 1250
  carspd2 = -1.4
  // Define colors
  c1 = color(29, 45, 92);
  c2 = color(11, 20, 48);
  
  //////////////black blocks
  
  ////////////////
}

function draw() {

  background(0)
  ////////////////////////////////////////////////////// Gradient//////////////////////////////////////

  
  ///////////////////////////////////////Buildings///////////////////////////
  image (bgg, 125,100,1300,600)
  
  //////////////////////////////////////////////////////////Sky Lights
    if(onn){  
  fill(102, 153, 255);
  strokeWeight(0)
  triangle(600, 600, x, 100, x+50,100);
  x = x + xsp;
  if (x > width-50 || x < 0){
    xsp *= -1;  
  }}else{}

      if(onn){  
  fill(102, 153, 255);
  strokeWeight(0)
  triangle(900, 600, x1, 100, x1+50,100);
  x1 = x1 - x1sp;
  if (x1 > width-50 || x1 < 0){
    x1sp *= -1;  
  }}else{}
  
  
        if(onn){  
  fill(102, 153, 255);
  strokeWeight(0)
  triangle(900, 600, x2, 100, x2+50,100);
  x2 = x2 - x2sp;
  if (x2 > width-50 || x2 < 0){
    x2sp *= -1;  
  }}else{}
  
          if(onn){  
  fill(102, 153, 255);
  strokeWeight(0)
  triangle(300, 600, x3, 100, x3+50,100);
  x3 = x3 - x3sp;
  if (x3 > width-50 || x3 < 0){
    x3sp *= -1;  
  }}else{}
  
  
  
  image(img, 125, 100, 1300, 600);
  image(middle,325,135,970,565);
  image(front,205,350,1135,350);
  image(text,140,720,820,30 )
  
  

  ////////////////////////////////////////////////////////BGM Button////////////////////////////////////////
if(on){
    fill(255,0,0)  
    rect(235,720,75,30);
  }else{
fill(255)  
    rect(235,720,75,30);
  }
  
  


//////////////////////////////////////////////////////////ads Button/////////////////////////////
  if(onads){
    fill(255,0,0)
    rect(720,720,75,30)
    image(ads,285,210,1055,445);


  }else{    
    
    fill(255)
    rect(720,720,75,30)
  
    }
      //////////////////////////////////////////////////////////////Sky Light Button////////////////////////////////////////////
  if(onn){
    fill(255,0,0)  
    rect(480,720,75,30);
  }else{
fill(255)  
    rect(480,720,75,30);
  }
////////////////////////////////////////////////////CAR button///////////////////////////////
    if(onrain){
    fill(255,0,0)
    rect(960,720,75,30)
      
fill(23);
beginShape();
vertex(carx, 350);
vertex(carx+50, 350);
vertex(carx+50, 360);
vertex(carx+70, 360);
vertex(carx+70,370);
vertex(carx-20,370);
vertex(carx-20,360);
vertex(carx,360);
endShape(CLOSE);

fill(255, 51, 153)
rect(carx-18, 360,8,8)    
      
fill(255, 51, 153)
rect(carx+62, 360,8,8)

fill(102, 153, 255)
rect(carx+2, 350,46,8)
      
              
carx = carx + carspd
if (carx<0 || carx>1500){
carspd = carspd * -1}
      
      
      fill(23);
beginShape();
vertex(carx1, 550);
vertex(carx1+50, 550);
vertex(carx1+50, 560);
vertex(carx1+70, 560);
vertex(carx1+70,570);
vertex(carx1-20,570);
vertex(carx1-20,560);
vertex(carx1,560);
endShape(CLOSE);

fill(255, 51, 153)
rect(carx1-18, 560,8,8)    
      
fill(255, 51, 153)
rect(carx1+62, 560,8,8)

fill(102, 153, 255)
rect(carx1+2, 550,46,8)
      
              
carx1 = carx1 + carspd1
if (carx1<0 || carx1>1500){
carspd1 = carspd1 * -1}
      
  
      
      fill(23);
beginShape();
vertex(carx2, 150);
vertex(carx2+50, 150);
vertex(carx2+50, 160);
vertex(carx2+70, 160);
vertex(carx2+70,170);
vertex(carx2-20,170);
vertex(carx2-20,160);
vertex(carx2,160);
endShape(CLOSE);

fill(255, 51, 153)
rect(carx2-18, 160,8,8)    
      
fill(255, 51, 153)
rect(carx2+62, 160,8,8)

fill(102, 153, 255)
rect(carx2+2, 150,46,8)
      
              
carx2 = carx2 + carspd2
if (carx2<0 || carx2>1500){
carspd2 = carspd2 * -1}      
      

    
  }else{    
    fill(255)
    rect(960,720,75,30)
    }
  
noStroke()  
fill(0)  
rect(0,0,125,900)
  
noStroke()  
fill(0)  
rect(1425,0,500,900)

}





function mousePressed(){
 if(mouseX>235&&mouseX<310&&mouseY>720&&mouseY<750){ 
    if (!on){// added !on (on == false) to make sure that it is not executed when on is true
      bgm.play();
      on=true;
    }else {// so this becomes on == true 
      bgm.pause();
      on=false;
    }
  }
    
if(mouseX>480&&mouseX<555&&mouseY>720&&mouseY<750){ 
    if (!onn){// added !on (on == false) to make sure that it is not executed when on is true
      onn=true;
    }else {// so this becomes on == true 
      onn=false;

      
    }
  }  
  
  if(mouseX>720&&mouseX<805&&mouseY>720&&mouseY<750){ 
    if (!onads){// added !on (on == false) to make sure that it is not executed when on is true
      onads=true;
      ledon.play();
    }else {// so this becomes on == true 
      onads=false;
      ledon.stop();

      
    }
  }  
    if(mouseX>960&&mouseX<1350&&mouseY>720&&mouseY<750){ 
    if (!onrain){// added !on (on == false) to make sure that it is not executed when on is true
      onrain=true;
    }else {// so this becomes on == true 
      onrain=false;

      
    }
  }  
}
