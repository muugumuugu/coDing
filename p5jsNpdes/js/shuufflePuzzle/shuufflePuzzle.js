function Array2D(cols, rows) {
  var arr = new Array(cols);
  for (var i = 0; i < arr.length; i++) {
    arr[i] = new Array(rows);
  }
  return arr;
}

var colm = 4;
var rows = 4;
var spacing = 170;
var grid;
var shuffleButton;

function setup() {
  createCanvas(colm * spacing, rows * spacing);
  
  grid = new Array2D(colm, rows);
  for (var i = 0; i < colm; i++) {
    for (var j = 0; j < rows; j++) {
      grid[i][j] = i + j * colm + 1;
      if (grid[i][j] == colm * rows) {
        grid[i][j] = 0;
      }
      



    }
  }
  shuffleButton = createButton("Shuffle");
  shuffleButton.mousePressed(shuffleBoard);
}

function mousePressed() {
  if (mouseX < width && mouseX > 0 && mouseY < height && mouseY > 0) {
    slide(mouseX, mouseY);
  }
}

function slide(x, y) {
  var mx = floor(x / spacing);
  var my = floor(y / spacing);
  var num = grid[mx][my];
  var neighbours;
  if (mx == 0) {
    neighbours = [
      grid[mx + 1][my],
      grid[mx][my + 1],
      grid[mx][my - 1]
    ];
  } else if (mx == colm - 1) {
    neighbours = [
      grid[mx - 1][my],
      grid[mx][my + 1],
      grid[mx][my - 1]
    ];
  } else {
    neighbours = [
      grid[mx + 1][my],
      grid[mx - 1][my],
      grid[mx][my + 1],
      grid[mx][my - 1]
    ];
  }
  for (var i = 0; i < neighbours.length; i++) {
    if (neighbours[i] == 0) {
      var temp = grid[mx][my];
      if (mx != colm - 1) {
        if (neighbours[i] == grid[mx + 1][my]) {
          grid[mx][my] = 0;
          grid[mx + 1][my] = temp;
        }
      }
      if (mx != 0) {
        if (neighbours[i] == grid[mx - 1][my]) {
          grid[mx][my] = 0;
          grid[mx - 1][my] = temp;
        }
      }
      if (neighbours[i] == grid[mx][my + 1]) {
        grid[mx][my] = 0;
        grid[mx][my + 1] = temp;
      }
      if (neighbours[i] == grid[mx][my - 1]) {
        grid[mx][my] = 0;
        grid[mx][my - 1] = temp;
      }
    }
  }
}

function shuffleBoard() {
  for (var i = 0; i < colm; i++) {
    for (var j = 0; j < rows; j++) {
      grid[i][j] = i + j * colm + 1;
      if (grid[i][j] == colm * rows) {
        grid[i][j] = 0;
      }
    }
  }
  for (var k = 0; k < 10000; k++) {
    slide(random(width), random(height));
  }
}

function draw() {
  background(221, 29, 255);
  for (var i = 0; i < colm; i++) {
    for (var j = 0; j < rows; j++) {
      var x = i * spacing;
      var y = j * spacing;
      fill(0, 0, 0);
      stroke(255, 255, 255);
      rect(x, y, spacing, spacing);
      var xt = x + spacing / 2;
      var yt = y + spacing / 2;
      var num = grid[i][j];
      if (num != 0) {
        stroke('pink');
        strokeWeight(5);
        textFont('Viner Hand ITC');
        fill(105, 250, 135);
        textSize(100);
        textAlign(CENTER, CENTER);
        text(num, xt, yt);
        colorMode(RGB);

      }
    }
  }
}
