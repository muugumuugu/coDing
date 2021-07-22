// Illustrate the continuum between chaos and cosmos (order) on the canvas from left to right.

// The composition is based on an underlying dividual structure in the form a matrix of squares over which the individual squares are drawn.


// Try changing the values of the squareSize

let squareSize = 30; // works best if this is an even divisor of the width and height

let white = 255;


function setup() {
  createCanvas(1200, 300);
  stroke(0); // black outlines
  noLoop(); // halt when the drawing is complete
  rectMode(CENTER); // draw squared centered at their coordinates
}

function draw() {

  background(40); // black canvas

  // a nested loop that steps through the squares in columns from left to right
  for (let x = 0; x < width; x = x + squareSize) {
    for (let y = 0; y < height; y = y + squareSize) {

      let chaosScaler = map(x, 0, width, 1, 0); // calculate a linear scaler based on horizontal position of the square
      chaosScaler = chaosScaler * chaosScaler; // convert linear scaler to exponential which skews the chaotic variations to the left making for a more balanced visual composition

      let rotationOffset = chaosScaler * (random(2) - 1);

      // calculate the x, y offsets for each square
      let offsetX = squareSize / 2 + ((chaosScaler * (random(2) - 1)) * squareSize*2);
      let offsetY = squareSize / 2 + ((chaosScaler * (random(2) - 1)) * squareSize*2);

      // calculate the variation in square size
      let sizeVariationX = squareSize + (chaosScaler * (random(2) - 1) * squareSize*2);
      let sizeVariationY = squareSize + (chaosScaler * (random(2) - 1) * squareSize*2);

      // calculate the gray level: the further to the left the square, the more random variation in level
      let level = white - (chaosScaler * random(255));

      // set the fill color
      fill(level);

      // draw the squares with position, scale, and rotation varations
      push(); // save the current coordinate system so we can restore, using push(), for the next square
      translate(x + offsetX, y + offsetY);
      rotate(rotationOffset);
      rect(0, 0, sizeVariationX, sizeVariationY);
      pop(); // restore the coordinate system
    }
  }
}

function mousePressed() {
  redraw();
}
