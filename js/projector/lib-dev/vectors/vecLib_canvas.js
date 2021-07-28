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