// change these flow parameters for different effects:
const dt = 1 / 25;  // approximately equal to framerate
const visc = 0.00001;
const N = 128;
const M = N+2;
const SIZE = (N+2)*(N+2);
// free flow velocity:
const uf = 0.0 / dt;
const vf = 0.0 / dt;

var U1 = new Array(M);
var V1 = new Array(M);
var U2 = new Array(M);
var V2 = new Array(M);

function initflow() {
  for (var i = 0; i < M; ++i) {
    U1[i] = new Float32Array(M);
    V1[i] = new Float32Array(M);
    U2[i] = new Float32Array(M);
    V2[i] = new Float32Array(M);
  }
  
}

function step() {
  //diffuse( 1, U2, U1, visc );
  //diffuse( 2, V2, V1, visc );
  memcpy(U2, U1);
  memcpy(V2, V1);
  //project( U2, V2, U1, V1 );
  advect(1, U1, U2, U2, V2);
  advect(2, V1, V2, U2, V2);
  //if (frameCount % 20 == 0) add_noise(U1, V1);
  project(U1, V1, U2, V2);
  // pressure = U2, div = V2;
  
}


function add_velocity() {
    // fill a circle with radius rad and midpoint (x,y) with velocity (u,v) (nondim!)
    var u = (mouseX - pmouseX);
    var v = (mouseY - pmouseY);
    if (u == 0 && v == 0) return;
    u /= dt * width;
    v /= dt * height;
    var x = 1 + int(N * mouseX / width);
    var y = 1 + int(N * mouseY / height);
    var rad = int(20 * N / width);

    for (var i = -rad; i <= rad; i++) {
        if ((x + i < 0) || (x + i > N)) { continue };
        var row = int(0.5 + Math.sqrt(rad * rad - i * i));
        for (var j = -row; j <= row; j++) {
            if ((y + j < 0) || (y + j > N)) { continue };
            U1[x + i][y + j] = u;
            V1[x + i][y + j] = v;
        }
    }
    if (mouseIsPressed) {
        for (var k = 0; k < rad * rad; k++) {
            var i = floor(randomGaussian(x, rad));
            var j = floor(randomGaussian(y, rad));
            particles.push(new Particle(i / N, j / N));
        }
    }
}


function memcpy(dst, src) {
  for (var i = 0; i < M; i++) {
    for (var j = 0; j < M; j++) {
      dst[i][j] = src[i][j];
    }
  }
}

function sum(u0) {
  var s = 0.0;
  for (var i=1 ; i<=N ; i++) {
    for (var j=1; j<=N; j++) {
      s += u0[i][j];
    }
  }
  return s;
}


function diffuse(b, x, x0, diff0) {
  var a = dt * diff0 * N * N;
  for (var k=0 ; k<10 ; k++) {
    for (var i=1 ; i<=N ; i++) {
      for (var j=1; j<=N; j++) {
        x[i][j] = (x0[i][j] + a * (x[i-1][j] + x[i+1][j] + x[i][j-1] + x[i][j+1])) / (1 + 4 * a);
      }
    }
    set_bnd(b, x);
  }
}


function advect(b, d, d0, u0, v0) {
  var i0, j0, i1, j1;
  var x, y, s0, t0, s1, t1, dt0;
  dt0 = dt * N;
  for (var i=1 ; i<=N ; i++) {
    for (var j=1 ; j<=N ; j++) {
      x = i - dt0 * u0[i][j];
      y = j - dt0 * v0[i][j];
      if (x<0.5) x = 0.5;
      if (x>N+0.5) x = N+0.5;
      i0 = int(x);
      i1 = i0 + 1;
      if (y<0.5) y = 0.5;
      if (y>N+0.5) y = N+0.5;
      j0 = int(y);
      j1 = j0 + 1;
      s1 = x - i0;
      s0 = 1 - s1;
      t1 = y - j0;
      t0 = 1 - t1;
      d[i][j] = s0 * (t0 * d0[i0][j0] + t1 * d0[i0][j1]) + s1 * (t0 * d0[i1][j0] + t1 * d0[i1][j1]);
    }
  }
  set_bnd(b, d);
}


function advect2(b, d, d0, u0, v0) {
  // midpoint displacement
  var i0, j0, i1, j1;
  var u, v, x, y, s0, t0, s1, t1
  var dt0 = dt * N;
  var dt2 = 0.5 * dt0;
  for (var i=1 ; i<=N ; i++) {
    for (var j=1 ; j<=N ; j++) {
      x = i - dt2 * u0[i][j];
      y = j - dt2 * v0[i][j];
      if (x<0.5) x = 0.5;
      if (x>N+0.5) x = N+0.5;
      i0 = int(x);
      i1 = i0 + 1;
      if (y<0.5) y = 0.5;
      if (y>N+0.5) y = N+0.5;
      j0 = int(y);
      j1 = j0 + 1;
      s1 = x - i0;
      s0 = 1 - s1;
      t1 = y - j0;
      t0 = 1 - t1;
      u = s0 * (t0 * u0[i0][j0] + t1 * u0[i0][j1]) + s1 * (t0 * u0[i1][j0] + t1 * u0[i1][j1]);
      v = s0 * (t0 * v0[i0][j0] + t1 * v0[i0][j1]) + s1 * (t0 * v0[i1][j0] + t1 * v0[i1][j1]);

      x = i - dt0 * u;
      y = j - dt0 * v;
      if (x<0.5) x = 0.5;
      if (x>N+0.5) x = N+0.5;
      i0 = int(x);
      i1 = i0 + 1;
      if (y<0.5) y = 0.5;
      if (y>N+0.5) y = N+0.5;
      j0 = int(y);
      j1 = j0 + 1;
      s1 = x - i0;
      s0 = 1 - s1;
      t1 = y - j0;
      t0 = 1 - t1;

      d[i][j] = s0 * (t0 * d0[i0][j0] + t1 * d0[i0][j1]) + s1 * (t0 * d0[i1][j0] + t1 * d0[i1][j1]);
    }
  }
  set_bnd(b, d);
}



function project(u0, v0, p, div) {
  var h = 1.0 / N;
  for (var i=1; i<=N ; i++) {
    for (var j=1; j<=N ; j++) {
      div[i][j] = -0.5 * h * (u0[i + 1][j] - u0[i - 1][j] + v0[i][j + 1] - v0[i][j - 1]);
      p[i][j] = 0;
    }
  }
  set_bnd(0, div);
  set_bnd(0, p);
  for (var k = 0; k < 10; k++) {
    for (i=1; i<=N ; i++) {
      for (j=1; j<=N ; j++) {
        p[i][j] = (div[i][j] + p[i - 1][j] + p[i + 1][j] + p[i][j - 1] + p[i][j + 1]) * (1 / 4);
      }
    }
    set_bnd(0, p);
  }
  for (i=1 ; i<=N ; i++) {
    for (j=1 ; j<=N ; j++) {
      u0[i][j] -= 0.5 * (p[i + 1][j] - p[i - 1][j]) / h;
      v0[i][j] -= 0.5 * (p[i][j + 1] - p[i][j - 1]) / h;
    }
  }
  set_bnd(1, u0);
  set_bnd(2, v0);
}


function add_noise(u0, v0) {
  //var V = 40/N;
  for (i=1 ; i<=N ; i++) {
    for (j=1 ; j<=N ; j++) {
      var p = (1/8) * randomGaussian();
      p *= Math.sqrt(u0[i][j]*u0[i][j] + v0[i][j]*v0[i][j])
      u0[i][j-1] -= p;
      u0[i][j+1] += p;
      v0[i-1][j] += p;
      v0[i+1][j] -= p;
      p *= 0.5;
      u0[i-1][j-1] -= p;
      u0[i-1][j+1] += p;
      u0[i+1][j-1] -= p;
      u0[i+1][j+1] += p;
      v0[i-1][j-1] += p;
      v0[i+1][j-1] -= p;
      v0[i-1][j+1] += p;
      v0[i+1][j+1] -= p;
    }
  }
  set_bnd(1, u0);
  set_bnd(2, v0);
}

function set_bnd(b, x) {
    for (var i=1; i<=N; i++) {
        x[0][i] = (b == 1) ? uf - x[1][i] : x[1][i];
        x[N+1][i] = b == 1 ? uf - x[N][i] : x[N][i];
        x[i][0] = b == 2 ? vf - x[i][1] : x[i][1];
        x[i][N+1] = b == 2 ? vf - x[i][N] : x[i][N];
    }
    x[0][0] = 0.5 * (x[1][0] + x[0][1]);
    x[0][N+1] = 0.5 * (x[1][N+1] + x[0][N]);
    x[N+1][0] = 0.5 * (x[N][0] + x[N+1][1]);
    x[N+1][N+1] = 0.5 * (x[N][N+1] + x[N+1][N]);
}
