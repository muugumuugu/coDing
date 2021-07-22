void dtaHt(float[] arr){
   for (int ii=0; ii<values.length;ii++){
    values[ii]=random(height);
  }
}

void dtaClr(float[] arr){
   for (int ii=0; ii<values.length;ii++){
    values[ii]=round(random(255*255*255));
  }
}

void visualHt(float[] arr){
    for(int ii=0;ii<arr.length;ii++){
    fill(255);
    noStroke();
    rectMode(CORNERS);
    rect((thic*ii)+gap*2,height,(ii+1)*thic+gap,height-values[ii]);
  }
}

void visualClr(float[] arr){
    for(int ii=0;ii<arr.length;ii++){
      float r= round(arr[ii]/(255*255))%255;
      float g= round(arr[ii]/255)%255;
      float b= arr[ii] %255;
      
      
      fill(r,g,b);
     noStroke();
     //rectMode(CORNERS);
    //  rect((thic*ii)+gap*2,height,(ii+1)*thic+gap,height/2);
      circle((thicc+gap)*ii,map(arr[ii],0,255*255*255,0,height),thic);
  }
}

void visualClrFin(float[] arr){
      for(int ii=0;ii<arr.length;ii++){
      float r= round(arr[ii]/(255*255))%255;
      float g= round(arr[ii]/255)%255;
      float b= arr[ii] %255;
      
      
      stroke(r,g,b);
      line((thicc+gap)*ii,map(arr[ii],0,255*255*255,0,height)-gap*4,(thicc+gap)*ii,map(arr[ii],0,255*255*255,0,height)+gap*4);
  }
}
