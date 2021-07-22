obs=[]
numeachcolor=[]
ang=false
bigness=75
runone=true
time=0
remove=[]
sum=0
function setup() {
  createCanvas(windowWidth, windowHeight);
  background(0);
  noStroke();
  rectMode(RADIUS)
}

function populate(num){
  for( var k=0;k<num;k++){obs.push( new Ob( random(windowWidth),random(windowHeight),random(360),random(),random(),random(),random()*5,[random(255),random(255),random(255)] ) );}
}

function mleaderboard(){
  meachcolor=[]
  for(k=0;k<obs.length;k++){
    inn=false;jindex=0
    for(j=0;j<meachcolor.length;j++){
      if(obs[k].color==meachcolor[j][0]){inn=true;jindex=j}
    }
    if(inn==true){meachcolor[jindex][1]+=(obs[k].size^2)*PI}else{meachcolor.push([obs[k].color,(obs[k].size^2)*PI])}
  }
  sortmeachcolor();
  textSize(windowWidth*0.0145);
  fill(255,255,255,100)
  rect(windowWidth*0.025,windowHeight/2,windowWidth*0.025,windowHeight/2)
  for(a=0;a<meachcolor.length&&a<int(1/0.0145)+1;a++){
    fill(meachcolor[a][0],meachcolor[a][1],meachcolor[a][2])
    rect(windowWidth*0.0146/2,(a)*windowWidth*0.0145+windowWidth*0.01,windowWidth*0.0145/2,windowWidth*0.0145/2)
    fill(0);
    text(str(round(meachcolor[a][1]*100)/100),windowWidth*0.015,(a)*windowWidth*0.0145+windowWidth*0.0145)
  }
}
function leaderboard(){
  //showbest()
  numeachcolor=[]
  
  for(k=0;k<obs.length;k++){
    inn=false;jindex=0
    for(j=0;j<numeachcolor.length;j++){
      if(obs[k].color==numeachcolor[j][0]){inn=true;jindex=j}
    }
    if(inn==true){numeachcolor[jindex][1]+=1;numeachcolor[jindex][2]+=obs[k].size}else{numeachcolor.push([obs[k].color,1,obs[k].size])}
  }
  
  sortnumeachcolor();
  textSize(windowWidth*.0145);
  fill(255,255,255,100)
  rect(windowWidth*.975,windowHeight/2,windowWidth*.025,windowHeight/2)
  for(a=0;a<numeachcolor.length&&a<int(1/.0145)+1;a++){
      fill(numeachcolor[a][0],numeachcolor[a][1],numeachcolor[a][2])
      rect(windowWidth*.960,(a)*windowWidth*.0145+windowWidth*.01,windowWidth*.0145/2,windowWidth*.0145/2)
      fill(0);
      text(str(numeachcolor[a][1]),windowWidth*.968,(a)*windowWidth*.0145+windowWidth*.0145)
  }
}
function showbest(){
  getbest();
  fill(255,255,255,100);
  rect(windowWidth/2,windowHeight*.975,windowWidth/2-windowWidth*.05,windowHeight*.025);
  fill(best.color[0],best.color[1],best.color[2]);
  rect(windowWidth*.07,windowHeight*.975,windowWidth*.0145/2,windowWidth*.0145/2);
  fill(0);
  text(str(round((best.size^2)*PI*100)/100),windowWidth*.07+windowWidth*.0145/2,windowHeight*.975+windowWidth*.0145/2);

}
function getbest(){
  for(k=0;k<obs.length;k++){if(obs[k].size>best.size){best=obs[k]}}
  }
function sortnumeachcolor(){
  re=true
  while(re==true){
    re=false
    for(k=0;k<numeachcolor.length-1;k++){
        holder=[]
      if(numeachcolor[k][1]<numeachcolor[k+1][1]){
        re=true
        holder=numeachcolor[k+1]
        numeachcolor[k+1]=numeachcolor[k]
        numeachcolor[k]=holder
      }else if(numeachcolor[k][1]==numeachcolor[k+1][1]&&numeachcolor[k][2]<numeachcolor[k+1][2]){
        re=true
        holder=numeachcolor[k+1]
        numeachcolor[k+1]=numeachcolor[k]
        numeachcolor[k]=holder
      }
    }
  }
}
function sortmeachcolor(){
  re=true
  while(re==true){
    re=false
    for(k=0;k<meachcolor.length-1;k++){
        holder=[]
      if(meachcolor[k][1]<meachcolor[k+1][1]){
        re=true
        holder=meachcolor[k+1]
        meachcolor[k+1]=meachcolor[k]
        meachcolor[k]=holder
      }
    }
  }
}
function toosmall(){
  for(k=0;k<obs.length;k++){
    if(obs[k].size<=0){remove=[k];print("removing "+str(k)+" for Size")};
    if(obs[k].size!=obs[k].size){remove=[k];print("removing "+str(k)+" for NaN")};
  }
}
function Ob(fx,fy,fdirection,fsize,fweight,fspeed,fbabytime,fcolor){//creating a class
  this.x=fx
  this.y=fy
  this.direction=fdirection
  this.size=fsize
  this.weight=fweight
  this.speed=fspeed
  this.babytime=fbabytime
  this.poptime=this.babytime
  this.color=fcolor
  this.Iout=[0,0]
  this.show = function(color){
    fill(color);
    ellipse(this.x,this.y,this.size*bigness,this.size*bigness);
    stroke(0,0,0);
    line(this.x,this.y,this.x+cos(this.direction*2*PI/360)*this.size*bigness/2,this.y+sin(this.direction*2*PI/360)*this.size*bigness/2);
    noStroke();
    //fill(0);
    //text(str((this.size**2)*PI),this.x,this.y);
  }
  this.showlines = function(){
    for(j=0;j<obs.length;j++){
      if(obs[j].color==this.color&&obs[j].size!=this.size){
        stroke(this.color[0],this.color[1],this.color[2]);
        line(this.x,this.y,obs[j].x,obs[j].y);
      }
    }  
    noStroke();
  }
  ///////////// testing
  this.showsize = function(){
    textSize(this.size*20);
    fill(0);
    text(round(this.size^2*PI*100)/100,this.x-this.size*20,this.y);
  }
  ///////////////////
  this.baby = function(){
    if(this.size>.25){
      babysize=this.size/2 + (random()-random())*this.size/4;
      babyweight=this.weight + (random()-random())*this.weight;
      babyspeed=this.speed +(random()-random())*this.speed;
      babybabytime=this.babytime+(random()-random())*this.babytime;
      this.poptime=this.babytime;
      this.size=(this.size^2-(babysize)^2)^(1/2);
      obs.push(new Ob(this.x,this.y,random(360),babysize,babyweight,babyspeed,babybabytime,this.color));
    }
  }
  this.mature = function(t){this.poptime-=t}
  this.move = function(){this.x+=cos(this.direction*2*PI/360)*this.speed*this.size;this.y+=sin(this.direction*2*PI/360)*this.speed*this.size;}
  this.bounce = function(){
    if(this.x+this.size*bigness/2>windowWidth){this.direction=180-this.direction;this.size-=(random()/50)}
    if(this.x-this.size*bigness/2<0){this.direction=180-this.direction;this.size-=(random()/50)}
    if(this.y+this.size*bigness/2>windowHeight){this.direction=360-this.direction;this.size-=(random()/50)}
    if(this.y-this.size*bigness/2<0){this.direction=360-this.direction;this.size-=(random()/50)}
  }
  this.redirect = function(){this.direction+=(random()-random())*this.weight*20;}
}
/*
function intersection(){
  for(k=0;k<obs.length;k++){
    for(j=0;j<obs.length;j++){
      if(k!=j){
        if(((obs[k].x-obs[j].x)**2+(obs[k].y-obs[j].y)**2)**(1/2)<obs[k].size*bigness/2+obs[j].size*bigness/2&&obs[k].poptime<0&&obs[j].poptime<0){
          // do somthing here
        }
      }
    }
  }
}
*/

function overlapping(){
  for(k=0;k<obs.length;k++){
    for(j=0;j<obs.length;j++){
      if(k!=j){
        if(((obs[k].x-obs[j].x)^2+(obs[k].y-obs[j].y)^2)^(1/2)<obs[k].size*bigness/2+obs[j].size*bigness/2){
          if(((obs[k].x-obs[j].x)^2+(obs[k].y-obs[j].y)^2)^(1/2)<obs[j].size*bigness/2-obs[k].size*bigness/2){
            obs[k].show([0,0,0]);
            if(obs[k].color!=obs[j].color){remove=[k,j]}
          }
          if(((obs[k].x-obs[j].x)^2+(obs[k].y-obs[j].y)^2)^(1/2)<obs[k].size*bigness/2-obs[j].size*bigness/2){
            obs[j].show([0,0,0]);
            if(obs[k].color!=obs[j].color){remove=[j,k]}
          }
        }
      }
    }
  }
}
function makebabytime(){
  for(k=0;k<obs.length;k++){
    obs[k].mature(0.002);
    if(obs[k].size>0.1){
      if(obs[k].poptime<0){
        obs[k].baby();
      }
    }
  }
}
function keyPressed(){
  if(keyCode==87){}
  if(keyCode==65){}
  if(keyCode==83){}
  if(keyCode==68){}
  if(keyCode==13){obs.push( new Ob( random(windowWidth),random(windowHeight),random(360),random(),random(),random()*3,random()*5,[random(255),random(255),random(255)] ) );}
  if(keyCode==32){
    for(k=0;k<obs.length;k++){
      println("R:"+str(round(obs[k].color[0]))+" G:"+str(round(obs[k].color[1]))+" B:"+str(round(obs[k].color[2]))+" S:"+str(obs[k].size));
    }
  }
}
function keyReleased(){
  println(keyCode)
  if(keyCode==87){}
  if(keyCode==65){}
  if(keyCode==83){}
  if(keyCode==68){}
}
function mousePressed(){}
function draw() {
  if(runone==true){populate(int(1/.0145)+1);best = new Ob( 0,0,0,0,0,0,0,[0,0,0] );runone=false}
  if(remove.length!=0){// if there is an ob to remove
    if(remove.length==2){//if the ob being removed is being eaten by another ob
      obs[remove[1]].size=(((obs[remove[0]].size)^2)+((obs[remove[1]].size)^2))^(1/2)
    }
    obs.splice(remove[0],1);
    remove=[];
  }
  toosmall();
  time++
  if(Math.random()<.0012){obs.push( new Ob( random(windowWidth),random(windowHeight),random(360),random(),random(),random(),random()*5,[random(255),random(255),random(255)] ) );}
  
  fill(0);rect(0,0,windowWidth,windowHeight)
  for(k=0;k<obs.length;k++){
    obs[k].show(obs[k].color);
    //obs[k].showsize();
    obs[k].move();
    obs[k].bounce();
    obs[k].redirect();
    //obs[k].showlines();
  }
  //intersection()
  makebabytime();
  overlapping();
  leaderboard();
  mleaderboard();
}
