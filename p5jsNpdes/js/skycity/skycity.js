var from, to, interA, interB, interC;
var WIN //window opacity

//starTimer
var timer =0

//stars
var str_FLASH_1
var str_FLASH_2
var str_FLASH_3
var str_FLASH_4
var str_FLASH_5
var str_FLASH_6
var str_FLASH_7
var str_FLASH_8
var str_FLASH_9
var str_FLASH_10
var str_FLASH_11
var str_FLASH_12
var str_FLASH_13

var sr,sg,sb,mnO,mxO

var h



//topLight
var lightRD;
var pulseSP= 4;

//clouds
var clX1,clY1,clW1,clH1
var clX2,clY2,clW2,clH2

var mnX,mnY,mnD

//SUNSET VARIABLES
var sunsOP
var pulseSUN= 0

  //buildings_background
  var bd_B_SUNSET
  var bd_B_NIGHT

  //buildings_foreground
  var bd_F_SUNSET
  var bd_F_NIGHT

  //windows_off
  var w_o_SUNSET
  var w_o_NIGHT
  var w_o_SUNSET_ALT
  
  //windows_on
  var w_on_SUNSET
  var w_on_NIGHT
  
  //clouds
  var cl_SUNSET
  var cl_NIGHT
  
  //moon
  var m_SUNSET
  var m_NIGHT
  
//window_on_trigger
  var w_on_TRIGGER1
  var w_on_TRIGGER2

  
  
  
  
  

function setup() {
  
  frameRate(120);
  
  lightRD = 200;

//lerp_function(in place of solid background)
  createCanvas(900, 600);
  from = color(8, 8, 85);
  to = color(32, 6, 114);
  interA = lerpColor(from, to, 0.33);
  interB = lerpColor(from, to, 0.66);
  interC = lerpColor(from, to, 0.80);
  
  //sunset
  sunsOP = 0
  
  //window_opacity
  WIN = 150
  
  //star_master
  sr = 249;
  sg = 238;
  sb = 79;
  mnO = 60;
  mxO = 140;
  
  str_FLASH_1 = random(mnO,mxO)
  str_FLASH_2 = random(mnO,mxO)
  str_FLASH_3 = random(mnO,mxO)
  str_FLASH_4 = random(mnO,mxO)
  str_FLASH_5 = random(mnO,mxO)
  str_FLASH_6 = random(mnO,mxO)
  str_FLASH_7 = random(mnO,mxO)
  str_FLASH_8 = random(mnO,mxO)
  str_FLASH_9 = random(mnO,mxO)
  str_FLASH_10 = random(mnO,mxO)
  str_FLASH_11 = random(mnO,mxO)
  str_FLASH_12 = random(mnO,mxO)
  str_FLASH_13 = random(mnO,mxO)
  
  //cloud_1_master
  h = height/5
  clX1 = -100
  clH1 = 110
  clW1 = 180
  clY1 = 260
  
  //cloud_2_master
  clX2 = 890
  clY2 = 50
  clW2 = 190
  clH2 = 100
  
  //moon_master
  mnX = 100
  mnY = 90
  mnD = 80
  
  //buildings_background_color
  bd_B_SUNSET = color(37,35,100, 255);
  bd_B_NIGHT = color(37,35,100, 255);
  
  //buildings_foreground_color
  bd_F_SUNSET = color(0,0,20,255);
  bd_F_NIGHT = color(0,0,20,255);
  
  //window_off_color
  w_o_SUNSET = color(41,41,41,120);
  w_o_NIGHT = color(41,41,41,120);
  
  w_o_SUNSET_ALT = color(41,41,41,120);
  
  //window_on_color
  w_on_SUNSET = color(212,198,0,WIN);
  w_on_NIGHT = color(212,198,0,WIN);
  
  //cloud_color
  cl_SUNSET = color(172,78,125,120);
  cl_NIGHT = color(72,78,125,120);
  
  //moon_color
  m_SUNSET = color (255,248,199,255);
  m_NIGHT = color (255,248,199,255);
  
}









function draw() {
  
  
//background_gradient
  noStroke();
  fill(from);
  rect(0, 450, 900, 200);
  fill(interA);
  rect(0, 300, 900, 150);
  fill(interB);
  rect(0, 170, 900, 130);
  fill(interC);
  rect(0, 70, 900, 110);
  fill(to);
  rect(0, 0, 900, 70);
  
//sunset_fade
  noStroke();
  fill(255,185,0,sunsOP);
  sunsOP += pulseSUN;
  if(sunsOP > 70){
    pulseSP = pulseSP * -1;
   }
  rect(0,0,900,600);

//star_timer
  timer = timer +0;
  if(timer > 30){
    
    str_FLASH_1 = random(mnO,mxO);
    str_FLASH_2 = random(mnO,mxO);
    str_FLASH_3 = random(mnO,mxO);
    str_FLASH_4 = random(mnO,mxO);
    str_FLASH_5 = random(mnO,mxO);
    str_FLASH_6 = random(mnO,mxO);
    str_FLASH_7 = random(mnO,mxO);
    str_FLASH_8 = random(mnO,mxO);
    str_FLASH_9 = random(mnO,mxO);
    str_FLASH_10 = random(mnO,mxO);
    str_FLASH_11 = random(mnO,mxO);
    str_FLASH_12 = random(mnO,mxO);
    str_FLASH_13 = random(mnO,mxO);
    
    timer = 0;
  }

  
//stars//
  
  fill(sr,sg,sb, str_FLASH_1);
    rect(260,40,5,5);
  fill(sr,sg,sb, str_FLASH_2);
    rect(210,70,5,5);
  fill(sr,sg,sb, str_FLASH_3);
    rect(240,105,5,5);
  fill(sr,sg,sb, str_FLASH_4);
    rect(220,250,5,5);
  fill(sr,sg,sb, str_FLASH_5);
    rect(600,140,5,5);
  fill(sr,sg,sb, str_FLASH_6);
    rect(510,90,5,5);
  fill(sr,sg,sb, str_FLASH_7);
    rect(560,60,5,5);
  fill(sr,sg,sb, str_FLASH_8);
    rect(630,220,5,5);
  fill(sr,sg,sb, str_FLASH_9);
    rect(400,140,5,5);
  fill(sr,sg,sb, str_FLASH_10);
    rect(150,180,5,5);
  fill(sr,sg,sb, str_FLASH_11);
    rect(800,120,5,5);
  fill(sr,sg,sb, str_FLASH_12);
    rect(710,90,5,5);
  fill(sr,sg,sb, str_FLASH_13);
    rect(820,40,5,5);
  
  
//moon//
  
    var tempColor0 = lerpColor(m_NIGHT,m_SUNSET,sunsOP/80);
    fill(tempColor0);
  
    circle(mnX,mnY,mnD);
    mnX = mnX + .04;
    mnY = mnY + .01;
  
  
//buildings_background//
    
    var tempColor1 = lerpColor(bd_B_NIGHT,bd_B_SUNSET,sunsOP/80);
    fill(tempColor1);
    
    //b_1
    rect(50,220,90,500);
    rect(80,270,90,500);
    //b_2
    rect(240,360,90,500);
    //b_3
    rect(160,480,90,500);
    //b_4
    rect(310,410,90,500);
    rect(330,480,90,500);
    //B_5
    rect(450,170,90,500);
    rect(450,100,40,500);
    //b_6
    rect(610,330,100,500);
    rect(680,180,100,500);
  
//clouds
  
    var tempColor2 = lerpColor(cl_NIGHT,cl_SUNSET,sunsOP/80);
    fill(tempColor2);
  
    //cl_1
    rect(clX1,clY1,clW1,clH1);
    rect(clX1 + 180, clY1 + 40, 50, 70);
    rect(clX1 - 69.9, clY1 + 65, 70, 45);
    clX1 = clX1 + .2;
    //cl_2
    rect(clX2,clY2,clW2,clH2);
    rect(clX2 - 39.9, clY2 + 40, 40, 60);
    rect(clX2 + clW2, clY2 + 65, 50, 35);
    clX2 = clX2 - .2;

    
//b_7_skylight
  
    //fill(0,0,0)
    
  
    //var tempColor3 = lerpColor(w_on_NIGHT,w_o_SUNSET_ALT,sunsOP/80);
    //fill(tempColor3);
  

  
  
//buildings_foreground//
  
    if(clX2 < 632){
      fill(w_on_NIGHT)
    }
    if(clX2 > 632){
      fill(w_on_SUNSET)
    }
    rect(580,410,180,20);
  
    var tempColor4 = lerpColor(bd_F_NIGHT,bd_F_SUNSET,sunsOP/80);
    fill(tempColor4);

  
    //b_1
    rect(0,240,70,500);
    rect(40,280,70,500);
    //b_2
    rect(110,500,110,500);
    //b_3
    rect(200,420,90,500);
    //b_4
    rect(270,260,110,500);
    rect(285,190,80,500);
    rect(301,130,50,500);
    rect(324,60,5,500);
    //b_5
    rect(340,550,90,500);
    //b_6
    rect(420,350,90,500);
    rect(490,230,90,500);
    //b_7
    rect(580,420,180,500);
    rect(580,390,180,20);
    rect(600,400,30,20);
    rect(700,400,30,20);
    //b_8
    rect(750,200,70,500);
    //b_9
    rect(810,300,70,500);
    //b_10
    rect(850,450,70,500);
    
    //b_4_top
    fill(lightRD,0,0);
    lightRD += pulseSP;
     if(lightRD > 255 || lightRD < 0 ){
    pulseSP = pulseSP * 0;
   }
    circle(326.7,60,10);
    //fill(200,0,0);
    //circle(327.5,60,10, 255 /*top_flash*/);
    
  
  
//windows
  
  //ON Windows
    if(clX2 > 815){
      fill(w_on_SUNSET)
    }
    if(clX2 < 815){
      fill(w_on_NIGHT)
    }
    rect(535,290,10,20);
  
  
    if(clX2 > 807){
      fill(w_on_SUNSET)
    }
    if(clX2 < 807){
      fill(w_on_NIGHT)
    }
    rect(335,340,10,20);
  
  
    if(clX2 < 800){
      fill(w_on_NIGHT)
    }
    if(clX2 > 800){
      fill(w_on_SUNSET)
    }
    rect(15,400,10,20);
  
  
    if(clX2 > 780){
      fill(w_on_SUNSET)
    }
    if(clX2 < 780){
      fill(w_on_NIGHT)
    }
    rect(510,450,10,20);
  
  
    if(clX2 > 760){
      fill(w_on_SUNSET)
    }
    if(clX2 < 760){
      fill(w_on_NIGHT)
    }
    rect(305,260,10,20);
  
  
    if(clX2 > 730){
      fill(w_on_SUNSET)
    }
    if(clX2 < 730){
      fill(w_on_NIGHT)
    }
    rect(555,350,10,20);
  
  
    if(clX2 < 728){
      fill(w_on_NIGHT)
    }
    if(clX2 > 728){
      fill(w_on_SUNSET)
    rect(780,400,10,20);
    }
  
  
    if(clX2 < 705){
      fill(w_on_NIGHT)
    }
    if(clX2 > 705){
      fill(w_on_SUNSET)
    }
    rect(470,370,10,20);
  
  
    if(clX2 < 700){
      fill(w_on_NIGHT)
    }
    if(clX2 > 700){
      fill(w_on_SUNSET)
    }
    rect(15,315,10,20);
  
  
    if(clX2 < 690){
      fill(w_on_NIGHT)
    }
    if(clX2 > 690){
      fill(w_on_SUNSET)
    rect(247,440,10,20);
    }
      
      
    if(clX2 < 685){
      fill(w_on_NIGHT)
    }
    if(clX2 > 685){
      fill(w_on_SUNSET)  
    }
    rect(780,280,10,20);
  
  
    if(clX2 < 679){
      fill(w_on_NIGHT)
    }
    if(clX2 > 679){
      fill(w_on_SUNSET)
    }
    rect(80,358,10,20);
  
  
    if(clX2 < 670){
      fill(w_on_NIGHT)
    }
    if(clX2 > 670){
      fill(w_on_SUNSET)
    }
    rect(220,440,10,20);
  
  
    if(clX2 < 665){
      fill(w_on_NIGHT)
    }
    if(clX2 > 665){
      fill(w_on_SUNSET)
    }
    rect(440,520,10,20);
  
  
    if(clX2 < 658){
      fill(w_on_NIGHT)
    }
    if(clX2 > 658){
      fill(w_on_SUNSET)
    }
    rect(40,400,10,20);
  
    
    if(clX2 < 654){
      fill(w_on_NIGHT)
    }
    if(clX2 > 654){
      fill(w_on_SUNSET)
    }
    rect(40,400,10,20);
  
  
    if(clX2 < 650){
      fill(w_on_NIGHT)
    }
    if(clX2 > 650){
      fill(w_on_SUNSET)
    }
    rect(60,490,10,20);
  
  
    if(clX2 < 646){
      fill(w_on_NIGHT)
    }
    if(clX2 > 646){
      fill(w_on_SUNSET)
    }
    rect(305,220,10,20);
  
  
    if(clX2 < 645){
      fill(w_on_NIGHT)
    }
    if(clX2 > 645){
      fill(w_on_SUNSET)
    }
    rect(843,500,10,20);
  
  
    if(clX2 < 638){
      fill(w_on_NIGHT)
    }
    if(clX2 > 638){
      fill(w_on_SUNSET)
    }
    rect(510,250,10,20);
  
  
    if(clX2 < 629){
      fill(w_on_NIGHT)
    }
    if(clX2 > 629){
      fill(w_on_SUNSET)
    }
    rect(80,530,10,20);
  
  

    if(clX2 < 625){
      fill(w_on_NIGHT)
    }
    if(clX2 > 625){
      fill(w_on_SUNSET)
    }
    rect(510,290,10,20);
  
  
    if(clX2 < 620){
      fill(w_on_NIGHT)
    }
    if(clX2 > 620){
      fill(w_on_SUNSET)
    }
    rect(305,340,10,20);
  
  
    if(clX2 < 617){
      fill(w_on_NIGHT)
    }
    if(clX2 > 617){
      fill(w_on_SUNSET)
    }
    rect(780,230,10,20);
  
  
    if(clX2 < 610){
      fill(w_on_NIGHT)
    }
    if(clX2 > 610){
      fill(w_on_SUNSET)
    }
    rect(305,380,10,20);
  
  
    if(clX2 < 608){
      fill(w_on_NIGHT)
    }
    if(clX2 > 608){
      fill(w_on_SUNSET)
    }
    rect(247,490,10,20);
  
  
    if(clX2 < 604){
      fill(w_on_NIGHT)
    }
    if(clX2 > 604){
      fill(w_on_SUNSET)
    }
    rect(843,330,10,20);
  

    //b_1
    
    
    
    
    
  
    //b_3
    
    
    
    //b_4
    
    

    
  
    //b_6
    
  
  
    
    
    
    
    //b_8+9
  
    
  
    
  
  
  //OFF Windows
  
    var tempColor5 = lerpColor(w_o_NIGHT,w_o_SUNSET,sunsOP/80);
    fill(tempColor5);
    
    //b_1
    rect(40,315,10,20);
    rect(40,358,10,20);
    rect(60,445,10,20);
    //b_3
    rect(220,540,10,20);
    //b_4
    rect(335,260,10,20);
    rect(305,300,10,20);
    rect(305,450,10,20);
    rect(335,500,10,20);
    //b_6
    rect(510,350,10,20);
    rect(440,370,10,20);
    //b_7
    rect(580,440,170,10);
    rect(580,470,170,10);
    
    
}
