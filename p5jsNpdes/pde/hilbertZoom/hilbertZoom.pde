EasingFunctions ease=new EasingFunctions();
int orderMax = 8;

float order = 1;
float  N;
float total;

float n2;
float total2;

PVector[] path={};

PVector[] otherPath={};
PVector[] otherDest={};

float counter = 0;
float delta = 0.01;
float orderDelta = 1;

void setup() {
  size(512, 512);
  colorMode(HSB, 360, 255, 255,255);
  background(0);

  setupCurves(order, order + 1);
}

void draw() {
  background(0);

  stroke(255);
  strokeWeight(1);
  noFill();
  for (int i = 1; i < max(total, total2); i++) {
      float h = map(i, 0, otherPath.length, 0, 360);
      stroke(h, 255, 255);
      
      float c = counter;
      if(orderDelta < 0){c = 1.0 - c;}
  
      PVector  pointa = lerpvec(otherPath[i - 1], otherDest[i - 1], c);
      PVector  pointb = lerpvec(otherPath[i], otherDest[i], c);
  
      line(pointa.x, pointa.y, pointb.x, pointb.y);
  }
  counter += delta;
  if (counter > 1) {
    order += orderDelta;
    if (order > orderMax-1)
      orderDelta = -1;
    else if (order < 2)
      orderDelta = 1;
    else if(orderDelta > 0)
      setupCurves(order, order + 1);
    else
      setupCurves(order-1, order);
    counter = 0;

  }
  //endShape();


  // strokeWeight(4);
  // for (float i = 0; i < path.length; i++) {
  //  point(path[i].x, path[i].y);
  //  text(i, path[i].x+5, path[i].y);
  // }
}

void setupCurves(float fromOrder,float  toOrder) {
  N = int(pow(2, fromOrder));
  total = N * N;
  n2 = int(pow(2, toOrder));
  total2 = n2 * n2;
  
  path =new PVector[ceil(total)];
  otherPath =new PVector[ceil(total2)];
  otherDest = new PVector[ceil(total2)];
  
  for (int i = 0; i < total; i++) {
    path[i] = hilbert(i, fromOrder);
    float len = width / N;
    path[i].mult(len);
    path[i].add(len / 2, len / 2);
  }

  if (toOrder > fromOrder) {
    for (int i = 0; i < total2; ++i) {
     float thisAmount = (i / total2) * total;
      int thisIndex = floor(thisAmount);
      otherPath[i] = new PVector(path[thisIndex].x,path[thisIndex].y);

      int otherIndex = thisIndex + 1;
      if (otherIndex >= path.length)
        otherIndex = thisIndex;

      otherPath[i] = lerpvec(path[thisIndex], path[otherIndex], thisAmount - thisIndex);

      otherDest[i] = hilbert(i, toOrder);
      float len = width / n2;
      otherDest[i].mult(len);
      otherDest[i].add(len / 2, len / 2);
    }
  }
}



PVector lerpvec(PVector pa, PVector pb, float t) {
  float tt = ease.easeInOutQuint(t);
  PVector result= new PVector(pa.x,pa.y);
  result.x += (pb.x - pa.x) * tt;
  result.y += (pb.y - pa.y) * tt;
  return result;
}
