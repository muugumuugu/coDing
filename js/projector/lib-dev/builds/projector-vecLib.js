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
	let dots=detail||Math.floor(info.r/2);
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
//============================================