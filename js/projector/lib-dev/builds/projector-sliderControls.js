//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//_________________________________
//camSliderControls.js
//_________________________________
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
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//_________________________________
//canvasSliderControls.js
//_________________________________
//----------------------------------------------
function canvasControls(){
	let sliderIframe=document.getElementById('SLIDERFRM');
	let cnvsDomSlide=sliderIframe.contentWindow.document.getElementById('canvasCtrls');//---------------//lvl0
	//-------------------------------
	//---------------------------------------------------------------------//lvl1
	let rotH=sliderIframe.contentWindow.document.createElement('div');
	rotH.innerHTML='<b>rotate system</b>';
	let sclH=sliderIframe.contentWindow.document.createElement('div');
	sclH.innerHTML='<b>scale system</b>';
	let trnsH=sliderIframe.contentWindow.document.createElement('div');
	trnsH.innerHTML='<b>shift system</b>';
	//
	let Bs=sliderIframe.contentWindow.document.createElement('div');
	Bs.id="resetCnv";
	//...............
	cnvsDomSlide.appendChild(rotH);//lvl1
	cnvsDomSlide.appendChild(sclH);
	cnvsDomSlide.appendChild(trnsH);
	cnvsDomSlide.appendChild(Bs);
	//----------------
	//--------------------------------------------------------------------//lvl2
	frontend.cnvs.LABELS={};
	frontend.cnvs.LABELS.Rotation=sliderIframe.contentWindow.document.createElement('p');
	frontend.cnvs.LABELS.Scale=sliderIframe.contentWindow.document.createElement('p');
	frontend.cnvs.LABELS.Translation=sliderIframe.contentWindow.document.createElement('p');
	//
	let rotD =sliderIframe.contentWindow.document.createElement('div');
	let sclD=sliderIframe.contentWindow.document.createElement('div');
	let trnsD =sliderIframe.contentWindow.document.createElement('div');
	//
	let rotB =sliderIframe.contentWindow.document.createElement('div');
	let sclB =sliderIframe.contentWindow.document.createElement('div');
	let trnsB =sliderIframe.contentWindow.document.createElement('div');
	//.................
	rotH.appendChild(frontend.cnvs.LABELS.Rotation);
	sclH.appendChild(frontend.cnvs.LABELS.Scale);
	trnsH.appendChild(frontend.cnvs.LABELS.Translation);
	//
	rotH.appendChild(rotD);
	sclH.appendChild(sclD);
	trnsH.appendChild(trnsD);
	//
	Bs.appendChild(rotB);
	Bs.appendChild(sclB);
	Bs.appendChild(trnsB);
	//---------------------------------------
	//-------------------------------------------------------------------//lvl3
	let lrx=sliderIframe.contentWindow.document.createElement('div');
	lrx.innerHTML='X';
	let lry=sliderIframe.contentWindow.document.createElement('div');
	lry.innerHTML='Y';
	let lrz=sliderIframe.contentWindow.document.createElement('div');
	lrz.innerHTML='Z';
	let lsx=sliderIframe.contentWindow.document.createElement('div');
	lsx.innerHTML='X';
	let lsy=sliderIframe.contentWindow.document.createElement('div');
	lsy.innerHTML='Y';
	let lsz=sliderIframe.contentWindow.document.createElement('div');
	lsz.innerHTML='Z';
	let ltx=sliderIframe.contentWindow.document.createElement('div');
	ltx.innerHTML='X';
	let lty=sliderIframe.contentWindow.document.createElement('div');
	lty.innerHTML='Y';
	let ltz=sliderIframe.contentWindow.document.createElement('div');
	ltz.innerHTML='Z';
	//
	let resetCanvasRb=sliderIframe.contentWindow.document.createElement('button');
	resetCanvasRb.innerHTML='reset';
	let resetCanvasSb=sliderIframe.contentWindow.document.createElement('button');
	resetCanvasSb.innerHTML='reset';
	let resetCanvasCb=sliderIframe.contentWindow.document.createElement('button');
	resetCanvasCb.innerHTML='reset';
	resetCanvasRb.onclick=resetCnvRot;
	resetCanvasSb.onclick=resetCnvScl;
	resetCanvasCb.onclick=resetCnvTrns;
	//.............................
	rotD.appendChild(lrx);
	rotD.appendChild(lry);
	rotD.appendChild(lrz);
	sclD.appendChild(lsx);
	sclD.appendChild(lsy);
	sclD.appendChild(lsz);
	trnsD.appendChild(ltx);
	trnsD.appendChild(lty);
	trnsD.appendChild(ltz);
	//
	rotB.appendChild(resetCanvasRb);
	sclB.appendChild(resetCanvasSb);
	trnsB.appendChild(resetCanvasCb);
	//-----------------------------------------------
	//-------------------------------------------------------------------//lvl4
	frontend.cnvs.SLIDERS={};
	//
	frontend.cnvs.SLIDERS.Rotation={};
	frontend.cnvs.SLIDERS.Rotation.X=makeSlider(-180, 180,  0.05, '0',lrx,updateviewCnvs);
	frontend.cnvs.SLIDERS.Rotation.Y=makeSlider(-180, 180,  0.05, '0',lry,updateviewCnvs);
	frontend.cnvs.SLIDERS.Rotation.Z=makeSlider(-180, 180,  0.05, '0',lrz,updateviewCnvs);
	//
	frontend.cnvs.SLIDERS.Scale={};
	frontend.cnvs.SLIDERS.Scale.X=makeSlider(-10 ,  10, 0.001, '1',lsx,updateviewCnvs);
	frontend.cnvs.SLIDERS.Scale.Y=makeSlider(-10 ,  10, 0.001, '1',lsy,updateviewCnvs);
	frontend.cnvs.SLIDERS.Scale.Z=makeSlider(-10 ,  10, 0.001, '1',lsz,updateviewCnvs);
	//
	frontend.cnvs.SLIDERS.Translation={};
	frontend.cnvs.SLIDERS.Translation.X  =makeSlider(-250, 250,   0.1, '0',ltx,updateviewCnvs);
	frontend.cnvs.SLIDERS.Translation.Y  =makeSlider(-250, 250,   0.1, '0',lty,updateviewCnvs);
	frontend.cnvs.SLIDERS.Translation.Z  =makeSlider(-250, 250,   0.1, '0',ltz,updateviewCnvs);
}
//----------------------------------------------
function updateviewCnvs(){
	//=================
	const rrx =parseFloat(frontend.cnvs.SLIDERS.Rotation.X.value)            ; const rry =parseFloat(frontend.cnvs.SLIDERS.Rotation.Y.value)            ;const rrz=parseFloat(frontend.cnvs.SLIDERS.Rotation.Z.value);
	const c_rotx=rrx*Math.PI/180                       ; const c_roty=rry*Math.PI/180                       ;const c_rotz=rrz*Math.PI/180;
	frontend.cnvs.LABELS.Rotation.innerHTML=rrx.fmt(2,3) +'°<br>'+rry.fmt(2,3)  +'°<br>' +rrz.fmt(2,3) +'°';
	//--------
	const c_tx=parseFloat(frontend.cnvs.SLIDERS.Translation.X.value); const c_ty=parseFloat(frontend.cnvs.SLIDERS.Translation.Y.value); const c_tz=parseFloat(frontend.cnvs.SLIDERS.Translation.Z.value);
	const cx=c_tx.fmt(1,3); const cy=c_ty.fmt(1,3) ; const cz=c_tz.fmt(1,3);
	frontend.cnvs.LABELS.Translation.innerHTML=cx +'\%<br>'+cy +'\%<br>' +cz+'\%' ;
	//-----------
	const c_sclx=parseFloat(frontend.cnvs.SLIDERS.Scale.X.value); const c_scly=parseFloat(frontend.cnvs.SLIDERS.Scale.Y.value); const c_sclz=parseFloat(frontend.cnvs.SLIDERS.Scale.Z.value);
	const ssx=c_sclx.fmt(2,2); const ssy=c_scly.fmt(2,2); const ssz=c_sclz.fmt(2,2);
	frontend.cnvs.LABELS.Scale.innerHTML=ssx +'<br>'+ssy +'<br>' +ssz ;
	//----------
	resetScreen();
	rotCnvs([c_rotx,c_roty,c_rotz]);
	scaleCnvs([c_sclx,c_scly,c_sclz]);
	transCnvs(c_tx*VANISH.x/100,c_ty*VANISH.y/100,c_tz*VANISH.z/100);
	//----------
	fillCnvsM();
}
//--------------------------------------------------
function resetCnvRot(){
	cnvSlidersReset('r');
	updateviewCnvs();
}
function resetCnvScl(){
	cnvSlidersReset('s');
	updateviewCnvs();
}
function resetCnvTrns(){
	cnvSlidersReset('t');
	updateviewCnvs();
}
//--------------------------------------------------
function resetcanvas(digi){
	cnvSlidersReset('r',digi);
	cnvSlidersReset('s',digi);
	cnvSlidersReset('t',digi);
	updateviewCnvs();
	resetScreen();
}
function cnvSlidersReset(option,digi){
	switch (option){
		case 'r':
			frontend.cnvs.SLIDERS.Rotation.X.value=0;
			frontend.cnvs.SLIDERS.Rotation.Y.value=0;
			frontend.cnvs.SLIDERS.Rotation.Z.value=0;
			break;
		case 't':
			if (digi){
				frontend.cnvs.SLIDERS.Translation.X.value=VANISH.x/2;
				frontend.cnvs.SLIDERS.Translation.Y.value=-VANISH.y/2;
			}
			else{
				frontend.cnvs.SLIDERS.Translation.X.value=0;
				frontend.cnvs.SLIDERS.Translation.Y.value=0;
			}
			frontend.cnvs.SLIDERS.Translation.Z.value=0;
			break;
		case  's':
			frontend.cnvs.SLIDERS.Scale.X.value=1;
			frontend.cnvs.SLIDERS.Scale.Y.value=1;
			if (digi){
				frontend.cnvs.SLIDERS.Scale.Y.value=-1;
			}
			frontend.cnvs.SLIDERS.Scale.Z.value=1;
	}
}