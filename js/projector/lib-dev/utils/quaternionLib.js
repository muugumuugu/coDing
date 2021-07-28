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