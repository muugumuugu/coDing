int[][] result;
float t;

float ease(float p) {
  return 3*p*p - 2*p*p*p;
}

float ease(float p, float g) {
  if (p < 0.5) 
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}

float mn = .5*sqrt(3);

void draw() {

  if (!recording) {
    t = mouseX*1.0/width;
    draw_();
  } else {
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;

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

    saveFrame("f###.gif");
    if (frameCount==numFrames)
      exit();
  }
}

//////////////////////////////////////////////////////////////////////////////

int samplesPerFrame = 8;
int numFrames = 180;        
float shutterAngle = .7;

boolean recording = true;

void setup() {
  size(740, 550, P3D);
  ortho();
  rectMode(CENTER);
  strokeWeight(1.5);
  smooth(8);
  result = new int[width*height][3];
}

float x, y, tt;
int N = 5;

void draw_() {
  background(255); 
  pushMatrix();
  translate(width/2, height/2);


  for (int i=0; i<16; i++) {
    tt = ease(constrain(1.75*t-.75*i/16.0,0,1),2);
    fill(255*(i%2));
    stroke(255-255*(i%2));
    pushMatrix();
    translate(0, 0, -180*i);
    rotateX(-atan(sqrt(.5)));
    rotateY(QUARTER_PI);
    if(i%3 == 0)
      rotateY(HALF_PI*tt);
    if(i%3 == 1)
      rotateX(HALF_PI*tt);
    if(i%3 == 2)
      rotateZ(HALF_PI*tt);
    box(18*i+14);
    popMatrix();
  }
  popMatrix();
}
