int dimen;
float[][] curr;
float[][] prev;
float damping=0.99;

void setup(){
  size(600,600);
  frameRate(30);
  dimen=width;
  curr=new float[dimen][dimen];
  prev=new float[dimen][dimen];
}

void draw(){
  background(0);
  loadPixels();
  for (int i=1;i<dimen-1; i++){
    for (int j=1; j<dimen-1; j++){
      curr[i][j]=((prev[i-1][j]+prev[i+1][j]+prev[i][j-1]+prev[i][j+1])/2-curr[i][j])*damping;
      int index=i+j*dimen;
      pixels[index]=color(curr[i][j]);
    }
  }
  updatePixels();
  float[][] temp=prev;
  prev=curr;
  curr=temp;
}

void mouseDragged(){
  if (mouseX<dimen && mouseX>0 && mouseY>0 && mouseY<dimen){
    curr[mouseX][mouseY]=2500;
  }
}

void mousePressed(){
  if (mouseX<dimen && mouseX>0 && mouseY>0 && mouseY<dimen){
    curr[mouseX][mouseY]=5200;
  }
}

void mouseClicked(){
  if (mouseX<dimen && mouseX>0 && mouseY>0 && mouseY<dimen){
    curr[mouseX][mouseY]=2500;
  }
}
