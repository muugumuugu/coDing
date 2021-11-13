Drop[] drops=new Drop[800];
void setup(){
  size(1000,800);
    for (int i=0; i<drops.length;i++){
    drops[i]=new Drop();
  }
}

void draw(){
  background(30,30,50);
  for (int i=0; i<drops.length;i++){
    Drop d=drops[i];
    d.fall();
    d.show();
  }

}
