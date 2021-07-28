/*
MATRIX LIB
*/
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
//------------------------------------------
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
	scene.canvasT=rollpitchyaw(rotor,scene.canvasT);
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
function Camera(intrinsic,extrinsic){//PRE MULTIPLIER
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
	//transpose(decomp.Q);ACTUAL CAMERA's ROTATION.
	transpose(posn);
	decomp.R=swapMinor(identityMatrix(4),decomp.R,0,0);
	decomp.Q=swapMinor(identityMatrix(4),decomp.Q,0,0);//ANTI ROTN.
	scaleMatrix(posn,-1);
	let res={ROT:decomp.Q,INTRINSIC:decomp.R,POS:posn[0]}
	if(scene.cam){scene.camComponents=res;}
	transpose(camMatrix);//restore.
	return res;
}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/*
VECTOR LIB
*/
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//vecLib_parsing.js
//____________________
function vec2arr(vecObj){
	let dim=vecDim(vecObj);
	let ind=['x','y','z','w'];
	let arr=[];
	for(let i=0;i<Math.min(dim,4);i++){arr.push(vecObj[ind[i]]);}
	for(let j=4;j<dim;j++){
		let indx='d'+j;
		arr.push(vecObj[indx]);
	}
	return arr;
}
function arr2vec(arr){
	let ind=['x','y','z','w'];//till 4 d
	let v={};
	for (let i=0;i<Math.min(arr.length,4);i++){v[ind[i]]=arr[i];}
	for (let j=4;j<arr.length;j++){
		let indx='d'+j;
		v[indx]=arr[j];
	}
	return v;
}
//---------------------------
function vec4(x,y,z,w){
	let v=vec3(x,y,z);
	v.w=0;
	if(w){v.w=w;}
	return v;
}
function vec3(x,y,z){
	let x_=0,y_=0,z_=0;
	if(x){x_=x;}
	if(y){y_=y;}
	if(z){z_=z;}
	return {'x':x_,'y':y_,'z':z_}
}
//------------------------------
function vecCopy(vec){
	if (Array.isArray(vec)){return arr2vec(vec);}
	else{
		let v={};
		let keys=Object.keys(vec);
		for(let i=0;i<keys.length;i++){
			v[keys[i]]=vec[keys[i]];
		}
		return v;
	}
}
//-------------------------------
function vec2column(vec){
	return transposed(vec2row(vec));
}
function vec2row(vec){
	if(Array.isArray(vec)){return [vec];}
	return([vec2arr[vec]]);
}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//vecLib_binaryOps.js
//____________________
function vecSum(dat1,dat2,datset){
	let vArr1,vArr2;
	if (datset){return arrSum(null,null,null,datset)}
	if (Array.isArray(dat1)){vArr1=arrCopy(dat1);}
	else{vArr1=vec2arr(dat1);}
	if (Array.isArray(dat2)){vArr2=arrCopy(dat2);}
	else if (dat2){vArr2=vec2arr(dat2);}
	else{vArr2=[0,0,0];}
	return arr2vec(arrSum(vArr1,vArr2))
}
function vecDiff(dat1,dat2){
	let vArr1,vArr2;
	if (Array.isArray(dat1)){vArr1=arrCopy(dat1);}
	else{vArr1=vec2arr(dat1);}
	if (Array.isArray(dat2)){vArr2=arrCopy(dat2);}
	else if (dat2){vArr2=vec2arr(dat2);}
	else{vArr2=[0,0,0];}
	return arr2vec(arrDiff(vArr1,vArr2))
}
//---------------------
function vecCross(v1,v2){
	let varr1,varr2;
	if (!Array.isArray(v1)){varr1=vec2arr(v1);}
	else{varr1=arrCopy(v1);}
	if (!Array.isArray(v2)){varr2=vec2arr(v2);}
	else{varr2=arrCopy(v2)}
	let matreece=[[1,1,1],varr1,varr2]
	let crossCors=[];
	for(let i=0; i<3;i++){crossCors.push(cofactor(matreece,0,i)); }
	return arr2vec(crossCors);
}//3 iimensional cross
//--------------------
function vecDot(dat1,dat2,datset){
	let vArr1,vArr2;
	if (datset){return arrProd(null,null,null,datset)}
	if (Array.isArray(dat1)){vArr1=arrCopy(dat1);}
	else{vArr1=vec2arr(dat1);}
	if (Array.isArray(dat2)){vArr2=arrCopy(dat2);}
	else if(dat2){vArr2=vec2arr(dat2);}
	else {vArr2=[1,1,1];}
	return arr2vec(arrProd(vArr1,vArr2))
}
function vecDotProd(dat1,dat2){
	let vArr1,vArr2;
	if (Array.isArray(dat1)){vArr1=arrCopy(dat1);}
	else{vArr1=vec2arr(dat1);}
	if (Array.isArray(dat2)){vArr2=arrCopy(dat2);}
	else if (dat2){vArr2=vec2arr(dat2);}
	else{vArr2=[0,0,0];}
	return arrSquash(arrProd(vArr1,vArr2));
}
function vecDist(v1,v2){
	return vecMag(vecDiff(v1,v2));
}
//---------------------
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//vecLib_selfOps.js
//____________________
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
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//vecLib_binaryOps.js
//____________________
function vecSum(dat1,dat2,datset){
	let vArr1,vArr2;
	if (datset){return arrSum(null,null,null,datset)}
	if (Array.isArray(dat1)){vArr1=arrCopy(dat1);}
	else{vArr1=vec2arr(dat1);}
	if (Array.isArray(dat2)){vArr2=arrCopy(dat2);}
	else if (dat2){vArr2=vec2arr(dat2);}
	else{vArr2=[0,0,0];}
	return arr2vec(arrSum(vArr1,vArr2))
}
function vecDiff(dat1,dat2){
	let vArr1,vArr2;
	if (Array.isArray(dat1)){vArr1=arrCopy(dat1);}
	else{vArr1=vec2arr(dat1);}
	if (Array.isArray(dat2)){vArr2=arrCopy(dat2);}
	else if (dat2){vArr2=vec2arr(dat2);}
	else{vArr2=[0,0,0];}
	return arr2vec(arrDiff(vArr1,vArr2))
}
//---------------------
function vecCross(v1,v2){
	let varr1,varr2;
	if (!Array.isArray(v1)){varr1=vec2arr(v1);}
	else{varr1=arrCopy(v1);}
	if (!Array.isArray(v2)){varr2=vec2arr(v2);}
	else{varr2=arrCopy(v2)}
	let matreece=[[1,1,1],varr1,varr2]
	let crossCors=[];
	for(let i=0; i<3;i++){crossCors.push(cofactor(matreece,0,i)); }
	return arr2vec(crossCors);
}//3 iimensional cross
//--------------------
function vecDot(dat1,dat2,datset){
	let vArr1,vArr2;
	if (datset){return arrProd(null,null,null,datset)}
	if (Array.isArray(dat1)){vArr1=arrCopy(dat1);}
	else{vArr1=vec2arr(dat1);}
	if (Array.isArray(dat2)){vArr2=arrCopy(dat2);}
	else if(dat2){vArr2=vec2arr(dat2);}
	else {vArr2=[1,1,1];}
	return arr2vec(arrProd(vArr1,vArr2))
}
function vecDotProd(dat1,dat2){
	let vArr1,vArr2;
	if (Array.isArray(dat1)){vArr1=arrCopy(dat1);}
	else{vArr1=vec2arr(dat1);}
	if (Array.isArray(dat2)){vArr2=arrCopy(dat2);}
	else if (dat2){vArr2=vec2arr(dat2);}
	else{vArr2=[0,0,0];}
	return arrSquash(arrProd(vArr1,vArr2));
}
function vecDist(v1,v2){
	return vecMag(vecDiff(v1,v2));
}
//---------------------
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//vecLib_project.js
//____________________
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
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//vecLib_canvas.js
//____________________
function vecDigitize(vec){
	return vecSum(vecStretch(vec,Stretcher(-1,Y)),SC);
}
//==================================
function vecAlpha(vec){
	let vecObj;
	if(Array.isArray(vec)){vecObj=arr2vec(vec);}
	else{vecObj=vec;}
	let alphalim;
		if(scene.cnv){
			alphalim=scene.cnv._colorMaxes[scene.cnv._colorMode][3]
		}
		else{
			alphalim=_colorMaxes[_colorMode][3]
		}
		return ((vecObj.z+zlim/2)*alphalim/VANISH.z);
}
//==================================
function vecProject(vec){
	if (scene.mode>5){if(scene.cam){return vecTransform(vec,scene.cam);}}
	else{
		switch (scene.mode){
			case STEREO:
				return stereoproject(vec);
			case TWOPT:
				return twoptproject(vec);
			case THREEPT:
				return threeptproject(vec);
			case HUMAN:
				return  humanview(vec);
			case FISH:
				return  fisheyeview(vec);
		}
	}
	return vec;
}
//===================================
function vecPlot(vec,clr,stkwt){
	let v=vecCopy(vec);
	if (scene.canvasTupd){coors=vecTransform(v,scene.canvasT);}
	if (scene.mode>0){coors=vecProject(v)}
	if (scene.cnv){
		if (clr){scene.cnv.stroke(clr);}
		if (stkwt){scene.cnv.strokeWeight(stkwt);}
		scene.cnv.point(v.x,v.y)
	}
	else{
		if (clr){stroke(clr);}
		if (stkwt){strokeWeight(stkwt);}
		point(v.x,v.y)
	}
}
function vecConnect(vec1,vec2,clr,stkwt){
	let v1=vecCopy(vec1),v2=vecCopy(vec2);
	if (scene.canvasTupd){
		v1=vecTransform(v1,scene.canvasT);
		v2=vecTransform(v2,scene.canvasT);
	}
	if (scene.mode>0){
		v1=vecProject(v1)
		v2=vecProject(v2)
	}
	if (scene.cnv){
		if (clr){scene.cnv.stroke(clr);}
		if (stkwt){scene.cnv.strokeWeight(stkwt);}
		scene.cnv.line(v1.x,v1.y,v2.x,v2.y);
	}
	else{
		if (clr){stroke(clr);}
		if (stkwt){strokeWeight(stkwt);}
		line(v1.x,v1.y,v2.x,v2.y);
	}
	return vecDist(v1,v2);
}
//------------
function polyV(data,closeit,stylus){
	let pen=Pen(0);
	if(stylus){pen=stylus;}
	let closer=0;
	if(closeit){closer=closeit;}
	//
	let vertices=data.vertices;
	let centroid=data.centroid
	const numvertices=vertices.length;
	//
	if (pen.show.points){
		for(let i=0; i<numvertices; i++){
			let clr,stkwt;
			if(!Array.isArray(pen.color.points)){clr=pen.color.points;}
			else{clr=pen.color.points[i];}
			if(!Array.isArray(pen.wt.points)){stkwt=pen.wt.points;}
			else{stkwt=pen.wt.points[i];}
			vecPlot(vertices[i],clr,stkwt);
		}
	}
	//
	let area,perimeter;
	//
	if (pen.show.fillit){
	area=0;
		for(let i=0; i<(numvertices-1+closer); i++){
			let clr;
			let ngbr=vertices[(i+1)%numvertices];
			if(!Array.isArray(pen.color.fill)){clr=pen.color.fill;}
			else{clr=pen.color.fill[i];}
			let pts=[vertices[i],ngbr,centroid];
			area+=triangleV(pts,clr);
		}
	}
	//
	if (pen.show.edges){
		perimeter=0;
		for(let i=0; i<(numvertices-1+closer); i++){
			let clr,stkwt;
			let ngbr=vertices[(i+1)%numvertices];
			if(!Array.isArray(pen.color.edges)){clr=pen.color.edges;}
			else{clr=pen.color.edges[i];}
			if(!Array.isArray(pen.wt.edges)){stkwt=pen.wt.edges;}
			else{stkwt=pen.wt.edges[i];}
			perimeter+=vecConnect(vertices[i],ngbr,clr,stkwt);
		}
	}
	return {'centroid':centroid,'area':area,'perimeter':perimeter,'ptarr':vertices};
}
function tristripV(data,closeit,stylus,rounded){
	let closer=0;
	if(closeit){closer=closeit;}
	let pen=Pen();
	if(stylus){pen=stylus;}
	//
	let vertices=data.vertices;
	let centroid=data.centroid
	const numvertices=vertices.length;
	//
	let rounded_=0;
	if(rounded){rounded_=rounded}
	if (pen.show.points){
		for (let j=0; j<(numvertices-1+closer);j++){
			let clr,stkwt;
			if(!Array.isArray(pen.color.points)){clr=pen.color.points;}
			else{clr=pen.color.points[j];}
			if(!Array.isArray(pen.wt.points)){stkwt=pen.wt.points;}
			else{stkwt=pen.wt.points[j];}
			vecPlot(vertices[j],clr,stkwt);
		}
	}
	if (pen.show.edges){
		for (let j=0; j<(numvertices-1+closer);j++){
			let clr,stkwt;
			let ngbr1=vertices[(j+1)%numvertices];
			let ngbr2=vertices[(j+2)%numvertices];
			if(!Array.isArray(pen.color.edges)){clr=pen.color.edges;}
			else{clr=pen.color.edges[j];}
			if(!Array.isArray(pen.wt.edges)){stkwt=pen.wt.edges;}
			else{stkwt=pen.wt.edges[j];}
			vecConnect(vertices[j],ngbr1,clr,stkwt);
			vecConnect(vertices[j],ngbr2,clr,stkwt);
		}
	}
	if (pen.show.fillit){
		for (let j=0; j<(numvertices-3+closer);j++){
			let clr;
			if(!Array.isArray(pen.color.fill)){clr=pen.color.fill;}
			else{clr=pen.color.fill[j];}
			let pts=[vertices[j],vertices[(j+1)%numvertices],vertices[(j+2)%numvertices]];
			if      (rounded_==0){triangleV(pts,clr    );}
			else if (rounded_==1){circleV(  pts,clr,1.8);}
		}
	}
}
function solidV(faces,closeits,pens){
	if(Array.isArray(closeits)){
		if(Array.isArray(pens)){
			for (let i=0; i<faces.length;i++){polyV(faces[i],closeits[i],pens[i]);}
		}
		else{
			for (let i=0; i<faces.length;i++){polyV(faces[i],closeits[i],pens);}
		}
	}
	else{
		if(Array.isArray(pens)){
			for (let i=0; i<faces.length;i++){polyV(faces[i],closeits,pens[i]);}
		}
		else{
			for (let i=0; i<faces.length;i++){polyV(faces[i],closeits,pens);}
		}
	}
	return faces;
}
//---------------------------------------------------------------------
function triangleV(points,clr){
	let p5inst=scene.cnv;
	//
	let pts=arrCopy(points);
	if (scene.canvasTupd){for(let i=0; i<3;i++){pts[i]=vecTransform(pts[i],scene.canvasT);}}
	if (scene.mode>0){for(let i=0; i<3;i++){pts[i]=vecProject(pts[i]);}}
	//
	if (p5inst){
		if (clr){p5inst.fill(clr);}
		p5inst.push();
		p5inst.noStroke()
		p5inst.triangle(pts[0].x,pts[0].y,pts[1].x,pts[1].y,pts[2].x,pts[2].y);
		p5inst.pop();
	}
	else{
		if (clr){fill(clr);}
		push();
		noStroke();
		triangle(pts[0].x,pts[0].y,pts[1].x,pts[1].y,pts[2].x,pts[2].y);
		pop();
	}
	let area=0.5*Math.abs(det([
	[1,pts[0].x,pts[0].y],
	[1,pts[1].x,pts[1].y],
	[1,pts[2].x,pts[2].y],
	]));
	return area;
}
function circleV(points,clr,fac){
	let pts=arrCopy(points);
	if (scene.canvasTupd){for(let i=0; i<3;i++){pts[i]=vecTransform(pts[i],scene.canvasT);}}
	if (scene.mode>0){for(let i=0; i<3;i++){pts[i]=vecProject(pts[i]);}}
	//
	let circinfo=circumscribe(pts[0],pts[1],pts[2]);
	//
	let p5inst=scene.cnv
	if (p5inst){
		if (clr){p5inst.fill(clr);}
		p5inst.push();
		p5inst.noStroke()
		p5inst.circle(circinfo.center.x,circinfo.center.y,fac*circinfo.r);
		p5inst.pop();
	}
	else{
		if (clr){fill(clr);}
		push();
		noStroke();
		circle(circinfo.center.x,circinfo.center.y,fac*circinfo.r);
		pop();
	}
}
//----------
function regpolyV(r,num,stylus,center,rotor,pivot,planeN,xdir,trans,store){
	let n=3;
	if (num){n=num;}
	let angadd=Math.PI/2-Math.PI/n;
	let ptarr=[];
	for (i=0; i<n ;i++){
		let ang=i*2*Math.PI/n;
		let vv=pol2cart(r,ang+angadd,planeN,xdir);
		ptarr.push(vv);
	}
	let info=processPoints(arrpt,origin,rotor,pivot,plane,xdir,trans,digi);
	if (store){return ({data:info,pen:stylus,closeit:CLOSED})}
	let dat=polyV(info,CLOSED,stylus)
	return dat;
}
function dotCircleV(info,detail,pen,rotor,store){
	const dots=detail||Math.floor(info.r/2);
	return regpolyV(info.r,dots,pen,info.center,rotor,info.plane,null,null,store);
}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//vecLib_2Dprimitives.js
//____________________
function squareV(side,style,pos,rot,pivot,plane,xdir,trans,store){
	return regpolyV(side/Math.sqrt(2),4,style,pos,rot,pivot,plane,xdir,trans,store);
}
//
function rectV(b,h,style,origin,rotor,pivots,plane,xdir,trans,store){
	let face=[
			[-b/2, h/2,0],
			[-b/2,-h/2,0],
			[ b/2,-h/2,0],
			[ b/2, h/2,0]
		];
	let info=processPoints(face,origin,rotor,pivot,plane,xdir,trans,digi);
	return polyV(info,CLOSED,style);
}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//vecLib_3Dprimitives.js
//____________________
function cubeV(side,stylus,center,rotn,digi,store){
	let pen=Pen(7);
	side*=0.5;
	if(stylus){pen=stylus;}
	let faces=[];
	for (let i=0; i<3;i++){
		let verticesF=[];
		let verticesB=[];
		let fac=[[-1,1,1,-1],[-1,-1,1,1],[1,1,1,1]]
		for(let k=0; k<4; k++){
			let v=[ side*fac[i][k], side*fac[(i+1)%3][k], side*fac[(i+2)%3][k]];
						if(rotn){v=vecRotate(v,rotn);}
			v=vecSum(v,center);
			if (digi){v=vecDigitize(v);}
			verticesF.push(v);
			verticesB.push(vecScale(v,-1));
		}
		faces.push(verticesF);
		faces.push(verticesB);
	}
	let facedatas=[];
	for(i=0;i<faces.length;i++){facedatas.push(processPoints(faces[i]));}
	if (store){return ({faces:facedatas,pens:pen,closeits:CLOSED})}
	return solidV(facedatas,CLOSED,pen);
}
function cuboidV(dimensions,stylus,center,rotn,digi,store){
	let pen=Pen(7);
	if(stylus){pen=stylus;}
	let sides;
	if (Array.isArray(dimensions)){sides=arrCopy(dimensions);}
	else{sides=vec2arr(sides);}
	let faces=[];
	for (let i=0; i<3;i++){
		let verticesF=[];
		let verticesB=[];
		let fac=[[-1,1,1,-1],[-1,-1,1,1],[1,1,1,1]]
		for(let k=0; k<4; k++){
			let v=[ sides[0]*fac[i][k], sides[1]*fac[(i+1)%3][k], sides[2]*fac[(i+2)%3][k]];
						if(rotn){v=vecRotate(v,rotn);}
			v=vecSum(v,center);
			if (digi){v=vecDigitize(v);}
			verticesF.push(v);
			verticesB.push(vecScale(v,-1));
		}
		faces.push(verticesF);
		faces.push(verticesB);
	}
	let facedatas=[];
	for(i=0;i<faces.length;i++){facedatas.push(processPoints(faces[i]));}
	if (store){return ({faces:facedatas,pens:pen,closeits:CLOSED})}
	return solidV(facedatas,CLOSED,pen);
}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//vecLib_3Dprimitives.js
//____________________
function cubeV(side,stylus,center,rotn,digi,store){
	let pen=Pen(7);
	side*=0.5;
	if(stylus){pen=stylus;}
	let faces=[];
	for (let i=0; i<3;i++){
		let verticesF=[];
		let verticesB=[];
		let fac=[[-1,1,1,-1],[-1,-1,1,1],[1,1,1,1]]
		for(let k=0; k<4; k++){
			let v=[ side*fac[i][k], side*fac[(i+1)%3][k], side*fac[(i+2)%3][k]];
						if(rotn){v=vecRotate(v,rotn);}
			v=vecSum(v,center);
			if (digi){v=vecDigitize(v);}
			verticesF.push(v);
			verticesB.push(vecScale(v,-1));
		}
		faces.push(verticesF);
		faces.push(verticesB);
	}
	let facedatas=[];
	for(i=0;i<faces.length;i++){facedatas.push(processPoints(faces[i]));}
	if (store){return ({faces:facedatas,pens:pen,closeits:CLOSED})}
	return solidV(facedatas,CLOSED,pen);
}
function cuboidV(dimensions,stylus,center,rotn,digi,store){
	let pen=Pen(7);
	if(stylus){pen=stylus;}
	let sides;
	if (Array.isArray(dimensions)){sides=arrCopy(dimensions);}
	else{sides=vec2arr(sides);}
	let faces=[];
	for (let i=0; i<3;i++){
		let verticesF=[];
		let verticesB=[];
		let fac=[[-1,1,1,-1],[-1,-1,1,1],[1,1,1,1]]
		for(let k=0; k<4; k++){
			let v=[ sides[0]*fac[i][k], sides[1]*fac[(i+1)%3][k], sides[2]*fac[(i+2)%3][k]];
						if(rotn){v=vecRotate(v,rotn);}
			v=vecSum(v,center);
			if (digi){v=vecDigitize(v);}
			verticesF.push(v);
			verticesB.push(vecScale(v,-1));
		}
		faces.push(verticesF);
		faces.push(verticesB);
	}
	let facedatas=[];
	for(i=0;i<faces.length;i++){facedatas.push(processPoints(faces[i]));}
	if (store){return ({faces:facedatas,pens:pen,closeits:CLOSED})}
	return solidV(facedatas,CLOSED,pen);
}
function sphereV(r,stylus,center,rotn,detail,digi,store){
	let det=detail||Math.floor(r/2);
	const dott=Math.PI*2/det;
	let pen=Pen(2);
	let bang;
	if(center||digi){bang=vecSum(center,SC);}
	if(stylus){pen=stylus;}
	for (let colat=0; colat<Math.PI; colat+=dott/2){
		pen.wt.points.push(2-1.5*Math.abs(colat-Math.PI/2)/(Math.PI/2));
		pen.wt.edges.push(2-1.5*Math.abs(colat-Math.PI/2)/(Math.PI/2));
	}
	for (let longi=0; longi<Math.PI*2;longi+=dott){
		let pts=[];
		for (let colat=0; colat<Math.PI; colat+=dott/2){
			let x=r*Math.cos(longi)*Math.sin(colat);
			let y=r*Math.sin(longi)*Math.sin(colat);
			let z=Math*Math.cos(colat);
			let v=vec3(x,y,z);
			if(rotn){v=vecRotate(v,rotn);}
			if(bang){v=vecSum(v,bang)}
			pts.push(v);
		}
		let info=processPoints(pts);
		polyV(info,true,pen);
	}
}
//================================================
/*
UTILS
*/
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//quarternionLib.js
//_________
class Quaternion{
	constructor(dat,theta){
		if(theta){//make rotn quarternion.
			let im=vecScale(vecNormalize(dat),Math.sin(theta/2));
			let re=Math.cos(theta/2);
			this.re=re;
			this.im=im;
		}
		else if (Array.isArray(dat)){
			this.re=dat[0];
			this.im={x:dat[1],y:dat[2],z:dat[3]}
		}
		else if(typeof(dat)=='object'){
			if(dat.re){this.re=dat.re;}
			else if(dat.w){
				this.re=dat.w;
			}
			else{this.re=0;}
			if(dat.im){this.im=dat.im}
			else {this.im={x:dat.x,y:dat.y,z:dat.z}}
		}
		else if(typeof(dat)=='number'){
			this.re=dat;
			this.im=vec3();
		}
		else{
			this.re=1;
			this.im=vec3();
		}
	}
	toArr(){
		let arr=vec2arr(this.im);
		arr.unshift(this.re);
		return arr;
	}
	toVec(){
		return(vec4(this.im.x,this.im.y,this.im.z,this.re));
	}
	//
	scale(k){
		let re, im;
		if(Array.isArray(k)){
			return new Quaternion(arrProd(this.toArr(),k));
		}
		else{
			re=this.re*k;
			im=vecScale(this.im,k);
		}
		return new Quaternion({re:re,im:im})
	}
	pow(n){
	 return this.log().scale(n).exp();
	}
	//
	magSq(){
		return vecMag(this.toVec());
	}
	magn(){
		return Math.sqrt(this.magSq());
	}
	//
	conjugate(){
		let im=vecScale(this.im,-1);
		return new Quaternion({re:this.re,im:im})
	}
	inverse(){
		return this.conjugate().scale(1/this.magSq());
	}
	//
	exp(){
		const expp=Math.exp(this.re);
		const magn=vecMag(this.im);
		let re=Math.cos(magn)*expp;
		let im=vecScale(vecNormalize(this.im),expp*Math.sin(magn));
		return new Quaternion({re:re,im:im});
	}
	log(){
		let re=Math.log(this.magn());
		let im=vecScale(vecNormalize(this.im),Math.acos(this.re/this.magn()));
		return new Quaternion({re:re,im:im});
	}
	//
	prod(Q){
		let a=this.re, b=this.im.x,c=this.im.y,d=this.im.z;
		let e,f,g,h;
		if(Q){
			if(Array.isArray(Q)){e=Q[0];f=Q[1];g=Q[2];h=Q[3];}
			else{
				if (Q.re){e=Q.re;}
				else if(Q.w){e=Q.w;}
				else{e=0;}
				if(Q.im){f=Q.im.x;g=Q.im.y;h=Q.im.z; }
				else{
					if(Q.x){f=Q.x;}else{f=0;}
					if(Q.y){g=Q.y;}else{g=0;}
					if(Q.z){h=Q.z;}else{h=0;}
				}
			}
		}
		else {e=0;f=0;g=0;h=0;}
	let w=(a*e -b*f -c*g -d*h)
	let x=(a*f +b*e +c*h -d*g)
	let y=(a*g -b*h +c*e +d*f)
	let z=(a*h +b*g -c*f +d*e)
		return new Quaternion([w,x,y,z]);
	}
	conjugation(Q){
		return this.prod(Q).prod(this.inverse());
	}
	slerp(Q,t){
		t = t < 0 ? 0 : t;
		t = t > 1 ? 1 : t;
		return this.prod(this.inverse().prod(Q).pow(t));
	}
}
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//helperLib.js
//_________
Number.prototype.fmt = function(pre,post) {
	let sign = Math.sign(parseFloat(this)) === -1 ? '-' : '+';
	return sign + Math.abs(this).toFixed(pre).padStart(post+pre+1,0);
}
function updateOnResize(){
	SC=getSC();
	negSC=vecScale(SC,-1)
	TRENCH=getSC();TRENCH.z=-DEPTH;TRENCH.x*=-1;TRENCH.y*=-1;
	let vanishx,vanishy,vanishz;
	if(scene.cnv){
		vanishx=scene.cnv.width;
		vanishy=scene.cnv.height;
		vanishz=(scene.cnv.width+scene.cnv.height)/2;
		if(scene.cnv.DEPTH){vanishz=scene.cnv.DEPTH;}
	}
	else{
		vanishx=width;
		vanishy=height;
		vanishz=(height+width)/2;
		if(DEPTH){vanishz=DEPTH;}
	}
	VANISH={x:vanishx,y:vanishy,z:vanishz}
}
//
function getSC(){
	if (scene.cnv){return vec3(scene.cnv.width/2,scene.cnv.height/2,0);}
	else{return vec3(width/2,height/2,0);}
}
//
function Pen(show){
	let newpen={};
	newpen.show={};
	newpen.color={'points':[],'edges':[],'fill':[]};
	newpen.wt={'points':[],'edges':[]};
	if (show){
		if (Array.isArray(show)){
			newpen.show.points=(1==show[0]);
			newpen.show.edges=(1==show[1]);
			newpen.show.fillit=(1==show[2]);
		}
		else if (typeof(show)=='object'){
			newpen.show.points=show.points;
			newpen.show.edges=show.edges;
			newpen.show.fillit=show.fillit;
		}
		else{
			switch (show){
				case 0:
					break;
				case 1:
					newpen.show.points=true;
					break;
				case 2:
					newpen.show.edges=true;
					break;
				case 3:
					newpen.show.points=true;//1
					newpen.show.edges=true;//2
					break;
				case 4:
					newpen.show.fillit=true;
					break;
				case 5:
					newpen.show.points=true;//1
					newpen.show.fillit=true;//4
					break;
				case 6:
					newpen.show.edges=true;//2
					newpen.show.fillit=true;  //4
					break;
				case 7:
					newpen.show.points=true//1
					newpen.show.edges=true;//2
					newpen.show.fillit=true;//4
					break;
			}
		}
	}
	else{
		newpen.show.points=true;
	}
	return newpen;
}
//=============
function PhysProp(dimen){
	let prop={
		'mass':1,
		'vel':new position(dimen),
		'acc':new position(dimen),
		'density':1,
		'fricn':1};
	return prop;
}
//=============
function Scene(mode,cam,cnvs,canvasT){
		let cnvs_=null,mode_=0,cam_=null,canvasTupd=false,canvasT_=tMatrix();
		if(cnvs){cnvs_=cnvs;}
		if(mode){mode_=mode;}
		if(cam){cam_=cam;}
		else{cam_=getModeCam(mode)}
		if(canvasT){canvasT_=canvasT;}
	return {'mode':mode_,'cam':cam_,'cnv':cnvs_,'canvasT':canvasT_,'canvasTupd':canvasTupd}
}
//==============
function Rotor(arr,theta){
	let obj=vec3();
	if (arr){
		if (Array.isArray(arr)){
			obj.x=arr[0];
			if (arr.length>1){obj.y=arr[1];}
			if (arr.length>2){obj.z=arr[2];}
		}
		else if (typeof(arr)=='object'){obj=vecCopy(arr);}
		else if (typeof(arr)=='number'){obj.x=arr;}
	}
	if(theta){return new Quaternion(obj,theta);}
	return obj;
}
function Stretcher(arr,axis){
	if(Array.isArray(arr)){return arr2vec(arr);}
	if (typeof(arr)=='object'){return arr;}
	else{
		let str=[1,1,1];
		str[axis]*=arr;
		return arr2vec(str);
	}
}
//=============
function pol2cart(r,theta,plane,xdir){
	let posV;//draws on XY plane , plane argument is the optional unit vector for custom Z direcion
	posV=vec3(r*Math.cos(theta),r*Math.sin(theta),0);
	if (plane){
		posV=flipPlane(posV,plane,xdir);
	}
	return posV;
}
//---------------
function circumscribe(P1, P2, P3) {
	let D21=vecDiff(P2,P1);
	let D31=vecDiff(P3,P1);
	let F2 = 1/2*vecMagSq(D21);
	let F3 = 1/2*vecMagSq(D31);
	let N23=vecCross(D21,D31);
	D21=vecScale(D21,F3);
	D31=vecScale(D31,F2);
	let Rv=vecScale(vecCross(vecDiff(D31,D21),N23),1/vecMagSq(N23))
	let C=vecSum(P1,Rv);
	let r=vecMag(Rv);
	return {'center':C,'r':r,'plane':vecNormalize(N23)}
}
//---------------
function flipPlane(vecP,normal,xdir){
	let uz=vecNormalize(normal);
	let a=uz.x,b=uz.y,c=uz.z;
	let ux;
	if (xdir){ux=xdir;}
	else{//make random vec on plane the x axis.
		if      (a!=0){ux=[-(b+c)/a,1,1]}
		else if (b!=0){ux=[1,-(a+c)/b,1]}
		else if (c!=0){ux=[1,1,-(a+b)/c]}
	}
	ux=vecNormalize(ux)//returned parsed :)
	let uy=vecNormalize(vecCross(uz,ux));
	if(Array.isArray(vecP)){vecP=arr2vec(vecP);}
	ux=vecScale(ux,vecP.x);
	uy=vecScale(uy,vecP.y);
	uz=vecScale(uz,vecP.z)
	return vecSum(null,null,[ux,uy,uz])
}
//---------------
function applyTrans(pos,T){
	let posM=homogenize2Mat(pos);//homogenized coors
	let transf=matMult(posM,T)[0];
	return arr2vec(transf);
}
function rotAround(pos,v,ang){
	let q=new Quaternion(v,ang);
	return q.conjugation(pos).im;
}
//-------------
function rotobjToQuat(rotor){
	const xx=rotor.x/2;const yy=rotor.y/2;const zz=rotor.z/2;
	const sx=Math.sin(xx);const sy=Math.sin(yy);const sz=Math.sin(zz);
	const cx=Math.cos(xx);const cy=Math.cos(yy);const cz=Math.cos(zz);
	return new Quaternion(vec4(
		sx*cy*cz-cx*sy*sz,
		cx*sy*cz+sx*cy*sz,
		cx*cy*sz-sx*sy*cz,
		cx*cy*cz+sx*sy*sz
	));
}
function quatTomat(rotQ){
	const xy=2*rotQ.im.x*rotQ.im.y;const xz=2*rotQ.im.x*rotQ.im.z;const yz=2*rotQ.im.y*rotQ.im.z;
	const xx=2*rotQ.im.x*rotQ.im.x;const yy=2*rotQ.im.y*rotQ.im.y;const zz=2*rotQ.im.z*rotQ.im.z
	const xw=2*rotQ.im.x*rotQ.re;  const yw=2*rotQ.im.y*rotQ.re;  const zw=2*rotQ.im.z*rotQ.re
	return ([
		[1-yy-zz,   xy+zw,   xz-yw, 0],
		[  xy-zw, 1-xx-zz,   yz+xw, 0],
		[  xz+yw,   yz-xw, 1-xx-yy, 0],
		[0      , 0      , 0       ,1]
	]);
}
function navals(R){
	let roll,yaw,pitch;
	const x1=R[0][0];
	const y1=R[1][0];
	const z1=R[2][0];
	//
	const x2=R[0][1];
	const y2=R[1][1];
	const z2=R[2][1];
	//
	const x3=R[0][2];
	const y3=R[1][2];
	const z3=R[2][2];
	pitch=Math.round(Math.asin(-x3)*Math.pow(10,6))*Math.pow(10,-6);
	if(x3*x3<0.999){//==>cy!=0
		roll=Math.atan2(y3,z3);
		yaw=Math.atan2(x2,x1);
	}
	else{
		roll=Math.acos((z1+y2)/(1-x3))||Math.asin((z2+y1)/(-x3-1))
		yaw=0;
	}
	roll=Math.round(roll*Math.pow(10,6))*Math.pow(10,-6);
	yaw=Math.round(yaw*Math.pow(10,6))*Math.pow(10,-6);
	return(Rotor([roll,pitch,yaw]));
}
function  Mat2AxisAngle(M){
	let u=vec3(
		M[1][2]-M[2][1],
		M[2][0]-M[0][2],
		M[0][1]-M[1][0]
	)
	let ang=Math.atan2(vecMag(u),(trace(M)-2));
	u=vecNormalize(u);
	return {axis:u,angle:ang};
}
//------------
function processPoints(arrpt,origin,rotor,pivot,plane,xdir,trans,digi){
	let vertices=arrCopy(arrpt);
	const numvertices=vertices.length;
	//
	let centroid=vec3();
	for(let i=0; i<numvertices; i++){centroid=vecSum(centroid,vertices[i]);}
	centroid=vecScale(centroid,1/numvertices);
	//
	if(rotor){
		let nP,p;
		if(pivot){nP=vecScale(pivot,-1);p=pivot;}
		else{nP=vecScale(centroid,-1);p=centroid;}
		let centerpt;
		if (origin){centerpt=vecSum(p,origin);}
		else{centerpt=p;}
		for(let i=0; i<numvertices;i++){vertices[i]=vecSum(vecRotate(vecSum(vertices[i],nP),rotor),centerpt);}
		if(origin){centroid=vecSum(centroid,origin);}
	}
	else if (origin){
		for(let i=0; i<numvertices;i++){vertices[i]=vecSum(vertices[i],origin);}
		centroid=vecSum(centroid,origin);
	}
	//
	if(trans){for(let i=0; i<numvertices;i++){vertices[i]=vecTransform(vertices[i],trans);centroid=vecTransform(centroid,trans);}}
	//
	if(plane){for(let i=0; i<numvertices;i++){vertices[i]=flipPlane(vertices[i],plane,xdir);centroid=flipPlane(centroid,plane,xdir);}}
	//
	if(digi){for(let i=0; i<numvertices;i++){vertices[i]=vecDigitize(vertices[i]);centroid=vecDigitize(centroid);}}
	return {vertices:vertices,centroid:centroid};
}
//=============
function homogenize(vecObj){
	let w=1,z=1;
	if(vecObj.w){w=vecObj.w;}
	if (vecObj.z){z=vecObj.z}
	return [vecObj.x,vecObj.y,z,w];
}
function homogenize2Mat(vecObj){
	return [homogenize(vecObj)];
}
//==============
function look(at,from){
	return Camera(null,lookAtM(from,at));
}
function getModeCam(mode){
	if(!mode){return null}
	if (mode>3){
		switch(mode){
			case ISO:
				return ISOCAM;
			case DIAM:
				return DIAMETRICCAM;
			case CAB:
				return CABINETCAM;
		}
	}
	else{return null;}
}
//==============
function drawGrid(scaled,showOrigin,label,rotaxes,inst){
	let fac=1;
	let w,h;
	if (scaled){fac=scaled;}
	if (inst){
		w=inst.width;
		h=inst.height;
		inst.push();
		//digitize
		inst.translate(w / 2, h / 2);
		//inst.scale(1, -1);
		//
		inst.colorMode(inst.RGB,255,255,255,255)
		inst.stroke(255, 255, 0, 64);//yellow and transparent
		inst.strokeWeight(1/fac);//1 pixel
		inst.scale(fac);
		//
		if (rotaxes){inst.rotate(-rotaxes);}//to become like a right hand without scaling by -1
		for (let i = 0; i < h / 2; i++) {//horiz
			inst.line(-w / 2, i, w / 2, i);
			inst.line(-w / 2, -i, w / 2, -i);
			if (label){
				inst.textSize(8*1/fac);
				inst.fill(255);
				if (i%10==5){
					inst.text('-\t ' + inst.nf(i,2,0),-8*1/fac,i);
					inst.text('+\t ' + inst.nf(i,2,0),-8*1/fac,-i)
					inst.circle(0,i,3/fac);
					inst.circle(0,-i,3/fac);
				}
			}
		}
		for (let i = 0; i < w / 2; i++) {
			inst.line(i, -h / 2, i, h / 2);//vert
			inst.line(-i, -h / 2, -i, h / 2);
			if (label){
				inst.textSize(8*1/fac);
				inst.fill(255);
				if (i%10==5){
					inst.text('+' + inst.nf(i,2,0),i-8/fac,(1+2*1/fac));
					inst.circle(i,0,3/fac);
					inst.circle(-i,0,3/fac);
					inst.text('-' + inst.nf(i,2,0),-i-8/fac,(1+2*1/fac))
				}
			}
		}
		inst.stroke(255, 0, 0, 192);//red but slight mask
		inst.line(-w / 2, 0, w / 2, 0); //X axis
		inst.line(0, -h / 2, 0, h / 2); //Y axis
		if(showOrigin){
			inst.strokeWeight(1)//scaled
			inst.stroke(0, 0, 255, 255);//blue and bright:)
			inst.point(0,0);
		}
		inst.pop();
	}
	else{
		w=width;
		h=height;
		push();
		//digitize
		translate(w / 2, h / 2);
		//scale(1, -1);//text gets reversed
		//
		colorMode(RGB,255,255,255,255)
		stroke(255, 255, 0, 64);//yellow and transparent
		strokeWeight(1/fac);//1 pixel
		scale(fac);
		//
		if (rotaxes){rotate(-rotaxes);}//to become like a right hand without scaling by -1
		//
		for (let i = 0; i < h / 2; i++) {//horiz
			line(-w / 2, i, w / 2, i);
			if (label){
				textSize(8*1/fac);
				fill(255);
				if (i%10==5){
					text('-\t ' + nf(i,2,0),-8*1/fac,i);
					circle(0,i,3/fac);
					circle(0,-i,3/fac);
					text('+\t ' + nf(i,2,0),-8*1/fac,-i)
				}
			}
			line(-w / 2, -i, w / 2, -i);
		}
		for (let i = 0; i < w / 2; i++) {
			line(i, -h / 2, i, h / 2);//vert
			if (label){
					textSize(8*1/fac);
					fill(255);
					if (i%10==5){
						text('+' + nf(i,2,0),i-8/fac,(1+2*1/fac));
						circle(i,0,3/fac)
						circle(-i,0,3/fac)
						text('-' + nf(i,2,0),-i-8/fac,(1+2*1/fac))
					};
				}
				line(-i, -h / 2, -i, h / 2);
		}
		stroke(255, 0, 0, 192);//red but masked
		line(-w / 2, 0, w / 2, 0); //X axis
		line(0, -h / 2, 0, h / 2); //Y axis
			if(showOrigin){
				strokeWeight(1)//scaled
				stroke(0, 0, 255, 255);//blue and bright:)
				point(0,0);
			}
		pop();
	}

}
//------
function coorDisp(){
	if(scene.cnv){
		scene.cnv.fill(255);
		scene.cnv.stroke(255);
		scene.cnv.strokeWeight(0.2);
		scene.cnv.textSize(14);
		let x=scene.cnv.mouseX,y=scene.cnv.mouseY;
		scene.cnv.text(scene.cnv.nf(x,3,1)+','+scene.cnv.nf(y,3,1),x,y);
	}
	else{
		fill(255);
		stroke(255);
		strokeWeight(0.2);
		textSize(14);
		text(nf(mouseX,3,1)+','+nf(mouseY,3,1),mouseX,mouseY);
	}
}
//========================
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//constants.js
//____________________
//--------------------
const CLOSED=1;const OPEN=0;
//---------------------
const X=0;const Y=1;const Z=2;
//---------------------
const ORTHO=0;
const STEREO=1;
const TWOPT=2;
const THREEPT=3;
const HUMAN=4;
const FISH=5;
//
const ISO=5;
const DIAM=6;
const CAB=7;
const CUSTOM=8;
//-----------------------------------------------------------------
////========
//builtin systems
//========
const isosys=scaledMatrix([
	[Math.sqrt(3),0,-Math.sqrt(3)],
	[1,2,1],
	[Math.sqrt(2),-Math.sqrt(2),Math.sqrt(2)],

],1/Math.sqrt(6));//from 1st quadrant.
//================================================================
//CAMERAS
//================================================================
//...............
//Axonomeric
//................
//diametric
const dtheta=Math.atan(1/2);
const DIAMETRICCAM=[
	[ 0.8944,0.4472,0,0],//col1[Math.cos(dtheta),0,-Math.cos(dtheta)]
	[ 0     ,1     ,0,0],//col2[Math.sin(dtheta),1,Math.sin(dtheta)],
	[-0.8944,0.4472,1,0],
	[ 0     ,0     ,0,1]
]
const CABINETCAM=[
	[ 2,1,0,0],
	[ 0,1,0,0],
	[-1,2,1,0],
	[ 0,0,0,1]
]
//isometric
const ISOCAM=[
	[ 0.8660 ,0.5,0,0],//col1:[Math.cos(Math.PI/6),0,-Math.cos(Math.PI/6)],
	[ 0      ,1  ,0,0],//col2:[Math.sin(Math.PI/6),1,Math.sin(Math.PI/6)],
	[-0.8660 ,0.5,1,0],//col3 for z axis
	[0       ,0  ,0,1]//column 4 for translation.
]
//................
//Parallel
//................
//orthographic
const orthocam=[
	[1,0,0,0],
	[0,1,0,0],
	[0,0,1,0],
	[0,0,0,1]
]
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
//globalVars.js
//____________________
let scene=Scene();
//--------------------------------------------------------------
let sz=750;
//--------------------------------------------------------------
let DEPTH;
let SC,negSC;
let TRENCH,ZENITH;
let VANISH;
//--------------------------------------------------------------