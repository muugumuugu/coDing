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
//-----------------------------------
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