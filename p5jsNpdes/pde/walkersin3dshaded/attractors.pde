boolean inbound(PVector v){
  if (v.x>dim || v.x<0){return false;}
  if (v.y>dim || v.y<0){return false;}
  if (v.z>dim || v.z<0){return false;}
  return true;
}
//-----------------------------------------------
float attract(PVector walker){
  int leng=attractors.size();
  float[] ds=new float[leng];
  for (int i=0; i<leng;i++){
    ds[i]=distnce(attractors.get(i),walker);
  }
  return max(ds);
}

//sphere ρcosθsinϕ,ρsinθsinϕ,ρcosϕ)
