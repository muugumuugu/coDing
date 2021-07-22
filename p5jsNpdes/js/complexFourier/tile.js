Counter=0

draw=_=>{
	createCanvas(W=720,W)
	Counter+=.03;
	D(0,0,W-1,W-1,8)
}

D=(x,y,w,h,step)=>{
	if(step>0){
		strokeWeight(step)
		rect(x,y,w,h,10,10)
		let n=noise(x/W*TAU,y/W*TAU,Counter/step)
		--step%2?
		D(x,y,w*n,h,step)&D(x+w*n,y,w-w*n,h,step):
		D(x,y,w,h*n,step)&D(x,y+h*n,w,h-h*n,step)
	}
}