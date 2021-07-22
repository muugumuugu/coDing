//Variables
let fourierX=[];
let fourierY=[];
//
let path=[];
//
let ampCnst;
//
//-----------------------------------------------------
// discrete fourier transform
function dft(xx){
    const fourier=[];
    const N = xx.length;
    for (let k=0; k<N; k++){//frquenc index
        let thetaCoeff=(TWO_PI*k)/N;
        let re=0;
        let im=0;
        for (let n=0; n<N; n++){
            let theta=n* thetaCoeff;
            re+=xx[n]*cos(theta);
            im-=xx[n]*sin(theta);
        }
    re=re/N;
    im=im/N;
    let freq=k;
    let amp=sqrt(re*re+im*im);
    let phase=atan2(im,re);
    fourier[k]={re,im,freq,amp,phase};
    }

    return fourier;

}
//----------------------------------------------------


function epicycles(x ,y, fourier,rotation){
    for (let i=0; i<ctr; i++){
        let prevx=x;
        let prevy=y;
        let freq=fourier[i].freq;
        let radius=fourier[i].amp;
        let phase=fourier[i].phase;
        x+=radius*cos(freq*time+phase+rotation);//rotation of axed=rotation
        y+=radius *sin(freq*time+phase+rotation);
        noFill();
        stroke(255,100);
        strokeWeight(1);
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
