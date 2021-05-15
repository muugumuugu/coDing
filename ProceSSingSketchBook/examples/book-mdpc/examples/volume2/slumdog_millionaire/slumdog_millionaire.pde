// Manuale di Programmazione Cinematografica
// Daniele Olmisani, 2015

// Slumdog millionaire (2008)


final color PAPER = color(0, 0, 0);
final color INK1 = color(120, 60, 255);
final color INK2 = color(225, 225, 225);


void  setup() {
  size(480, 640);
  noLoop();
}


void draw() {
  
  final float S = min(width, height);
   final float U = 0.002;
  
  translate(0.5*width, 0.6*height);
  scale(S);
  
  background(PAPER);
  
  stroke(INK2);
  strokeWeight(3*U);
  
  fill(INK1);
  
  line(-0.5, 0.10, 0.5, 0.10);
  line(-0.5, 0.25, 0.5, 0.25);
  line(-0.5, 0.40, 0.5, 0.40);
  
  drawCell( 0.00, 0.10, 0.9, 0.1);
  drawCell(-0.25, 0.25, 0.4, 0.1);
  drawCell( 0.25, 0.25, 0.4, 0.1);
  drawCell(-0.25, 0.40, 0.4, 0.1);
  drawCell( 0.25, 0.40, 0.4, 0.1);
  
  save("slumdog-millionaire.png");
}


void drawCell(float x, float y, float w, float h) {
  
  pushMatrix();
  
    translate(x, y);
    
    float w2 = 0.5*w;
    float h2 = 0.5*h;
    float d  = 0.2*h;
    
    beginShape();
      vertex(-w2,     0);
      vertex(-w2+d, -h2);
      vertex( w2-d, -h2);
      vertex( w2,     0);
      vertex( w2-d,  h2);
      vertex(-w2+d,  h2);
      vertex(-w2,     0);
    endShape();
  
  popMatrix();
}
