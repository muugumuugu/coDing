function vecScale(dat,k){
	let vArr;
	if(k==null){k=1;}
	if (Array.isArray(dat)){vArr=arrCopy(dat);}
	else{vArr=vec2arr(dat);}
	return arr2vec(scaledArr(vArr,k));
}
function vecStretch(vec,stretch){
	return vecDot(vec,stretch);
}
function vecMagSq(vec){
	return arrSquash(vec2arr(vecDot(vec,vec)));
}
function vecMag(vec){
	return Math.sqrt(vecMagSq(vec));
}
function vecNormalize(vec){
	let r=vecMag(vec);
	if (r==0){return vec;}
	return vecScale(vec,1/r);
}
function vecDir(vec){
	let uV=vecNormalize(vec);
	let angs=[];
	for (let i=0; i<this.dim;i++){
		angs.push(Math.acos(dircosine));
	}
	return angs;
}
//................
function vecTransform(vec,Tmat){
	let vecObj
	if (Array.isArray(vec)){vecObj=arr2vec(vec);}
	else {vecObj=vec;}
	return applyTrans(vecObj,Tmat);
}
function vecApplyQ(vec,Q){
	return (Q.conjugation(vec).im);;
}
function vecRotate(vec,rotor){
	let v;
	if(Array.isArray(vec)){v=arr2vec(vec);}
	else{v=vec;}
	if(rotor.re){return rotor.conjugation(v).im;}
	else{
		let rotnQ=rotobjToQuat(rotor);
		return rotnQ.conjugation(v).im;
	}
}
//--------------------------
function vecDim(vec){
	if(Array.isArray(vec)){return vec.length;}
	else if(vec){return Object.keys(vec).length; }
	else return 0;
}
//----------------------------