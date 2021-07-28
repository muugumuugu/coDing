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