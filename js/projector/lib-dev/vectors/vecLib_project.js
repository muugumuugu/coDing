//PARALLEL POINT PERSPECTIVES
function stereoproject(vec){
	let camdist=(VANISH.z-vec.z)/VANISH.z;
	if (camdist==0){camdist=0.00001;}
	return vecSum(vecScale(vecSum(vec,negSC),1/camdist),SC);
}
function twoptproject(vec){
	let v=vecSum(vec,negSC)
	//
	let dx =(VANISH.x-v.x)/VANISH.x;if (dx==0){dx=0.00001;}
	let dz =(VANISH.z-v.z)/VANISH.z;if (dz==0){dz=0.00001;}
	let st=Stretcher([1/dx,1,1/dz])
	v=vecStretch(v,st)
	let r=Math.sqrt(v.x*v.x+v.z*v.z);
	let camD=(VANISH.z-r)/VANISH.z;if (camD==0){camD=0.00001;}
	v.y=v.y/camD//foreshortening.
	//rot axes by 45.
	v.x=((v.x-v.z)/Math.sqrt(2));
	return vecSum(v,SC);
}
function threeptproject(vec){// system wrong handed but i like it this way,
	let v=vecSum(vec,negSC)
	//
	let dx =(VANISH.x-v.x)/VANISH.x;
	let dy =(VANISH.y-v.y)/VANISH.y;
	let dz =(VANISH.z-v.z)/VANISH.z;
	let st=Stretcher([dx,dy,dz])
	v=vecStretch(v,st)
	//rot axes by 45.
	v.x=((v.x-v.z)/Math.sqrt(2));
	return vecSum(v,SC);
}
//CURVILIENEAR
function humanview(vec){//4pt.
	v=vecSum(vec,TRENCH)
	const R=Math.min(VANISH.x,VANISH.y,VANISH.z);
	let r=vecMag(vec3(v.x,v.z));if (r==0){r=0.00001;}
	v=vecScale(v,R/r);
	return vecSum(v,SC);
}
function fisheyeview(vec){// NSWE and one pt.
	const R=Math.min(VANISH.x,VANISH.y,VANISH.z);
	let vecTemp=vecSum(vec,TRENCH)
	let d =vecMag(vecTemp);
	if(d==0){d=0.00001;}
	return vecSum(vecScale(vecTemp,R/d),SC);
}