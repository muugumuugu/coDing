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