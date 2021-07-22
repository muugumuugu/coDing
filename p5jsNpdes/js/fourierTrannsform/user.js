function mousePressed(){
    mode=USER;
    fourierX=[];
    fourierY=[];
}



function mouseReleased(){

    for (let i=0; i<userdrawing.length; i++){
        x[i]=userdrawing[i].x;
        y[i]=-userdrawing[i].y;
        console.log(x,y);
     }
    fourierX=dft(x);
    fourierY=dft(y);
    ctr=userdrawing.length;
    dt=TWO_PI/ctr;
    path=[];
    userdrawing=[];
    x=[];
    y=[];
    mode=FOURIER;
}