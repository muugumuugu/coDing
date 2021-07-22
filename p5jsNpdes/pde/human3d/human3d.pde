import remixlab.proscene.*;
 
Scene scene;
float px[], py[], mesh[][][];
 
void setup() {
  size(800, 800, P3D);
  smooth(); //Suavição de Contorno
  lights(); //Inicia Luzes no ambiente
 
  //Inicia ambiente para Cena
  scene = new Scene(this);
  scene.setAxesVisualHint(false);
  scene.setGridVisualHint(false);
  scene.showAll();
 
  //Cria Matriz para a malha 
  px = new float[40];
  py = new float[40];
  float t = 0;
 
  for(int i = 0; i < px.length; i++) {
    px[i] = bezierPoint(50, 130, 130, 50, t);
    py[i] = bezierPoint(450, 350, 150, 50, t);
    //px[i] = bezierPoint(300, 308, 370, 300, t);
    //py[i] = bezierPoint(70, 30, 30, 70, t);
    t += (1.0/(float)(px.length-1));
    ellipse(px[i], py[i], 5, 5);
    println(t);
  }
 
  //Cria Malha
  mesh = createMesh(px,py,20, -60,60);
  //mesh = createMesh(px,py,170, -360,360);
 
  scene.startAnimation();
}
 
void draw() {
  background(0);
  ambientLight(128, 128, 128);
  directionalLight(255, 255, 255, 0, 1, -100);
 
  //head(-3);
  stroke(255);
  //noStroke();
  //fill(255,120,0);
  drawMesh(mesh);
}
 
void head(int headSize) { 
  fill(255);
  bezier(300, 70, 30, 308, 30, 30, 372, 30, 30, 385, 70, 30); //scalp
  bezier(300, 70, 30, 300-headSize, 120, 30, 315-headSize, 135, 30, 320, 140, 30); //side
  bezier(385, 70, 30, 385+headSize, 120, 30, 370+headSize, 135, 30, 365, 140, 30); //side
  bezier(320, 140, 30, 340, 155, 30, 345, 155, 30, 365, 140, 30); //chin
}
 
//Desenha Malha
void drawMesh(float mesh[][][]) {
  //println(mesh.length+" "+mesh[0].length+" "+mesh[0][0].length);
  for(int i = 0; i < mesh.length-1; i++) {
    beginShape(QUAD_STRIP);
    for(int j = 0; j < mesh[0].length; j++) {
      vertex(mesh[i][j][0], mesh[i][j][1], mesh[i][j][2]);
      vertex(mesh[i+1][j][0], mesh[i+1][j][1], mesh[i+1][j][2]);
    }
    endShape();
  }
}
 
//Cria malha
float [][][] createMesh(float px[],float py[],int numrot, float startDeg,float endDeg) {
  float deg, x, z;
  double cosval, sinval, tmp1, tmp2;
 
  float [][][] mesh = new float[numrot][px.length][3];
  endDeg -= startDeg;
 
  for(int i = 0; i < numrot; i++) {
    deg = radians(startDeg + (endDeg/(float)(numrot-1)) * (float)i);
    for(int j = 0; j < px.length; j++) {
      x = px[j];
      z = 0;
      cosval = Math.cos(deg);
      sinval = Math.sin(deg);
      tmp1   = x * cosval - z * sinval;
      tmp2   = x * sinval + z * cosval;
      mesh[i][j][0] = (float) tmp1;
      mesh[i][j][1] = py[j];
      mesh[i][j][2] = (float) tmp2;
    }
  }
  return mesh;
}
