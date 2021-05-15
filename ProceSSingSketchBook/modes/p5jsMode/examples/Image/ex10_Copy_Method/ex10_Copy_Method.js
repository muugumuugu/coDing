/*
 * @name Copy() method
 * @frame 600,400
 * @description An example of how to simulate coloring image with the copy() method.
 */
let draft, ready;
function preload() {
  ready = loadImage("data/parrot-color.png");
  draft = loadImage("data/parrot-bw.png");
}
function setup() {
  createCanvas(600, 400);
  noCursor();
  cursor("data/brush.png", 20, -10);
  image(ready, 0, 0);
  image(draft, 0, 0);
}
function mouseDragged() {
  copy(ready, mouseX, mouseY, 20, 20, mouseX, mouseY, 20, 20);
}
