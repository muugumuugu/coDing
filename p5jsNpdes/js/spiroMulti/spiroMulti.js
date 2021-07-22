let first = true;
let numDimension = 8;

let radius = [];
let phase = [];
let phaseVel = [];
let basePhaseVel;

let prevPos;

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(0);
  stroke(255, 40);
  
  basePhaseVel = random(0.001, 0.1);
  
  for (let i = 0; i < numDimension; i++) {
    radius.push(random(10, 80));
    phase.push(HALF_PI);
    phaseVel.push(basePhaseVel * floor(random(1, 8)));
  }
  prevPos = createVector(0, 0);
}

function draw() {
  for (let i = 0; i < 50; i++) {    
    let curPos = p5.Vector.fromAngle(phase[0]);
    curPos.mult(radius[0]);
    curPos.add(width / 2, height / 2);
    phase[0] += phaseVel[0];
    
    for (let j = 1; j < numDimension; j++) {
      let tmpPos = p5.Vector.fromAngle(phase[j]);
      tmpPos.mult(radius[j]);
      curPos.add(tmpPos);
      phase[j] += phaseVel[j];
    }
      
    if (first) {
      first = false;
    } else {
      line(curPos.x, curPos.y, prevPos.x, prevPos.y);
    }
    
    prevPos = curPos.copy();
    phase[0] += 0.001;
  }
  
}

function mousePressed() {
  first = true;
  background(0);
  
  basePhaseVel = random(0.001, 0.1);
  for (let i = 0; i < numDimension; i++) {
    radius[i] = random(10, 80);
    phase[i] = HALF_PI;
    phaseVel[i] = basePhaseVel * floor(random(1, 8));
    
  }
}
