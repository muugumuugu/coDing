let wall;
let eyeZ;
let sh;
let t;
let es = [];
const CYCLE = 100;


function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  let dep = max(width,height);
  ortho(-width / 2, width / 2, height / 2, -height / 2,-dep*2 , dep*2);
  eyeZ = height / 2 / tan((30 * PI) / 180); // The default distance the camera is away from the origin.
  wall = new IntersectPlane(0, 0, 1, 0, 0, 300);
  noStroke();
  init();
  
  //shader
  sh = createShader(vert,frag);
  this.shader(sh);
  sh.setUniform("u_resolution", [width,height]);
  sh.setUniform("u_lightDir", [1,-1,-1]);
}

function draw() {
  background('#002D52');
  
  //culclate mousePos
  let x = mouseX - width / 2;
  let y = (mouseY - height / 2)*-1;
  /*
  let radius = 200;
  x = cos(frameCount/CYCLE*TWO_PI)*radius;
  y = sin(frameCount/CYCLE*TWO_PI)*radius;
  */
  const Q = createVector(0, 0, eyeZ); // A point on the ray and the default position of the camera.
  const v = createVector(x, y, -eyeZ); // The direction vector of the ray.
  let intersect; // The point of intersection between the ray and a plane.
  let closestLambda = eyeZ * 10; // The draw distance.
  let lambda = wall.getLambda(Q, v); // The value of lambda where the ray intersects the object
  if (lambda < closestLambda && lambda > 0)
  {
    // Find the position of the intersection of the ray and the object.
    intersect = p5.Vector.add(Q, p5.Vector.mult(v, lambda));
    closestLambda = lambda;
  }
  const mousePos = createVector(intersect.x,intersect.y,intersect.z);
  
  for(let item of es)
  {
    item.setTarget(mousePos);
    item.update();
    item.display();
  }
}


function init()
{
  let size = min(width,height)*0.7;
  let span = size/3;
  for(let y = -size/2; y <= size/2; y+=span)
  {
    for(let x = -size/2; x <= size/2; x+=span)
    {
      es.push(new Eye(createVector(x,y,0),span*0.4));
    }
  }
}



class Eye
{
  constructor(_pos,_radius)
  {
    this.pos = _pos;
    this.radius = _radius;
    this.dMult = random(0.05,0.1);
    this.currentTarget = createVector(0,0,1);
    this.target = createVector(0,0,1);
    this.tex = createGraphics(this.radius*4,this.radius*2);
  }
  
  setTarget(_targetPos)
  {
    this.target = _targetPos;
  }

  update()
  {
    this.currentTarget.add(p5.Vector.sub(this.target,this.currentTarget).mult(this.dMult));
  }
  
  drawTex()
  {
    this.tex.ellipseMode(CENTER);
    this.tex.noStroke();
    this.tex.background("#F4F8FB");    
    let diameter = this.tex.width*0.2;
    let noiseMult = noise(this.pos.x + sin((frameCount/CYCLE)*TWO_PI));
    diameter += (noiseMult-0.5)/5 * diameter;
    this.tex.fill(100);
    this.tex.ellipse(this.tex.width/2,this.tex.height/2,diameter,diameter);
    
    this.tex.push();
    this.tex.translate(this.tex.width/2,this.tex.height/2);
    for(let r = 0 ; r <TWO_PI; r+=PI/30)
    {
      this.tex.stroke("#002D52AA");
      this.tex.push();
      this.tex.rotate(r);
      this.tex.line(0,0,diameter/2,0);
      this.tex.pop();
    }
    this.tex.pop();
    this.tex.noStroke();
    
    diameter *= 0.5;
    this.tex.fill("#001223");
    this.tex.ellipse(this.tex.width/2,this.tex.height/2,diameter,diameter);
    diameter *= 0.5;
    this.tex.fill(255,100);
    this.tex.ellipse(this.tex.width*0.55,this.tex.height*0.4,diameter,diameter);
  }

  
  display()
  {
    let angleY = atan2(this.currentTarget.x - this.pos.x, this.currentTarget.z - this.pos.z);
    let angleX = atan2(this.currentTarget.z - this.pos.z, this.currentTarget.y - this.pos.y);
    push();
    translate(this.pos);
    rotateY(-angleY);
    rotateX(angleX + PI/2);
    
    this.drawTex();
    sh.setUniform("u_tex",this.tex);
    sphere(this.radius);
    pop();
  }
}



// Class for a plane that extends to infinity.
class IntersectPlane
{
  constructor(n1, n2, n3, p1, p2, p3) {
    this.normal = createVector(n1, n2, n3); // The normal vector of the plane
    this.point = createVector(p1, p2, p3); // A point on the plane
    this.d = this.point.dot(this.normal);
  }

  getLambda(Q, v) {
    return (-this.d - this.normal.dot(Q)) / this.normal.dot(v);
  }
}
function setup() {

}


function draw() {

}
