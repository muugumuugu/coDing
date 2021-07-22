//quickSort
//create posets around pivot to find pivots locn . repeat.
//=================================================
let values=[];
let value=0;
let w=5;
let sorted=false;
let states=[];//0 = pivot pt  2= checking , -1 = random ass , 1== pivot guess
//---------------
let qsB;
//---------------------
const swaps=[];
let backup=[];
class Swap{
  constructor(a,b){
    this.a=a;
    this.b=b;
  }
}
let swapInd=0;
//----------------------
let flashin = [-1,-1];
//=================================================

function qsInitiate(){
  quickSort(values,0,values.length-1);
  sorted=true;
}

//===================================================
async function partition(arr,start,end){
  let pInd=start;
  let pI=end;
  let pivot=arr[pI];
   states[pI]=0;
   states[pInd]=2;
    for (let i=start; i<=end; i++){
      states[i]=1;
      drawArr(values);
      //check(i,end);
        if (arr[i]<pivot){
          states[i]=2;//curr piv posn guess
          states[pInd]=-1;
          await swap(arr,i,pInd);
          pInd=pInd+1;
        }
        
    }
   await swap(arr,pI,pInd);
  states[pI]=-1;
  states[pInd]=0;
  return pInd;
}
//-----------------------------
async function quickSort(arr,start,end){
    if (start>=end){
      return;
    }
  let index=await partition(arr,start,end);
  // let x;
  //for (let delayer=0 ; delayer<100000 ; delayer+=0.05){
  //  x=0;
  //}
  await Promise.all([
  quickSort(arr,start,index-1),
  quickSort(arr,index+1,end)
  ]);
  states[index]=-1;
  drawArr(values);
}
//==================================================

function setup() {
  createCanvas(800,200);
  qsB=createButton("QUICK");
  qsB.mousePressed(qsInitiate);
  values= new Array(floor(width/w));
  states=new Array(values.length);
    for (let i=0; i< values.length; i++){
        value=random(height);
        values[i]=value;
        states[i]=-1;
    }
  backup=values.slice(0);
  drawArr(backup);
}
//----------------------------------
function draw() {
  //if (swapInd<swaps.length){
  //  const sw=swaps[swapInd];
  //  swap(backup,sw.a,sw.b);
  //  swapInd=swapInd+1;
  //  flashin=[sw.a,sw.b];
  //}
  //else if (sorted){
  //  console.log("DONE");
  //  noLoop();
  //}
  //drawArr(backup);
}

//=========================================================

async function swap(arr , i, j){
  let temp=arr[i];
  arr[i]=arr[j];
  arr[j]=temp;
  //--------------------
  if (sorted==false){
    const sw=new Swap(i,j);
    swaps.push(sw);
  }
  if (sorted){
     console.log("gonn sleep");
     await sleep(50);
   }
   drawArr(values);
  // let x;
  //for (let delayer=0 ; delayer<100000 ; delayer+=0.05){
  //  x=0;
  //}
}
//==========================================================

function sleep(ms){
return new Promise(resolve=>setTimeout(resolve,ms));
}

//==========================================================

function drawArr(arr){
  background(51);
    for (let i=0; i<arr.length; i++){
      stroke(0);
      //-------------
      if (states[i]==0){fill(255,0,0);}
      else if (states[i]==1) {fill(255,255,0);}
      else if (states[i]==2){fill(0,255,0);}
      else{fill(255);} 
      //---------------------
      rect(i*w,height-arr[i],w,arr[i]);
    }
}
