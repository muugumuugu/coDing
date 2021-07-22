public class CampoFlusso{
  /*dimensioni della matrice*/
  protected int larg;
  protected int alt;
  /*pixel dell'immagine*/
  protected int pixelLarg;
  protected int pixelAlt;
  /*pixel di ogni elemento*/
  protected int risoluzioneElemento;
  /*matrice di angoli di direzione*/
  protected float[][] a;
  /*matrice di forze*/
  //protected float[][] f;
  
  
   public CampoFlusso(int pixelLarg,int pixelAlt,int risoluzioneGriglia){
     this.pixelLarg=pixelLarg;
     this.pixelAlt=pixelAlt;
     alt=this.pixelAlt/risoluzioneGriglia;
     larg=this.pixelLarg/risoluzioneGriglia;
     this.risoluzioneElemento=risoluzioneGriglia;
     a=new float[larg][alt];
     //f=new float[larg][alt];
   }
  
 
   public PVector getForce(float x,float y){
     PVector f;
     int yy=(int)constrain(y/risoluzioneElemento,0,alt-1);
     int xx=(int)constrain(x/risoluzioneElemento,0,larg-1);
     float fa=map(a[xx][yy],0.0,1.0,0,TWO_PI);
     float fx=cos(fa);
     float fy=sin(fa);
        
     f=new PVector(fx,fy);
     //line(x,y,x+f.x*50,y+f.y*50);
     return f;
     
   }
  
  public float getVal(float x,float y){
     
     int yy=(int)constrain(y/risoluzioneElemento,0,alt-1);
     int xx=(int)constrain(x/risoluzioneElemento,0,larg-1);
     float fa=map(a[xx][yy],0.0,1.0,0,TWO_PI);
     
     return fa;
     
   }
  
  
  public void updateGrid(CampoFlussoUpdater u){
    //u.aggiorna(a,larg,alt);
    u.aggiorna(this);
  }
  
  
    public void drawGrid(CampoFlussoDrawer d){
      d.disegna(this);
  }

}



public interface CampoFlussoUpdater{
  public void aggiorna(CampoFlusso chiamante);
}

public interface CampoFlussoDrawer{
  public void disegna(CampoFlusso chiamante);
  
}


public class NOISE implements CampoFlussoUpdater{
  public float xoff=0.0;
  public float yoff=0.0;
  public float incXoff=0.1;
  public float incYoff=0.1;
  public float scale=0.15;
  protected float ottave;
protected float sfumatura;
  
  public NOISE(float ottave,float sfumatura){
    this.ottave=ottave;
    this.sfumatura=sfumatura;
    noiseDetail(int(ottave),sfumatura);
  }
  
  
  public void aggiorna(CampoFlusso chiamante){
    
    float[][] a=chiamante.a;
    int larg=chiamante.larg;
    int alt=chiamante.alt;
    for(int x=0;x<larg;x++){
      for(int y=0;y<alt;y++){
        a[x][y]=map(noise((x+xoff)*scale,(y+yoff)*scale)*100,0,100,0.0,1.0);
       
      }
       
    }
    
    xoff+=incXoff;//map(noise(xoff+incXoff)*scale,0.0,1.0,-incXoff,incXoff);
    yoff+=incYoff;//map(noise(yoff+incYoff)*scale,0.0,1.0,-incYoff,incYoff);
  }
}

public class DISEGNATORE_VALORI implements CampoFlussoDrawer{
  public void disegna(CampoFlusso chiamante){
    float[][] a=chiamante.a;
    int larg=chiamante.larg;
    int alt=chiamante.alt;
    int risoluzioneGriglia=chiamante.risoluzioneElemento;
    float w=((float)risoluzioneGriglia);
    float h=((float)risoluzioneGriglia);
    float x=0;
    float y=0;
    //int colore;
    fill(0);
    textSize(w/3);
    for(int xx=0;xx<larg;xx++){
      for(int yy=0;yy<alt;yy++){
       // colore=(int)map(a[r][c],0.0,TWO_PI,0,255);
        text((""+a[xx][yy]).substring(0,3), x, y+h/2);
        
        x+=w;  
      }
      y+=h;
      x=0;
    }
  
  }
}


public class DISEGNATORE_VETTORI implements CampoFlussoDrawer{
  
  public void disegna(CampoFlusso chiamante){
    float[][] a=chiamante.a;
    int larg=chiamante.larg;
    int alt=chiamante.alt;
    int risoluzioneGriglia=chiamante.risoluzioneElemento;
    float w=((float)risoluzioneGriglia)/2;
    float h=((float)risoluzioneGriglia)/2;
    float x=0;
    float y=0;
    int colore;
    strokeWeight(w/10);
      for(int r=0;r<larg;r++){
        for(int c=0;c<alt;c++){
        float fa=map(a[r][c],0.0,1.0,0.0,TWO_PI);
        float fx=cos(fa);
        float fy=sin(fa);
        
        colore=(int)map(a[r][c],0.0,1.0,0,255);
        //stroke(255-colore,255-colore,255-colore);
        stroke(0,255-colore,colore);
        fill(0,255-colore,colore);
        //if(a[r][c]>0 && a[r][c]<PI){
          //line(x+w-fx*w*3,y+h-fy*h*3,x+w+fx*w*3,y+h+fy*h*3);
        //}else{
         line(x+w-fx*w,y+h-fy*h,x+w+fx*w,y+h+fy*h);
       pushMatrix();
        translate(x+w, y+h);
       rotate(fa); 
        polygon(w/2, 0, w/3, 3);  // Triangle
       
        popMatrix();
        //}
        
        //rect(x+w+fx*w,y+h+fy*h,3,3);
        x+=w*2;  
        
      }
      y+=h*2;
      x=0;
    }
  }
  
  private void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
}


public class DISEGNATORE_RETINO implements CampoFlussoDrawer{
  
  public void disegna(CampoFlusso chiamante){
    float[][] a=chiamante.a;
    int larg=chiamante.larg;
    int alt=chiamante.alt;
    int risoluzioneGriglia=chiamante.risoluzioneElemento;
  
    int w=risoluzioneGriglia;
    int h=risoluzioneGriglia;
    int x=0;
    int y=0;
    noStroke();
    int colore;
    float raggio;
    ellipseMode(RADIUS);  
    for(int r=0;r<larg;r++){
      for(int c=0;c<alt;c++){
        colore=(int)map(a[r][c],0.0,1.0,0,255);
        raggio=map(a[r][c],0.0,1.0,0,w)/2;
        fill(0,255-colore,255-colore);
        if(raggio>risoluzioneGriglia/5){
        ellipse(x+w/2,y+w/2,raggio,raggio);
        }else{
          ellipse(x,y,raggio/2,raggio/2);
          ellipse(x+w,y,raggio/2,raggio/2);
          ellipse(x,y+h,raggio/2,raggio/2);
          ellipse(x+w,y+h,raggio/2,raggio/2);
          ellipse(x+w/2,y+h/2,raggio/2,raggio/2);
        }
        x+=w;  
      }
      y+=h;
      x=0;
    }
  }
}



public class DISEGNATORE_COLORI implements CampoFlussoDrawer{
  
  public void disegna(CampoFlusso chiamante){
    float[][] a=chiamante.a;
    int larg=chiamante.larg;
    int alt=chiamante.alt;
    int risoluzioneGriglia=chiamante.risoluzioneElemento;
  
    int w=risoluzioneGriglia;
    int h=risoluzioneGriglia;
    int x=0;
    int y=0;
    noStroke();
    int colore;
    for(int r=0;r<larg;r++){
      for(int c=0;c<alt;c++){
      //float fx=cos(a[r][c]);
      //float fy=sin(a[r][c]);
      //line(x+(w)-fx*(w),y+(h)-fy*(h),x+(w)+fx*(w),y+(h)+fy*(h));
      colore=(int)map(a[r][c],0.0,1.0,0,255);
      fill(0,colore,colore);
      
      rect(x,y,w,h);
      x+=w;  
      
    }
    y+=h;
    x=0;
  }
  }
}
