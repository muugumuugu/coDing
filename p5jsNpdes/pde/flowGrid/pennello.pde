class PennelloParticellare {
  PVector pos;
  PGraphics canvas;
  ArrayList<Particella> punti=new ArrayList<Particella>();
  float noiseScale=0.001f;
  float h=random(0,255);
  float s=random(0,255);
  float b=random(0,255);
  float inc_h=random(0.01,0.5);
  float inc_s=random(0.01,0.5);
  float inc_b=random(0.01,0.5);
  PVector forceUser;
  CampoFlusso f;
  
  PennelloParticellare(int numParticelle,float x,float y,PGraphics offScreen,CampoFlusso f){
    this.f=f;
    pos=new PVector(x,y);
    forceUser=new PVector(0,0);
    canvas=offScreen;
    for(int i=0;i<numParticelle;i++){
      punti.add(new Particella(x,y,30,f));
    }
  }
  
  
  public void draw(){
    nextStep();
    canvas.beginDraw();
    //canvas.background(0,0,0,0);
    
    //forceUser.x=sin(mouseX);
    //forceUser.y=cos(mouseY);
    
    for(Particella p : punti){
        p.setColor(h,s,b);
        //p.addForce(forceUser);
        //canvas.tint(255,50);
        canvas.image(p.getSprite(),p.pos.x,p.pos.y); 
    }
    
    canvas.endDraw();
    //image(canvas,0,0);
  }
  
  protected void nextStep(){
    h+=inc_h;//noise(pos.x*noiseScale);
    s+=inc_s;//noise(pos.y*noiseScale);
    b+=inc_b;//noise(frameCount*zOff);
    
    if(h<0 || h > 255)inc_h*=-1;
    if(s<0 || s > 255)inc_s*=-1;
    if(b<0 || b > 255)inc_b*=-1;
    
    
    
    for(Particella p : punti){
      if(p.life>0){
        
        p.nextStep();
      }else{
        p.restart(pos.x,pos.y);
      }
    }    
  }
  
  

}


//////////////////////////////////////////////////



class Particella{
  
  PVector pos;
  PVector acc;
  PVector vel;
  float limitVel=random(0.5,1.5);
  float angoloSterzo=0;
  int size;
  PGraphics sprite;
  float noiseScale=0.002;
  float zOff;
  float h=random(0,255);
  float s=random(0,255);
  float b=random(0,255);
  float a=255;
  float xoff=0.0;
  float yoff=0.0;
  
  float life=1.0f;
  float dec_life=random(0.001,0.01);
  CampoFlusso f;
  
  Particella(float x,float y,int size,CampoFlusso f){
    this.f=f;
    pos=new PVector(x,y);
    acc=new PVector(0,0);
    vel=new PVector(0,0);
    zOff=random(0.009,0.09);
    this.size=size;
    sprite=createGraphics(size,size);
    sprite.colorMode(HSB);
    
    buildSprite();
    
  }
 
  public void setColor(float h,float s,float b){
   this.h=h;
   this.s=s;
   this.b=b;
  }

  protected void restart(float x,float y){
    this.pos.x=x;
    this.pos.y=y;
    life=1.0f;
    vel.mult(0);
    
  }
  private void buildSprite(){
    float m=map(vel.mag(),0.5,1.5,0.0,1.0);
    float fa=f.getVal(pos.x,pos.y);
    
    float r=sprite.width*m;
    a=100-(100*m);
    sprite.beginDraw();
    sprite.background(0,0,0,0);
    sprite.noStroke();
    //sprite.stroke(b,s,h,10-a);
    //sprite.noStroke();
    sprite.fill(h,s,b,a);
    
    sprite.pushMatrix();
    sprite.translate(r/2,r/2);
    //sprite.rect(-r/2,-r/2,r+life,r+life);
    sprite.ellipse(0,0,r,r);
    //sprite.line(0,0,(r/2)*sin(angoloSterzo),(r/2)*cos(angoloSterzo));
    //sprite.line(0,0,vel.x,vel.y);
    sprite.popMatrix();

    sprite.endDraw();
       
  }
  
  
  public void addForce(PVector f){
    acc.add(f);
  }
  
  public void nextStep(){
    PVector dir=f.getForce(pos.x,pos.y);
    dir.mult(limitVel);
    acc.add(dir);
    life-=dec_life;
    
    acc.normalize();
    vel.add(acc);
    vel.limit(limitVel);
    pos.add(vel);
    acc.mult(0);
    
    //pos.add(acc);
   // acc.mult(0);
    
  }
  
  public PGraphics getSprite(){
    
    buildSprite();
    
    return sprite;
  }
  
  

}
