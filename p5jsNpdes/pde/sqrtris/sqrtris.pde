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

void pop() {
  popStyle();
  popMatrix();
}

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
int numFrames = 180;        
float shutterAngle = .75;

boolean recording = false, 
  preview = true;

void setup() {
  size(800, 800, P2D);
  strokeJoin(ROUND);
  smooth(8); 
  pixelDensity(recording ? 1 : 2);
  result = new int[width*height][3];
  strokeWeight(2.5);
  noFill();
  rectMode(CENTER);
  blendMode(ADD);
}

float x, y, z, tt;
float r = 70;

void tri() {
  triangle(0, 0, r*3/2, r*mn, r*3/2, -r*mn);
}

void twoTris() {
  tri();
  push();
  rotate(PI);
  tri();
  pop();
}

void halfTri() {
  beginShape();
  vertex(0, 0);
  vertex(r*3/2, r*mn);
  vertex(r*3/2, -r*mn);
  endShape();
}

void twoHalfTris() {
  halfTri();
  push();
  rotate(PI);
  halfTri();
  pop();
}
float ee = 4;

void things(float q){
  q = (q+1000)%1;
  if (4*q<1) {
    tt = ease(4*q,ee);
    for (int i=0; i<4; i++) {
      push();
      rotate(HALF_PI*i);
      translate(0, r*sqrt(3));
      rotate(lerp(-PI/6,PI/6,tt));
      //stroke(0);
      noFill();
      twoTris();
      pop();
    }
  }
  
  else if (4*q<2) {
    tt = ease(4*q-1,ee);
    for (int i=0; i<4; i++) {
      push();
      rotate(HALF_PI*i);
      translate(0, r*sqrt(3));
      rotate(PI/6);
      //stroke(0);
      noFill();
      twoHalfTris();
      pop();
    }
    push();
    rotate(-HALF_PI*tt);
    rect(0,0,2*sqrt(3)*r,2*sqrt(3)*r);
    pop();
  }
  
  else if (4*q<3) {
    tt = ease(4*q-2,ee);
    for (int i=0; i<4; i++) {
      push();
      rotate(HALF_PI*i);
      translate(0, r*sqrt(3));
      rotate(lerp(PI/6,-PI/6,tt));
      //stroke(0);
      noFill();
      twoTris();
      pop();
    }
  }
  
  else {
    tt = ease(4*q-3,ee);
    push();
    scale(-1,1);
    for (int i=0; i<4; i++) {
      push();
      rotate(HALF_PI*i);
      translate(0, r*sqrt(3));
      rotate(PI/6);
      //stroke(0);
      noFill();
      twoHalfTris();
      pop();
    }
    push();
    rotate(-HALF_PI*tt);
    rect(0,0,2*sqrt(3)*r,2*sqrt(3)*r);
    pop();
    pop();
  }
}

void draw_() {
  background(10);
  push();
  translate(width/2, height/2);
  stroke(255,0,0);
  things(t);
  push();
  scale(1.0075);
  stroke(0,255,0);
  things(t+.003);
  pop();
  push();
  scale(1.015);
  stroke(0,0,255);
  things(t+.006);
  pop();
  pop();
}
