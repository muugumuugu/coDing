var c;
var hue,sat,bright;
var rr,gg,bb;
//------------------------
function setup() {
 createCanvas(1000,600);
 colorMode(RGB);
 hue=30;
 sat=100;
 bright=100;
 rr=80;
 gg=87;
 bb=230;
 background(rr,gg,bb);
// background(hue,sat,bright);
 textAlign(CENTER);
 textSize(64);
 var c;
// c= hsv2rgb(hue,sat,bright);
//c=rgb2hsb(rr,gg,bb);
c=hsb2rgb(290,40,100);
 text(c[0]+"_"+c[1]+"_"+c[2],width/2,height/2);
 
}


function draw() {

}
//-------------

function rgb2hsb(r,g,b){
  r=r/255;
  g=g/255;
  b=b/255;
  let h, s,v;
  let cmax,cmin,del;
  cmax=max(r,max(g,b));
  cmin=min(r,min(g,b));
  del=cmax-cmin;
  if (cmax==r){h=60*(((g-b)/del)%6);}
  if (cmax==g){h=60*(((b-r)/del)+2);}
  if (cmax==b){h=60*(((r-g)/del)+4);}
  if (cmax==0){s=0;}
  else{s=100*del/cmax;}
  v=cmax*100;
  return [int(h),int(s),int(v)];
        
}

function hsb2rgb(h,s,v){
  s=s/100;
  v=v/100;
  let r,g,b;
  let rr,gg,bb;
  let col,xfac,m ;
  col=v*s;
  xfac=col*(1-abs(((h/60)%2)-1));
  m=v-col;
  if (h<120){
    bb=0;
    if (h<60){
      gg=xfac;
      rr=col;
    }
    else{
    gg=col;
    rr=xfac;
    }
  }
  
  if (120<=h<240){
    rr=0;
    if (h<180){
      gg=col;
      bb=xfac;
    }
    else{
    gg=xfac;
    bb=col;
    }
  }
  if (240<=h<360){
    gg=0;
      if (h<300){
      bb=col;
      rr=xfac;
    }
    else{
    bb=xfac;
    rr=col;
    }
  }
  r=255*(rr+m);
  g=255*(gg+m);
  b=255*(bb+m);
 return [int(r),int(g),int(b)];
        
}
//-------------------
