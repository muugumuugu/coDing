var amount;
var stars = [];
var buildings = [];

function setup() {
  createCanvas(1024, 768);
  background(0);

  colorMode(HSB);
  noLoop();
  
  // amount of buildings and stars
  amount = int(random(15, 45));
  
  // initialise star array
  for (x = 0; x < (amount* 2) +30; x++) stars.push([-10,-10]);

  for (i = 0; i < amount; i++) {
    // create new building
    x = random(-50, width + 50);
    buildings[i] = new Building(x);
    
    // create 2x new stars
    stars[i][0] = int(random(0,width));
    stars[i][1] = int(random(0, 500));    
    stars[amount+i][0] = int(random(0,width));
    stars[amount+i][1] = int(random(0, 500));
  }
}

function draw() {
  for (i = 0; i < amount; i++) {
    fill(255);
    stroke(255);
    strokeWeight(random(0.3,3));
    point(stars[i][0], stars[i][1]);
    point(stars[amount+i][0], stars[amount+i][1]);
    
    noStroke();
    buildings[i].display();
  }
  
}
  
function mousePressed() {
  // redraw
  background(0);
  amount = int(random(15, 45));
  for (i = 0; i < amount; i++) {
    var x = random(-50, width + 50);
    buildings[i] = new Building(x);
    stars[i][0] = int(random(0,width));
    stars[i][1] = int(random(0, 300));    
    stars[amount+i][0] = int(random(0,width));
    stars[amount+i][1] = int(random(0, 300));
  }
  redraw();
}


function Building(_rectX) {

  this.chars = [];
  this.fillCol = color(random(255), 255, 255);
  this.txtSize = int(random(7, 12));
  this.charWidth = 0;

  this.rectX = _rectX;
  this.rectY = random(50, height - 50);
  this.rectW = random(60, 130);
  this.rectH = height - this.rectY;

  textSize(this.txtSize);
  this.charWidth = textWidth("W");
  this.gap = random(this.charWidth, this.charWidth + 5);
  this.gapY = random(this.txtSize, this.txtSize + 4);

  this.chars = [];
  for (var p = 0; p < int(this.rectX + (this.rectH *this.rectW)); p++) {

   /* var val = int(random(12353, 12586));
    while ((val >= 12544 && val <= 12548) || (val >= 12439 && val <= 12440)) {
      val = int(random(12353, 12586));
    }*/
    
    var val = int(random(48, 58));
    /*while ((val >= 12544 && val <= 12548) || (val >= 12439 && val <= 12440)) {
      val = int(random(12353, 12586));
    }*/

    this.chars[p] = val;
  }

  this.display = function() {

    textSize(this.txtSize);
    fill(this.fillCol);
    noStroke();
    var pos = 0;
    var lastX = 0;
    for (var x = this.rectX + 5; x < (this.rectX + this.rectW); x += this.gap) {
      lastX = x;
      for (var y = this.rectY + this.gapY; y <= (this.rectY + this.rectH)+10; y += this.gapY) {
        text(char(this.chars[pos]), x, y);
        pos += 1;
      }
    }
    stroke(this.fillCol);
    noFill();
    strokeWeight(0.03);
    rect(this.rectX, this.rectY-3, (lastX - this.rectX) + (this.charWidth) + 3, this.rectH);
  }
}
