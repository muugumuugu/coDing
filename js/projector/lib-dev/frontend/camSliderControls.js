//----------------------------------------------
function camControls(){
	let sliderIframe=document.getElementById('SLIDERFRM');
	let CamControlsDom=sliderIframe.contentWindow.document.getElementById('camControls');    //lvl0.
	//------------------------------------
	//------------------------------------------------------------//lvl1
	let intDt=sliderIframe.contentWindow.document.createElement('div');
	intDt.innerHTML="<b>camera's intrinsic settings</b>"
	let extDt=sliderIframe.contentWindow.document.createElement('div');
	extDt.innerHTML="<b>camera's extrinsic settings</b>"
	//..............
	CamControlsDom.appendChild(extDt);//.parent(select('#camControls'));
	CamControlsDom.appendChild(intDt);//.parent(select('#camControls'));
	//---------------------------------------
	//------------------------------------------------------------//lvl2
	let intDM=sliderIframe.contentWindow.document.createElement('div');
	let intDs=sliderIframe.contentWindow.document.createElement('div');
	let extD=sliderIframe.contentWindow.document.createElement('div');
	//...................
	extDt.appendChild(extD);
	intDt.appendChild(intDM);
	intDt.appendChild(intDs);
	intDs.style.width="540px";
	//------------------------------------------
	//-----------------------------------------------------------//lvl3
	let ornD=sliderIframe.contentWindow.document.createElement('div');
	ornD.innerHTML='orientation'
	let cenD=sliderIframe.contentWindow.document.createElement('div');
	cenD.innerHTML='positioning'
	let focD=sliderIframe.contentWindow.document.createElement('div');
	focD.innerHTML='focal lengths'
	let poffD=sliderIframe.contentWindow.document.createElement('div');
	poffD.innerHTML='p.axis offset'
	let skewD=sliderIframe.contentWindow.document.createElement('div');
	skewD.innerHTML='skew'
	//....................................
	extD.appendChild(ornD);
	extD.appendChild(cenD);
	intDM.appendChild(focD);
	intDM.appendChild(poffD);
	intDs.appendChild(skewD);
	skewD.style.width="540px";
	//--------------------------------------
	//------------------------------------------------------------//lvl4
	frontend.cam.LABELS={};
	//
	frontend.cam.LABELS.extrinsic={};
	frontend.cam.LABELS.extrinsic.ROTATION=sliderIframe.contentWindow.document.createElement('p');
	frontend.cam.LABELS.extrinsic.POSITION=sliderIframe.contentWindow.document.createElement('p');
	//
	frontend.cam.LABELS.intrinsic={};
	frontend.cam.LABELS.intrinsic.FocalLength=sliderIframe.contentWindow.document.createElement('p');
	frontend.cam.LABELS.intrinsic.PrincipalOffset =sliderIframe.contentWindow.document.createElement('p');
	frontend.cam.LABELS.intrinsic.Skew=sliderIframe.contentWindow.document.createElement('p');
	//...............................
	ornD.appendChild(frontend.cam.LABELS.extrinsic.ROTATION);
	cenD.appendChild(frontend.cam.LABELS.extrinsic.POSITION);
	//
	focD.appendChild(frontend.cam.LABELS.intrinsic.FocalLength);
	poffD.appendChild(frontend.cam.LABELS.intrinsic.PrincipalOffset);
	skewD.appendChild(frontend.cam.LABELS.intrinsic.Skew);
	//-------------------------------------------
	let lrx=sliderIframe.contentWindow.document.createElement('span');
	lrx.innerHTML='X&nbsp;'
	let lry=sliderIframe.contentWindow.document.createElement('span');
	lry.innerHTML='Y&nbsp;'
	let lrz=sliderIframe.contentWindow.document.createElement('span');
	lrz.innerHTML='Z&nbsp;'
	let obH=sliderIframe.contentWindow.document.createElement('p');//button holder.
	let lpx=sliderIframe.contentWindow.document.createElement('span');
	lpx.innerHTML='X&nbsp;'
	let lpy=sliderIframe.contentWindow.document.createElement('span');
	lpy.innerHTML='Y&nbsp;'
	let lpz=sliderIframe.contentWindow.document.createElement('span');
	lpz.innerHTML='Z&nbsp;'
	let pbH=sliderIframe.contentWindow.document.createElement('p');
	let lfx=sliderIframe.contentWindow.document.createElement('span');
	lfx.innerHTML='X&nbsp;'
	let lfy=sliderIframe.contentWindow.document.createElement('span');
	lfy.innerHTML='Y&nbsp;'
	let fbH=sliderIframe.contentWindow.document.createElement('p');
	let lpoffx=sliderIframe.contentWindow.document.createElement('span');
	lpoffx.innerHTML='X&nbsp;'
	let lpoffy=sliderIframe.contentWindow.document.createElement('span');
	lpoffy.innerHTML='Y&nbsp;'
	let pobH=sliderIframe.contentWindow.document.createElement('p');
	let lskew=sliderIframe.contentWindow.document.createElement('span');
	let sbH=sliderIframe.contentWindow.document.createElement('p');
	//..........................
	ornD.appendChild(lrx);
	ornD.appendChild(lry);
	ornD.appendChild(lrz);
	ornD.appendChild(obH);
	cenD.appendChild(lpx);
	cenD.appendChild(lpy);
	cenD.appendChild(lpz);
	cenD.appendChild(pbH);
	focD.appendChild(lfx);
	focD.appendChild(lfy);
	focD.appendChild(fbH);
	poffD.appendChild(lpoffx);
	poffD.appendChild(lpoffy);
	poffD.appendChild(pobH);
	skewD.appendChild(lskew);
	skewD.appendChild(sbH);
	//------------------------------------------------
	//------------------------------------------------------------//lvl5
	frontend.cam.SLIDERS={};
	//.............
	frontend.cam.SLIDERS.extrinsic={};
	//
	frontend.cam.SLIDERS.extrinsic.ROTATION={};
	frontend.cam.SLIDERS.extrinsic.ROTATION.X=makeSlider(-180 , 180 , 0.05 ,"0" ,lrx,updateviewCam);
	frontend.cam.SLIDERS.extrinsic.ROTATION.Y=makeSlider(-180 , 180 , 0.05 ,"0" ,lry,updateviewCam);
	frontend.cam.SLIDERS.extrinsic.ROTATION.Z=makeSlider(-180 , 180 , 0.05 ,"0" ,lrz,updateviewCam);
	//
	frontend.cam.SLIDERS.extrinsic.POSITION={};
	frontend.cam.SLIDERS.extrinsic.POSITION.X=makeSlider(  -200 , 200 , 0.05 ,"0" ,lpx,updateviewCam);
	frontend.cam.SLIDERS.extrinsic.POSITION.Y=makeSlider(  -200 , 200 , 0.05 ,"0" ,lpy,updateviewCam);
	frontend.cam.SLIDERS.extrinsic.POSITION.Z=makeSlider(  -200 , 200 , 0.05 ,"0" ,lpz,updateviewCam);
	//..........................
	frontend.cam.SLIDERS.intrinsic={};
	//
	frontend.cam.SLIDERS.intrinsic.FocalLength={};
	//
	frontend.cam.SLIDERS.intrinsic.FocalLength.X=makeSlider(     -2   ,   2 , 0.001,"1" ,lfx,updateviewCam);
	frontend.cam.SLIDERS.intrinsic.FocalLength.Y=makeSlider(     -2   ,   2 , 0.001,"1" ,lfy,updateviewCam);
	//
	frontend.cam.SLIDERS.intrinsic.PrincipalOffset={};
	//
	frontend.cam.SLIDERS.intrinsic.PrincipalOffset.X=makeSlider(  -2   ,   2 , 0.001,"0" ,lpoffx,updateviewCam);
	frontend.cam.SLIDERS.intrinsic.PrincipalOffset.Y=makeSlider(  -2   ,   2 , 0.001,"0" ,lpoffy,updateviewCam);
	//
	frontend.cam.SLIDERS.intrinsic.Skew=makeSlider(   -2   ,   2 , 0.0001,"0",lskew,updateviewCam);
	//--------------------------------
	let resetCamOb=sliderIframe.contentWindow.document.createElement('button');
	resetCamOb.innerHTML='reset'
	let resetCamPb=sliderIframe.contentWindow.document.createElement('button');
	resetCamPb.innerHTML='reset'
	let resetCamFb=sliderIframe.contentWindow.document.createElement('button');
	resetCamFb.innerHTML='reset'
	let resetCamPob=sliderIframe.contentWindow.document.createElement('button');
	resetCamPob.innerHTML='reset'
	let resetCamSb=sliderIframe.contentWindow.document.createElement('button');
	resetCamSb.innerHTML='reset'
	//....................................
	obH.appendChild(resetCamOb);
	pbH.appendChild(resetCamPb);
	fbH.appendChild(resetCamFb);
	pobH.appendChild(resetCamPob);
	sbH.appendChild(resetCamSb);
	//-------------------------------------------
	resetCamOb.onclick=resetCamOrn;
	resetCamPb.onclick=resetCamPos;
	resetCamFb.onclick=resetCamFoc;
	resetCamPob.onclick=resetCamPoff;
	resetCamSb.onclick=resetCamSkew;
	//-----------------------------------------
}
//----------------------------------------------
function updateviewCam(){
	//====================================
	const c_rx=parseFloat(frontend.cam.SLIDERS.extrinsic.ROTATION.X.value);const c_ry=parseFloat(frontend.cam.SLIDERS.extrinsic.ROTATION.Y.value); const c_rz=parseFloat(frontend.cam.SLIDERS.extrinsic.ROTATION.Z.value);
	let camR=rollpitchyaw([c_rx*Math.PI/180,c_ry*Math.PI/180,c_rz*Math.PI/180])
	frontend.cam.LABELS.extrinsic.ROTATION.innerHTML=c_rx.fmt(1,3) +'° '+c_ry.fmt(1,3) +'° ' +c_rz.fmt(1,3) +'°';
	//--------
	const cam_cx=parseFloat(frontend.cam.SLIDERS.extrinsic.POSITION.X.value);const cam_cy=parseFloat(frontend.cam.SLIDERS.extrinsic.POSITION.Y.value);const cam_cz=parseFloat(frontend.cam.SLIDERS.extrinsic.POSITION.Z.value);
	let camC=[cam_cx*VANISH.x/100,cam_cy*VANISH.y/100,cam_cz*VANISH.z/100];
	frontend.cam.LABELS.extrinsic.POSITION.innerHTML=cam_cx.fmt(2,3) +'\% '+cam_cy.fmt(2,3) +'\% ' +cam_cz.fmt(2,3)+ '\%';
	//-----------
	const focx=parseFloat(frontend.cam.SLIDERS.intrinsic.FocalLength.X.value);  const focy=parseFloat(frontend.cam.SLIDERS.intrinsic.FocalLength.Y.value);
	const  px=parseFloat(frontend.cam.SLIDERS.intrinsic.PrincipalOffset.X.value);const py=parseFloat(frontend.cam.SLIDERS.intrinsic.PrincipalOffset.Y.value);
	const  c_s=parseFloat(frontend.cam.SLIDERS.intrinsic.Skew.value);
	const ffx=focx.fmt(3,1);const ffy=focy.fmt(3,1)
	const ppx=px.fmt(3,1) ; const ppy=py.fmt(3,1);
	frontend.cam.LABELS.intrinsic.FocalLength.innerHTML='\t\[' + ffx +', '+ffy +'\]\t';
	frontend.cam.LABELS.intrinsic.PrincipalOffset.innerHTML='\t\[' + ppx +', '+ppy +'\]\t';
	frontend.cam.LABELS.intrinsic.Skew.innerHTML=c_s.fmt(5,1);
	//======================================
	let camextr=poseM(camR,camC);
	let camintr=intrinsicM(focx,focy,px,py,c_s);
	scene.camComponents={ROT:camR,INTRINSIC:camintr,POS:camC}
	//-------------------------------------
	//let camCurr=Camera(camintr,camextr);
	//if(matEq(camCurr,scene.cam)){return false;}
	//return true;
	//-------------------------------------
	let camTemp=Camera(camintr,camextr);
	if(matEq(camTemp,identityMatrix(4))){scene.cam=null;}
	else{scene.cam=camTemp;}
	//------------------------------------
	fillCamM()
	//========================================
}

function resetCamOrn(){
	camSlidersReset('o');
	updateviewCam();
}
function resetCamPos(){
	camSlidersReset('p');
	updateviewCam();
}
function resetCamFoc(){
	camSlidersReset('f');
	updateviewCam();
}
function resetCamPoff(){
	camSlidersReset('poff');
	updateviewCam();
}
function resetCamSkew(){
	camSlidersReset('s');
	updateviewCam();
}
//--------------------------------------------------
function resetcam(digi){
	camSlidersReset('o',digi);
	camSlidersReset('p',digi);
	camSlidersReset('f',digi);
	camSlidersReset('poff',digi);
	camSlidersReset('s',digi);
	scene.cam=null;
	updateviewCam();
}
function camSlidersReset(option,digi){
	switch (option){
		case 'o':
			frontend.cam.SLIDERS.extrinsic.ROTATION.X.value=0;
			frontend.cam.SLIDERS.extrinsic.ROTATION.Y.value=0;
			frontend.cam.SLIDERS.extrinsic.ROTATION.Z.value=0;
			break;
		case 'p':
			if (digi){
				frontend.cam.SLIDERS.extrinsic.POSITION.X.value=width/2;
				frontend.cam.SLIDERS.extrinsic.POSITION.Y.value=-height/2;
			}
			else{
				frontend.cam.SLIDERS.extrinsic.POSITION.X.value=0;
				frontend.cam.SLIDERS.extrinsic.POSITION.Y.value=0;
			}
			frontend.cam.SLIDERS.extrinsic.POSITION.Z.value=0;
			break;
		case  'f':
			frontend.cam.SLIDERS.intrinsic.FocalLength.X.value=1;
			frontend.cam.SLIDERS.intrinsic.FocalLength.Y.value=1;
			break;
		case  'poff':
			frontend.cam.SLIDERS.intrinsic.PrincipalOffset.X.value=0;
			frontend.cam.SLIDERS.intrinsic.PrincipalOffset.Y.value=0;
			break;
		case 's':
			frontend.cam.SLIDERS.intrinsic.Skew.value=0;
			break;
	}
}