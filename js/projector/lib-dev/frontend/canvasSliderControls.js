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