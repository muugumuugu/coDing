function arrCopy(arr){
	let temp=[];
	for (let i=0;i<arr.length; i++){
		if(Array.isArray(arr[i])){temp.push(arrCopy(arr[i]));}
		else{temp.push(arr[i]);}
	}
	return temp;
}
function fillarr(size,filler){
	let filler_=0
	if (filler){filler_=filler;}
	let sz=0;
	if(size){sz=size;}
	let arr=[];
	for (let i=0;i<sz;i++){
		arr.push(filler_);
	}
	return arr;
}
function range(a,b,step){
	let temp=[];
	let n,start=0;
	if (!b){n=a+1;start=0;}
	else{start=a;n=b+1;}
	step=step||1;
	for (let i=start; i<n;i+=step){
		temp.push(i);
	}
	return temp;
}
//--------------
function nullMatrix(m,n){
	let rows=1;
	if (m){rows=m;}
	let cols=rows;
	if (n){cols=n;}
	let O=[];
	for (let i=0; i<rows; i++){
		O.push(fillarr(cols,0.0));
	}
	return O;
}
function identityMatrix(n){
	let rows=1;
	if (n){rows=n;}
	let cols=rows;
	let I=[];
	for (let i=0; i<rows; i++){
		I.push([]);
		for (let j=0;j<cols;j++){
			if(i==j){I[i].push(1.0);}
			else{I[i].push(0.0);}
		}
	}
	return I;
}
//===========================
//All Transform Generators are postmultipliers, transpose to use with Column Matrices.
//==========================
function rotMatrix(dir,ang){
	let rot;
	if (typeof(dir)=='object'){
		rot=rollpitchyaw(dir);
	}
	switch(dir){
		case X:
			rot=[
				[  1,             0,             0,  0],
				[  0, Math.cos(ang), Math.sin(ang),  0],
				[  0,-Math.sin(ang), Math.cos(ang),  0],
				[  0,             0,             0,  1]
			];
			break;
		case Y:
			rot=[
				[ Math.cos(ang),  0,-Math.sin(ang),  0],
				[             0,  1,             0,  0],
				[ Math.sin(ang),  0, Math.cos(ang),  0],
				[  0,             0,             0,  1]
			];
			break;
		case Z:
			rot=[
				[ Math.cos(ang), Math.sin(ang), 0,  0],
				[-Math.sin(ang), Math.cos(ang), 0,  0],
				[             0,             0, 1,  0],
				[             0,             0, 0,  1]
			];
			break;
	}
	return rot;
}
//============================
function rollpitchyaw(rotor,T){//X then Y then Z., TAIT BRYAN ANGLES
	let angs,temp;
	if(rotor.im){
		temp=quatTomat(rotor);
		if(T){return matMult(T,temp);}
		else{return temp;}
	}
	if (Array.isArray(rotor)){angs=arrCopy(rotor);}
	else{angs=vec2arr(rotor);}
	let c=[];
	let s=[];
	for (let i=0; i<3 ;i++){
			c[i]=Math.cos(angs[i])
			s[i]=Math.sin(angs[i])
	}
	temp=[
		[ c[2]*c[1]                 ,	s[2]*c[1]                 ,	    -s[1],	0.0],
		[ c[2]*s[1]*s[0] - c[0]*s[2],	s[2]*s[1]*s[0] + c[2]*c[0],	c[1]*s[0],	0.0],
		[ c[2]*s[1]*c[0] + s[2]*s[0],	s[2]*s[1]*c[0] - c[2]*s[0],	c[1]*c[0],	0.0],
		[                        0.0,                          0.0,	      0.0,	1.0]
	];
	if(T){return matMult(T,temp)};
	return temp;

}
function stretchM(scales,T){
	let temp=identityMatrix(4);
	let sclArr;
	if(!Array.isArray(scales)){sclArr=vec2arr(scales);}
	else{sclArr=arrCopy(scales);}
	if(!sclArr[3]){sclArr[3]=1;}
	for (let i=0;i<4; i++){temp[i][i]=sclArr[i];}
	if(T){return matMult(T,temp)};
	return temp;
}
function transM(shifter,T){
	let temp;
	if(T){temp=arrCopy(T);}
	else{temp=identityMatrix(4);}
	if (Array.isArray(shifter)){temp[3]=arrSum(temp[3],shifter);}
	else {temp[3]=arrSum(temp[3],vec2arr(shifter))};
	temp[3][3]=1;
	return temp;
}
//--------------
function tMatrix(rotor,stretcher,translations,T){
	let M;
	if(T){M=T;}
	else{M=identityMatrix(4);}
	if(rotor){M=rollpitchyaw(rotor,M);}
	if(stretcher){M=stretchM(stretcher,M);}
	if(translations){M=transM(translations,M);}
	return M;
}
//===========================