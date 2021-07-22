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
int numFrames = 330;        
float shutterAngle = 1;

boolean recording = false, 
  preview = true;

void setup() {
  size(866, 750, P3D);
  smooth(8);  
  rectMode(CENTER);
  pixelDensity(recording ? 1 : 2);
  result = new int[width*height][3];
  fill(255);
  noStroke();
}

float x, y, z, tt;
int N = 10;
float sp = 36, w, h, th, hexDist;
float maxDist = 249.5;
float easing = 4.5;
float wavelength = 2.5;

void draw_() {
  background(30);
  push();
  translate(width/2, height/2);
  for (int a=-1; a<2; a++) {
    for (int i=-N; i<N; i++) {
      for (int j=-N; j<N; j++) {
        x = i*sp;
        y = (j+a*2/3.0)*mn*sp;
        if (j%2 != 0)
          x += .5*sp;

        hexDist = max(abs(y), abs(mn*x + .5*y), abs(mn*x - .5*y))/maxDist;

        if (hexDist <= 1) {
          w = lerp(3, 4, sq(hexDist));
          h = lerp(sp/mn, w, sq(hexDist)); 

          tt = (t + 100 - hexDist/wavelength)%1;
          
          th = TWO_PI*a/3;
          for (int k=0; k<3; k++) {
            th += TWO_PI/6*ease(c01(3*tt-k), easing);
          }

          push();
          translate(x, y);
          rotate(th);
          ellipse(0, 0, w, h);
          pop();
        }
      }
    }
  }
  pop();
}
