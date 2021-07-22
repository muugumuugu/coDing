int dimtest=4;// looping method. >> shall use 4d and loop in z and v dimensions in a circle.
//
Vectorr boundV;
FloatList bounds;
//
WorleyNoise wrly; 
int detailing=50;
int indexing=1;  // worley factor
//
float depth=200; // equivalent to inc for the slice offsets, but  lesser depth gives more voronoier patterns.
float scaled;
int numFrames=60;
//

void setup(){
  size(600,600);// symetrical , and even sym to depth for neatiness. 
  scaled=width;
  colorMode(HSB,360,100,100,100);
  
  bounds=new FloatList();
  for (int k=0; k<dimtest; k++){
  bounds.set(k,scaled);
  }
  boundV=new Vectorr(bounds);
  //
  wrly=new WorleyNoise(boundV,detailing,indexing);
  //
  background(255);
}

void draw(){
  float ang= map (frameCount%(numFrames+1), 1, numFrames,0,TWO_PI);
  float z= depth*sin(ang);
  float v= depth*cos(ang);
  loadPixels();
   for (float x=0; x<width ; x++){
      for (float y=0; y<height ; y++){ 
          FloatList posP= new FloatList();
          //-------------------------
          //coor on pixel canvas
          posP.append(x);
          posP.append(y);
          //coor in time slice
            posP.append(z);
            posP.append(v);
          //-------------------------
          Vectorr pos=new Vectorr(posP);
          //------------------------------------------------------------------
          float[] evaled= wrly.eval(pos);// Fn, max dist
          color clr=color(map(evaled[0],0,evaled[1],180,720)%360,100,100,50);//increase range if color is not changing much or some other range to limit to a clr scheme
          //clr=color(map(evaled[0],0,evaled[1],0,360));
          //-------------------------------------------------------------------
          //stroke(clr);
          //point(x,y);
          pixels[(int)(x+y*width)]=clr;
         }
     }
  //
  updatePixels();
    //for gif rendering
     if (frameCount>10 && frameCount<=numFrames+10){
       saveFrame(nf(frameCount-10,3,0) +".gif");
       println(frameCount-10);// makes alpha factor of gif incorporated into loopydela loop>> makes for a simple motion blur.
     }

}

void mousePressed(){
  wrly=new WorleyNoise(boundV,detailing,indexing);
  wrly.show();
}
