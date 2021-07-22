OpenSimplexNoise noise;

float[][] result;
float t, c;




void push() {
  pushMatrix();
  pushStyle();
}

void pop() {
  popStyle();
  popMatrix();
}

void draw() {
    //translate(0,-height);
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;

    c = 0;
    //----------------------------
    for (int sa=0; sa<samplesPerFrame; sa++) 
    {
      t = map(frameCount%numFrames-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
      draw_();
      loadPixels();
      for (int i=0; i<pixels.length; i++)
      {
        result[i][0] += pixels[i] >> 16 & 0xff;
        result[i][1] += pixels[i] >> 8 & 0xff;
        result[i][2] += pixels[i] & 0xff;
      }
    }
  //---------------------------
    loadPixels();
    for (int i=0; i<pixels.length; i++)
        {
        pixels[i] = 0xff << 24 | 
        int(result[i][0]*1.0/samplesPerFrame) << 16 | 
        int(result[i][1]*1.0/samplesPerFrame) << 8 | 
        int(result[i][2]*1.0/samplesPerFrame);
        }
    updatePixels();
    
   //-----------------------
  if (recording){
    saveFrame("fr###.png");
    println(frameCount,"/",numFrames);
    if (frameCount==numFrames){exit();}
  }

}

//////////////////////////////////////////////////////////////////////////////


void setup(){
  size(1800,600);
  colorMode(HSB,360,100,100,100);
  result = new float[width*height][3];
  
  noise = new OpenSimplexNoise();
  
  for(int i=0;i<n;i++){
    array[i] = new Star();
  }
  
}
