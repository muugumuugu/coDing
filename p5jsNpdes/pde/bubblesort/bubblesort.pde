float[] values;
float thic=10;
float thicc=10;
int gap=2;
int i=0;
int j=0;


////
void setup(){
  background(0,0,0,0);
  size(1000,1000);
  values=new float[width/int(thicc+gap)];//lemgth of values array
 // dtaHt(values);
  dtaClr(values);
  //sort func
  //for (int i=0; i<values.length; i++){
  //  for (int j=0;j<values.length-i-1;j++){
  //    float a = values[j];
  //    float b = values[j+1];
  //    if (a>b){
  //      swap(values,j,j+1);//the window
  //    }
      
  // }
  
  
}
  
  
void draw(){
  //background(0,0,0,0);
  //visualHt(values);
  visualClr(values);
    //do one window per frame

    float a = values[j];
    float b = values[j+1];
    if (a>b){
    swap(values,j,j+1);//the window
     }
   if(i<values.length){
     j=j+1;
     if (j>=values.length-i-1){
       j=0;
       i=i+1;
       thic=thic*0.9;
       }
   }else{
       println("hehehehehe");
       thic=20;
       visualClrFin(values);
       noLoop();
     }
   
}

void swap(float[] arr,int i, int j){
  float temp=arr[i];
  arr[i]=arr[j];
  arr[j]=temp;
}
