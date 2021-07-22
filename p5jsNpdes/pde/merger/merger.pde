float a=0;
Boxy b;
ArrayList<Boxy> sponge;

void setup(){
    size(800,800,P3D);
    b=new Boxy(0,0,0,400);
}

void draw(){
  background(0);
  stroke(255);
 // noFill();
  lights();
  
  translate(width/2,height/2);
  rotateX(a);
  rotateY(a);
  a+=0.01;
  if (sponge!=null){
   for (Boxy bb  : sponge){bb.show();
  }}
  else {b.show();}
}

void mousePressed(){
  if (sponge!=null){
    ArrayList<Boxy> next= new ArrayList<Boxy>();
    for (Boxy bb : sponge){
      ArrayList<Boxy> boxes=bb.generate();
      next.addAll(boxes);
    }
    sponge=next;
  }
  else{sponge=b.generate();}
}
