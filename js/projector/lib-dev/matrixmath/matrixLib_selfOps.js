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
