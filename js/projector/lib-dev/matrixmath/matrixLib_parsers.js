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
//==================================