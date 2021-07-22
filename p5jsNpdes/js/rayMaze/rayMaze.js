/*
Sources:
https://www.youtube.com/watch?v=HyK_Q5rrcr4
https://www.youtube.com/watch?v=D8UgRyRnvXU
https://www.youtube.com/watch?v=_p5IH0L63wo
https://www.youtube.com/watch?v=8Ju_uxJ9v44
https://en.wikipedia.org/wiki/Maze_generation_algorithm
https://p5js.org/examples/arrays-array-2d.html
*/


var walls = [];
var ray;
var particle;
var printed=false;

//columns/rows
var cols, rows;
//Size of each cell
var s = 70;
//defining the 1d array
var grid = [];
//defining the current cell
var current;
//defining the stack(order)
var stack = [];

var player;
function setup() {
  grid[index(0, 0)]=true
  createCanvas(windowWidth, windowHeight);
  cols = floor(width / s);
  rows = floor(height / s);


  for (var y = 0; y < rows; y++) {
    for (var x = 0; x < cols; x++) {
      var cell = new Cell(x, y);
      grid.push(cell);
    }
  }
  current = grid[0];
 player = current;
  

  particle = new Particle();
  
    
}




function draw() {
  background(0, 50);



  
  for (var i = 0; i < grid.length; i++) {
    grid[i].show();
  }


  //filling in the maze
    current.visited = true;
  //If a new cell is available, go to that cell, if none are available, go back until one is
  var next = current.checkNeighbors();
  if (next) {
    next.visited = true;
  stack.push(current);
    removeWalls(current, next);

    current = next;
  } else if (stack.length > 0) {
    current = stack.pop();
  }
//raycasting
  for (let wall of walls) {
    wall.show();
  }


  particle.update(mouseX, mouseY);
  particle.show();
particle.look(walls);
  
}
