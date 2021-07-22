function setup() {
  createCanvas(800, 800);
  colorMode(HSB, 100);
  frameRate(5);
  

}

function draw()
{
  background(15, 10, 150);
  const NUM_DOTS = 3000;
  for (let i = 0; i < NUM_DOTS; i++) {
    let x1 = Math.random() * width;
    let y1 = Math.random() * height;
    let theta = Math.random() * 2 * Math.PI;
    let segmentLength = Math.random() * 5 + 20;
    let x2 = Math.cos(theta) * segmentLength + x1;
    let y2 = Math.sin(theta) * segmentLength + y1;
    const BASE_H = 15;
    const BASE_S = 10;
    const BASE_B = 100;
    stroke(
      BASE_H,
      BASE_S - Math.random() * 5,
      BASE_B - Math.random() * 8,
      Math.random() * 10 + 75
    );
    line(x1, y1, x2, y2);
  }
}
