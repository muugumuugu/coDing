//Madeline Dennehy

var bwY1, bwY2, bwY3, bwY4, bwY5;
var cloudX;
var astar1, astar2, astar3, astar4, astar5;
var timer = 0;
var skyA, skyB;
var alight, lightSP
var sbColor

function setup() {
  createCanvas(900, 700);
  frameRate(30);
  bwY1 = 240;
  bwY2 = 270;
  bwY3 = 300;
  bwY4 = 330;
  bwY5 = 360;
  cloudX = 175;
  astar1 = 255;
  astar2 = 0;
  astar3 = 100;
  astar4 = 200;
  astar5 = 50;
  skyA = color (180,10,200);
  skyB = color (35,0,70);
  alight = 10
  lightSP = 5
  sbColor = color(118, 8, 130)
}

function draw() {
  var tempColor = lerpColor(skyA, skyB, cloudX/width);
  background(tempColor);
  timer = timer + 1;
  noStroke()
  
  
  //Moon
  fill(230)
  circle(700,85,75)
  fill(tempColor)
  circle(715,85,70)
  
  //stars
  fill(230,230,230,astar1)
  triangle(95,50,105,52,105,48)
  triangle(115,50,105,52,105,48)
  triangle(105,40,103,50,107,50)
  triangle(105,65,103,50,107,50)
  
  fill(230,230,230,astar2)
  triangle(306,70,315,71,315,69)
  triangle(324,70,315,71,315,69)
  triangle(315,61,314,70,316,70)
  triangle(315,84,314,70,316,70)
  
  fill(230,230,230,astar3)
  triangle(515,35,525,36,525,34)
  triangle(535,35,525,36,525,34)
  triangle(525,25,524,35,526,35)
  triangle(525,50,524,35,526,35)
  
  fill(230,230,230,astar4)
  triangle(845,135,855,137,855,133);    
  triangle(865,135,855,137,855,133);    
  triangle(855,125,853,135,857,135);  
  triangle(855,150,853,135,857,135);  
  
  fill(230,230,230,astar5)
  triangle(43,215,55,217,55,213);
  triangle(67,215,55,217,55,213);
  triangle(55,205,53,215,57,215);
  triangle(55,232,53,215,57,215);
  
  //animate stars
  
  if(astar1 < 0){
    astar1 = 255
  }
  astar1 = astar1 - 5
  
    if(astar2 > 255){
    astar2 = 0
  }
  astar2 = astar2 + 8
  
    if(astar3 < 0){
    astar3 = 255
  }
  astar3 = astar3 - 10
  
  if(astar4 > 255){
    astar4 = 0
  }
  astar4 = astar4 + 5
  
    if(astar5 > 255){
    astar5 = 0
  }
  astar5 = astar5 + 10
  
  //shadow building
  fill(sbColor)
  rect(120,515,10,height)//filler
  rect(765,480,95,height)//filler
  rect(160,340,130,height)//building #1
  rect(300,420,40,height)//building #2
  rect(300,415,35,height)//building #2
  rect(300,425,45,5)//building #2
  rect(410,300,75,height)//building #3
  triangle(415,300,485,300,415,265)//building #3
  triangle(410,300,480,300,480,250)//building #3
  rect(600,260,100,height)//building #4
  rect(610,250,80,height)//building #4
  rect(655,230,4,height)//building #4
  rect(665,215,3,height)//building #4
  rect(790,400,70,height)//building #5
  rect(795,380,60,height)//building #5
  rect(810,370,30,height)//building #5
  rect(815,355,20,height)//building #5
  rect(822,350,6,height)//building #5
  rect(823.5,320,3,height)//building #5
  
  //red light animation
  fill(200,0,0,alight);
  circle(825,321,4);
  
  if(alight > 255){
    alight = lightSP * -1
  }else if(alight < 0){
    alight = lightSP * -1
  }
  alight = alight + lightSP
  
  //shaddow building color
  if(cloudX > width/2){
    sbColor = color(65,50,80)
  }else{
    sbColor = color(118, 8, 130)
  }

  //clouds
  fill(193,146,198);
  ellipse(cloudX,200,350,50);
  ellipse(cloudX - 125,185,70,40);
  ellipse(cloudX + 25,175,125,60);
  ellipse(cloudX - 50,165,150,80);
  
  //cloud animation
  if(cloudX > width+175){
    cloudX = -175
  }
  cloudX++
  
  //black buildings
  fill(0)
  rect(130,600,70,height)//filler
  rect(625,650,10,height)//filler
  rect(120,630,10,height)//filler
  rect(765,595,10,height)//filler
  rect(0,380,120,height)//building #1
  rect(30,358,70,height)//building #1
  rect(55,330,45,height)//building #1
  rect(130,500,64,height)//building #2
  triangle(134,500,194,500,134,460)//building #2
  rect(172,450,3,height)//building #2
  rect(178,446,2,height)//building #2
  rect(200,200,100,height,15)//building #3
  rect(215,175,70,height,15)//building #3
  rect(240,140,20,height,50)//building #3
  rect(248,50,4,height)//building #3
  rect(300,437,200,height,85)//building #4
  rect(380,430,40,height,5)//building #4
  rect(385,405,30,height,5)//building #4
  rect(389,398,22,height,11)//building #4
  rect(398.5,380,3,height)//building #4
  circle(400,395,8)//building #4
  rect(500,355,50,height)//building #5
  rect(550,320,75,height)//building #6
  rect(630,443,135,height)//building #7
  triangle(630,443,765,443,765,410)//building #7
  rect(630,438,8,height)//building #7
  rect(661.75,430,8,height)//building #7
  rect(693.5,422,8,height)//building #7
  rect(725.25,414,8,height)//building #7
  rect(757,406,8,height)//building #7
  rect(775,534,130,height)//building #8
  rect(850,505,50,height)//building #8
  rect(800,510,10,height)//building #8
  rect(820,514,10,height)//building #8
  
  //yellow windows
  fill(255,220,64)
  rect(570,350,6,10)
  rect(600,350,6,10)
  rect(570,390,6,10)
  rect(585,430,6,10)
  rect(600,470,6,10)
  rect(585,470,6,10)
  rect(570,550,6,10)
  rect(600,590,6,10)
  rect(585,590,6,10)
  rect(570,590,6,10)
  
//blue windows
  fill(64,198,255)
  rect(210,bwY1,8,16)
  rect(210,bwY2,8,16)
  rect(228,bwY2,8,16)
  rect(210,bwY3,8,16)
  rect(228,bwY3,8,16)
  rect(246,bwY3,8,16)
  rect(210,bwY4,8,16)
  rect(228,bwY4,8,16)
  rect(246,bwY4,8,16)
  rect(264,bwY4,8,16)
  rect(210,bwY5,8,16)
  rect(228,bwY5,8,16)
  rect(246,bwY5,8,16)
  rect(264,bwY5,8,16)
  rect(282,bwY5,8,16)
  
  //animating blue windows  
/*
  if(bwY1 > 600){
    bwY1 = 240;
  }
  bwY1 = bwY1 + 1
  
  if(bwY2 > 600){
    bwY2 = 240;
  }
  bwY2 = bwY2 + 1
  
  if(bwY3 > 600){
    bwY3 = 240;
  }
  bwY3 = bwY3 + 1
  
  if(bwY4 > 600){
    bwY4 = 240;
  }
  bwY4 = bwY4 + 1
  
  if(bwY5 > 600){
    bwY5 = 240;
  }
  bwY5 = bwY5 + 1
  */
  
  if(timer > 25){
    bwY1 = bwY1 + 30
    bwY2 = bwY2 + 30
    bwY3 = bwY3 + 30
    bwY4 = bwY4 + 30
    bwY5 = bwY5 + 30
    timer = 0;
  }
  if(bwY1 > 600){
    bwY1 = 240;
  }
  if(bwY2 > 600){
    bwY2 = 240;
  }
    if(bwY3 > 600){
    bwY3 = 240;
  }
    if(bwY4 > 600){
    bwY4 = 240;
  }
  if(bwY5 > 600){
    bwY5 = 240;
  }
  
  //grey windows
  fill(111,86,114)
  rect(646.875,455,6,18)
  rect(678.625,455,6,18)
  rect(710.375,455,6,18)
  rect(742.125,455,6,18)
  rect(646.875,490,6,18)
  rect(678.625,490,6,18)
  rect(710.375,490,6,18)
  rect(742.125,490,6,18)
  rect(646.875,525,6,18)
  rect(678.625,525,6,18)
  rect(710.375,525,6,18)
  rect(742.125,525,6,18)
  rect(646.875,560,6,18)
  rect(678.625,560,6,18)
  rect(710.375,560,6,18)
  rect(742.125,560,6,18)
  rect(646.875,595,6,18)
  rect(678.625,595,6,18)
  rect(710.375,595,6,18)
  rect(742.125,595,6,18)
  rect(646.875,630,6,18)
  rect(678.625,630,6,18)
  rect(710.375,630,6,18)
  rect(742.125,630,6,18);

  
}
