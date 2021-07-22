/** rahmant3
 * Requires Cube.java and Face.java
 * Simulates a 3D 3x3 Rubix Cube in Processing
 *
 * Controls are: 
 * Up/Down/Left/Right arrows to move the view of the cube.
 * G(reen)/O(range)/B(lue)/R(ed)/W(hite)/Y(ellow) to turn that face CLOCKWISE
 * N to randomize the cube
 * Space to restart to solved position
 * U to undo a move
 */

float tileLen;
Cube cube;

float xOffset;
float yOffset;
float yChange;
float xChange;

ArrayList<Integer> moves;
int maxMoves = 254;

boolean showText;
String welcome = "Welcome to the Rubix Cube simulation!\n\nThe controls are as follows: \n" +
//"-Mouse movement from side to side moves the cube about the central vertical axis\n" +
"-Left/Right arrow keys moves the cube about the central vertical axis\n" +
//"-Mouse movement above or below the middle half of this window moves the cube about the \n" +
//"central horizontal axis (keeping your mouse in the middle half of the window means the cube won't move \n" +
"-Up/Down arrow keys moves the cube about the central horizontal axis\n" +
"-Capital N randomizes the cube\n" + 
"-Space Bar resets cube to solved\n" + 
"-Press the letter corresponding to the color of the face to turn that face\n" +
"CLOCKWISE, e.g.:\n\n" +
"G for green\n" +
"O for orange\n" +
"R for red\n" +
"B for blue\n" +
"W for white\n" +
"Y for yellow\n" +
"(The color of a face is the color of its center)\n\n" +
"-Press U to undo a move\n" +
"-Press H to hide this and show the cube!" +
"\n\n\n\n\n\nThis program is written in Processing (Java)";

void setup() {
  size(600, 600);
  colorMode(HSB);
  
  cube = new Cube();
  tileLen = 75;
  xOffset = 0;
  yOffset = 0;
  xOffset = 0;
  
  moves = new ArrayList<Integer>();
  showText = false;
}

void draw() {
  background(0);
  //lights();
  
  stroke(0);
  //strokeWeight(2);
  
  if (showText) {
    fill(255);
    textSize(14);
    text(welcome, 50, 50);
  } else {
    fill(255);
    textSize(12);
    text("Press H for help!", 20, 20);
    
    xOffset += xChange;
    
    if (xOffset > 2*PI) {
      xOffset -= 2*PI;
    } else if (xOffset < -2*PI) {
      xOffset += 2*PI;
    }
    
    //xOffset = map(mouseX, 0, width, -2*PI, 2*PI);
    //yChange = map(mouseY, 0, height, 0.1, -0.1);
    
    //if (yChange < 0.05 && yChange > -0.05) {
    //  yChange = 0;
    //} else {
    //  if (mouseY < height/2) {
    //    yChange = map(mouseY, 0, height*0.25, 0.1, 0);
    //  } else {
    //    yChange = map(mouseY, height*0.75, height, 0, -0.1);
    //  }
    //}
    
    
    if (abs(xOffset) > PI/2 && abs(xOffset) < 1.5*PI) {
      yOffset -= yChange;
    } else {
      yOffset += yChange;
    }
    
    translate((width/2), (height/2));
    rotateY(xOffset);
    rotateX(yOffset);
    translate(-tileLen*3/2, -tileLen*3/2, tileLen*3/2);
    
    drawCube();
  }
}

void drawCube() {
  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        //char tile = cube.sides[i].tiles[j][k];
        char tile = cube.getTile(i, j, k);
        int colour = 0;
        if (tile == 'R') {
          colour = 0;
        } else if (tile == 'B') {
          colour = 180;
        } else if (tile == 'G') {
          colour = 80;
        } else if (tile == 'O') {
          colour = 20;
        } else if (tile == 'Y') {
          colour = 50;
        } else if (tile == 'W') {
          colour = -1;
        }
        
        if (i == 0) {
          makeTile(k*tileLen, (j)*tileLen, 0, (k+1)*tileLen, (j+1)*tileLen, 0, colour);
        } else if (i == 1) {
          makeTile(0, j*tileLen, (k - 3)*tileLen, 0, (j+1)*tileLen, (k - 2)*tileLen, colour);
        } else if (i == 2) {
          makeTile((3-k)*tileLen, (j)*tileLen, -3*tileLen, (2-k)*tileLen, (j+1)*tileLen, -3*tileLen, colour);
        } else if (i == 3) {
          makeTile(3*tileLen, j*tileLen, (-k)*tileLen, 3*tileLen, (j+1)*tileLen, (-1-k)*tileLen, colour);
        } else if (i == 4) {
          makeTile((k)*tileLen, 0, (j-3)*tileLen, (k+1)*tileLen, 0, (j-2)*tileLen, colour);
        } else if (i == 5) {
          makeTile(k*tileLen, 3*tileLen, (-j)*tileLen, (k+1)*tileLen, 3*tileLen, (-1-j)*tileLen, colour);
        }
      }
    }
  }
}

void makeTile(float xS, float yS, float zS, float xE, float yE, float zE, int colour) {
  if (colour != -1) {
    fill(colour, 255, 255);
  } else {
    fill(255, 0, 255);
  }
  beginShape();
  if (zS == zE) {
    vertex(xS, yS, zS);
    vertex(xE, yS, zS);
    vertex(xE, yE, zE);
    vertex(xS, yE, zE);
  } else if (yS == yE) {
    vertex(xS, yS, zS);
    vertex(xE, yS, zS);
    vertex(xE, yE, zE);
    vertex(xS, yE, zE);
  } else if (xS == xE) {
    vertex(xS, yS, zS);
    vertex(xE, yE, zS);
    vertex(xE, yE, zE);
    vertex(xS, yS, zE);
  }
  endShape(CLOSE);
}

void keyPressed() {
  if (moves.size() > maxMoves) {
    moves.remove(0);
  }
  
  if (key == 'G' || key == 'g') {
    cube.rotateFace(0);
    moves.add(0);
  } 
  if (key == 'O' || key == 'o') {
    cube.rotateFace(1);
    moves.add(1);
  } 
  if (key == 'B' || key == 'b') {
    cube.rotateFace(2);
    moves.add(2);
  }
  if (key == 'R' || key == 'r') {
    cube.rotateFace(3);
    moves.add(3);
  }
  if (key == 'W' || key == 'w') {
    cube.rotateFace(4);
    moves.add(4);
  } 
  if (key == 'Y' || key == 'y') {
    cube.rotateFace(5);
    moves.add(5);
  }
  
  if (key == 'u' || key == 'U') {
    if (!moves.isEmpty()) {
      int index = moves.size() - 1;
      int face = moves.get(index);
      cube.rotateFace(face);
      cube.rotateFace(face);
      cube.rotateFace(face);
      moves.remove(index);
    }
  }
  if (key == ' ') {
    cube.reset();
    moves = new ArrayList<Integer>();
  }
  if (key == 'N') {
    randomize();
    moves = new ArrayList<Integer>();
  }
  if (key == 'H' || key == 'h') {
    showText = !showText;
  } 
  if (key == CODED) {
    if (keyCode == UP) {
      yChange = 0.1;
    } else if (keyCode == DOWN) {
      yChange = -0.1;
    } else if (keyCode == RIGHT) {
      xChange = 0.1;
    } else if (keyCode == LEFT) {
      xChange = -0.1;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN) {
      yChange = 0;
    } else if (keyCode == RIGHT || keyCode == LEFT) {
      xChange = 0;
    }
  }
}
  
void randomize() {
  for (int i = 0; i < 60; i++) {
    double r = Math.random();
    
    cube.rotateFace((int) Math.floor(r*100) % 6);
    
  }
}
/** rahmant3
 * Requires Face.java class
 *
 * Contains 6 face objects (a 3x3 array containing 1 face of the cube) to simulate a rubix cube.
 * Allows the user only to rotate the face of a cube, to reset the cube to starting position, or
 * to get a tile from the cube.
 *
 * The order of faces is indexed from 0 to 5, with the colors as follows:
 * front (green), left (orange), back (blue), right (red), top (white), bottom (yellow)
 * 
 */

public class Cube {
  
  private static Face[] sides;
  private char[] colors = {'G', 'O', 'B', 'R', 'W', 'Y', 'Z', 'A', 'C'};
  
  public Cube() {
    sides = new Face[6];
    for (int i = 0; i < sides.length; i++) {
      sides[i] = new Face();
    }
    this.reset();
  }
  
  public char getTile(int face, int row, int col) {
    return sides[face].getTile(row, col);
  }
    

  public void reset() {
    for (int k = 0; k < 6; k++) {
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          sides[k].setTile(i, j, colors[k]);
        }
      }
    }
  }
  
  //CW turn of any face on the cube
  public void rotateFace(int pos) {
    //Rotate the target face CW
    sides[pos] = rotateMatrixCW(sides[pos]);
    
    //Adjust the other faces accordingly
    if (pos == 0) { //front face
      char[] temp = (sides[4].getRow(2));
      sides[4].setRow(2, reverseLine(sides[1].getCol(2)));
      sides[1].setCol(2, sides[5].getRow(0));
      sides[5].setRow(0, reverseLine(sides[3].getCol(0)));
      sides[3].setCol(0,  temp);
    } else if (pos == 1) { // left face
      char[] temp = (sides[4].getCol(0));
      sides[4].setCol(0, reverseLine(sides[2].getCol(2)));
      sides[2].setCol(2, reverseLine(sides[5].getCol(0)));
      sides[5].setCol(0, sides[0].getCol(0));
      sides[0].setCol(0, temp);
    } else if (pos == 2) { //back face
      char[] temp = (sides[4].getRow(0));
      sides[4].setRow(0, (sides[3].getCol(2)));
      sides[3].setCol(2, reverseLine(sides[5].getRow(2)));
      sides[5].setRow(2, (sides[1].getCol(0)));
      sides[1].setCol(0, reverseLine(temp));
    } else if (pos == 3) { //right face
      char[] temp = (sides[0].getCol(2));
      sides[0].setCol(2, sides[5].getCol(2));
      sides[5].setCol(2, reverseLine(sides[2].getCol(0)));
      sides[2].setCol(0, reverseLine(sides[4].getCol(2)));
      sides[4].setCol(2, (temp));
    } else if (pos == 4) { //top
      char[] temp = (sides[0].getRow(0));
      sides[0].setRow(0, sides[3].getRow(0));
      sides[3].setRow(0, sides[2].getRow(0));
      sides[2].setRow(0, sides[1].getRow(0));
      sides[1].setRow(0, temp);
    } else if (pos == 5) { //bottom
      char[] temp = (sides[0].getRow(2));
      sides[0].setRow(2, sides[1].getRow(2));
      sides[1].setRow(2, sides[2].getRow(2));
      sides[2].setRow(2, sides[3].getRow(2));
      sides[3].setRow(2,  temp);
    }
    
  }
  
  //Reverse a vector of characters
  private static char[] reverseLine (char[] line) {
    char[] result = new char[line.length];
    for (int i = 0; i < line.length/2; i++) {
      result[i] = line[line.length - 1 - i];
      result[line.length - 1 - i] = line[i];
    }
    if (line.length % 2 != 0) {
      result[line.length/2] = line[line.length/2];
    }
    return result;
  }
  
  //Rotate matrix clockwise
  //Transpose matrix, then reverse the columns
  private static Face rotateMatrixCW (Face input) {
    Face transpose = new Face();
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        transpose.setTile(i, j, input.getTile(j, i));
      }
    }
    
    for (int i = 0; i < input.getSIZE()/2; i++) {
      input.setCol(i, transpose.getCol(input.getSIZE() - i - 1));
      input.setCol(input.getSIZE() - i - 1, transpose.getCol(i));
    }
    
    if (input.getSIZE() % 2 != 0) {
      input.setCol(input.getSIZE()/2, transpose.getCol(input.getSIZE()/2));
    }
    return input;
  }
  
  public String cubeToString() {
    String result = "";
    for (int i = 0; i < 3; i++) {;
      result += sides[4].lineToString(i) + "\n";
    }
    int[] order = {0, 3, 2, 1};
    for (int i = 0; i < 3; i++) {
      for (int k = 0; k < 4; k++) {
        result+= sides[order[k]].lineToString(i) + " ";
      }
      result += "\n";
    }
    for (int i = 0; i < 3; i++) {
      result += sides[5].lineToString(i) + "\n";
    }
    return result;
  }
}
/** rahmant3
 * To be used with Cube.java class
 *
 * Face objects (a 3x3 array containing 1 face of the cube) to be used in order to simulate a rubix cube.
 * Contains getters and setters in order to get a row, column, or tile, allowing Cube.java to manipulate
 * the faces to simulate a cube.
 */
 
public class Face {

  private char[][] tiles;
  private int SIZE = 3;
  
  public Face () {
    tiles = new  char[SIZE][SIZE];
  }

  public char getTile(int row, int col) {
    return tiles[row][col];
  }
  
  public void setTile(int row, int col, char val) {
    tiles[row][col] = val;
  }
  
  public int getSIZE() {
    return SIZE;
  }

  public char[] getRow (int row) {
    char[] result = new char[SIZE];
    for (int i = 0; i < SIZE; i++) {
      result[i] = tiles[row][i];
    }
    return result;
  }
  
  public char[] getCol (int col) {
    char[] result = new char[SIZE];
    for (int i = 0; i < SIZE; i++) {
      result[i] = tiles[i][col];
    }
    return result;
  }
  
  public char[][] getFace () {
    char[][] result = new char[SIZE][SIZE];
    
    for (int i = 0; i < SIZE; i++) {
      for (int j = 0; j < SIZE; j++) {
        result[i][j] = tiles[i][j];
      }
    }
    return result;
  }
  
  public void setFace (char[][] vals) {
    for (int i = 0; i < vals.length; i++) {
      for (int j = 0; j < vals[0].length; j++) {
        tiles[i][j] = vals[i][j];
      }
    }
  }
  
  public void setRow (int row, char[] input) {
    char[] vals = input;
    for (int i = 0; i < vals.length; i++) {
      tiles[row][i] = vals[i];
    }
  }
  
  public void setCol (int col, char[] input) {
    char[] vals = input;
    for (int i = 0; i < vals.length; i++) {
      tiles[i][col] = vals[i];
    }
  }
  
  public String faceToString() {
    String result = "";
    for (int i = 0; i < tiles.length; i++) {
      for (int j = 0; j < tiles[0].length; j++) {
        result += tiles[i][j];
      }
    }
    return result;
  }
  public String lineToString(int row) {
    String result = "";
    for (int i = 0; i < tiles.length; i++) {
      result += tiles[row][i];
    }
    return result;
  }  
}
    
