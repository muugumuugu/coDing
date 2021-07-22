var s = 0.015;

function setup() {
  if (windowWidth < 800) {
    createCanvas(windowWidth, windowHeight);
  } else {
    createCanvas(600, 400);
  }
  background(0);
  colorMode(HSL, 360, 100, 100, 100);
  //var c = 175 + random(135);
  var c = 194;
  //var c = 310;  
  
  noiseDetail(2, 0.3);
  for (var y = 0; y <= height; y++) {
    for (var x = 0; x <= width; x++) {
      var n = noise(x * s, y * s);
      var N = map(n, 0, 1, 1, 0);
      stroke(c, 100, N * 30, 30);
      point(x, y);
    }
  }
  
  noiseDetail(10, 0.8);
  for (var yy = 0; yy <= height; yy++) {
    for (var xx = 0; xx <= width; xx++) {
      var nn = noise(xx * s, yy * s);
      var NN = map(nn, 0, 1, 1, 0);
      stroke(c, 100, 50 + sq(NN) * 200, NN * 100);
      if (NN < 0.5) {
        point(xx, yy);
      }
      if (random(1) < 0.01) {
        var size = random(1.1);
        for (var i = 4; i > 1; i--) {
          noStroke();
          fill(c, 100, 60 + i * 10, i * 25);
          ellipse(xx, yy, pow(size, 3) + pow(2.2 / i, 3));
        }
      }
    }
  }
}
