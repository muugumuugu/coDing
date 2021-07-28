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
