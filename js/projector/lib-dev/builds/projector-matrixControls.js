//_________________________________
//matrixFormDOM.js
//_________________________________
function getFrms(){
	let frm=document.getElementById('MATRIXFRM')
	//------------------------------------------------------
	frontend.cnvs.FORMS={};
	//..................
	frontend.cnvs.FORMS.netMATRIX=frm.contentWindow.document.getElementById('cnvsM').getElementsByTagName('input');
	frontend.cnvs.FORMS.RotMs={};
	frontend.cnvs.FORMS.RotMs.X=frm.contentWindow.document.getElementById('cnvsRx').getElementsByTagName('input');
	frontend.cnvs.FORMS.RotMs.Y=frm.contentWindow.document.getElementById('cnvsRy').getElementsByTagName('input');
	frontend.cnvs.FORMS.RotMs.Z=frm.contentWindow.document.getElementById('cnvsRz').getElementsByTagName('input');
	frontend.cnvs.FORMS.Positions=frm.contentWindow.document.getElementsByClassName('cnvpos');
	frontend.cnvs.FORMS.Angles=frm.contentWindow.document.getElementsByClassName('canvastheta');
	frontend.cnvs.FORMS.Scales=frm.contentWindow.document.getElementsByClassName('cnvscl');
	//------------------------------------------------------
	frontend.cam.FORMS={};
	//.................
	frontend.cam.FORMS.netMATRIX=frm.contentWindow.document.getElementById('camM').getElementsByTagName('input');
	//
	frontend.cam.FORMS.netPose=frm.contentWindow.document.getElementById('POSEM').getElementsByTagName('input');
	frontend.cam.FORMS.netIntrinsic=frm.contentWindow.document.getElementById('INTRINSIC').getElementsByTagName('input');
	//...................
	frontend.cam.FORMS.poseRaw=frm.contentWindow.document.getElementById('POSEDATA').getElementsByTagName('input');
	frontend.cam.FORMS.intrinsicRaw=frm.contentWindow.document.getElementById('INTRINSICDATA').getElementsByTagName('input');
	//-------------------------------------------------------
	matrixFormDOM();
}
//-----------------------------------------
function matrixFormDOM(){
	fillCnvsM('net');
	fillCnvsM('pos');
	fillCnvsM('ang');
	fillCnvsM('scl');
	fillCnvsM('Rms');
	//.........
	fillCamM('net');
	fillCamM('pose');
	fillCamM('intrinsic');
	//
	for (let i=0;i<4;i++){for (let j=0;j<4;j++){
		const frmInd=index1D(i,j,4);
		frontend.cnvs.FORMS.netMATRIX[frmInd].onchange=function(){cnvsGetFrmEntry('net',i,j);}
		frontend.cam.FORMS.netMATRIX[frmInd].onchange=function(){camGetFrmEntry('net',i,j);}
		frontend.cam.FORMS.netPose[frmInd].onchange=function(){camGetFrmEntry('pose',i,j);}
		frontend.cam.FORMS.netIntrinsic[frmInd].onchange=function(){camGetFrmEntry('intrinsic',i,j);}
	}}
	fillCamM('posedata');
	for (let i=0;i<3;i++){
		frontend.cnvs.FORMS.Scales[i].onchange=function(){cnvsGetFrmEntry('scl',i);}
		frontend.cnvs.FORMS.Positions[i].onchange=function(){cnvsGetFrmEntry('pos',i);}
		frontend.cnvs.FORMS.Angles[i].onchange=function(){cnvsGetFrmEntry('ang',i);}
		for (let j=0;j<2;j++){frontend.cam.FORMS.poseRaw[index1D(i,j,2)].onchange=function(){camGetFrmEntry('posedata',i,j);}}
	}
	fillCamM('intrinsicdata');
	for (let i=0;i<2;i++){for (let j=0;j<2;j++){frontend.cam.FORMS.intrinsicRaw[index1D(i,j,2)].onchange=function(){camGetFrmEntry('intrinsicdata',i,j);}}}
	frontend.cam.FORMS.intrinsicRaw[4].onchange=function(){camGetFrmEntry('intrinsicdata',2,0);}
}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//_________________________________
//camMatrixControls.js
//_________________________________
function fillCamM(frm){
	let cammatrix=scene.cam||identityMatrix(4);
	let decomp=decomposeCam(cammatrix);
	let angs=scaledArr(vec2arr(navals(decomp.ROT)),180/Math.PI);
	let focals=[decomp.INTRINSIC[0][0],decomp.INTRINSIC[1][1]];
	let offsets=[decomp.INTRINSIC[2][0],decomp.INTRINSIC[2][1]];
	let skw=decomp.INTRINSIC[1][0];
	switch(frm){
		case 'net':
			for (let i=0;i<4;i++){for (let j=0;j<4;j++){frontend.cam.FORMS.netMATRIX[index1D(i,j,4)].value=cammatrix[i][j].fmt(5,4);}}
			break;
		case 'pose':
			let poseMatrix=poseM(decomp.ROT,decomp.POS);
			for (let i=0;i<4;i++){for (let j=0;j<4;j++){frontend.cam.FORMS.netPose[index1D(i,j,4)].value=poseMatrix[i][j].fmt(4,4);}}
			break;
		case 'intrinsic':
			for (let i=0;i<4;i++){for (let j=0;j<4;j++){frontend.cam.FORMS.netIntrinsic[index1D(i,j,4)].value=decomp.INTRINSIC[i][j].fmt(4,4);}}
			break;
		case 'posedata':
			for (let i=0;i<6;i+=2){frontend.cam.FORMS.poseRaw[i].value=angs[i/2].fmt(3,3);frontend.cam.FORMS.poseRaw[i+1].value=decomp.POS[i/2].fmt(3,3);}
			break;
		case 'intrinsicdata':
			for (let i=0;i<4;i+=2){frontend.cam.FORMS.intrinsicRaw[i].value=focals[i/2].fmt(3,3);frontend.cam.FORMS.intrinsicRaw[i+1].value=offsets[i/2].fmt(3,3);}
			frontend.cam.FORMS.intrinsicRaw[4].value=skw.fmt(9,2);
			break;
	}
}
//---------------------------------------------------------------------
function camGetFrmEntry(frm,i,j){
	if(scene.cam==null){scene.cam=identityMatrix(4);}
	if(scene.camComponents==null){decomposeCam();}
	frmInd=index1D(i,j,4);
	let angs=vec2arr(navals(scene.camComponents.ROT));
	let focals=[scene.camComponents.INTRINSIC[0][0],scene.camComponents.INTRINSIC[1][1]];
	let offsets=[scene.camComponents.INTRINSIC[2][0],scene.camComponents.INTRINSIC[2][1]];
	let skw=scene.camComponents.INTRINSIC[1][0];
	switch(frm){
		case 'net':
			scene.cam[i][j]=parseFloat(frontend.cam.FORMS.netMATRIX[frmInd].value);
			frontend.cam.FORMS.netMATRIX[frmInd].value=scene.cam[i][j].fmt(5,4);
			fillCamM('pose');
			fillCamM('posedata');
			fillCamM('intrinsic');
			fillCamM('intrinsicdata');
			return;
			break;
		case 'pose':
			let pM=[];
			for (let i=0;i<4;i++){pM.push([]);for (let j=0;j<4;j++){pM[i][j]=parseFloat(frontend.cam.FORMS.netPose[index1D(i,j,4)].value);}}
			scene.cam=Camera(pM,scene.camComponents.INTRINSIC);
			frontend.cam.FORMS.netPose[frmInd].value=pM[i][j].fmt(4,4);
			fillCamM('posedata');
			fillCamM('intrinsicdata');
			fillCamM('intrinsic');
			break;
		case 'intrinsic':
			scene.camComponents.INTRINSIC[i][j]=parseFloat(frontend.cam.FORMS.netIntrinsic[frmInd].value);
			scene.cam=Camera(poseM(scene.camComponents.ROT,scene.camComponents.POS),scene.camComponents.INTRINSIC);
			frontend.cam.FORMS.netIntrinsic[frmInd].value=scene.camComponents.INTRINSIC[i][j].fmt(4,4);
			fillCamM('intrinsicdata');
			fillCamM('posedata');
			fillCamM('pose');
			break;
		case 'posedata':
			if(j==0){
				angs[i]=parseFloat(frontend.cam.FORMS.poseRaw[i*2].value)*Math.PI/180;
				scene.cam=Camera(poseM(rollpitchyaw(angs),scene.camComponents.POS),scene.camComponents.INTRINSIC);
				angs[i]=parseFloat(frontend.cam.FORMS.poseRaw[i*2].value);
				frontend.cam.FORMS.poseRaw[i*2].value=angs[i].fmt(3,3);
			}
			else{
				scene.camComponents.POS[i]=parseFloat(frontend.cam.FORMS.poseRaw[i*2+1].value);
				scene.cam=Camera(poseM(scene.camComponents.ROT,scene.camComponents.POS),scene.camComponents.INTRINSIC);
				frontend.cam.FORMS.poseRaw[i*2+1].value=scene.camComponents.POS[i].fmt(3,3);
			}
			fillCamM('pose');
			fillCamM('intrinsicdata');
			fillCamM('intrinsic');
			break;
		case 'intrinsicdata':
			if(i<2){
				switch(j){
					case 0:
					focals[i]=parseFloat(frontend.cam.FORMS.intrinsicRaw[i*2].value);
					frontend.cam.FORMS.intrinsicRaw[i*2].value=focals[i].fmt(3,3);
					break;
					case 1:
					offsets[i]=parseFloat(frontend.cam.FORMS.intrinsicRaw[i*2+1].value)
					frontend.cam.FORMS.intrinsicRaw[i*2+1].value=offsets[i].fmt(3,3);
					break;
				}
			}
			else{skw=parseFloat(frontend.cam.FORMS.intrinsicRaw[4].value);frontend.cam.FORMS.intrinsicRaw[4].value=skw.fmt(2,9);}
			scene.cam=Camera(poseM(scene.camComponents.ROT,scene.camComponents.POS),intrinsicM(focals[0],focals[1],offsets[0],offsets[1],skw));
			fillCamM('intrinsic');
			fillCamM('posedata');
			fillCamM('pose');
			break;
	}
	fillCamM('net');
	decomposeCam();
}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//_________________________________
//camMatrixControls.js
//_________________________________
function fillCnvsM(frm){
	if (!scene.canvasComponents){cnvsGetFrmEntry();}
	let angTemp=scaledArr(scene.canvasComponents.angs,180/Math.PI);
	switch (frm){
		case 'net':
			for (let i=0;i<4;i++){for (let j=0;j<4;j++){frontend.cnvs.FORMS.netMATRIX[index1D(i,j,4)].value=scene.canvasT[i][j].fmt(5,4);}}
			break;
		case 'ang':
			for (let i=0;i<3;i++){frontend.cnvs.FORMS.Angles[i].value=angTemp[i].fmt(3,3)}
			break;
		case 'pos':
			for (let i=0;i<3;i++){frontend.cnvs.FORMS.Positions[i].value=scene.canvasComponents.pos[i].fmt(2,4)}
			break;
		case 'scl':
			for (let i=0;i<3;i++){frontend.cnvs.FORMS.Scales[i].value=scene.canvasComponents.scls[i].fmt(4,2)}
			break;
		case 'Rms':
			let RmX=rotMatrix(X,scene.canvasComponents.angs[0]),RmY=rotMatrix(Y,scene.canvasComponents.angs[1]),RmZ=rotMatrix(Z,scene.canvasComponents.angs[2]);
			for (let i=0;i<3;i++){
				for(let j=0;j<3;j++){
					const ij=index1D(i,j,3);
					frontend.cnvs.FORMS.RotMs.X[ij].value=RmX[i][j].fmt(4,4)
					frontend.cnvs.FORMS.RotMs.Y[ij].value=RmY[i][j].fmt(4,4)
					frontend.cnvs.FORMS.RotMs.Z[ij].value=RmZ[i][j].fmt(4,4)
				}
			}
			break;

	}
}
//-------------------------------------
function cnvsGetFrmEntry(frm,i,j){
	decomp=QRdecompose(minor(scene.canvasT,3,3));
	scene.canvasComponents={};
	scene.canvasComponents.scls=[decomp.R[0][0],decomp.R[1][1],decomp.R[2][2]];
	scene.canvasComponents.angs=vec2arr(navals(decomp.Q));
	scene.canvasComponents.pos=arrCopy(scene.canvasT[3]);
	if(!frm){return;}
	switch (frm){
		case 'net':
		scene.canvasT[i][j]=parseFloat(frontend.cnvs.FORMS.netMATRIX[index1D(i,j,4)].value);
		frontend.cnvs.FORMS.netMATRIX[index1D(i,j,4)].value=scene.canvasT[i][j].fmt(5,4);
		return;
		break;
		case 'pos':
		scene.canvasComponents.pos[i]=parseFloat(frontend.cnvs.FORMS.Positions[i].value);
		frontend.cnvs.FORMS.Positions[i].value=scene.canvasComponents.pos[i].fmt(2,4);
		break;
		case 'scl':
		scene.canvasComponents.scls[i]=parseFloat(frontend.cnvs.FORMS.Scales[i].value);
		frontend.cnvs.FORMS.Scales[i].value=scene.canvasComponents.scls[i].fmt(4,2);
		break;
		case 'ang':
		scene.canvasComponents.angs[i]=parseFloat(frontend.cnvs.FORMS.Angles[i].value);
		frontend.cnvs.FORMS.Angles[i].value=scene.canvasComponents.angs[i].fmt(3,3);
		scene.canvasComponents.angs[i]*=Math.PI/180;
		fillCnvsM('Rms');
		break;
	}
	let tempM=stretchM(scene.canvasComponents.scls,rollpitchyaw(scene.canvasComponents.angs));
	tempM[3]=arrCopy(scene.canvasComponents.pos);
	scene.canvasT=tempM;
	fillCnvsM('net');
}