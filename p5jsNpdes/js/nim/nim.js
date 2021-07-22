// By Roni Kaufman

var sticks;
var goingUp, goingDown;
var hasPlayed;
var choice;
var newGame;
var endgame;

function setup() {
  createCanvas(windowWidth, windowHeight);
  textSize(20);
  noStroke();
  
  hasPLayed = false;
  newGame = false;
  endgame = false;
  goingUp = [];
  goingDown = [];
  
  sticks = [];
  var numberOfSticks = floor(random(15,25));
  var stickThickness = 12;
  var stickLength = 100;
  var x = (width - (2*numberOfSticks-1)*stickThickness)/2;
  var y = (height - stickLength)/2;
  var color, colorNoise;
  
  for (var i = 0; i < numberOfSticks; i++) {
    colorNoise = 100*noise(i/2);
    switch (i % 4) {
      case 0:
        color = [51+colorNoise, 103+colorNoise, 123+colorNoise];
        break;
      case 1:
        color = [236+colorNoise, 189+colorNoise, 80+colorNoise];
        break;
      case 2:
        color = [239+colorNoise, 61+colorNoise, 28+colorNoise];
        break;
      case 3:
        color = [81+colorNoise, 39+colorNoise, 39+colorNoise];
        break;
    }    
    var position = createVector(x, y);
    x+=2*stickThickness;
    sticks.push(new Stick(position, stickThickness, stickLength, color));
  }  
  
  display();
}

function draw() {
  if (hasPlayed) {
    hasPlayed = false;
    oneTurn("player");
    
    choice = computerChoice();
    oneTurn("computer");
  } 
  
  if (newGame && endgame) {
    setup();
  }
  
  display();
}

function keyPressed() {
  switch (key) {
    case "1":
      choice = 1;
      hasPlayed = true;
      break;
    case "2":
      if (sticks.length > 1) {
        choice = 2;
        hasPlayed = true;
      }
      break;
    case "3":
      if (sticks.length > 2) {
        choice = 3;
        hasPlayed = true;
      }
      break;
    case " ":
      if (endgame) {
        newGame = true;
      }
      break;
  } 
  if (choice > sticks.length) {
    choice = sticks.length;
  }  
} 

function computerChoice() {
  if (sticks.length === 0) {
    return 0;
  }  
  switch (sticks.length % 4) {
    case 0:
      return 3;
    case 1:
      return 1;
    case 2:
      return 1;
    case 3:
      return 2;
  }    
} 

function display() {
  background(251);
  for (i = 0; i < sticks.length; i++) {
    sticks[i].display();
  } 
  for (i = 0; i < goingDown.length; i++) {
    goingDown[i].goUp(-12);
    goingDown[i].display();
  } 
  for (i = 0; i < goingUp.length; i++) {
    goingUp[i].goUp(12);
    goingUp[i].display();
  } 
  if (endgame) { // there was no other way...
    fill(50);
    text("Press [space] to play again", width/2 - 115, height/2);
  }
}  

// choice has already been chosen
function oneTurn(who) {
  var eliminated = [];
  for (var i = 0; i < choice; i++) {
    eliminated.push(sticks.pop());
  } 

  if (who === "computer") {
    goingDown = goingDown.concat(eliminated);
  } else {
    goingUp = goingUp.concat(eliminated);
  }  
  
  if (sticks.length === 0) {
    endgame = true;
  }
}  
