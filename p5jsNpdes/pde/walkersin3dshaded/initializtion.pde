void   generateattractors(){
   PVector centre=new PVector(dim/2,dim/2,dim/2);
   attractors.add(centre);//point attractor 
   attractors.add(new PVector(dim/4,dim/4,dim)); //multiple points:)
   attractors.add(new PVector(3*dim/4,dim/4,dim)); //multiple points:)
   attractors.add(new PVector(dim/4,3*dim/4,dim)); //multiple points:)
   attractors.add(new PVector(3*dim/4,3*dim/4,dim)); //multiple points:)   
   attractors.add(new PVector(dim/4,dim/4,0)); //multiple points:)
   attractors.add(new PVector(3*dim/4,dim/4,0)); //multiple points:)
   attractors.add(new PVector(dim/4,3*dim/4,0)); //multiple points:)
   attractors.add(new PVector(3*dim/4,3*dim/4,0)); //multiple points:)
}
//-----------------------------------
void generateWalkers(){
  float[] xs=getrandom(density,seedit());
  float[] ys=getrandom(density,seedit());
  float[] zs=getrandom(density,seedit());
  for (int j=0; j<density; j++){
    status[j]=true;
    walkers[j]=new PVector(xs[j]*dim,ys[j]*dim,zs[j]*dim);
    locns.add(walkers[j]);
  }  
}
//---------------------------------------------

float seedit(){
  return 12000+random(12000);
}
