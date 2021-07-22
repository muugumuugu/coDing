Cell[] cells; // grid of triangular cells
int[] stack; // stack used to save visited cells
int current;  // current cell
PGraphics maze; // PGraphics used to draw the maze
int stackSize;

int l;  
float h;
float r;
float theta = TWO_PI/3;  
int cols;
int rows;
int cellCount;

void setup() {
  size(1200, 700);
  
  initializeVariables();
  createGrid();
}

void draw() {
  updateMaze();
  displayMaze();
}

/*---------------------*/

void mousePressed() {
  initializeVariables();
  createGrid();
}

/*---------------------*/

void initializeVariables() {
  l = 22;
  h = l*sqrt(3)/2;
  r = h*2/3;

  // Picks random and valid row and column numbers
  int mazeWidth = l*(2+floor(random(height/l-1)))-1;
  cols = 2*floor(mazeWidth/l)-2;
  rows = 1+floor(random(cols/2));

  maze = createGraphics(mazeWidth,l*rows);
  cellCalculator(cols,rows);
  
  background(0, 50, 70);
}

/*---------------------*/

// Calculates the quantity of cells in one hemisphere
void cellCalculator(int col, int row) {
  int triangle = row * row;
  int parallelogramside = col + 2 - (2*row);
  int parallelogram = parallelogramside * row;
  int result = parallelogram + triangle;
  cellCount = result;
}

/*---------------------*/

void createGrid() {
  cells = new Cell[cellCount];
  stack = new int[cellCount];
  stackSize = 0;
  
  float x = 0, y = 0;
  boolean up = false;
  
  int index = 0;
  for (int j = 0; j < rows; j += 1) {
    for (int i = j; i <= cols-j; i += 1) {
      
      if (i%2 == 0) {
        up = j%2 == 0 ? false : true;
      } else {
        up = j%2 == 1 ? false : true;
      }
      
      x = l + i*l/2;
      y = up ? r : h - r; 
      y += j*h;
      
      cells[index] = new Cell(x, y, up);
      index += 1;
    }
  }
  current = 0;
}

/*---------------------*/

void updateMaze() {
  maze.beginDraw();
  maze.background(0, 50, 70);
  
  cells[current].visited = true;
  
  // move to neighbor
  int next = cells[current].chooseNeighbor();
  if (next > 0) {  
    stack[stackSize] = current;
    stackSize += 1; 
    removeWalls(cells[current], cells[next]);
    current = next;
  } else if (stackSize > 0) {
    current = stack[stackSize-1];
    stackSize -= 1; 
  }
  
  // display cells
  for (int i = 0, j = cells.length; i < j; i += 1) {
    cells[i].display(maze);
  }
  
  // highlight current cell
  if (stackSize > 0) {
    cells[current].highlight(maze);
  }
  maze.endDraw();
}

/*---------------------*/

void displayMaze() {
  translate(width/2, (height - maze.width)/2);
  rotate(HALF_PI);
  
  image(maze, 0, 0);
  scale(1, -1);
  image(maze, 0, 0);
}

void removeWalls(Cell c, Cell n) {
  float angle = atan2(n.y - c.y, n.x - c.x);
  angle = (angle + PI)%PI;
  
  int idx = floor(2 * angle / theta);
  
  c.edges[idx] = false;
  n.edges[idx] = false;
}

/*---------------------*/

int findIndex(float x, float y) {
  // find position on the grid
  int i = floor(2*x/l)-2;
  int j = floor(y/h);
  
  // find index on the array of cells if it's on a valid grid position
  int index = i;
  if (i >= j && i <= cols-j && j >= 0 && j < rows) {
    for (int k = 0; k < j; k += 1) {
      index += cols - 2*k;
    }
    return index;
  } else {
    return -1;
  }
}


/*---------------------*/

  
class Cell {
  float x, y;
  float angle;
  boolean[] edges = {true, true, true}; // boolean array used to set which edges will be drawn
  boolean visited = false; // boolean used to know whether the cell was alredy visited

  Cell(float x_, float y_, boolean up) {
    x = x_;
    y = y_;
    angle = up ? -HALF_PI : HALF_PI; // orientation of the triangle
  }

  /*-----------*/ 
  
  void highlight(PGraphics pg)  {  // draw circles with random diameter on the edges of the current cell
    float diam = random(50);

    pg.noStroke();
    pg.fill(255, 100, 150, 100);
  
    for (int i = 0, l = edges.length; i < l; i += 1) {
      pg.ellipse(
        x + r * cos(angle - i * theta), 
        y + r * sin(angle - i * theta),
        diam, diam
      );
    }
  }
  
  /*-----------*/ 
  
  void display(PGraphics pg) {  // draw active edges
    pg.strokeWeight(visited ? 3 : 1);
    pg.stroke(visited ? color(220, 250, 255) : color(50, 80, 100));
    
    for (int i = 0, l = edges.length; i < l; i += 1) {
      if (this.edges[i]) {
        pg.line(
          x + r*cos(angle - (i+0)%l * theta),
          y + r*sin(angle - (i+0)%l * theta),
          x + r*cos(angle - (i+1)%l * theta),
          y + r*sin(angle - (i+1)%l * theta)
        );
      }
    }
  }

  /*-----------*/ 
  
  int chooseNeighbor() {
    int index;
    float x_, y_;
    int[] list = {-1, -1, -1};
    int listSize = 0;
    
    // find available neighbors
    for(int i = 0, l = edges.length; i < l; i += 1) {
      // find neighbor position
      x_ = x + r * cos(angle - theta * (i + 0.5));
      y_ = y + r * sin(angle - theta * (i + 0.5));
      
      // use the position to find neighbor index
      index = findIndex(round(x_), round(y_));
      
      // if neighbor was not visited yet, add it to the available neighbors list
      if (index > 0 && !cells[index].visited) {
        list[listSize]  = index;
        listSize += 1;
      }
    }

    //if there are available neighbors, choose one
    if (listSize > 0) {
      return list[floor(random(listSize))];
    } else {
      return -1;
    }
  }  
}
