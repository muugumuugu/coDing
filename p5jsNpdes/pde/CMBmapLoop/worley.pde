 
public class WorleyNoise {

  //
  PVector[] points= new PVector[detail];// number of randomly distributed feature points.
  
  
  public WorleyNoise(vectorr bounds, int detail, int lvl ) {
    
}
  
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
