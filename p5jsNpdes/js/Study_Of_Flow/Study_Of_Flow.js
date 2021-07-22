
var WIDTH = 1.0;
var HEIGHT = 1.0;

var GRID_DIVISION_X = 50;
var GRID_DIVISION_Y = 50;

var GRID_SIZE_X = WIDTH / GRID_DIVISION_X;
var GRID_SIZE_Y = HEIGHT / GRID_DIVISION_Y;

var GRID_DISPLAY_SIZE_X;
var GRID_DISPLAY_SIZE_Y;

var FLOW_VELOCITY = 1.0;

var OBSTACLE_TOP = 30;
var OBSTACLE_BOTTOM = 50;
var OBSTACLE_LEFT = 20;
var OBSTACLE_RIGHT = 30;

var ITERATION = 5000;
var TOLERANCE = 0.00000001;

var grids;
var particles;

function setup() {
  createCanvas(500, 500);
  GRID_DISPLAY_SIZE_X = width / GRID_DIVISION_X;
  GRID_DISPLAY_SIZE_Y = height / GRID_DIVISION_Y;
  colorMode(HSB, 360, 100, 100);
  
  grids = [];
  for (var y = 0; y < GRID_DIVISION_Y; y++) {
    var gridXs = [];
    for (var x = 0; x < GRID_DIVISION_X; x++) {
      var type;
      var psi = 0.0;
      var vel = createVector(0.0);
      if (x == 0) {
        type = 'inlet';
        psi = FLOW_VELOCITY * (GRID_DIVISION_Y - 1 - y) * GRID_SIZE_Y;
        vel = createVector(FLOW_VELOCITY, 0.0)
      } else if (x == GRID_DIVISION_X - 1) {
        type = 'outlet';
        psi = FLOW_VELOCITY * (GRID_DIVISION_Y - 1 - y) * GRID_SIZE_Y;
        vel = createVector(FLOW_VELOCITY, 0.0)
      } else if (y == 0) {
        type = 'top';
        psi = FLOW_VELOCITY;
        vel = createVector(FLOW_VELOCITY, 0.0)
      } else if (y == GRID_DIVISION_Y - 1) {
        type = 'bottom';
        psi = 0.0;
      } else if(x >= OBSTACLE_LEFT && x <= OBSTACLE_RIGHT && y >= OBSTACLE_TOP && y <= OBSTACLE_BOTTOM) {
        type = 'obstacle';
        psi = 0.0;
      } else {
        type = 'inside';
        psi = 0.0;
      }
      
      gridXs.push(new Grid(type, psi, vel));
    }
    grids.push(gridXs);
  }
  
  var sqdx = sq(GRID_SIZE_X);
  var sqdy = sq(GRID_SIZE_Y);
  for (var i = 0; i < ITERATION; i++) {
    var maxError = 0.0;
    for (var y = 0; y < GRID_DIVISION_Y; y++) {
      for (var x = 0; x < GRID_DIVISION_X; x++) {
        if (grids[y][x].type !== 'inside') {
          continue;
        }
        
        var up = grids[y - 1][x].psi;
        var down = grids[y + 1][x].psi;
        var left = grids[y][x - 1].psi;
        var right = grids[y][x + 1].psi;        
        var p = sqdy * (left + right) + sqdx * (up + down);
        p /= 2 * (sqdx + sqdy);
        var error = abs(p - grids[y][x].psi);
        maxError = max(maxError, error);
        grids[y][x].psi = p;
      }
    }
    // console.log(i + " : " + maxError);
    if (maxError < TOLERANCE) {
      break;
    }
  }
  
  particles = [];
  for (var i = 0; i < 300; i++) {
    particles.push(new Particle());
  }
  
  
  
}

function draw() {
  background(0, 0, 100);
  
  for (var y = 0; y < GRID_DIVISION_Y; y++) {
    for (var x = 0; x < GRID_DIVISION_X; x++) {
      if (grids[y][x].type === 'obstacle') {
        fill(0, 0, 0);
        rect(x * GRID_DISPLAY_SIZE_X, y * GRID_DISPLAY_SIZE_Y, GRID_DISPLAY_SIZE_X, GRID_DISPLAY_SIZE_Y);
      } else if (grids[y][x].type !== 'inside') {
        var theta = atan2(grids[y][x].vel.y, grids[y][x].vel.x);
        var h = (theta + PI) / TWO_PI * 360;
        fill(h, 100, 100);
        rect(x * GRID_DISPLAY_SIZE_X, y * GRID_DISPLAY_SIZE_Y, GRID_DISPLAY_SIZE_X, GRID_DISPLAY_SIZE_Y);
      } else {
        var up = grids[y - 1][x].psi;
        var down = grids[y + 1][x].psi;
        var left = grids[y][x - 1].psi;
        var right = grids[y][x + 1].psi;
        var vx = (up - down) / (GRID_SIZE_Y * 2);
        var vy = -(left - right) / (GRID_SIZE_X * 2);
        grids[y][x].vel = createVector(vx, vy);
        var theta = atan2(vy, vx);
        var h = (theta + PI) / TWO_PI * 360;
        fill(h, 100, 100);
        rect(x * GRID_DISPLAY_SIZE_X, y * GRID_DISPLAY_SIZE_Y, GRID_DISPLAY_SIZE_X, GRID_DISPLAY_SIZE_Y);
      }
    }
  }
  
  particles.forEach(function(p) {
    p.update();
    p.render();
  });
}

function Grid(type, psi, vel) {
  this.type = type;
  this.psi = psi;
  this.vel = vel;
}

function Particle() {
  this.pos = createVector(random(WIDTH), random(HEIGHT));
  this.vel = createVector(0.0, 0.0);
}

Particle.prototype.update = function() {
  var x = parseInt(this.pos.x * GRID_DIVISION_X);
  var y = parseInt(this.pos.y * GRID_DIVISION_Y);
  //console.log(x, y);
  if ((x >= 0 && x < GRID_DIVISION_X && y >= 0 && y < GRID_DIVISION_Y) &&
      !(x >= OBSTACLE_LEFT && x <= OBSTACLE_RIGHT && y >= OBSTACLE_TOP && y <= OBSTACLE_BOTTOM)) {
    var vel = grids[y][x].vel;
    this.pos.add(p5.Vector.mult(vel, 0.01));
  } else {
    this.pos = createVector(random(WIDTH), random(HEIGHT));
  }
}

Particle.prototype.render = function() {
  fill(30, 100, 100);
  var px = this.pos.x / WIDTH * width;
  var py = this.pos.y / HEIGHT * height;
  ellipse(px, py, 5, 5);
}
