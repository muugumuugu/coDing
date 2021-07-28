//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//quarternionLib.js
//_________
class Quaternion{
	constructor(dat,theta){
		if(theta){//make rotn quarternion.
			let im=vecScale(vecNormalize(dat),Math.sin(theta/2));
			let re=Math.cos(theta/2);
			this.re=re;
			this.im=im;
		}
		else if (Array.isArray(dat)){
			this.re=dat[0];
			this.im={x:dat[1],y:dat[2],z:dat[3]}
		}
		else if(typeof(dat)=='object'){
			if(dat.re){this.re=dat.re;}
			else if(dat.w){
				this.re=dat.w;
			}
			else{this.re=0;}
			if(dat.im){this.im=dat.im}
			else {this.im={x:dat.x,y:dat.y,z:dat.z}}
		}
		else if(typeof(dat)=='number'){
			this.re=dat;
			this.im=vec3();
		}
		else{
			this.re=1;
			this.im=vec3();
		}
	}
	toArr(){
		let arr=vec2arr(this.im);
		arr.unshift(this.re);
		return arr;
	}
	toVec(){
		return(vec4(this.im.x,this.im.y,this.im.z,this.re));
	}
	//
	scale(k){
		let re, im;
		if(Array.isArray(k)){
			return new Quaternion(arrProd(this.toArr(),k));
		}
		else{
			re=this.re*k;
			im=vecScale(this.im,k);
		}
		return new Quaternion({re:re,im:im})
	}
	pow(n){
	 return this.log().scale(n).exp();
	}
	//
	magSq(){
		return vecMag(this.toVec());
	}
	magn(){
		return Math.sqrt(this.magSq());
	}
	//
	conjugate(){
		let im=vecScale(this.im,-1);
		return new Quaternion({re:this.re,im:im})
	}
	inverse(){
		return this.conjugate().scale(1/this.magSq());
	}
	//
	exp(){
		const expp=Math.exp(this.re);
		const magn=vecMag(this.im);
		let re=Math.cos(magn)*expp;
		let im=vecScale(vecNormalize(this.im),expp*Math.sin(magn));
		return new Quaternion({re:re,im:im});
	}
	log(){
		let re=Math.log(this.magn());
		let im=vecScale(vecNormalize(this.im),Math.acos(this.re/this.magn()));
		return new Quaternion({re:re,im:im});
	}
	//
	prod(Q){
		let a=this.re, b=this.im.x,c=this.im.y,d=this.im.z;
		let e,f,g,h;
		if(Q){
			if(Array.isArray(Q)){e=Q[0];f=Q[1];g=Q[2];h=Q[3];}
			else{
				if (Q.re){e=Q.re;}
				else if(Q.w){e=Q.w;}
				else{e=0;}
				if(Q.im){f=Q.im.x;g=Q.im.y;h=Q.im.z; }
				else{
					if(Q.x){f=Q.x;}else{f=0;}
					if(Q.y){g=Q.y;}else{g=0;}
					if(Q.z){h=Q.z;}else{h=0;}
				}
			}
		}
		else {e=0;f=0;g=0;h=0;}
	let w=(a*e -b*f -c*g -d*h)
	let x=(a*f +b*e +c*h -d*g)
	let y=(a*g -b*h +c*e +d*f)
	let z=(a*h +b*g -c*f +d*e)
		return new Quaternion([w,x,y,z]);
	}
	conjugation(Q){
		return this.prod(Q).prod(this.inverse());
	}
	slerp(Q,t){
		t = t < 0 ? 0 : t;
		t = t > 1 ? 1 : t;
		return this.prod(this.inverse().prod(Q).pow(t));
	}
}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//helperLib.js
//_________
Number.prototype.fmt = function(pre,post) {
  let sign = Math.sign(parseFloat(this)) === -1 ? '-' : '+';
  return sign + Math.abs(this).toFixed(pre).padStart(post+pre+1,0);
}
function updateOnResize(){
	SC=getSC();
	negSC=vecScale(SC,-1)
	TRENCH=getSC();TRENCH.z=-DEPTH;TRENCH.x*=-1;TRENCH.y*=-1;
	let vanishx,vanishy,vanishz;
	if(scene.cnv){
		vanishx=scene.cnv.width;
		vanishy=scene.cnv.height;
		vanishz=(scene.cnv.width+scene.cnv.height)/2;
		if(scene.cnv.DEPTH){vanishz=scene.cnv.DEPTH;}
	}
	else{
		vanishx=width;
		vanishy=height;
		vanishz=(height+width)/2;
		if(DEPTH){vanishz=DEPTH;}
	}
	VANISH={x:vanishx,y:vanishy,z:vanishz}
}
//
function getSC(){
	if (scene.cnv){return vec3(scene.cnv.width/2,scene.cnv.height/2,0);}
	else{return vec3(width/2,height/2,0);}
}
//
function Pen(show){
	let newpen={};
	newpen.show={};
	newpen.color={'points':[],'edges':[],'fill':[]};
	newpen.wt={'points':[],'edges':[]};
	if (show){
		if (Array.isArray(show)){
			newpen.show.points=(1==show[0]);
			newpen.show.edges=(1==show[1]);
			newpen.show.fillit=(1==show[2]);
		}
		else if (typeof(show)=='object'){
			newpen.show.points=show.points;
			newpen.show.edges=show.edges;
			newpen.show.fillit=show.fillit;
		}
		else{
			switch (show){
				case 0:
					break;
				case 1:
					newpen.show.points=true;
					break;
				case 2:
					newpen.show.edges=true;
					break;
				case 3:
					newpen.show.points=true;//1
					newpen.show.edges=true;//2
					break;
				case 4:
					newpen.show.fillit=true;
					break;
				case 5:
					newpen.show.points=true;//1
					newpen.show.fillit=true;//4
					break;
				case 6:
					newpen.show.edges=true;//2
					newpen.show.fillit=true;  //4
					break;
				case 7:
					newpen.show.points=true//1
					newpen.show.edges=true;//2
					newpen.show.fillit=true;//4
					break;
			}
		}
	}
	else{
		newpen.show.points=true;
	}
	return newpen;
}
//=============
function PhysProp(dimen){
	let prop={
		'mass':1,
		'vel':new position(dimen),
		'acc':new position(dimen),
		'density':1,
		'fricn':1};
	return prop;
}
//=============
function Scene(mode,cam,cnvs,canvasT){
		let cnvs_=null,mode_=0,cam_=null,canvasTupd=false,canvasT_=tMatrix();
		if(cnvs){cnvs_=cnvs;}
		if(mode){mode_=mode;}
		if(cam){cam_=cam;}
		else{cam_=getModeCam(mode)}
		if(canvasT){canvasT_=canvasT;}
	return {'mode':mode_,'cam':cam_,'cnv':cnvs_,'canvasT':canvasT_,'canvasTupd':canvasTupd}
}
//==============
function Rotor(arr,theta){
	let obj=vec3();
	if (arr){
		if (Array.isArray(arr)){
			obj.x=arr[0];
			if (arr.length>1){obj.y=arr[1];}
			if (arr.length>2){obj.z=arr[2];}
		}
		else if (typeof(arr)=='object'){obj=vecCopy(arr);}
		else if (typeof(arr)=='number'){obj.x=arr;}
	}
	if(theta){return new Quaternion(obj,theta);}
	return obj;
}
function Stretcher(arr,axis){
	if(Array.isArray(arr)){return arr2vec(arr);}
	if (typeof(arr)=='object'){return arr;}
	else{
		let str=[1,1,1];
		str[axis]*=arr;
		return arr2vec(str);
	}
}
//=============
function pol2cart(r,theta,plane,xdir){
	let posV;//draws on XY plane , plane argument is the optional unit vector for custom Z direcion
	posV=vec3(r*Math.cos(theta),r*Math.sin(theta),0);
	if (plane){
		posV=flipPlane(posV,plane,xdir);
	}
	return posV;
}
//---------------
function circumscribe(P1, P2, P3) {
	let D21=vecDiff(P2,P1);
	let D31=vecDiff(P3,P1);
	let F2 = 1/2*vecMagSq(D21);
	let F3 = 1/2*vecMagSq(D31);
	let N23=vecCross(D21,D31);
	D21=vecScale(D21,F3);
	D31=vecScale(D31,F2);
	let Rv=vecScale(vecCross(vecDiff(D31,D21),N23),1/vecMagSq(N23))
	let C=vecSum(P1,Rv);
	let r=vecMag(Rv);
	return {'center':C,'r':r,'plane':vecNormalize(N23)}
}
//---------------
function flipPlane(vecP,normal,xdir){
	let uz=vecNormalize(normal);
	let a=uz.x,b=uz.y,c=uz.z;
	let ux;
	if (xdir){ux=xdir;}
	else{//make random vec on plane the x axis.
		if      (a!=0){ux=[-(b+c)/a,1,1]}
		else if (b!=0){ux=[1,-(a+c)/b,1]}
		else if (c!=0){ux=[1,1,-(a+b)/c]}
	}
	ux=vecNormalize(ux)//returned parsed :)
	let uy=vecNormalize(vecCross(uz,ux));
	if(Array.isArray(vecP)){vecP=arr2vec(vecP);}
	ux=vecScale(ux,vecP.x);
	uy=vecScale(uy,vecP.y);
	uz=vecScale(uz,vecP.z)
	return vecSum(null,null,[ux,uy,uz])
}
//---------------
function applyTrans(pos,T){
	let posM=homogenize2Mat(pos);//homogenized coors
	let transf=matMult(posM,T)[0];
	return arr2vec(transf);
}
function rotAround(pos,v,ang){
	let q=new Quaternion(v,ang);
	return q.conjugation(pos).im;
}
//-------------
function rotobjToQuat(rotor){
	const xx=rotor.x/2;const yy=rotor.y/2;const zz=rotor.z/2;
	const sx=Math.sin(xx);const sy=Math.sin(yy);const sz=Math.sin(zz);
	const cx=Math.cos(xx);const cy=Math.cos(yy);const cz=Math.cos(zz);
	return new Quaternion(vec4(
		sx*cy*cz-cx*sy*sz,
		cx*sy*cz+sx*cy*sz,
		cx*cy*sz-sx*sy*cz,
		cx*cy*cz+sx*sy*sz
	));
}
function quatTomat(rotQ){
	const xy=2*rotQ.im.x*rotQ.im.y;const xz=2*rotQ.im.x*rotQ.im.z;const yz=2*rotQ.im.y*rotQ.im.z;
	const xx=2*rotQ.im.x*rotQ.im.x;const yy=2*rotQ.im.y*rotQ.im.y;const zz=2*rotQ.im.z*rotQ.im.z
	const xw=2*rotQ.im.x*rotQ.re;  const yw=2*rotQ.im.y*rotQ.re;  const zw=2*rotQ.im.z*rotQ.re
	return ([
		[1-yy-zz,   xy+zw,   xz-yw, 0],
		[  xy-zw, 1-xx-zz,   yz+xw, 0],
		[  xz+yw,   yz-xw, 1-xx-yy, 0],
		[0      , 0      , 0       ,1]
	]);
}
function navals(R){
	let roll,yaw,pitch;
	const x1=R[0][0];
	const y1=R[1][0];
	const z1=R[2][0];
	//
	const x2=R[0][1];
	const y2=R[1][1];
	const z2=R[2][1];
	//
	const x3=R[0][2];
	const y3=R[1][2];
	const z3=R[2][2];
	pitch=Math.round(Math.asin(-x3)*Math.pow(10,6))*Math.pow(10,-6);
	if(x3*x3<0.999){//==>cy!=0
		roll=Math.atan2(y3,z3);
		yaw=Math.atan2(x2,x1);
	}
	else{
		roll=Math.acos((z1+y2)/(1-x3))||Math.asin((z2+y1)/(-x3-1))
		yaw=0;
	}
	roll=Math.round(roll*Math.pow(10,6))*Math.pow(10,-6);
	yaw=Math.round(yaw*Math.pow(10,6))*Math.pow(10,-6);
	return(Rotor([roll,pitch,yaw]));
}
function  Mat2AxisAngle(M){
	let u=vec3(
		M[1][2]-M[2][1],
		M[2][0]-M[0][2],
		M[0][1]-M[1][0]
	)
	let ang=Math.atan2(vecMag(u),(trace(M)-2));
	u=vecNormalize(u);
	return {axis:u,angle:ang};
}
//------------
function processPoints(arrpt,origin,rotor,pivot,plane,xdir,trans,digi){
	let vertices=arrCopy(arrpt);
	const numvertices=vertices.length;
	//
	let centroid=vec3();
	for(let i=0; i<numvertices; i++){centroid=vecSum(centroid,vertices[i]);}
	centroid=vecScale(centroid,1/numvertices);
	//
	if(rotor){
		let nP,p;
		if(pivot){nP=vecScale(pivot,-1);p=pivot;}
		else{nP=vecScale(centroid,-1);p=centroid;}
		let centerpt;
		if (origin){centerpt=vecSum(p,origin);}
		else{centerpt=p;}
		for(let i=0; i<numvertices;i++){vertices[i]=vecSum(vecRotate(vecSum(vertices[i],nP),rotor),centerpt);}
		if(origin){centroid=vecSum(centroid,origin);}
	}
	else if (origin){
		for(let i=0; i<numvertices;i++){vertices[i]=vecSum(vertices[i],origin);}
		centroid=vecSum(centroid,origin);
	}
	//
	if(trans){for(let i=0; i<numvertices;i++){vertices[i]=vecTransform(vertices[i],trans);centroid=vecTransform(centroid,trans);}}
	//
	if(plane){for(let i=0; i<numvertices;i++){vertices[i]=flipPlane(vertices[i],plane,xdir);centroid=flipPlane(centroid,plane,xdir);}}
	//
	if(digi){for(let i=0; i<numvertices;i++){vertices[i]=vecDigitize(vertices[i]);centroid=vecDigitize(centroid);}}
	return {vertices:vertices,centroid:centroid};
}
//=============
function homogenize(vecObj){
	let w=1,z=1;
	if(vecObj.w){w=vecObj.w;}
	if (vecObj.z){z=vecObj.z}
	return [vecObj.x,vecObj.y,z,w];
}
function homogenize2Mat(vecObj){
	return [homogenize(vecObj)];
}
//==============
function look(at,from){
	return Camera(null,lookAtM(from,at));
}
function getModeCam(mode){
	if(!mode){return null}
	if (mode>3){
		switch(mode){
			case ISO:
				return ISOCAM;
			case DIAM:
				return DIAMETRICCAM;
			case CAB:
				return CABINETCAM;
		}
	}
	else{return null;}
}
//==============
function drawGrid(scaled,showOrigin,label,rotaxes,inst){
	let fac=1;
	let w,h;
	if (scaled){fac=scaled;}
	if (inst){
		w=inst.width;
		h=inst.height;
		inst.push();
		//digitize
		inst.translate(w / 2, h / 2);
		//inst.scale(1, -1);
		//
		inst.colorMode(inst.RGB,255,255,255,255)
		inst.stroke(255, 255, 0, 64);//yellow and transparent
		inst.strokeWeight(1/fac);//1 pixel
		inst.scale(fac);
		//
		if (rotaxes){inst.rotate(-rotaxes);}//to become like a right hand without scaling by -1
		for (let i = 0; i < h / 2; i++) {//horiz
			inst.line(-w / 2, i, w / 2, i);
			inst.line(-w / 2, -i, w / 2, -i);
			if (label){
				inst.textSize(8*1/fac);
				inst.fill(255);
				if (i%10==5){
					inst.text('-\t ' + inst.nf(i,2,0),-8*1/fac,i);
					inst.text('+\t ' + inst.nf(i,2,0),-8*1/fac,-i)
					inst.circle(0,i,3/fac);
					inst.circle(0,-i,3/fac);
				}
			}
		}
		for (let i = 0; i < w / 2; i++) {
			inst.line(i, -h / 2, i, h / 2);//vert
			inst.line(-i, -h / 2, -i, h / 2);
			if (label){
				inst.textSize(8*1/fac);
				inst.fill(255);
				if (i%10==5){
					inst.text('+' + inst.nf(i,2,0),i-8/fac,(1+2*1/fac));
					inst.circle(i,0,3/fac);
					inst.circle(-i,0,3/fac);
					inst.text('-' + inst.nf(i,2,0),-i-8/fac,(1+2*1/fac))
				}
			}
		}
		inst.stroke(255, 0, 0, 192);//red but slight mask
		inst.line(-w / 2, 0, w / 2, 0); //X axis
		inst.line(0, -h / 2, 0, h / 2); //Y axis
		if(showOrigin){
			inst.strokeWeight(1)//scaled
			inst.stroke(0, 0, 255, 255);//blue and bright:)
			inst.point(0,0);
		}
		inst.pop();
	}
	else{
		w=width;
		h=height;
		push();
		//digitize
		translate(w / 2, h / 2);
		//scale(1, -1);//text gets reversed
		//
		colorMode(RGB,255,255,255,255)
		stroke(255, 255, 0, 64);//yellow and transparent
		strokeWeight(1/fac);//1 pixel
		scale(fac);
		//
		if (rotaxes){rotate(-rotaxes);}//to become like a right hand without scaling by -1
		//
		for (let i = 0; i < h / 2; i++) {//horiz
			line(-w / 2, i, w / 2, i);
			if (label){
				textSize(8*1/fac);
				fill(255);
				if (i%10==5){
					text('-\t ' + nf(i,2,0),-8*1/fac,i);
					circle(0,i,3/fac);
					circle(0,-i,3/fac);
					text('+\t ' + nf(i,2,0),-8*1/fac,-i)
				}
			}
			line(-w / 2, -i, w / 2, -i);
		}
		for (let i = 0; i < w / 2; i++) {
			line(i, -h / 2, i, h / 2);//vert
			if (label){
					textSize(8*1/fac);
					fill(255);
					if (i%10==5){
						text('+' + nf(i,2,0),i-8/fac,(1+2*1/fac));
						circle(i,0,3/fac)
						circle(-i,0,3/fac)
						text('-' + nf(i,2,0),-i-8/fac,(1+2*1/fac))
					};
				}
				line(-i, -h / 2, -i, h / 2);
		}
		stroke(255, 0, 0, 192);//red but masked
		line(-w / 2, 0, w / 2, 0); //X axis
		line(0, -h / 2, 0, h / 2); //Y axis
			if(showOrigin){
				strokeWeight(1)//scaled
				stroke(0, 0, 255, 255);//blue and bright:)
				point(0,0);
			}
		pop();
	}

}
//------
function coorDisp(){
	if(scene.cnv){
		scene.cnv.fill(255);
		scene.cnv.stroke(255);
		scene.cnv.strokeWeight(0.2);
		scene.cnv.textSize(14);
		let x=scene.cnv.mouseX,y=scene.cnv.mouseY;
		scene.cnv.text(scene.cnv.nf(x,3,1)+','+scene.cnv.nf(y,3,1),x,y);
	}
	else{
		fill(255);
		stroke(255);
		strokeWeight(0.2);
		textSize(14);
		text(nf(mouseX,3,1)+','+nf(mouseY,3,1),mouseX,mouseY);
	}
}
//========================
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//constants.js
//____________________
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
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//globalVars.js
//____________________
let scene=Scene();
//--------------------------------------------------------------
let sz=750;
//--------------------------------------------------------------
let DEPTH;
let SC,negSC;
let TRENCH,ZENITH;
let VANISH;
//--------------------------------------------------------------