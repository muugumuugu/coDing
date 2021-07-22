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

float c01(float g) {
  return constrain(g, 0, 1);
}

void draw() {
  if (recording) {
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;

    c = 0;
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
      t %= 1;
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

    saveFrame("f###.png");
    if (frameCount==numFrames)
      exit();
  } else if (preview) {
    c = mouseY*1.0/height;
    if (mousePressed)
      println(c);
    t = (millis()/(20.0*numFrames))%1;
    draw_();
  } else {
    t = mouseX*1.0/width;
    c = mouseY*1.0/height;
    if (mousePressed)
      println(c);
    draw_();
  }
}

//////////////////////////////////////////////////////////////////////////////

int samplesPerFrame = 4;
int numFrames = 125;        
float shutterAngle = .6;

boolean recording = false, 
  preview = false;

void setup() {
  size(750, 750, P3D);
  smooth(8);  
  rectMode(CENTER);
  pixelDensity(recording ? 1 : 2);
  result = new int[width*height][3];
  fill(32);
  noStroke();
  blendMode(ADD);
}

float x, y, z, tt;
int N = 8;
float l = 50, sp = 1.2*l, D = 5, d = 4, qq;
float th;

color[] cs = {#ff0000, #00ff00, #0000ff};

void thing(float q) {
  q = (q+100)%1;
  for (int a=0; a<3; a++) {
    fill(cs[a]);
    push();
    translate(a-1, 0);
    for (int i=0; i<4; i++) {
      push();
      rotate(-HALF_PI*i);
      for (int j=0; j<N; j++) {
        qq = (i+(j*1.0/N))/4;
        tt = (q*(a+1) + qq)%1;
        d = D*(1-tt);
        x = map(j, 0, N, -l/2, l/2);
        y = l/2;
        square(x, y, d);
      }
      pop();
    }
  pop();
  }
}

void draw_() {
  background(10);
  push();
  translate(width/2, height/2);
  for (int i=-4; i<4; i++) {
    for (int j=-4; j<4; j++) {
      push();
      translate((i+.5)*sp, (j+.5)*sp);
      thing(t + atan2(i+.5, j+.5)/TWO_PI);
      pop();
    }
  }
  pop();
}
