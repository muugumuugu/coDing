int neckThick, headShape, shoulderSize, armSize, hipSize, lowerSize, upperSize, thighSize, handSize, legSize, footSize; 
 
void setup() {
  size(displayWidth, displayHeight, P3D);
  smooth();
  strokeWeight(2);
  noFill();
  stroke(10,50,255,80);
 
  atualizaPontos();
}
 
void draw() {
  background(255);
  desenhaCorpo();;
}
 
void atualizaPontos(){
  neckThick    = 3;
  headShape    = 0;
  shoulderSize = 5;
  armSize      = -1;
  hipSize      = -3;
  lowerSize    = -5;
  upperSize    = 2;
  thighSize    = -5;
  handSize     = 15;
  legSize      = 0;
  footSize     = 14;
}
 
void desenhaCorpo() {
  head(headShape);
  neck(neckThick);
  shoulders(shoulderSize); 
  upperArms(armSize);
  hips(hipSize); 
  lowerBody(lowerSize); 
  upperBody(upperSize);  
  thighs(thighSize); 
  kneecaps();
  hands(handSize);  
  legs(legSize); 
  feet(footSize);
}
 
void head(int headSize) { 
  bezier(300, 70, 308, 30, 372, 30, 385, 70); //scalp
  bezier(300, 70, 300-headSize, 120, 315-headSize, 135, 320, 140); //side
  bezier(385, 70, 385+headSize, 120, 370+headSize, 135, 365, 140); //side
  bezier(320, 140, 340, 155, 345, 155, 365, 140); //chin
}
void neck(int neckWidth) {
  bezier(320, 140, 325-neckWidth, 170, 320-neckWidth, 180, 315, 180); //left neck
  bezier(365, 140, 355+neckWidth, 170, 365+neckWidth, 180, 365, 180); //right neck
}
void shoulders(int shoulderWidth) {
  bezier(210, 200, 305, 190-shoulderWidth, 310, 185-shoulderWidth, 315, 180); //left trapezius
  bezier(365, 180, 370, 190-shoulderWidth, 380, 195-shoulderWidth, 480, 200); //right trapezius
  bezier(210, 200, 205, 205, 205, 205, 200, 220); // left shoulder
  bezier(480, 200, 485, 205, 485, 205, 490, 220); // right shoulder
} 
void upperBody(int upperWidth) {
  bezier(240, 250, 245-upperWidth, 300+upperWidth, 250-upperWidth, 325+upperWidth, 275, 325); //left pectoral 
  bezier(450, 250, 450+upperWidth, 300+upperWidth, 430+upperWidth, 325+upperWidth, 415, 325); //right pectoral
  bezier(330, 300, 325, 320, 320, 320, 300, 325); //inner boob
  bezier(360, 300, 370, 320, 375, 320, 390, 325); //inner boob
}
void lowerBody(int lowerWidth) {
  bezier (260, 320, 260-lowerWidth, 350+lowerWidth/2, 270-lowerWidth, 380+lowerWidth/2, 265, 415); // left side 
  bezier (430, 320, 430+lowerWidth, 350+lowerWidth/2, 420+lowerWidth, 380+lowerWidth/2, 425, 415); // right side
}
void hips(int hipWidth) {
  bezier(265, 410, 265-hipWidth, 430, 255-hipWidth, 435, 260, 450); //left hip 
  bezier(425, 410, 425+hipWidth, 430, 435+hipWidth, 435, 430, 450); //left hip
}
void thighs(int thighWidth) {
  bezier(260, 450, 240-thighWidth, 500, 250-thighWidth, 525, 270, 650); //left thigh side
  bezier(335, 480, 340+thighWidth, 500, 330+thighWidth, 525, 320, 650); //right thigh side
  bezier(430, 450, 445+thighWidth, 500, 440+thighWidth, 525, 420, 650); //left thigh side
  bezier(360, 480, 355-thighWidth, 500, 355-thighWidth, 525, 370, 650); //right thigh side
  bezier(335, 480, 340, 483, 340, 483, 360, 480);
}
void kneecaps() {
  bezier(270, 650, 270, 655, 265, 655, 270, 690); // left kneecap side 
  bezier(320, 650, 320, 655, 325, 655, 320, 690); // right kneecap side
  bezier(420, 650, 420, 655, 425, 655, 420, 690); // left kneecap side 
  bezier(370, 650, 370, 655, 365, 655, 370, 690); // right kneecap side
}
void upperArms(int armWidth) {
  bezier(200, 220, 190-armWidth, 300, 200-armWidth, 310, 200, 350); // left forearm side 
  bezier(200, 350, 180-armWidth, 425, 200-armWidth, 500, 200, 500); // left arm side 
  bezier(240, 250, 240+armWidth, 300, 235+armWidth, 310, 235, 350); // left forearm inside 
  bezier(235, 350, 240+armWidth, 425, 230+armWidth, 450, 225, 500); // left arm inside 
  bezier(490, 220, 500+armWidth, 300, 490+armWidth, 310, 490, 350); // right forearm 
  bezier(490, 350, 510+armWidth, 425, 490+armWidth, 500, 490, 500); // right arm 
  bezier(450, 250, 450-armWidth, 300, 455-armWidth, 310, 455, 350); // right forearm inside
  bezier(455, 350, 460-armWidth, 425, 455-armWidth, 450, 465, 500); // right arm inside
}
void hands(int handWidth) {
  bezier(200, 500, 210-handWidth, 530, 175-handWidth, 560, 220, 575); // left hand 
  bezier(220, 575, 225+handWidth, 575, 220+handWidth, 560, 225, 500); // left hand 
  bezier(490, 500, 480+handWidth, 530, 500+handWidth, 560, 490, 575); // right hand 
  bezier(465, 500, 460-handWidth, 575, 455-handWidth, 560, 490, 575); // right hand
}
void legs(int legWidth) {
  bezier(270, 690, 255-legWidth, 775, 265-legWidth, 800, 275, 850); //left calf 
  bezier(320, 690, 320+legWidth, 775, 300+legWidth, 800, 300, 850); //left calf 
  bezier(420, 690, 435+legWidth, 775, 415+legWidth, 800, 405, 850); //right calf 
  bezier(370, 690, 370-legWidth, 775, 380-legWidth, 800, 380, 850); //left calf
}
void feet(int footWidth) {
  bezier(275, 850, 250-footWidth, 900+footWidth, 280-footWidth, 900+footWidth, 300, 850); // left foot 
  bezier(405, 850, 430+footWidth, 900+footWidth, 400+footWidth, 900+footWidth, 380, 850); // left foot
}
