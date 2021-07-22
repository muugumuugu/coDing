int detail=100;
int noiseLevel=1; //distance from ?th closest seed.
int depth=500;
PVector[] points= new PVector[detail];// number of randomly distributed feature points.
void setup(){
  colorMode(HSB,100,100,100,100);
  size(800,800);
  for (int i=0;i<detail;i++){
    points[i]=new PVector(random(width),random(height), random(depth));
  }
  
}

void draw(){
  loadPixels();
 for (int x=0; x<width ; x++){
    for (int y=0; y<width ; y++){ 
       int index= x+y*width;
       int z=frameCount%depth;
       //pixels[index]=color(random(255));//Pure Noise
       float[] distances= new float[points.length];
         for (int i=0; i<detail; i++){
           if (mousePressed){
           distances[i]=dist(x,y,points[i].x,points[i].y);}
           else{
           distances[i]=dist(x,y,z,points[i].x,points[i].y, points[i].z);
           }
         }
        float[] sorted=sort(distances);
        float noise=sorted[noiseLevel-1];
        pixels[index]=color(map(noise,0,sorted[detail-1],0,100),100,100,50);
   }
 }
 updatePixels();
   for (PVector v: points){
     stroke(255,0,0);
     strokeWeight(8);
    //point(v.x,v.y);
  }
}
