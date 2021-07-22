//Variables

let time=0;
let dt;
let scl=2;
//................
let fourierT=[];// fourier results : pos, freq, amp, phase.
let path=[];
let ampCnst;
//--------------------------------------------------
//Complex number Implemantation
class Complex{
    constructor(a,b){
        this.re=a;
        this.im=b;
    }
    //..............................
    multp(z){
        //(a+ib)(c+id)=ac-bd + i(bc+ad)
        let re=this.re*z.re-this.im*z.im;
        let im=this.re*z.im+this.im*z.re;
        return new Complex(re,im);
    }
    //....................................
    add(zz){
        this.re+=zz.re;
        this.im+=zz.im;
    }
    //.................................
    mag(){
        return this.re*this.re+this.im*this.im;
    }
    //......................................
    arg(){
        return atan2(this.im,this.re);

    }
}

//-----------------------------------------------------
// discrete fourier transform
function dft(points){
    let fourier=[];
    let Npts =points.length;
    for (let k=0; k<ctr; k++){//frquenc index
        let thetaCoeff=(TWO_PI*k)/Npts;
        let discreteIntegral=new Complex(0,0);// initiate at 
        for (let n=0; n<Npts; n++){
            let theta=n * thetaCoeff;
            let factor=new Complex(cos(theta),-sin(theta));
            let t=points[n].multp(factor);
            discreteIntegral.add(t);
        }
        discreteIntegral=discreteIntegral.multp(new Complex(1/Npts,0)); 
        let freq=k;
        let amp=sqrt(discreteIntegral.mag());
        let phase=discreteIntegral.arg();

        fourier[k]={re: discreteIntegral.re, im: discreteIntegral.im,  freq, amp, phase};
    }
    return fourier;
}
//-------------------------------------------------
// return epiCycle
function epicycles(x ,y, fourier){
    for (let i=0; i<fourier.length; i++){
        let prevx=x;
        let prevy=y;
        let freq=fourier[i].freq;
        let radius=scl*fourier[i].amp;
        let phase=fourier[i].phase;
        x+=radius*cos(freq*time+phase)
        y+=radius*sin(freq*time+phase);
        stroke(255,100);
        strokeWeight(1);
        noFill();
        circle(prevx,prevy,radius*2);
        stroke(1);
        stroke(255,0,0);
        fill(255,0,0,);
        circle(x,y,1.2); //circle child foot
        stroke(255,255,0,100);
        line(prevx,prevy,x,y);//follow circle child's foot
    }
    return createVector(x,y);
}
