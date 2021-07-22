PVector field(float x,float y){
  
  float amount = fieldDensity;
  //---------------------
  float xlump = 0;
  float ylump = 0;
  //-----------------
  for(int i = 0;i<NOrigins;i++){
    float distance = dist(x,y,midPts[i].x,midPts[i].y);
    float intensity = constrain(map(distance,0,width,1,0),0,1);
    intensity = pow(intensity,intensityExp);
    float xPixel = (x - midPts[i].x)/distance;
    float yPixel = (y - midPts[i].y)/distance;
    
    xlump += (midPts[i].rotAng*yPixel + midPts[i].repulsionEnergy*xPixel)*intensity*amount;
    ylump += (-midPts[i].rotAng*xPixel + midPts[i].repulsionEnergy*yPixel)*intensity*amount;
  }
  return new PVector(xlump,ylump+fieldDensity);
}
