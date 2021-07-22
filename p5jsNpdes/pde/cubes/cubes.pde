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

int samplesPerFrame = 8;
int numFrames = 340;        
float shutterAngle = .75;

boolean recording = false, 
  preview = true;
  

void setup() {
  size(750, 750, P3D);
  smooth(8);  
  rectMode(CENTER);
  pixelDensity(recording ? 1 : 2);
  result = new int[width*height][3];
  fill(200);
  noStroke();
  ortho();
}


float l = 100, sp = 2*l, L = l;
float fade, fadeStart = .89;
void boxx() {
  fade = map(T,fadeStart,1,0,1);  // horrible hack to fade unsightly lines
  ca_ = c1;
  cb_ = c2;
  cc_ = c3;
  for (int i=0; i<4; i++) {
    fill(i%2==0?lerpColor(c3,cb,fade):lerpColor(c2,cb,fade));
    push();
    rotateY(HALF_PI*i);
    translate(0, 0, l/2);
    if (i<2) {
      if (true)
        rect(0, 0, l, l);
    } else if (i==2) {
      rotate(PI);
      face();
    } else {
      ca_ = c2;
      cb_ = c3;
      cc_ = c1;
      rotate(1.5*PI);
      face();
    }
    pop();
  }

  ca_ = c3;
  cb_ = c1;
  cc_ = c2;

  for (int i=0; i<2; i++) {
    fill(lerpColor(c1,cb,fade));
    push();
    rotateX(HALF_PI+PI*i);
    translate(0, 0, l/2);
    if (i==0) {
      if (true)
        rect(0, 0, l, l);
    } else {
      rotate(1.5*PI);
      face();
    }
    pop();
  }
}

color c1 = #a9def9, c2 = #d0f4de, c3 = #ff99c8, cb = #fafafa;
color ca_ = c1, cb_ = c2, cc_ = c3;
float T;

void face() {
  push();
  fill(cb);
  push();
  translate(0, 0, -.1);
  rect(0, 0, L, L);
  pop();

  fill(ca_);
  rect(-L/3, -L/3, L/3, L/3);
  rect(-L/3, L/3, L/3, L/3);
  rect(L/3, -L/3, L/3, L/3);
  rect(L/3, L/3, L/3, L/3);

  fill(cb_);
  triangle(-L/6, -L/2, L/6, -L/2, L/6, -L/6);
  quad(-L/6, -L/6, -L/6, L/6, L/6, L/2, L/6, L/6);

  fill(cc_);
  triangle(-L/2, -L/6, -L/2, L/6, -L/6, L/6);
  quad(-L/6, -L/6, L/6, -L/6, L/2, L/6, L/6, L/6);
  pop();
}

float spx, spy, spz;
float ee = 4;

void draw_() {
  T = t;
  t = 1-t;
  background(cb);
  push();
  translate(width/2, height/2);
  scale(pow(1.5, -t));
  scale(-2.5, 2.5, 2.5);

  rotateX(-ia);
  rotateY(QUARTER_PI);

  if (t <= .6) {
    t = map(t,0,.6,0,1);

    rotateY(HALF_PI*ease(c01(3*t-2), ee));
    rotate(HALF_PI*ease(c01(3*t-1), ee));
    rotateY(HALF_PI*ease(c01(3*t), ee));

    rotateY(PI);
    rotate(PI);
    boxx();
  } 
  
  else {
    t = map(t,.6,1,0,1);
    spy = l + l*ease(c01(3*t), ee);
    spx = l + l*ease(c01(3*t-1), ee);
    spz = l + l*ease(c01(3*t-2), ee);
    push();
    scale(.5);
    for (int i=0; i<2; i++) {
      for (int j=0; j<2; j++) {
        for (int k=0; k<2; k++) {
          push();
          translate((i-.5)*spx, (j-.5)*spy, (k-.5)*spz);
          rotateX(PI*1.5);
          rotateY(PI);
          boxx();
          pop();
        }
      }
    }
    pop();
  }
  pop();
}
