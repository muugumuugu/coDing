function setup() {
  createCanvas(windowWidth, windowHeight);
  background(189, 65, 234);
}
function draw() {
  for (var x = 0; x <= windowWidth; x = x + 20) {
    for (var y = 0; y <= windowHeight; y = y + 20) {
      fill(random(145, 200), random(25, 75), random(190, 245))
      rect (x, y, 20, 20)
    }
  }
}
  
