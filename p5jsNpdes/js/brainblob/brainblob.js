var points = [];
var points2 = [];
var points3 = [];
var springLength;
var animateCount = 0;
var animatePerFrame = 3;

function setup() {
  springLength = min(windowWidth / 50, 30);
  createCanvas(windowWidth, windowHeight);
  background(200);
  noFill();
  noStroke();

  var xx = windowWidth / 2;
  var yy = windowHeight / 2;

  for (var l = 0; l < 2 * Math.PI; l += Math.PI / 10) {
    points.push(new Point(xx + springLength + cos(l) * springLength, yy + sin(l) * springLength, color(50)));
  }
  
  for (var l = 0; l < 2 * Math.PI; l += Math.PI / 10) {
    points2.push(new Point(xx - springLength + cos(l) * springLength, yy + sin(l) * springLength, color(50)));
  }
  
  for (var l = 0; l < 2 * Math.PI; l += Math.PI / 10) {
    points3.push(new Point(xx + cos(l) * springLength, yy - springLength + sin(l) * springLength, color(50)));
  }

}

function draw() {
  
  if (frameRate() > 55) animatePerFrame++;
  if (frameRate() < 45 && animatePerFrame > 1) animatePerFrame--;
  
  fill(255, 100)
  rect(0, 0, windowWidth, windowHeight);

  drawBlob(points, color(100, 0, 0));
  drawBlob(points2, color(0, 100, 0));
  drawBlob(points3, color(0, 0, 100));

  for (var i = 0; i < animatePerFrame; i++) {
    gravity(points);
    gravity(points2);
    gravity(points3);
    animateBlob(points);
    animateBlob(points2);
    animateBlob(points3);
    repelBlobs();
    if (mouseIsPressed)  attractPoint(mouseX, mouseY);
    attractPoint(windowWidth / 2 + sin(frameCount * 0.1) * springLength * 2, windowHeight / 2 + cos(frameCount * 0.1) * springLength * 2);
    moveBlob(points);
    moveBlob(points2);
    moveBlob(points3);
    
    keepInScreen(points);
    keepInScreen(points2);
    keepInScreen(points3);
    animateCount++;
  }

}

function drawBlob(ps, col) {
  fill(col)
  beginShape();
  ps.forEach(p => curveVertex(p.x, p.y));
  endShape(CLOSE);
}

function animateBlob(p) {
  
  if (animateCount % 200 == 0 && frameRate() > 30) addRandomPoint(p);
  
  for (var i = 0; i < p.length; i++) {
    var pI = i > 0 ? i - 1 : p.length - 1;
    p[i].keepDistanceToNeighbor(p[pI]);
  }

}

function gravity(p) {
  for (var i = 0; i < p.length; i++) p[i].dy += 0.0005;
}

function keepInScreen(p) {
  var pt;
  for (var i = 0; i < p.length; i++) {
    pt = p[i];
    if (pt.x < 0) {
      pt.x = 0;
      pt.dx = 0;
    }
    if (pt.x > windowWidth) {
      pt.x = windowWidth;
      pt.dx = 0;
    }
    if (pt.y < 0) {
      pt.y = 0;
      pt.dy = 0;
    }
    if (pt.y > windowHeight) {
      pt.y = windowHeight;
      pt.dy = 0;
    }
  }
}

function attractPoint(xx, yy) {
  
  var p = points.concat(points2).concat(points3);
  var m = { dx: 0, dy: 0 };
  var mdist = springLength * 15;
  
  for (var i = 0; i < p.length; i++) {
    
      var lx = p[i].x - xx;
      var ly = p[i].y - yy;
      var dist = sqrt(lx * lx + ly * ly);

      if (dist < mdist) {
        p[i].repel(m, lx, ly, dist, mdist, -0.01);
      }
    
  }
  
}

function repelBlobs() {
  
  var p = points.concat(points2).concat(points3);
  var mdist = springLength * 2;
  
  for (var i = 0; i < p.length; i++) {
    for (var j = i + 1; j < p.length; j++) {
      var lx = p[i].x - p[j].x;
      var ly = p[i].y - p[j].y;
      var dist = sqrt(lx * lx + ly * ly);

      if (dist < mdist) {
        p[i].repel(p[j], lx, ly, dist, mdist, 0.04);
      }

    }
  }

}

function moveBlob(p) {
  p.forEach(p => p.move());
}

function addRandomPoint(p) {
  var idx = floor(random(p.length - 2)) + 1;
  var x = (p[idx - 1].x + p[idx].x) / 2;
  var y = (p[idx - 1].y + p[idx].y) / 2;
  p.splice(idx, 0, new Point(x + random(8) - 4, y + random(8) - 4, color(50)));
}

class Point {
  constructor(x, y, col) {
    this.x = x;
    this.y = y;
    this.col = col;
    this.dx = 0;
    this.dy = 0;
    this.pd = 0;
  }

  keepDistanceToNeighbor(n) {
    var lx = this.x - n.x;
    var ly = this.y - n.y;
    var dist = sqrt(lx * lx + ly * ly);
    var angle = atan2(lx, ly);

    var tx = n.x + springLength * sin(angle);
    var ty = n.y + springLength * cos(angle);

    var deltaX = tx - this.x;
    var deltaY = ty - this.y;
    var a = atan2(deltaX, deltaY);
    var d = sqrt(deltaX * deltaX + deltaY * deltaY);
    var dmod = this.pd > d ? 0.3 : 1;
    this.pd = d;
    d = d * d * 0.001 * dmod;

    var ddx = d * sin(a);
    var ddy = d * cos(a);
    this.dx += ddx;
    this.dy += ddy;
    n.dx -= ddx;
    n.dy -= ddy;
  }

  repel(n, lx, ly, dist, mdist, pow) {
    var angle = atan2(lx, ly);
    var distMod = 1 - dist/mdist;
    var ddx = sin(angle) * pow * distMod;
    var ddy = cos(angle) * pow * distMod;
    this.dx += ddx;
    this.dy += ddy;
    n.dx -= ddx;
    n.dy -= ddy;    
  }

  move() {
    this.x += this.dx;
    this.y += this.dy;
    this.dx *= 0.995;
    this.dy *= 0.995;
  }
}
