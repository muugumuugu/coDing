float ease(float p, float g) {
  if (p < 0.5) 
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}

void setup() {
  size(960, 720, P3D);
  smooth(8);
  stroke(255);
  noFill();
}

float x, y, t, n = 360;
float weight, phase;

float spacing = 20, 
      len = 720, 
      wavelength = 7100, 
      speed = 8e-5,
      waveHeight = 14,
      spiralAmount = 3;
      
int numWaves = 8,
    numLines = 25;

void draw() {
  t = (millis()*speed) % 1;
  background(0); 
  
  pushMatrix();
  translate(width/2, height/2);
  
  for (int i=0; i<numLines; i++) {
    beginShape();
    for (int j=0; j<n; j++) {
      y = (i-.5*(numLines-1))*spacing;
      x = map(j, 0, n-1, -len/2, len/2);
      
      phase = (x*x + y*y)/wavelength;
      
      y += waveHeight*sin(TWO_PI*numWaves*t - phase)*exp(-.1*phase);
      
      weight = map(cos(TWO_PI*t + atan2(x,y) - spiralAmount*sqrt(phase)),1,-1,0,1);
      strokeWeight(lerp(2,9,ease(weight,3)));
      
      vertex(x, y);
    }
    endShape();
  }
  popMatrix();
}
