let listchar='_|';
let dim=12;
let x=0;
let y=0;
function setup(){

	//set10();
	setfractal();
	fractal();
}

function draw(){
	print10();
}

function print10(){
	let index=floor(random(2));
	let charac=listchar[index];
	text(charac,x,y);
	x=x+dim;
	if (x>width){
		x=0;
		y+=30;}
	if (y>height){
		noLoop();
	}
}

function set10(){
	createCanvas(400,400);
	textSize(32);
	background(51);
	fill(255);
}

function setfractal(){
	createCanvas(1000,800);
	background(0);
	noFill();
	stroke(255,50);
}
let f=0.5;
function fractal(){
	drawcircle(width/2,height/2,height);//,0.5);
}

function drawcircle(x,y,d){//,f){
	circle(x,y,d);
	if (d>2){
		let dd=d*f;//perfect fractal
		dd=random(0.2,0.8)*d;
		drawcircle(x+dd,y,dd);//,f);
		drawcircle(x-dd,y,dd);//,f);
		drawcircle(x,y+dd,dd);//,f);
	}
}