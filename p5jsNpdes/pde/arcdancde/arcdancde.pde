// arc dance by dave
// https://twitter.com/beesandbombs/status/1233403691673235457

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
int numFrames = 100;        
float shutterAngle = 1;

boolean recording = false, 
  preview = true;

void setup() {
  size(750, 750, P3D);
  smooth(8);  
  rectMode(CENTER);
  pixelDensity(recording ? 1 : 2);
  result = new int[width*height][3];
  noFill();
  strokeWeight(3);
  blendMode(ADD);

  r0 = l/(TWO_PI/3);
  sp = 3*r0;
}

float x, y, z, tt;
int N = 36;
float th, r, l = 40, ex, qq;
float r0, sp;

color[] cs = {#ff0000, #00ff00, #0000ff};

void thing(float q) {
  ex = lerp(TWO_PI/3, 1e-5, c01(2*q) - c01(2*q-1));
  r = l/ex;
  push();
  if (q>=.5)
    scale(-1, 1);
  beginShape();
  for (int i=0; i<N; i++) {
    qq = i/float(N-1);
    th = lerp(-ex/2, ex/2, qq);
    x = r*cos(th) - r;
    y = r*sin(th);
    vertex(x, y);
  }
  endShape();
  pop();
}

float rot;

void draw_() {
  background(20);
  push();
  translate(width/2, height/2);
  rotate(HALF_PI);
  for (int fr=0; fr<3; fr++) {
    stroke(cs[fr]);
    for (int i=-7; i<8; i++) {
      for (int j=-9; j<10; j++) {
        x = i*sp;
        y = (j+2/3.0)*mn*sp;
        if (j%2 != 0)
          x += .5*sp;
          
        tt = map(cos(TWO_PI*t - 0.06*fr + atan2(x,y) - 0.008*dist(x,y,0,0)), 1, -1, 0, 1);
        tt = ease(tt, 3);

        push();
        translate(x, y);
        for (int a=0; a<3; a++) {
          push();
          rotate(TWO_PI*a/3);
          translate(r0, 0);
          thing(tt);
          pop();
        }
        pop();
      }
    }
  }
  pop();
}
