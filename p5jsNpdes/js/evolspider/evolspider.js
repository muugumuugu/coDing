t=0,draw=_=>{createCanvas(w=720,w);t+=.01;A=sin(t/5)**2/3
for(i=12;i--;){T(PI/6*i)}}
T=(d,s=7,x=w/2,y=x,l=70)=>{if(s){strokeWeight(s*2)
f=20-s,n=noise(x/w-t,y/w+t)*f
line(x,y,x+=l*cos(d)+f*cos(n),y+=l*sin(d)+f*sin(n))
for(j of[A,-A]){T(d+j,s-1,x,y,l*.8)}}}
