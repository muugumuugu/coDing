let vizID=-1;
//=================================================================
function setup() {
	angleMode(DEGREES);
	colorMode(HSB,360,100,100,255);
	//----------------------------
	cnv=createCanvas(sz,sz);
	cnv.parent(select('#cnvs'));
	//-------------------------------
	background(0);
	drawGrid(10,true);
	//-------------------------------
	setSoundSys();
	//-------------------------------
	makeTerrain();
	makePos();
	//-------------------------------
	DEPTH=sz;
	updateOnResize();
	//-------------------------------
	getFrms();
	camControls();
	canvasControls();
	updateviewCam();
	updateviewCnvs();
}
function draw() {
	clear();
	drawGrid(10,true,true);
	coorDisp();
	//---------------------

	//---------------------
	spec=fft.analyze();
	//--------------------
	stroke('red');
	strokeWeight(8);
	if(vizID==0){
		rotSpec(spec);
	}
	else if(vizID==1){
		terrainG(spec);
	}
	else{
	cubeV(200,Pen(2),null,null,true);
	}
}
//==========================================================================
function keyPressed(){
		if      (key=='o'){resetcam();}
		else if (key=='c'){resetcam(true);}
}