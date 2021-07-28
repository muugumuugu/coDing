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