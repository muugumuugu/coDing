CampoFlusso f;

CampoFlussoUpdater generatoreNoise=new NOISE(1,1);
CampoFlussoDrawer disegnatoreVettori=new DISEGNATORE_VETTORI();
CampoFlussoDrawer disegnatoreColori=new DISEGNATORE_COLORI();
CampoFlussoDrawer disegnatoreRetino=new DISEGNATORE_RETINO();
CampoFlussoDrawer disegnatoreValori=new DISEGNATORE_VALORI();


int larg=700;
int alt=700;
int res/*risoluzioneElementoGriglia*/=25;

PGraphics canvasParticelle;

PennelloParticellare pennelloP;

void setup(){
  background(100);
  size(700,700);
  canvasParticelle=createGraphics(larg,alt);
  
  f=new CampoFlusso(larg,alt,res);
  f.updateGrid(generatoreNoise);
  
   pennelloP=new PennelloParticellare(1000,larg/2,alt/2,canvasParticelle,f);
  
}

void draw(){
  background(100);
  f.updateGrid(generatoreNoise);
  
  
  f.drawGrid(disegnatoreColori);
  //f.drawGrid(disegnatoreRetino);
  f.drawGrid(disegnatoreVettori);
  
  pennelloP.nextStep();
  pennelloP.draw();
  image(canvasParticelle,0,0);
  canvasParticelle.background(0,0,0,0);
  f.drawGrid(disegnatoreValori);
 
}
