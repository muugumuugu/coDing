//sketch 3d using alphas else P3D voxel
int dim=800;
int density=100;
boolean[] status=new boolean[density];
ArrayList<PVector> locns= new ArrayList<PVector>();
ArrayList<PVector> attractors= new ArrayList<PVector>();
float shade=(float)255/dim;
PVector[] walkers=new PVector[density];



void setup(){
   size(800,800);//,P3D);
   background(0);
   //scale(0.5);
   scale(2);
   //
   generateWalkers();
   generateattractors();
 
   drawWalkers();
}

void draw(){
  walk();
  drawWalkers();
}

void keyPressed(){
  saveFrame("###.png");
}
