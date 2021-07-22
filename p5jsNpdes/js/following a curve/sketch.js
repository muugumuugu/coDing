// Canvas
let width = 1000;	// width of canvas
let height = 600;	// height of canvas
let s = 200;		// spacing between axes
let offsetx = 150;
let offsety = 100;

let t = 0;

// let P0x = 0;
// let P0y = 0;
// let P1x = 500;
// let P1y = 100;
// let P2x = 100;
// let P2y = 300;
// let P3x = 700;
// let P3y = 400;
let P0x = 0+offsetx;
let P0y = height-100;
let P1x = 800+offsetx;
let P1y = height-offsety-100;
let P2x = 0+offsetx;
let P2y = height-offsety-300;
let P3x = width-offsetx-100;
let P3y = height-offsety-400;

let Ox = 100;
let Oy = 300;
let particle_size = 10;

let basis_length = 60;
let vscale = 10;
let clkd = false;
	
var sliderT;
var radioB;
var dragging = false;
var radioP;
var buttonO;

// Set up the canvas and DOS objects
function setup() {
	createCanvas(width, height);
	
	textSize(20);
	textFont('Times');
		
	radioB = createRadio();
	radioB.option('None', 1);
	radioB.option('Cartesian', 2);
	radioB.option('Polar', 3);
	radioB.option('Normal-Tangent', 4);
	radioB.position(10,30);
	radioB.style('width','700px');
	radioB._getInputChildrenArray()[0].checked = true;
	
	radioP = createRadio();
	radioP.option('Pos', 1);
	radioP.option('Pos+Vel', 2);
	radioP.option('Position+Vel+Acc', 3);
	radioP.option('None', 4);
	radioP.position(width-400,height-80);
	radioP.style('width','400px');
	radioP._getInputChildrenArray()[3].checked = true;
	
	sliderT = createSlider(0,1,0,0.001);
	sliderT.position(20,height-50);
	sliderT.style('width','200px')
	
	buttonO = createButton('Show Basis at Origin');
	buttonO.position(width-225,height-41);
	
	resetSpace();
	push();
	fill(255);
	circle(P0x,P0y,particle_size);
	pop();
	
	sliderT.input(plotParticle);
	radioB.changed(plotParticle);
	radioP.changed(plotParticle);
	buttonO.mousePressed(buttonClick);
	
}

// Plot stress and strain each time slider is changed
function plotPath() {
	
	beginShape();
	noFill();
	stroke(0);
	strokeWeight(2);

	for (n=0; n<=100; n++) {
		
		p = BezierPoint(t);
		vertex(p.x,p.y);
		t = t+0.01;
		
	}	
	endShape()
	
	// testP = Point(100,100);
	// console.log(testP.x);
	t = 0;
}

// Reset the Cross-section and axes each time slider is changed
function resetSpace() {
	// background(220);
	background(204,255,255);
	plotPath();
	plotOrigin();
}

// Function used to define a point along bezier curve (called when plotting path (all times t) and for plotting particle/origin of basis vectors (specific time t)
function BezierPoint(t) {
	
	let x = (1-t)**3*P0x+3*(1-t)**2*t*P1x+3*(1-t)*t**2*P2x+t**3*P3x;
	let y = (1-t)**3*P0y+3*(1-t)**2*t*P1y+3*(1-t)*t**2*P2y+t**3*P3y;
	
	let coord = createVector(x,y);
	
	return coord;
	
}

// Function to calculate derivative of position curve
function BezierTangent(t) {
	
	let xdot = 3*(1-t)**2*(P1x-P0x)+6*(1-t)*t*(P2x-P1x)+3*t**2*(P3x-P2x);
	let ydot = 3*(1-t)**2*(P1y-P0y)+6*(1-t)*t*(P2y-P1y)+3*t**2*(P3y-P2y);
	
	let deriv = createVector(xdot,ydot);
	
	return deriv;
}

// Bezier Curvature
function BezierCurv(t) {
	
	let xddot = 6*(1-t)*(P2x-2*P1x+P0x)+6*t*(P3x-2*P2x+P1x);
	let yddot = 6*(1-t)*(P2y-2*P1y+P0y)+6*t*(P3y-2*P2y+P1y);
	
	let curv = createVector(xddot,yddot);
	
	return curv;
		
}

function plotOrigin() {
	
	fill(0);
	
	push();
	strokeWeight(0.5);
	origin = createVector(Ox,Oy);
	circle(origin.x,origin.y,5);
	line(origin.x,origin.y,origin.x+50,origin.y);
	line(origin.x,origin.y,origin.x,origin.y-50);
	pop();
	
	push();
	strokeWeight(0.5);
	textStyle(ITALIC);
	text('O',origin.x-25,origin.y);
	pop();
	
	circle(P0x,P0y,5);
	// circle(P1x,P1y,5);
	// circle(P2x,P2y,5);
	circle(P3x,P3y,5);
	
}

function plotBasis () {
	
	
	// Plot instantaneous radius of curvature
}

function plotParticle() {
	clear();
	resetSpace();
	
	let val = radioB.value();
	let valP = radioP.value();

	let k = sliderT.value();
	let p = BezierPoint(k);
	let v = BezierTangent(k);
	let rho = BezierCurv(k);
	let o = createVector(Ox,Oy);
	
	// Draw Particle
	fill(255);
	stroke(0);
	circle(p.x,p.y,particle_size);
	
	// Draw Position Vector
	let position = createVector(p.x-Ox,p.y-Oy)

	
	// Draw Cartesian Basis
	ex = createVector(basis_length,0);
	ey = createVector(0,-basis_length);
	if (val == 2) {
		drawArrow(p,ex,'darkgreen',4);
		drawArrow(p,ey,'darkgreen',4);
		if (clkd == true) {
			drawArrow(o,ex,'darkgreen',4);
			drawArrow(o,ey,'darkgreen',4);
		}
	}
	
	// Draw Polar Basis
	lengthR = position.mag();
	er = position.mult(basis_length/lengthR);
	if (val == 3) {
		drawArrow(p,er,'red',4);
		if (clkd == true) {
			drawArrow(o,er,'red',4);
		}
		ec = position.rotate(-HALF_PI);
		drawArrow(p,ec,'red',4);
		if (clkd == true) {
			drawArrow(o,ec,'red',4);
		}
		position.rotate(HALF_PI);
	}
	position.mult(lengthR/basis_length);
	
	// Draw N-T Basis
	// let velocity = createVector(v.x-er.x,v.y-er.y);
	// lengthV = velocity.mag();
	// if (val == 4) {
		// et = velocity.mult(basis_length/lengthV);
		// drawArrow(p,et,'blue',4);
		// if (rho.y >= 0) {
			// angle = HALF_PI;
		// } else {
			// angle = -HALF_PI;
		// }
		// en = et.rotate(angle);
		// drawArrow(p,en,'blue',4); 
	// }
	
	let velocity = createVector(v.x-Ox,v.y-Oy);
	lengthV = v.mag();
	if (val == 4) {
		et = v.mult(basis_length/lengthV);
		drawArrow(p,et,'blue',4);
		if (clkd == true) {
			drawArrow(o,et,'blue',4);
		}
		if (rho.y >= 0) {
			angle = HALF_PI;
		} else {
			angle = -HALF_PI;
		}
		en = et.rotate(angle);
		drawArrow(p,en,'blue',4); 
		if (clkd == true) {
			drawArrow(o,en,'blue',4);
		}
		v.mult(lengthV/basis_length);
		v.rotate(-angle);
	}
	
	// Plot position vector
	if (valP != 4) {
	drawArrow(origin,position,'red',7);
	push();
	stroke('red');
	fill('red');
	strokeWeight(1);
	textStyle(BOLD);
	text('r',10+Ox+(p.x-Ox)/2,-10+Oy+(p.y-Oy)/2);
	pop();
	}
	
	// Plot velocity vector
	if (valP != 4 && valP != 1) {
	drawArrow(p,v.mult(1/vscale),'blue',7);
	push();
	stroke('blue');
	fill('blue');
	strokeWeight(1);
	textStyle(BOLD);
	text('v',10+p.x+v.x/2,-15+p.y-v.y/2);
	pop();
	}
	
	// Plot acceleration vector
	if (valP == 3) {
	drawArrow(p,rho.mult(0.2/vscale),'darkgreen',7);
	push();
	stroke('darkgreen');
	fill('darkgreen');
	strokeWeight(1);
	textStyle(BOLD);
	text('a',10+p.x+rho.x/2,-15+p.y-rho.y/2);
	pop();
	}
	
	// // Radius of Curvature
	// let p2 = BezierPoint(k+0.001);
	// let pos2 = createVector(p2.x-Ox,p2.y-Oy)
	// let et2 = BezierTangent(k+0.001);
	// lv2 = v.mag();
	// et2.mult(1/lengthV);
	// en1 = en.mult(1/basis_length);
	// en2 = et2.rotate(HALF_PI);
	
	// cos_beta = en.dot(en2);
	
	// x1 = p.x;
	// y1 = p.y;
	// x2 = en.x;
	// y2 = en.y;
	// x3 = p2.x;
	// y3 = p2.y;
	// x4 = en2.x;
	// y4 = en2.y;
	
	// denom = (x1-x2)*(y3-y4)-(y1-y2)*(x3-x4);
	// qx = ((x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*y4))/denom;
	// qy = ((x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*y4))/denom;
	
	// circle(qx-Ox,qy-Oy,10);
	// console.log(qx);
	
	// Redraw particle so it is on top
	circle(p.x,p.y,particle_size);
	
	// Display time next to slider
	push();
	fill(0);
	strokeWeight(0.25);
	textSize(16);
	text('Time:   '+nfc(k*10,1)+' seconds',width-390,height-25);
	pop();
}

// Clicking on button
function buttonClick() {
	if (clkd == true) {
		let Obase = 1;
		clkd = false;
		plotParticle();
	} else if (clkd == false) {
		let Obase = 0;
		clkd = true;
		plotParticle();
	}
	
}

// Clicking on canvas defines origin
function mouseReleased() {
	
	if (mouseX < width && mouseY < height-80 && mouseY > 50) {
		dragging = true;
		Ox = mouseX;
		Oy = mouseY;
		resetSpace();
		plotParticle();
	}
	
}
// draw an arrow for a vector at a given base position
function drawArrow(base, vec, myColor, arrowSize) {
  push();
  stroke(myColor);
  strokeWeight(1.5);
  fill(myColor);
  translate(base.x, base.y);
  line(0, 0, vec.x, vec.y);
  rotate(vec.heading());
  translate(vec.mag() - arrowSize, 0);
  triangle(0, arrowSize / 2, 0, -arrowSize / 2, arrowSize, 0);
  pop();
}