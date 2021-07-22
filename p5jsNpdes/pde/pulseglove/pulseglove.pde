// a gif by davey aka "bees & bombs"

int[][] result;
float t, c;

float ease(float p) {
  return 3*p*p - 2*p*p*p;
}

float ease(float p, float g) {
  if (p < 0.5) 
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}

float mn = .5*sqrt(3), ia = atan(sqrt(.5));

void push() {
  pushMatrix();
  pushStyle();
}

void pop(){
  popStyle();
  popMatrix();
}

void draw() {
  
  if(!recording){
    t = mouseX*1.0/width;
    c = mouseY*1.0/height;
    if(mousePressed)
        println(c);
    draw_();
  }
  
  else {
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;
  
    c = 0;
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
      draw_();
      loadPixels();
      for (int i=0; i<pixels.length; i++) {
        result[i][0] += pixels[i] >> 16 & 0xff;
        result[i][1] += pixels[i] >> 8 & 0xff;
        result[i][2] += pixels[i] & 0xff;
      }
    }

    loadPixels();
    for (int i=0; i<pixels.length; i++)
      pixels[i] = 0xff << 24 | 
        int(result[i][0]*1.0/samplesPerFrame) << 16 | 
        int(result[i][1]*1.0/samplesPerFrame) << 8 | 
        int(result[i][2]*1.0/samplesPerFrame);
    updatePixels();
  
    saveFrame("g###.gif");
    if (frameCount==numFrames)
      exit();
  }
}

//////////////////////////////////////////////////////////////////////////////

int samplesPerFrame = 4;
int numFrames = 220;        
float shutterAngle = .6;

boolean recording = false;

void setup() {
  size(540,540,P3D);
  pixelDensity(recording ? 1 : 2);
  smooth(8);
  result = new int[width*height][3];
  rectMode(CENTER);
  stroke(32);
  noFill();
  strokeWeight(4);
}

float x, y, z, tt;
int N = 2400, nt = 18;
float th, ph;
float r = 200;
float qq;
float br, sw;

void thing(){
  beginShape();
  for(int i=0; i<N; i++){
    qq = i*1.0/(N-1);
    ph = lerp(-HALF_PI,HALF_PI,qq);
    th = nt*TWO_PI*qq - TWO_PI*t;
    y = r*sin(ph);
    x = r*cos(ph)*sin(th);
    z = r*cos(ph)*cos(th);
    y += r*.08*cos(TWO_PI*t - PI*qq);
    br = map(modelZ(x,y,z),-r,r,0,1);
    stroke(lerpColor(250,16,br));
    sw = map(cos(TWO_PI*qq - 3*TWO_PI*t),1,-1,0,1);
    sw = constrain(3*sw-2,0,1);
    sw = 2 + 6.5*ease(sw,3);
    strokeWeight(sw);
    curveVertex(x,y,z);
  }
  endShape();
}

void draw_() {
  background(250); 
  push();
  translate(width/2, height/2);
  scale(5.6/7.2);
  thing();
  pop();
}
