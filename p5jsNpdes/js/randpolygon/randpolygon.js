let palette = [
  "#aaff00",
  "#ffaa00",
  "#ff00aa",
  "#aa00ff",
  "#00aaff"
];

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(60);
  noLoop();
}

function draw() {
  background(60);
  let xs = [width * 0.25, width * 0.5, width * 0.75];
  let ys = [height * 0.25, height * 0.5, height * 0.75];
  for (let x of xs) {
    for (let y of ys) {
      drawRandomShape(3, 3, x, y);
    }
  }
}


// Instead of using mouse clicks, 
// have the draw function compose a picture by drawing 3
// of your random shapes centred around 3 separate,
// randomly-chosen centre positions.

function drawRandomShape(numbShapes, numbPoints, centreX, centreY) {
  noStroke();
  for (let i = 0; i < numbShapes; i++) {
    fill(random(palette));
    beginShape();
    for (let i = 0; i < numbPoints; i++) {
      let x = random(centreX - 100, centreX + 100);
      let y = random(centreY - 100, centreY + 100);
      vertex(x, y);
    }
    endShape();
  }
}

function mousePressed() {
  redraw();
}

function drawCluster(numCluster) {
  for (let i = 0; i < numCluster; i++) {

  }
}
