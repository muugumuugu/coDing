// work: Strange Machines [interactive]
// author: k0ch
// date: 2019-09-11

// Math usage:
// - Delaunay triangulation
// - Linear interpolation

class StrangeMachine
{
  constructor()
  {
    this.map = []
    this.randMap = []
    this.data = []
  }
  
  init(center_x, center_y)
  {
    for(var i=0; i<50; i+=2) 
    {
      var x = random(100);
      var y = random(-100,100);
      this.map[i] = [center_x+x, center_y+y];
      this.map[i+1] = [center_x-x, center_y+y];
      var size = random(-200,200);
      var coef = random(0.0001, 0.005);
      this.randMap[i] = [size, coef];
      this.randMap[i+1] = [size, coef];
    }

    this.data = Delaunay.triangulate(this.map);
  }
  
  draw(t)
  {
    for(var i=0; i<50; i++)
    {
      this.map[i][1] = lerp(
        this.map[i][1],
        this.map[i][1]+this.randMap[i][0]*sin(t*this.randMap[i][1]),
        0.005
      );
    }

    for (var f=0; f<this.data.length; f+=3)
    {
      triangle(this.map[this.data[f]][0], this.map[this.data[f]][1],
               this.map[this.data[f+1]][0], this.map[this.data[f+1]][1],
               this.map[this.data[f+2]][0], this.map[this.data[f+2]][1]);
    }
  };
}

let sm1;

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(0);
  sm1 = new StrangeMachine();
  sm1.init(windowWidth/2, windowHeight/2);
  sm2 = new StrangeMachine();
  sm2.init(windowWidth/2-300, windowHeight/2);
  sm3 = new StrangeMachine();
  sm3.init(windowWidth/2+300, windowHeight/2);
}

function draw() {
  t = millis();
  background(0);
  
  fill(60,70,140,100);
  stroke(255);
  strokeWeight(1);
  sm1.draw(t);
  sm2.draw(t);
  sm3.draw(t);
}

function mousePressed() {
  sm1.init(windowWidth/2, windowHeight/2);
  sm2.init(windowWidth/2-300, windowHeight/2);
  sm3.init(windowWidth/2+300, windowHeight/2);
}
