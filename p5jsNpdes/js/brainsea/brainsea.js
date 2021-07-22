var _cellArray = [];
var _numX, _numY;
var _cellSize = 10;

function setup() {
  createCanvas(windowWidth, windowHeight);
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
restart(); }

function restart() {
  // first, create a grid of cells
  for (var x = 0; x<_numX; x++) {
   _cellArray[x] = [];
    for (var y = 0; y<_numY; y++) {
      var newCell = new Cell(x, y);
     _cellArray[x].push(newCell);
    }
  }
  
for (var x = 0; x < _numX; x++) {
  for (var y = 0; y < _numY; y++) {
    var above = y-1;
    var below = y+1;
    var left = x-1;
    var right = x+1;
    if (above < 0) { above = _numY-1; }
    if (below == _numY) { below = 0; }
    if (left < 0) { left = _numX-1; }
    if (right == _numX) { right = 0; }
    _cellArray[x][y].addNeighbour(_cellArray[left][above]);
      _cellArray[x][y].addNeighbour(_cellArray[left][y]);
      _cellArray[x][y].addNeighbour(_cellArray[left][below]);
      _cellArray[x][y].addNeighbour(_cellArray[x][below]);
      _cellArray[x][y].addNeighbour(_cellArray[right][below]);
      _cellArray[x][y].addNeighbour(_cellArray[right][y]);
      _cellArray[x][y].addNeighbour(_cellArray[right][above]);
      _cellArray[x][y].addNeighbour(_cellArray[x][above]);
        }
      }
    }

function draw() {
  background(200);
  for (var x = 0; x < _numX; x++) {
  for (var y = 0; y < _numY; y++) {
    _cellArray[x][y].calcNextState();
  }
  }
    translate(_cellSize/2, _cellSize/2);
    for (var x = 0; x < _numX; x++) {
  for (var y = 0; y < _numY; y++) {
    _cellArray[x][y].drawMe();
  }
}

  }

function mousePressed() {
 restart();}


function Cell(ex, why) { 
  this.x = ex * _cellSize;
   this.y = why * _cellSize;
   this.lastState = 0;
   this.nextState =
     ((this.x/width)+(this.y/height))*14;
   this.state = this.nextState;
   this.neighbours = []; }

Cell.prototype.addNeighbour = function(c) {
 this.neighbours.push(c);
}
Cell.prototype.calcNextState = function() {var total = 0;
 for(var i=0;i<this.neighbours.length;i++) {
 total += this.neighbours[i].state;
 }
 var average = int(total/8);
 if (average == 255) {
 this.nextState = 0;
 } else if (average == 0) {
 this.nextState = 255;
 } else {
 this.nextState = this.state + average;
 if (this.lastState > 0) {
 this.nextState -= this.lastState;
 }
 if (this.nextState > 255) {
 this.nextState = 255;
 } else if (this.nextState < 0) {
 this.nextState = 0;
 }
 }
 this.lastState = this.state;} 
Cell.prototype.drawMe = function() {this.state = this.nextState;
 stroke(0);
 fill(this.state);
 rect(this.x, this.y, _cellSize, _cellSize);
  }
