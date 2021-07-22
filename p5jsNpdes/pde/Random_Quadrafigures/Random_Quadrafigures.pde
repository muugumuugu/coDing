
// randomized Quadrangle plot
float scl=40;
float size=50;
float jitter=0.3;
void setup() {
size(800, 800);
background(255);
strokeWeight(1);
for(float i=0;i*scl<width;i++){
  for (float j=0; j*scl<height; j++){
  fill(random(255),random(255),random(255),random(100));
  plotRandomizedQuad (i*scl, j*scl, size, size, jitter, jitter);
}
}
} // end setup
void plotRandomizedQuad(float x, float y, float w, float h, float randW, float randH) {
  float jitterW = w*randW;
  float jitterH = h*randH;
  beginShape();
  vertex(x+random(- jitterW, jitterW), y+random(-jitterH, jitterH));
  vertex(x+random(-jitterW, jitterW), y+h+random(-jitterH, jitterH));
  vertex(x+w+random(-jitterW, jitterW), y+h+random(-jitterH, jitterH));
  vertex(x+w+random(-jitterW, jitterW), y+random(-jitterH, jitterH));
  endShape(CLOSE);
} // end plotRandomizedQuad

int token=0;
int shutter=20;
void draw(){
  if (token%shutter==0){
background(255);
strokeWeight(1);
for(float i=0;i*scl<width;i++){
  for (float j=0; j*scl<height; j++){
  fill(random(255),random(255),random(255),random(100));
  plotRandomizedQuad (i*scl, j*scl, size, size, jitter, jitter);
  token=token+1;
}
}
}}
