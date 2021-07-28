//
function resetScreen(){
	scene.canvasT=tMatrix();
	scene.canvasTupd=false;
}
//
function rotX(ang){
	scene.canvasT=matMult(scene.canvasT,rotMatrix(X,ang));
	scene.canvasTupd=true;
	return scene.canvasT;
}
function rotY(ang){
	scene.canvasT=matMult(scene.canvasT,rotMatrix(Y,ang));
	scene.canvasTupd=true;
	return scene.canvasT;
}
function rotZ(ang){
	scene.canvasT=matMult(scene.canvasT,rotMatrix(Z,ang));
	scene.canvasTupd=true;
	return scene.canvasT;
}
function rotCnvs(rotor){
	scene.canvasT=rollpitchyaw(rotor,scene.CanvasT);
}
//
function scaleX(fac){
	scene.canvasT[0][0]*=fac;
	scene.canvasT[1][0]*=fac;
	scene.canvasT[2][0]*=fac;
	scene.canvasT[3][0]*=fac;
	scene.canvasTupd=true;
}
function scaleY(fac){
	scene.canvasT[0][1]*=fac;
	scene.canvasT[1][1]*=fac;
	scene.canvasT[2][1]*=fac;
	scene.canvasT[3][1]*=fac;
	scene.canvasTupd=true;
}
function scaleZ(fac){
	scene.canvasT[0][2]*=fac;
	scene.canvasT[1][2]*=fac;
	scene.canvasT[2][2]*=fac;
	scene.canvasT[3][2]*=fac;
	scene.canvasTupd=true;
}
function scaleCnvs(scales){
	if(Array.isArray(scales)){scl=arr2vec(scales);}
	else{scl=scales;}
	scaleX(scl.x);
	scaleY(scl.y);
	scaleZ(scl.z);
}
//
function transCnvs(x,y,z){
	scene.canvasT[3][0]+=x;
	scene.canvasT[3][1]+=y;
	scene.canvasT[3][2]+=z;
	scene.canvasTupd=true;
}