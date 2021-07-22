//takes a 1d array, and outputs managable x&y coords

function index(x, y) {

  if (x < 0 || y < 0 || x > cols-1 || y > rows-1) {
  return -1;
  }


  return (x + y * cols);

}
//=============================================
function Cell(x, y) {
  this.x = x;
  this.y = y;
  //          top   right bottom left
  this.walls = [true, true, true, true];
  this.visited = false;

  this.checkNeighbors = function() {
    //creates a list of available moves, and picks one randomly 
    var neighbors = [];


    var top = grid[index(x, y - 1)];
    var right = grid[index(x + 1, y)];
    var bottom = grid[index(x, y + 1)];
    var left = grid[index(x - 1, y)];
    if (top && !top.visited) {
      neighbors.push(top);
    }
    if (right && !right.visited) {
      neighbors.push(right);
    }
    if (bottom && !bottom.visited) {
      neighbors.push(bottom);
    }
    if (left && !left.visited) {
      neighbors.push(left);
    }
    if (neighbors.length > 0) {
      var r = floor(random(0, neighbors.length));
      return (neighbors[r]);
      
    }
        

  }
  //draws the walls
  this.show = function() {
    var x = this.x * s;
    var y = this.y * s;
    //drawing the lines
    stroke(255, 0, 0, 200);
    //top
    if (this.walls[0]) {
      if(mouseIsPressed){
      walls.push(new Boundary(x, y, x + s, y));
        printed=true;
      }
      line(x, y, x + s, y);
    }
    //right
    if (this.walls[1]) {
        if(mouseIsPressed){
      walls.push(new Boundary(x + s, y, x + s, y + s));
    printed=true;
        }
        line(x + s, y, x + s, y + s);
    }
    //bottom
    if (this.walls[2]) {
        if(mouseIsPressed){
      walls.push(new Boundary(x + s, y + s, x, y + s));
          printed=true;
        }
      line(x + s, y + s, x, y + s);
    }
    //left
    if (this.walls[3]) {
        if(mouseIsPressed){
      walls.push(new Boundary(x, y, x, y + s));
          
        }
      line(x, y, x, y + s);
    }
    if (this.visited) {
      noStroke();
      fill(0);
      rect(x, y, s, s);
    }

    noStroke();
    fill(255, 0, 0, 100);
    rect(current.x * s, current.y * s, s, s)
    fill(0, 0, 255, 100);

  }
}

//========================================
function removeWalls(a, b) {
  var x = a.x - b.x;
  if (x == 1) {
    a.walls[3] = false;
    b.walls[1] = false;
  } else if (x == -1) {
    a.walls[1] = false;
    b.walls[3] = false;
  }
  var y = a.y - b.y;
    if (y == 1) {
    a.walls[0] = false;
    b.walls[2] = false;
  } else if (y == -1) {
    a.walls[2] = false;
    b.walls[0] = false;
  }
}
