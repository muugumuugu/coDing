function place() {
  while (pA < 65) 
  {
    pG(px,py,pA-1);
    if (pA%8==0) {py+=40;}
    if (pA%8!=0) {px += 40;} 
  else {px = 0;}
    pA +=1   ;
  }
  pA = 1;
  py = 0;
  px = 0;
}
//=====================
function player() 
{
  rectMode(CENTER);
  if (keyIsDown(39)) {a+=0.05;}
  if (keyIsDown(37)) {a-=0.05;}
  if (keyIsDown(40)) {Py-=sin(a+1);Px-=cos(a+1);}
  if (keyIsDown(38)) {/*Py-=1;*/Py+=sin(a+1);Px+=cos(a+1);}
  
  fill(0);
  while (numR<60) {
    if (p[(dy-(dy%40))/5+(dx-(dx%40))/40]==1) {
      line(Px,Py,dx,dy);
      dis=Math.sqrt((Px-dx)*(Px-dx)+(Py-dy)*(Py-dy));
      aDif=((numR-30)*rd)%(2*PI);
      dis=dis*cos(aDif);
      push();
      //noStroke();
      rectMode(CENTER);
      fill('green');
      rect(320+numR*5.4,160,5.35,30*320/dis);
      pop();
      numR+=1;
      dx=Px;dy=Py;
      //console.log(dis);
    } else {
      dy+=sin(a+(numR+30)*rd);
      dx+=cos(a+(numR+30)*rd);
    }
  }
  numR=0;
  fill(200,0,0);
  rect(Px,Py,10,10);
  rectMode(CORNER);
}
//=============
function pG(x,y,c)
{
  fill(255);
  if (p[c]==1) 
  {
    rect(x,y,40,40);
    if (Px+5>x&&Px+5<x+5&&Py+5>y&&Py-5<y+40) {Px-=1;}
    if (Px-5<x+40&&Px-5>x+35&&Py+5>y&&Py-5<y+40) {Px+=1;}
    if (Py+5>y&&Py+5<y+5&&Px+5>x&&Px-5<x+40) {Py-=1;}
    if (Py-5<y+40&&Py-5>y+35&&Px+5>x&&Px-5<x+40) {Py+=1;}
  }
  fill(100);
  if (p[c]==0) 
  {
    rect(x,y,40,40);
  }
}
//=============================
