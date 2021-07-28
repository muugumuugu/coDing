//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//matrixLib_parsers.js
//____________________
function logMatrix(M) {
	let rows = M.length;
	let cols = M[0].length;
	let matrixx = "\n";
	for (let i = 0; i < rows; i++) {
		let row = " | ";
		for (let j = 0; j < cols; j++) {
			row += ((M[i][j]).fmt(3,6) + " | ");
		}
		matrixx += row + "\n";
	}
	let dat={};
	dat.matrix=matrixx;
	dat.order=rows+'X'+cols;
	dat.rows=M;
	dat.cols=transposed(M);
	console.log(matrixx);
	return dat;
}
//=============================
function arr2mat(data,m,n){
	let rows=1;
	if(m){rows=m;}
	let cols=data.length/rows;
	if(n){cols=n;}
	if (rows*cols!=data.length){return null;}
	let M=[];
	for(let i=0; i<rows;i++){
		M.push([]);
		for(let j=0; j<cols;j++){
			M[i].push(data[i*cols+j]);
		}
	}
	return M;
}
function mat2arr(M){
	let arr=[];
	for (let i=0; i<M.length; i++){
		for(let j=0;j<M[0].length;j++){
			arr.push(M[i][j]);
		}
	}
	return arr;
}
//=============================
function index1D(x,y,colums){
	return (x*colums+y);
}
function index2D(ind,colums){
	return [Math.floor(ind/colums),ind%colums];
}
//=====================================
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//matrixLib_lookups.js
//____________________
function getrow(M,i){
	return arrCopy(M[i-1]);
}
function getcol(M,j){
	let rows=M.length;
	let col=[];
	for (let i=0; i<rows;i++){
		col.push(M[i][j-1]);
	}
	return col;
}
function lookup(M,i,j){
	return M[i-1][j-1];
}
//---------------------------------
function minor(M,ii,jj){
	let rows=M.length;
	let cols=M[0].length;
	let C=[];
	let ci=0
	for (let i=0;i<rows;i++){
		if (i!=ii){
			C.push([]);
			for (let j=0;j<cols;j++){
				if (j!=jj){
					C[ci].push(M[i][j])
				}
			}
			ci++
		}
	}
	return C;
}
function cofactor(M,ii,jj){
	if ((ii+jj)%2==0){
		return det(minor(M,ii,jj));
	}
	else{
		return -1*det(minor(M,ii,jj));
	}
}
//----------------------------------------
function matSlice(M,i1,j1,i2,j2){
	let temp=[];
	i1=i1||0;i2=i2||0;j1=j1||0;j2=j2||0;
	if (Array.isArray(i1)){
		if (Array.isArray(j1)){return matPick(M,i1,j1);}
		else{return matPick(M,i1,range(j1,j2));}
	}
	else if (Array.isArray(j1)){return matPick(M,range(i1,i2),j1);}
	let rows=(i2-i1)+1,cols=(j2-j1)+1;
	for(let i=i1,y=0;i<(i2+1);i++,y++){
		temp[y]=[];
		for(let j=j1,x=0;j<(j2+1);j++,x++){
			temp[y][x]=M[i][j];
		}
	}
	return temp;
}
function matPick(M,i,j){
	let rows=M.length,cols=M[0].length;
	let temp=[];
	for(let y=0,row=0;y<rows;y++){
		if(i[row]==y){
			temp[row]=[];
			for(let x=0,col=0;x<cols;x++){
				if(j[col]==x){temp[row][col]=M[y][x];col++}
			}
			row++;
		}
	}
	return temp;
}
//-----------------------------------
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//matrixLib_generators.js
//____________________
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
	else {shifter[3]=arrSum(shifter[3],vec2arr(shifter))};
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
	if (translations){M=transM(translations,M);}
	return M;
}
//===========================
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//matrixLib_binaryOps.js
//____________________
function arrProd(A1,A2,A,V){
	res=[];
	if(A){
		A.sort((a, b) => (a.length > b.length) ? -1 : 1)
		res=fillarr(A[0].length,1);
		for (let j=0; j<A.length;j++){
			for (let i=0; i<A[j].length;i++){
				res[i]*=arrSquashProd(A[j][i]);
			}
		}
		return res;
	}
	if (V){
		let ii=['x','y','z','w'];
		V.sort((a, b) => (Object.keys(a).length >Object.keys(b).length) ? -1 : 1)
		let res=V[0];
		for (let j=1; j<V.length;j++){
			for (let i=0; i<Object.keys(V[j]).length;i++){
				if(i<4){res[ii[i]]*=V[j][ii[i]];}
				else{res['d'+i]*=V[j]['d'+i];}
			}
		}
		return res;
	}
	else {return(arrProd(null,null,[A1,A2]));}
}
//-------------
function matMult(M1,M2){
	let prod=[];
	let rows1=M1.length;
	let rows2=M2.length;
	let cols1=M1[0].length;
	let cols2=M2[0].length;
	let commondim=cols1;
	if (cols1!==rows2){
		commondim=Math.min(cols1,rows2)//
	}
	for (let i=0; i<rows1;i++){
		prod.push([]);
		for (let j=0; j<cols2;j++){
			let compIJ=0;
			for (let k=0; k<commondim;k++){
				compIJ+=M1[i][k]*M2[k][j];
			}
			prod[i].push(compIJ);
		}
	}
	return prod;

}
function matChainProd(data){
	let prod=arrCopy(data[0]);
	for(let i=1; i<data.length;i++){
		prod=matMult(prod,data[i]);
	}
	return prod;
}
//=====================================
function arrSum(A1,A2,A,V){
	res=[];
	if(A){
		A.sort((a, b) => (a.length > b.length) ? -1 : 1)
		res=fillarr(A[0].length,0);
		for (let j=0; j<A.length;j++){
			for (let i=0; i<A[j].length;i++){
				res[i]+=arrSquash(A[j][i]);
			}
		}
		return res;
	}
	if (V){
		let ii=['x','y','z','w'];
		V.sort((a, b) => (Object.keys(a).length >Object.keys(b).length) ? -1 : 1)
		let res=V[0];
		for (let j=1; j<V.length;j++){
			for (let i=0; i<Object.keys(V[i]).length;i++){
				if(i<4){res[ii[i]]+=V[j][ii[i]];}
				else{res['d'+i]+=V[j]['d'+i];}
			}
		}
		return res;
	}
	else if (A2) {return(arrSum(null,null,[A1,A2]));}
	else {return A1;}
}
function arrDiff(A1,A2){
	return arrSum(null,null,[A1,scaledArr(A2,-1)]);
}
//-------------
function matSum(M1,M2,M){
	let res=[];
	if(M){
		M.sort((a, b) => (a.length > b.length) ? -1 : 1)
		res=arrCopy(M[0]);
		for (let j=1; j<M.length;j++){
			for (let i=0; i<M[j].length;i++){
			 res[i]=arrSum(res[i],M[j][i]);
			}
		}
		return res;
	}
	else {return(matSum(null,null,[M1,M2]));}
}
function matDiff(M1,M2){
	return matSum(null,null,[M1,scaledMatrix(M2,-1)]);
}
//=====================================
function arrEq(A1,A2){
	if (!A2){return false;}
	if (A1.length==A2.length){
		for (let i=0; i<A1.length; i++){if (A1[i]!=A2[i]){return false;}}
		return true;
	}
	else {return false;}
}
//--------------
function matEq(M1,M2){
	if (!M2){return false;}
	if (M1.length==M2.length){
		for (let i=0; i<M1.length; i++){if (!arrEq(M1[i],M2[i])){return false;}}
		return true;
	}
	else {return false;}
}
//=====================================
function swapMinor(M,portion,i,j){
	let temp=arrCopy(M);
	let rows=portion.length,cols=portion[0].length;
	for(let y=i;(y-i)<rows;y++){
		for(let x=j;(x-j)<cols;x++){
			temp[y][x]=portion[y-i][x-j];
		}
	}
	return temp;
}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//matrixLib_selfOps.js
//____________________
//=================================
function arrInc(A,step){
	res=[];
	for (let i=0; i<A.length;i++){
		res.push(A[i]+step);
	}
	return res;
}
//=================================
function scaledArr(arr,fac){
	let ARR=[];
	for (let i = 0; i < arr.length; i++) {
			ARR.push(arr[i]*fac);
	}
	return ARR;
}
//------------
function scaleMatrix(M,k){
	let rows = M.length;
	let cols = M[0].length;
	for (let i = 0; i < rows; i++) {
		for (let j = 0; j < cols; j++) {
			M[i][j]*=k;
		}
	}
}
function scaledMatrix(M,k){
	let rows = M.length;
	let cols = M[0].length;
	let MM=[];
	for (let i = 0; i < rows; i++) {
		MM.push(scaledArr(M[i],k));
	}
	return MM;
}
//==================================
function transpose(M){
	let temp=transposed(M);
	M.length=0;
	for (let i=0; i<temp.length; i++){
		M.push([]);
		for (let j=0;j<temp[0].length;j++){
			M[i].push(temp[i][j]);
		}
	}
}
function transposed(M){
	let rows=M.length;
	let cols=M[0].length;
	let T=[];
	for (let j=0;j<cols;j++){
		T.push([]);
		for (let i=0;i<rows;i++){
			T[j].push(M[i][j]);
		}
	}
	return T;
}
//==================================
function matSq(M,alt){
	if (alt){return matMult(transposed(M),M);}
	return matMult(M,transposed(M));
}
function adjoint(M){
	let adj=[];
	let rows=M.length;
	let cols=M[0].length;
	for (let i=0;i<rows;i++){
		adj.push([]);
		for (let j=0;j<cols;j++){
			adj[i].push(cofactor(M,i,j));
		}
	}
	return transposed(adj);

}
function inverse(M){
	if (det(M)==0){
		return null;
	}
	else{return scaledMatrix(adjoint(M),1/det(M));}
}
//==================================
function arrSquashProd(A){
	let dot=1;
	if(Array.isArray(A)){
		for (let i=0; i<A.length;i++){
			dot*=arrSquashProd(A[i]);
		}
		return dot;
	}
	else{return A;}
}
function arrSquash(A){
	let total=0;
	if(!Array.isArray(A)){return A;}
	for (let i=0;i<A.length;i++){total+=arrSquash(A[i]);}
	return total;
}
//--------------------
function trace(M){
	let cols = M.length;//sqr matrix
	if (cols==1){
		return(M[0][0]);
	}
	let trace_=0;
	for (let j = 0; j < cols; j++) {
		trace_+=M[j][j];
	}
	return trace_;

}
function det(M){
	let cols = M.length;//sqr matrix
	if (cols==1){
		return(M[0][0]);
	}
	let dett=0;
		for (let j = 0; j < cols; j++) {
			dett+=(M[0][j]*cofactor(M,0,j));
		}
	return dett;
}
//===================================
function QRdecompose(M){
	let qArr=[];
	temp=arrCopy(M);
	ii=identityMatrix(M.length);
	for (let i=0;i<M.length-1;i++){
		let v=transposed(temp)[0];
		v=vecCopy(v);
		const a=vecMag(v);
		v.x-=a;
		let vv=matSq([vec2arr(vecNormalize(v))],true);
		scaleMatrix(vv,-2);
		qArr[i]=matSum(identityMatrix(temp.length),vv)
		temp=minor(matMult(qArr[i],temp),0,0);
		qArr[i] =swapMinor(ii,qArr[i],i,i);
	}
	qArr.reverse();
	let qq=matChainProd(qArr);
	let r=matMult(qq,M);
	return {Q:transposed(qq),R:r};

}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//matrixLib_screen.js
//____________________
//
function resetScreen(){
	scene.canvasT=tMatrix();
	scene.canvasTupd=false;
}
//
function rotX(ang){
	scene.canvasT=matMult(scene.canvasT,rotMatrix(X,ang));
	scene.canvasTupd=true;
	return scene.canvasT;
}
function rotY(ang){
	scene.canvasT=matMult(scene.canvasT,rotMatrix(Y,ang));
	scene.canvasTupd=true;
	return scene.canvasT;
}
function rotZ(ang){
	scene.canvasT=matMult(scene.canvasT,rotMatrix(Z,ang));
	scene.canvasTupd=true;
	return scene.canvasT;
}
function rotCnvs(rotor){
	scene.canvasT=rollpitchyaw(rotor,scene.CanvasT);
}
//
function scaleX(fac){
	scene.canvasT[0][0]*=fac;
	scene.canvasT[1][0]*=fac;
	scene.canvasT[2][0]*=fac;
	scene.canvasT[3][0]*=fac;
	scene.canvasTupd=true;
}
function scaleY(fac){
	scene.canvasT[0][1]*=fac;
	scene.canvasT[1][1]*=fac;
	scene.canvasT[2][1]*=fac;
	scene.canvasT[3][1]*=fac;
	scene.canvasTupd=true;
}
function scaleZ(fac){
	scene.canvasT[0][2]*=fac;
	scene.canvasT[1][2]*=fac;
	scene.canvasT[2][2]*=fac;
	scene.canvasT[3][2]*=fac;
	scene.canvasTupd=true;
}
function scaleCnvs(scales){
	if(Array.isArray(scales)){scl=arr2vec(scales);}
	else{scl=scales;}
	scaleX(scl.x);
	scaleY(scl.y);
	scaleZ(scl.z);
}
//
function transCnvs(x,y,z){
	scene.canvasT[3][0]+=x;
	scene.canvasT[3][1]+=y;
	scene.canvasT[3][2]+=z;
	scene.canvasTupd=true;
}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//matrixLib_cameras.js
//____________________
//coordinates in screen system.
function intrinsicM(fx,fy,px,py,skew){
	let fx_=1,fy_=1,px_=0,py_=0,s=0;
	//scaling.
	if(fx){fx_=fx;fy_=fx;}
	if(fy){fy_=fy;}
	//transln
	if(px){px_=px;py_=px;}
	if(py){py_=py;}
	//shear.
	if(skew){s=skew;}
	return [
		[fx_,0  , 0  ,0],
		[s  ,fy_, 0  ,0],
		[px_,py_, 1  ,0],
		[  0,  0, 0  ,1]
	]
}
function poseM(CamRot,CamCenter){
	let CamC=identityMatrix(4);
	let R=identityMatrix(4);
	if (CamCenter){CamC=transM(vecScale(CamCenter,-1));}
	if (CamRot){R=transposed(CamRot);}
	return matMult(CamC,R);
}
function lookAtM(posV,lookPoint,upD){
	let CamC=vec3();
	if (posV){CamC=posV;}
	let upp=vec3(0,1,0)
	if(upD){upp=upD;}
	let looking=vec3();
	if(lookPoint){looking=lookPoint;}
	let zz=vecDiff(looking,CamC);
	zz=vecNormalize(zz);
	let xx=vecNormalize(vecCross(zz,upp));
	let yy=vecCross(xx,zz);
	zz=vecScale(zz,-1);
	return poseM([vec2arr(xx),vec2arr(yy),vec2arr(zz)],vec2arr(CamC));
}
//----------------------------------------------
function Camera(intrinsic,extrinsic){////PRE MULTIPLIER
	let int_=intrinsicM();
	let ext_=poseM();
	if (intrinsic){int_=intrinsic;}
	if (extrinsic){ext_=extrinsic;}
	return matMult(ext_,int_);
}
//================================================================
function decomposeCam(camMatrix){
	camMatrix=camMatrix||scene.cam;
	if(!camMatrix){return {ROT:identityMatrix(4),INTRINSIC:identityMatrix(4),POS:nullMatrix(1,3)};}
	let t=[getrow(camMatrix,4)];
	transpose(t);transpose(camMatrix);
	let decomp=QRdecompose(minor(camMatrix,3,3));
	if(det(decomp.Q)<0){scaleMatrix(decomp.Q,-1);decomp.R[2]=scaledArr(decomp.R[2],-1);}
	let posn=matMult(decomp.Q,t);
	transpose(decomp.R);
	//transpose(decomp.Q);
	transpose(posn);
	decomp.R=swapMinor(identityMatrix(4),decomp.R,0,0);
	decomp.Q=swapMinor(identityMatrix(4),decomp.Q,0,0);
	scaleMatrix(posn,-1);
	let res={ROT:decomp.Q,INTRINSIC:decomp.R,POS:posn[0]}
	if(scene.cam){scene.camComponents=res;}
	transpose(camMatrix);//restore.
	return res;
}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;