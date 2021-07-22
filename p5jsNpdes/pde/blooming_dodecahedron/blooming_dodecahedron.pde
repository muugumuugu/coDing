
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

void draw() {

  if (!recording) {
    t = mouseX*1.0/width;
    c = mouseY*1.0/height;
    if (mousePressed)
      println(c);
    draw_();
  } else {
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

    saveFrame("frame-###.gif");
    if (frameCount==numFrames)
      exit();
  }
}

//////////////////////////////////////////////////////////////////////////////

int samplesPerFrame = 8;
int numFrames = 320;        
float shutterAngle = .5;

boolean recording = false;

int ns = 240;
float th;

// grabbed vertices and edges from mathematica. sorry open source people :(

float[][] verts = {{-1.37638, 0., 0.262866}, {1.37638, 
  0., -0.262866}, {-0.425325, -1.30902, 0.262866}, {-0.425325, 
  1.30902, 0.262866}, {1.11352, -0.809017, 0.262866}, {1.11352, 
  0.809017, 0.262866}, {-0.262866, -0.809017, 1.11352}, {-0.262866, 
  0.809017, 1.11352}, {-0.688191, -0.5, -1.11352}, {-0.688191, 
  0.5, -1.11352}, {0.688191, -0.5, 1.11352}, {0.688191, 0.5, 
  1.11352}, {0.850651, 
  0., -1.11352}, {-1.11352, -0.809017, -0.262866}, {-1.11352, 
  0.809017, -0.262866}, {-0.850651, 0., 
  1.11352}, {0.262866, -0.809017, -1.11352}, {0.262866, 
  0.809017, -1.11352}, {0.425325, -1.30902, -0.262866}, {0.425325, 
  1.30902, -0.262866}};
  
int[][] edges = {{0, 13}, {0, 14}, {0, 15}, {1, 4}, {1, 5}, {1, 12}, {2, 6}, {2, 
  13}, {2, 18}, {3, 7}, {3, 14}, {3, 19}, {4, 10}, {4, 18}, {5, 
  11}, {5, 19}, {6, 10}, {6, 15}, {7, 11}, {7, 15}, {8, 9}, {8, 
  13}, {8, 16}, {9, 14}, {9, 17}, {10, 11}, {12, 16}, {12, 17}, {16, 
  18}, {17, 19}};

void dodec() {
  push();
  for (int i=0; i<edges.length; i++) {
    line(sc*verts[edges[i][0]][0], sc*verts[edges[i][0]][1], sc*verts[edges[i][0]][2], 
      sc*verts[edges[i][1]][0], sc*verts[edges[i][1]][1], sc*verts[edges[i][1]][2]);
  }
  pop();
}

void spiral(float q1, float q2) {
  beginShape();
  for (int i=int(ns*q1); i<ns*q2; i++) {
    x = map(i, 0, ns, 0, 80);
    th = map(i, 0, ns, 0, 6*TWO_PI);
    vertex(x, .008*x*x*cos(th), .008*x*x*sin(th));
  }
  endShape();
}

void spirals() {
  for (int i=0; i<verts.length; i++) {
    push();
    rotateY(atan2(verts[i][0], verts[i][2])+HALF_PI);
    rotate(acos(verts[i][1]/1.40126) - HALF_PI);
    translate(sc*1.4, 0, 0);
    spiral(ease(constrain(2.5*t-1.5,0,1)), ease(constrain(2.5*t,0,1)));
    pop();
  }
}

void setup() {
  size(640, 640, P3D);
  result = new int[width*height][3];
  rectMode(CENTER);
  noFill();
  smooth(8);
  strokeWeight(2);
}

float x, y, z, tt;
float sc = 90;

void draw_() {
  background(0);
  push();
  translate(width/2, height/2);
  rotateY(-PI*t);
  stroke(240);
  dodec();
  spirals();
  pop();
}
