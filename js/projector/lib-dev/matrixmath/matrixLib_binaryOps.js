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