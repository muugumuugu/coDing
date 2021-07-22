
void setup(){
  size(400,800);//(500,800,P3D);
  pixelSet = new int[width*height][3];
  background(0);
  colorMode(HSB,360,100,100,255);
  //Initiate CMs
  for(int i=0;i<NOrigins;i++){
    midPts[i] = new Origin();
  }
  //Start trails
  for(int i=0;i<NParticles;i++){
    loci[i] = new Locus();
  }
  //
  for(int i=0;i<nsteps;i++){
    println(i+1);
    locus_step();
  }
  println(fieldDensity,intensityExp,drag);
  //frameRate(1000);
}

//====================================================

void draw() {
    for (int i=0; i<width*height; i++){
      for (int a=0; a<3; a++){
        pixelSet[i][a] = 0;
      }
    }
    c = 0;
    for (int sampleCount=0; sampleCount<samplesPerFrame; sampleCount++) {
      sampleCount++;
      t = map((frameCount-1 + sampleCount*shutterAngle/samplesPerFrame)%numFrames, 0, numFrames, 0, 1);
      animate();}
    if (saving){
      saveFrame("###gif");
       println(frameCount);}
    if (frameCount==numFrames*samplesPerFrame){
    saving=false;}
   
  
}

//=================================================

void animate(){
  background(0,1);//clrScr
  //------------------
  for(int i=0;i<NParticles;i++){
      // colors
      
     float alpha=150;map(sin(map(i,0,NParticles,0,TWO_PI*10)),-1,1,50,150);
    color clr=color(map(i,0,NParticles,360,0),50,100,alpha);

     stroke(clr);
    loci[i].show();//
  }
}
