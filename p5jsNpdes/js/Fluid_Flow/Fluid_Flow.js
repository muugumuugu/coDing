// Source: Real-Time Fluid Dynamics for Games by Jos Stam - http://www.intpowertechcorp.com/GDC03.pdf

class Particle {
  constructor(x, y) {
    this.x = x;
    this.y = y;
    this.p = 0;
  }
}

var particles = [];


function setup() {
  createCanvas(512, 512);
  background(0);
  colorMode(HSB, 255);
  initflow();
  
  for (var j=0 ; j<=N ; ++j) {
    for (var i=0 ; i<=N ; ++i) {
      particles.push(new Particle(i/N, j/N));
    }
  }
}


function draw() {
  background(0);
  add_velocity();
  step();
  updateParticles()
  drawParticles();
  //print("N: " + particles.length);
}


function updateParticles() {
  for (var k=0; k<particles.length; k++) {
    var pt = particles[k];
    var x = 1 + N*pt.x; var y = 1 + N*pt.y;
    var i0 = int(x); var j0 = int(y);
    if (i0>=1 && i0<N && j0>=1 && j0<N) {
      var i1 = i0 + 1; var j1 = j0 + 1;
      var s1 = x - i0; var s0 = 1 - s1;
      var t1 = y - j0; var t0 = 1 - t1;
      var u = s0 * (t0 * U1[i0][j0] + t1 * U1[i0][j1]) + s1 * (t0 * U1[i1][j0] + t1 * U1[i1][j1]);
      var v = s0 * (t0 * V1[i0][j0] + t1 * V1[i0][j1]) + s1 * (t0 * V1[i1][j0] + t1 * V1[i1][j1]);
      pt.p =  s0 * (t0 * U2[i0][j0] + t1 * U2[i0][j1]) + s1 * (t0 * U2[i1][j0] + t1 * U2[i1][j1]);
      pt.x += u * dt;
      pt.y += v * dt;
    } else {
      particles.splice(k, 1);
    }
  }
}


function drawParticles() {
  loadPixels();
  for (var k=0; k<particles.length; k++) {
    var pt = particles[k];
    if (pt.x>=0 && pt.x<1 && pt.y>=0 && pt.y<1) {
      var idx = 4*(int(pt.y*height)*width + int(pt.x*width));
      var c = color(127 + int(40000*pt.p), 255, 255);
      pixels[idx] = red(c);
      pixels[idx+1] = green(c);
      pixels[idx+2] = blue(c);
    }
  }
  updatePixels();
}


function _updateParticles() {
  var dt2 = dt/2;
  for (var k=0; k<particles.length; k++) {
    var pt = particles[k];
    var x = pt.x; var y = pt.y;
    
    u = linterp(U1, x, y);
    v = linterp(V1, x, y);
    x += u * dt2;
    y += v * dt2;

    u = linterp(U1, x, y);
    v = linterp(V1, x, y);

    pt.x += u * dt;
    pt.y += v * dt;
  }
}


function linterp(U, x, y) {
  // x, y are nondimensional [0,1)
  x = x*N + 1;
  y = y*N + 1;
  x = (x<0.5)? 0.5 : (x>N+0.5)? N+0.5 : x ;
  y = (y<0.5)? 0.5 : (y>N+0.5)? N+0.5 : y ;
  var i0 = int(x); var i1 = i0 + 1;
  var j0 = int(y); var j1 = j0 + 1;
  var s1 = x - i0; var s0 = 1 - s1;
  var t1 = y - j0; var t0 = 1 - t1;
  return s0 * (t0 * U[i0][j0] + t1 * U[i0][j1]) + s1 * (t0 * U[i1][j0] + t1 * U[i1][j1]);
}
