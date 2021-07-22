/*
 sketch, you can draw skyscraper landscape. See instructions below.
 *
 * MOUSE
 * left click drag     : draw skyscrapers, drag slow for narow skyscrapers, fast for wide
 *
 * KEYS
 * Delete           : new canvas
 * - color control
 * Left Arrow          : move hue left
 * Right Arrow         : move hue right
 * - save frame
 * S                   : save png
 */

float strokeWidth = 15;
int hueBase = 220; // base for hue of skyscraper
int hueStep = 80; // how many colors are in one skyscraper
int m = 0;
int mchange = 5;

void setup() {
  fullScreen();
  //size(1900, 900);
  colorMode(HSB, 360, 100, 100, 100);
  background(229, 90, 18);
  drawGradient();
}

void draw() {
  m += mchange;
  strokeWidth = map(sin(m), -1, 1, 0, 3);
  strokeWeight(strokeWidth);
  strokeJoin(ROUND);

  if (mousePressed == true) {
    int j = 0;
    int add = mouseY < height/2 ? mouseY < height/4 ? 3 : 2 : 1;
    for (int i = hueBase; i < hueBase+hueStep; i += add) {
      stroke(i, map(mouseY, height/2, height, 100, 20), map(mouseY, height/2, height, 50, 100));
      line(mouseX, mouseY-strokeWidth*j, pmouseX, pmouseY-strokeWidth*j);
      j += map(mouseY, 0, height, 0.9, 1.7);
    }
  }
}


void drawGradient() {
  for (int i = 0; i < height; i++) {
    //float start = map(hour(), 0, 24, 0, height*0.85);
    float saturation = map(i, 3, height*0.85, 100, 80);
    float brightness = map(i, 3, height*0.85, 30, 12);

    stroke(hueBase, saturation, brightness);
    line(0, i, width, i);
  }
}

void keyPressed() {
  if (key == 'S') saveFrame("city-####.png");
  if (key == DELETE) {
    background(229, 90, 18); 
    drawGradient();
  }

  if (keyCode == RIGHT) hueBase = (hueBase + 60) % 360;
  if (keyCode == LEFT) hueBase = (hueBase - 60) % 360;
}
