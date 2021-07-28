//--------------------
const CLOSED=1;const OPEN=0;
//---------------------
const X=0;const Y=1;const Z=2;
//---------------------
const ORTHO=0;
const STEREO=1;
const TWOPT=2;
const THREEPT=3;
const HUMAN=4;
const FISH=5;
//
const ISO=5;
const DIAM=6;
const CAB=7;
const CUSTOM=8;
//-----------------------------------------------------------------
////========
//builtin systems
//========
const isosys=scaledMatrix([
	[Math.sqrt(3),0,-Math.sqrt(3)],
	[1,2,1],
	[Math.sqrt(2),-Math.sqrt(2),Math.sqrt(2)],

],1/Math.sqrt(6));//from 1st quadrant.
//================================================================
//CAMERAS
//================================================================
//...............
//Axonomeric
//................
//diametric
const dtheta=Math.atan(1/2);
const DIAMETRICCAM=[
	[ 0.8944,0.4472,0,0],//col1[Math.cos(dtheta),0,-Math.cos(dtheta)]
	[ 0     ,1     ,0,0],//col2[Math.sin(dtheta),1,Math.sin(dtheta)],
	[-0.8944,0.4472,1,0],
	[ 0     ,0     ,0,1]
]
const CABINETCAM=[
	[ 2,1,0,0],
	[ 0,1,0,0],
	[-1,2,1,0],
	[ 0,0,0,1]
]
//isometric
const ISOCAM=[
	[ 0.8660 ,0.5,0,0],//col1:[Math.cos(Math.PI/6),0,-Math.cos(Math.PI/6)],
	[ 0      ,1  ,0,0],//col2:[Math.sin(Math.PI/6),1,Math.sin(Math.PI/6)],
	[-0.8660 ,0.5,1,0],//col3 for z axis
	[0       ,0  ,0,1]//column 4 for translation.
]
//................
//Parallel
//................
//orthographic
const orthocam=[
	[1,0,0,0],
	[0,1,0,0],
	[0,0,1,0],
	[0,0,0,1]
]