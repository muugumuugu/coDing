let i  = 0; 
let L  = 800;
let x0 = 920;
let y0 = 540;
let N  = 64;

let points = [];

function setup() {
  createCanvas(windowWidth, windowHeight);
  strokeWeight(2.9);  
  for(let i=0; i<N; i++)
    points.push(new p5.Vector(x0+i*L*cos(PI/12)/N, y0+i*L*sin(PI/12)/N));
}


    
function draw() {  // this is run repeatedly.  
  background(255);

  let LL = L/N;
  let vx = points[1].x-points[0].x;
  let vy = points[1].y-points[0].y;
  let cp = vy*(mouseX-points[0].x) - vx*(mouseY-points[0].y);
  vx = vx-vy*max(-1, min(1, cp/500));
  vy = vy+vx*max(-1, min(1, cp/500));
  let NN = sqrt(vx*vx+vy*vy);
  points[0].x = points[0].x-vx*LL/NN;
  points[0].y = points[0].y-vy*LL/NN;
  
  for(let i=1; i<N; i++){
    let vx = points[i].x-points[i-1].x;
    let vy = points[i].y-points[i-1].y;
    let NN = sqrt(vx*vx+vy*vy);
    points[i].x = points[i-1].x + vx*LL/NN
    points[i].y = points[i-1].y + vy*LL/NN
  }  
  
    let x0 = points[0].x
    let y0 = points[0].y
    for (let i=10; i<N-1; i++){      
      let xb = points[i-1].x
      let yb = points[i-1].y
      let x = points[i].x
      let y = points[i].y
      let xa = points[i+1].x
      let ya = points[i+1].y
      let dec = 10;
      let xM = points[i-dec].x
      let yM = points[i-dec].y
      
      let vx = xa-xb;
      let vy = ya-yb;
      let nn = sqrt(vx*vx+vy*vy);
      let weight = (sin(PI*i/N*1.25)*sin(PI*i/N*1.25)*i + sin(PI*i/N*1.25)*(N-i))/N;
      let LL = L/3*(weight+0.1);
                  
      //
      bezier(xM, yM, xM, yM,  xM+ vy*(LL/nn), yM-vx*(LL/nn),  x+ vy*(LL/nn), y-vx*(LL/nn));
      bezier(xM, yM, xM, yM,  xM- vy*(LL/nn), yM+vx*(LL/nn),  x- vy*(LL/nn), y+vx*(LL/nn));
      //line (xM, yM, x- vy*(LL/nn), y+vx*(LL/nn));
    }  
}
