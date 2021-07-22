var bobby;
var i;
var alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var letters = [];
var row = 0;
var wordBank = ['HANGMAN','CLOWN','FISH','DOLPHIN','FRIENDS','ORNATE','ORIGINATE','TOAST','WINNER','BABY','SCHOOLHOUSE','FLOWER','BOOKCASE','RUG','KNIFE','QUEEN','CHRISTMAS','ELEPHANT', 'ORANGE', 'DEVIL', 'DARE', 'DEFINE', 'LEECH', 'DESTROYER', 'CANDLE', 'RETIREE', 'HEAVY', 'RISK', 'DATE', 'NORA'];
var word;
var boxes = [];
var lost = false;
var won = false;
var column = 0;
function setup() {
  createCanvas(windowWidth, windowHeight);
  background(100);
  rectMode (CENTER);
  ellipseMode (CENTER);
  textAlign (CENTER, CENTER);
  word = wordBank [Math.floor (random (0, wordBank.length))];
  bobby = new hangman (false, false, false, false, false, false, word);
  textFont('Georgia');
  for (i = 0; i < 26; i++) {
    letters.push (new box (windowWidth/2-250+column*45, windowHeight/2-200+row*45, 30, alphabet [i], "grey"));
    if (column < 4) {
      column += 1;
    } else {
      row+=1;
      column = 0;
    }
  }
  for (i = 0; i < word.length; i++) {
    boxes.push (new box (windowWidth/2-word.length/2*50-(word.length-1)/2*25+50*i+25*(i+1), windowHeight/2+200, 50, '', 'blank'));
  }
}

function draw() {
  background (100);
  strokeWeight (7);
  textSize (50);
  fill (255);
  stroke (247, 71, 61);
  text ('Hangman', windowWidth/2, windowHeight/2+125);
  textSize (30);
  stroke(0);
  line (windowWidth/2+250, windowHeight/2+50, windowWidth/2+50, windowHeight/2+50); //Base
  line (windowWidth/2+175, windowHeight/2+50, windowWidth/2+175, windowHeight/2-250); //Support beam |
  line (windowWidth/2+175, windowHeight/2-250, windowWidth/2+50, windowHeight/2-245); // Beam rope is hung --
  line (windowWidth/2+180, windowHeight/2-200, windowWidth/2+120, windowHeight/2-255); //design thing
  line (windowWidth/2+50, windowHeight/2-245, windowWidth/2+50, windowHeight/2-200); //rope
  bobby.show ();
  strokeWeight (3);
  for (i = 0; i < 26; i++) {
    fill (150);
    stroke(0);
    letters[i].show ();
    letters[i].update ();
  }
  if (lost == true) {
    fill (0);
    rect (windowWidth/2, windowHeight/2,windowWidth, windowHeight);
    textSize (100);
    strokeWeight (5);
    stroke (244, 184, 65);
    text ('oop\nWord Was: '+word, windowWidth/2, windowHeight/2);
  } else if (won == true) {
    fill (0);
    strokeWeight (5);
    rect (windowWidth/2, windowHeight/2,windowWidth, windowHeight);
    textSize (100);
    stroke (247, 90, 50);
    text ('Good Job!!\nWord Was: '+word, windowWidth/2, windowHeight/2);
  }
}

function checkWin () {
  var ticTac = 0;
  for (i = 0; i < boxes.length; i++) {
    if (boxes[i].contents != '') {
      ticTac += 1;
    }
  }
  if (ticTac == boxes.length) {
    won = true;
  }
}

class hangman {
  constructor (head, body, leg1, leg2, arm1, arm2, word) {
    this.head = head;
    this.body = body;
    this.leg1 = leg1;
    this.leg2 = leg2;
    this.arm1 = arm1;
    this.arm2 = arm2;
    this.word = word;
  }
  show () { 
    stroke(0);
    var startingX = this.word.length/2*75;
    if (this.head == true) {
      ellipse (windowWidth/2+50, windowHeight/2-175, 50);
    } if (this.body == true) {
      line (windowWidth/2+50, windowHeight/2-150, windowWidth/2+50, windowHeight/2-75);
    } if (this.leg1 == true) {
      line (windowWidth/2+50, windowHeight/2-75, windowWidth/2+75, windowHeight/2-20);
    } if (this.leg2 == true) {
      line (windowWidth/2+50, windowHeight/2-75, windowWidth/2+25, windowHeight/2-25);
    } if (this.arm1 == true) {
      line (windowWidth/2+50, windowHeight/2-130, windowWidth/2+70, windowHeight/2-80);
    } if (this.arm2 == true) {
      line (windowWidth/2+50, windowHeight/2-130, windowWidth/2+30, windowHeight/2-75);
    }
    for (i = 0; i < this.word.length; i++) {
      // boxes[i].contents = new box (windowWidth/2-word.length/2*50-(word.length-1)/2*25+50*i+25*(i+1), windowHeight/2+200, 50, boxes[i].contents, 'blank'));
      fill (255);
      boxes[i].show();
    }
  }
}

class box {
  constructor (x, y, size, contents, current) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.contents = contents;
    this.current = current;
  }
  checkCorrect (letter, testCheck) {
    for (i = 0; i < word.length; i++) {
      if (letter == word[i]) {
        testCheck = true;
        boxes[i].contents = word[i];    
      }
    }
    if (testCheck == true) {
      this.current = 'clicked';
    }
    return (testCheck);
  }
  update () {
    if (this.current != 'wrong' && this.current != 'clicked') {
      if (dist (this.x, this.x, mouseX, mouseX) < this.size/2 && dist (this.y, this.y, mouseY, mouseY) < this.size/2) {
        this.size = 40;
        if (mouseIsPressed) {
          if (this.checkCorrect (this.contents, false) == false) {
            this.current = 'wrong';
            if (bobby.head == false) {
              bobby.head = true;
            } else if (bobby.body == false) {
              bobby.body = true;
            } else if (bobby.leg1 == false) {
              bobby.leg1 = true;
            } else if (bobby.leg2 == false) {
              bobby.leg2 = true;
            } else if (bobby.arm1 == false) {
              bobby.arm1 = true;
            } else if (bobby.arm2 == false) {
              bobby.arm2 = true;
            } else {
              lost = true;
            }
          } else {
            checkWin ();
          }
        }
      } else {
        this.size = 30;
      }
    }
  }
  show () {
    rect (this.x, this.y, this.size, this.size);
    if (this.current == 'clicked') {
      fill (255);
    } else {
      fill (0);
    }
    if (this.current == 'blank') {
      strokeWeight (3);
    }
    text (this.contents, this.x, this.y);
    if (this.current == 'blank') {
      strokeWeight (7);
    }
    if (this.current == 'wrong') {
      stroke (247, 71, 61);
      line (this.x+this.size/2, this.y+this.size/2, this.x-this.size/2, this.y-this.size/2);
      line (this.x-this.size/2, this.y+this.size/2, this.x+this.size/2, this.y-this.size/2);
    }
  }
}
