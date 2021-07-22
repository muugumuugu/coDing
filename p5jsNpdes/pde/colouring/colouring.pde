void setup(){
  PGraphics p = createGraphics(4096,4096,JAVA2D);
  int temp= -1;
  p.beginDraw();
  for (int y=0;y<p.height;y++){
    println(y);
    for (int x=0;x<p.width;x++){
      if(x% 256 == 0){
        temp++;
      }
      p.stroke(x% 256,y% 256,temp);
      p.point(x,y);
    }
    if(y%6 != 0 || y == 0){
     temp -= 16;
    }
  }
  p.endDraw();
  println("saving image");
  p.save("test2.png");
}
