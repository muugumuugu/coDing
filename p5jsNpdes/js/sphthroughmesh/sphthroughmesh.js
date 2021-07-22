const COLS = createCols("https://coolors.co/ff6bb0-29d4ff-ffed61");

function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  //ortho
  let dep = max(width,height);
  ortho(-width / 2, width / 2, -height / 2, height / 2,-dep*3 , dep*3);
}

function draw() {

  background(0);
  strokeWeight(min(width,height)*0.005);
  rotateX(-PI/6);
  rotateY(-PI/6);
  
  const cycle = 300;
  let frameRatio = (frameCount % cycle) / cycle;
  let size = min(width , height)* 0.75;
  let vSphRadius = size/6;
  let vSphZ = frameRatio * (size + vSphRadius * 2) - size/2- vSphRadius;
  let count = 0;
  
  for(let z = -size/2; z < size/2; z+=size/50){
    stroke(COLS[count % COLS.length]);
    let dist = abs(vSphZ - z);
    let radius = dist > vSphRadius ? 0 : sin(acos(dist / vSphRadius)) *vSphRadius ;
    push();
    translate(0,0,z);
    if(count % 2 == 0)rotateZ(PI/2);
    if(radius > 0)bendLineTwoSide(radius,size);
    else line(-size/2, 0, 0, size/2, 0, 0);
    pop();
    count ++;
  }
}

function bendLineTwoSide(radius, length)
{
  bendedLine(radius, length);
  rotateZ(PI);
  bendedLine(radius, length);
}

function bendedLine(radius, length)
{
  const radiusStep = PI/20;
  const edgePosX = radius * 3;
  noFill();
  beginShape();
  vertex(length/2, 0, 0);
  for(let rad = -PI * 0.5; rad <= PI * 1.5; rad += radiusStep)
  {
    let x = map(rad, -PI * 0.5, PI * 1.5, edgePosX, -edgePosX);
    vertex(x, pow((sin(rad) + 1)/2, 2.5) * radius);
  }
  vertex(-length/2, 0, 0);
  endShape();
}

function createCols(_url)
{
  let slash_index = _url.lastIndexOf('/');
  let pallate_str = _url.slice(slash_index + 1);
  let arr = pallate_str.split('-');
  for (let i = 0; i < arr.length; i++) {
    arr[i] = '#' + arr[i];
  }
  return arr;
}
