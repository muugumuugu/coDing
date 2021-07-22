// By Roni Kaufman
// Inspired by Naoki Tsutae's sketches (https://www.openprocessing.org/user/154720)
// 158 characters

s=0;draw=_=>{createCanvas(w=255,w);s+=0.1;for(t=0;t<7;t+=0.01){a=cos(t);b=sin(t);c=(1+b*b)/99;d=cos(s-t)+1;stroke(w*b,w*a,w,w*d);circle(a/c+w/2,a*b/c+w/2,d)}}
