//
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