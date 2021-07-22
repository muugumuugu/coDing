/*Aidan Lilly
  Depth First Search Maze Generation
  February 25th, 2021
  
  The program utilizes a custom Stack type in order to implement a depth first search algorithm. Built on top the concept of cells, the program will iterate through the cells in a randomized order. Each time it translates from one cell to another,
  it will remove their wall. The amount of possible mazes that could be formed has 2270 digits in it. Once the program corners itself in the maze, it will utilize the stack in order to backtrack until another possible path is formed. Once it returns
  to it"s starting location, the game will begin. The user will be given full control of an object and must make their way through the newly generated maze in order to reach a specific point.
  */




import java.util.*;

PImage user = loadImage("mouse.png");
PImage cheese = loadImage("cheese.png");
int w = 30;
int screenSize = 901;
int cols, rows;
Cell grid[] = new Cell[900];
Cell current;
int index = 0;
int next;
Stack stack = new Stack();
int location = 0;
String winMsg ="You got the cheese!";
boolean mazeCreated = false;
boolean played = false;

void setup() {
  //draws the window
  frameRate(100);
  size(screenSize, screenSize);
 
  //sets number of columns = to width divided by object width
  cols = floor(width/w);
 
  //sets number of rows = to height divided by object width
  rows = floor(height/w);
 
  //creates the cells inside of the grid
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      grid[index] = new Cell(i, j);
      index+=1;
    }
  }
  current = grid[0];
}

void draw() {
  background(0);
  //Draws the grid
  for (int i=0; i<grid.length; i++) {
    grid[i].display();
  }
  //creates maze
  if (!mazeCreated){
  createMaze();
  }
  //Allows user to play
  else{
  playMaze();
  }
}


void playMaze(){
  fill(0);
  textSize(35);
  textAlign(CENTER);
  if (!played){
    text("Use WASD to move. Press r to restart. Get the cheese!",screenSize/2, screenSize/2);
  }
  //The location of mouse
  current = grid[location];
  image(cheese, grid[grid.length-1].x+7, grid[grid.length-1].y+7);
  image(user, current.x+7,current.y+7);
  //If mouse is in same cell as cheese
  if (current == grid[grid.length-1]){
  
    text(winMsg,screenSize/2, screenSize/2);
    exit();
  }
}

void createMaze(){
  noStroke();
  //mark current cell as visited
  current.visited = true;
  //show user which cell is current
  current.highlight(true);
  //choose the next cell to go to
  next = current.checkNeighbours();
  //if there is a open cell
  if (next){
    //mark next as visited
    next.visited = true;
    //push current to stack
    stack.push(current);
    //remove walls between current and next
    removeWalls(current,next);
    //move to next cell
    current = next;
    }
  //if there are no available cells
  else if (stack.size() > 0){
    //go back one space and try again
    current = stack.pop();
  }
  //once maze is finished
  else{
    mazeCreated = true;
    current.highlight(false);
  }
}
 
class Cell {
  //Cell Class variables
  int x, y;
  boolean walls[] = {true, true, true, true};
  boolean visited = false;
  int i;
  int j;
 
  //creates temporary variables when Cell is called to create grid
  Cell(int i, int j) {
    x = i*w;
    y = j*w;
  }
 
  void display() {

    //creates walls for top side of cells
    noFill();
    stroke(255);
    if (walls[0]) {
      line(x, y, x+w, y);
    }
 
    //creates walls for right side of cells
    if (walls[1]) {
      line(x+w, y, x+w, y+w);
    }
 
    //creates walls for botttom side of cells
    if (walls[2]) {
      line(x+w, y+w, x, y+w);
    }
 
    //creates walls for left side of cells
    if (walls[3]) {
      line(x, y+w, x, y);
    }
    //colours visited cells
    if(visited){
      noStroke();
      fill(255,0,0, 100);
      rect(x,y,w,w);
    }
  }
//checks avaible cells neighbouring current
    void checkNeighbours(){
      int x = current.x/w;
      int y = current.y/w;
      int multiplier = (screenSize-1)/w;
      
      int[] neighbours = new int[4];
      //cell on top of current
      int top = grid[y * multiplier + x - multiplier];
      //cell to the right of current
      int right = grid[y * multiplier + x + 1];
      //cell beneath current
      int bottom = grid[y * multiplier + x + multiplier];
      //cell to the left of current
      int left = grid[y * multiplier + x - 1];
      //if top is available
      if (top && !top.visited && y != 0){
        
        neighbours[0]=top;
      }
        //if right is available
      if (right && !right.visited && x != (multiplier-1)){
        neighbours[1]=right;
      }
        //if bottom is available
      if (bottom && !bottom.visited && y !=(multiplier-1)){
        neighbours[2]=bottom;
        
      }
        //if left is available
      if (left && !left.visited && x != 0){
        neighbours[3]=left;
      }
    //randomly select an availble cell to go to
      for (int i = 0; i<100; i++){
        int r = int(random(4));
        if (neighbours[r] != 0){
          return neighbours[r];
        }
      }
    //if no cells are avaiable
     return undefined;
  }
//highlights object calling it
  void highlight(boolean creating){
    if (creating){
    noStroke();
    fill(255,192,203, 100);
    rect(x, y, w, w);
    }
    else{
    noStroke();
    fill(0);
    rect(x,y,w,w);
    fill(255,0,0, 100);
    rect(x,y,w,w);
    stroke(255,100);
    line(x, y+w, x, y);
    line(x, y, x+w, y);
    }
  }
}
//removes walls between current and next
void removeWalls(var a, var b){
  int x = ((a.x)/w) - ((b.x)/w);
  //if b is to the left of a
  if (x==1){
    a.walls[3] = false;
    b.walls[1] = false;
  }
  //if b is to the right of a
  else if (x == -1) {
    a.walls[1] = false;
    b.walls[3] = false;
  }
  int y = ((a.y)/w) - ((b.y)/w);
  //if b is beneath a
  if (y == 1) {
    a.walls[0] = false;
    b.walls[2] = false;
  //if b is above a
  } else if (y == -1) {
    a.walls[2] = false;
    b.walls[0] = false;
  }
}

void keyPressed() {
  //once maze is finished being generated
  if (mazeCreated){
    //user has engaged with program
    played = true;
    
    if (key == 'w' || key=='W") {
      if (current.walls[0] == false){
      location -= 30;
      }
    }
   if (keyPressed == "a" || keyPressed == "A") {
     if (current.walls[3] == false){
      location -= 1;
     }
    }
   if (keyPressed == "s" || keyPressed == "S") {
     if (current.walls[2] == false){
      location += 30;
     }
    }
   if (keyPressed == "d" || keyPressed == "D") {
     if (current.walls[1] == false){
      location += 1;
     }
    }
  if (keyPressed == "r" || keyPressed == "r"){
    location = 0;
  }
  }
}
