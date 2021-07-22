var breath = .2;
var lungCapasity = 0;
crab = 1;
function setup() {
  createCanvas(500,500);
  background(100);

}

function draw() {
  background(100);
  fill(236,222,141);
  rect(0,0,500,500);
  fill(242,115,60);
  stroke(145,69,36);
  strokeWeight(7);
    frameRate(50);
if(keyIsPressed && keyCode === RIGHT_ARROW && crab !=3){
  crab++;
  frameRate(5);
}
  if(keyIsPressed && keyCode === LEFT_ARROW && crab !=1){
  crab--;
  frameRate(5);
}
  if(crab == 1){
    //text
    textSize(20);
    text('are you feeling crabby?',170,20);
  //crab
  //body
  ellipse(250,250+lungCapasity,70+lungCapasity,60+lungCapasity);
  //left arm
  ellipse(224,220+lungCapasity,20+lungCapasity,20+lungCapasity);
  ellipse(210,210+lungCapasity,24+lungCapasity,24+lungCapasity);
  arc(192,200+lungCapasity,20+lungCapasity,30+lungCapasity,68-lungCapasity/4,78+lungCapasity/4);
  //right arm
    ellipse(278,220+lungCapasity,20+lungCapasity,20+lungCapasity);
  ellipse(288,210+lungCapasity,24+lungCapasity,24+lungCapasity);
  arc(298,198+lungCapasity,20+lungCapasity,30+lungCapasity,63.6-lungCapasity/4,73.6+lungCapasity/4);
  //legs
  strokeWeight(4);
  //right legs
  fill(217,103,54);
  quad(285,240+lungCapasity, 293, 250+lungCapasity, 297+lungCapasity, 264+lungCapasity, 292, 282+lungCapasity);
  fill(242,115,60);
  quad(280,270+lungCapasity, 288, 260+lungCapasity, 292+lungCapasity, 280+lungCapasity, 287, 302+lungCapasity);
  //left legs
  fill(217,103,54);
  quad(200-lungCapasity,250+lungCapasity, 214, 237+lungCapasity, 212, 250, 200, 272+lungCapasity);
  fill(242,115,60);
  quad(210-lungCapasity,270+lungCapasity, 214, 250+lungCapasity, 222, 268, 210, 292+lungCapasity);
  //eyes
  fill(0);
  stroke(0);
  ellipse(240,220+lungCapasity,2+lungCapasity/2,8+lungCapasity/2);
  ellipse(260,220+lungCapasity,2+lungCapasity/2,8+lungCapasity/2);
  }
  if(crab == 2){
    //text
    textSize(20);
    text('He is in a Spappy mood',170,20);
  //crab
  //body
  ellipse(250,250+lungCapasity,70+lungCapasity,60+lungCapasity);
  //legs
  strokeWeight(4);
  //right legs
  fill(217,103,54);
  quad(285,240+lungCapasity, 293, 250+lungCapasity, 297+lungCapasity, 264+lungCapasity, 292, 282+lungCapasity);
  fill(242,115,60);
  quad(280,270+lungCapasity, 288, 260+lungCapasity, 292+lungCapasity, 280+lungCapasity, 287, 302+lungCapasity);
  //left legs
  fill(217,103,54);
  quad(200-lungCapasity,250+lungCapasity, 214, 237+lungCapasity, 212, 250, 200, 272+lungCapasity);
  fill(242,115,60);
  quad(210-lungCapasity,270+lungCapasity, 214, 250+lungCapasity, 222, 268, 210, 292+lungCapasity);
    stroke(145,69,36);
  strokeWeight(7);
      //left arm
  ellipse(224,230+lungCapasity,20+lungCapasity,20+lungCapasity);
  ellipse(210,240+lungCapasity,24+lungCapasity,24+lungCapasity);
    fill(193,92,48);
  arc(210,260+lungCapasity,20+lungCapasity,30+lungCapasity,65.4-lungCapasity/4,75.4+lungCapasity/4);
  //right arm
    ellipse(278,240+lungCapasity,20+lungCapasity,20+lungCapasity);
  ellipse(265,245+lungCapasity,24+lungCapasity,24+lungCapasity);
    fill(193,92,48);
  arc(250,248+lungCapasity,40+lungCapasity,30+lungCapasity,67-lungCapasity/4,77+lungCapasity/4);
  //eyes
  fill(0);
  stroke(0);
  ellipse(240,220+lungCapasity,2+lungCapasity/2,8+lungCapasity/2);
  ellipse(260,220+lungCapasity,2+lungCapasity/2,8+lungCapasity/2);
  }
    if(crab == 3){
    //text
    textSize(20);
    text('He is quite a dancer too!',170,20);
  //crab
  //body
  ellipse(250+lungCapasity*3,250+lungCapasity,70+lungCapasity,60+lungCapasity);
  //left arm
  ellipse(224,220+lungCapasity,20+lungCapasity,20+lungCapasity);
  ellipse(210,210+lungCapasity,24+lungCapasity,24+lungCapasity);
  arc(192,200+lungCapasity,20+lungCapasity,30+lungCapasity,68-lungCapasity/4,78+lungCapasity/4);
  //right arm
  ellipse(270,220+lungCapasity,20+lungCapasity,20+lungCapasity);
  ellipse(260,202+lungCapasity,24+lungCapasity,24+lungCapasity);
  arc(252,190+lungCapasity,20+lungCapasity,30+lungCapasity,68-lungCapasity/4,78+lungCapasity/4);
  //legs
  strokeWeight(4);
  //right legs
  fill(217,103,54);
  quad(285+lungCapasity*3,240+lungCapasity, 293+lungCapasity*3, 250+lungCapasity, 297+lungCapasity*3+lungCapasity, 264+lungCapasity, 292+lungCapasity*3, 282+lungCapasity);
  fill(242,115,60);
  quad(280+lungCapasity*3,270+lungCapasity, 288+lungCapasity*3, 260+lungCapasity, 292+lungCapasity*3+lungCapasity, 280+lungCapasity, 287+lungCapasity*3, 302+lungCapasity);
  //left legs
  fill(217,103,54);
  quad(200+lungCapasity*3-lungCapasity,250+lungCapasity, 214+lungCapasity*3, 237+lungCapasity, 212+lungCapasity*3, 250, 200+lungCapasity*3, 272+lungCapasity);
  fill(242,115,60);
  quad(210-lungCapasity+lungCapasity*3,270+lungCapasity, 214+lungCapasity*3, 250+lungCapasity, 222+lungCapasity*3, 268, 210+lungCapasity*3, 292+lungCapasity);
  //eyes
  fill(0);
  stroke(0);
  ellipse(240,220+lungCapasity,2+lungCapasity/2,8+lungCapasity/2);
  ellipse(260,220+lungCapasity,2+lungCapasity/2,8+lungCapasity/2);
  }
  //animate
  if(lungCapasity>4){
    breath = -.2;
  }
    if(lungCapasity<0.2){
    breath = .2;
  }
  lungCapasity+=breath;
strokeWeight(2);
}
