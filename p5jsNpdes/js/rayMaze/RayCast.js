class Ray {
  constructor(pos, angle) {
    this.pos = pos;
    this.dir = p5.Vector.fromAngle(angle);

  }

  lookAt(x, y) {
    this.dir.x = x - this.pos.x;
    this.dir.y = y - this.pos.y;
    this.dir.normalize();
  }

  show() {
    stroke(255);
    push();
    translate(this.pos.x, this.pos.y);
    line(0, 0, this.dir.x * 10, this.dir.y * 10);
    pop();
  }
  cast(wall) {
    var x1 = wall.a.x;
    var y1 = wall.a.y;

    var x2 = wall.b.x;
    var y2 = wall.b.y;

    var x3 = this.pos.x;
    var y3 = this.pos.y;
    var x4 = this.pos.x + this.dir.x;
    var y4 = this.pos.y + this.dir.y;

    var den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
    if (den == 0) {
      return
    }

      const t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
      var u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
    
    if (t > 0 && t < 1 && u > 0) {
      const pt = createVector();
      
      pt.x = x1 + t * (x2 - x1);
      pt.y = y1 + t * (y2 - y1);
      return pt;
    } else {
      return;
    }
  }


}
//===================================================================================
class Boundary {
  constructor(x1, y1, x2, y2) {
    this.a = createVector(x1, y1);
    this.b = createVector(x2, y2);
  }

  show() {
    stroke(255);
    strokeWeight(1);
    line(this.a.x, this.a.y, this.b.x, this.b.y);
  }
}
//=============================================================================
class Particle {
  constructor() {
    this.pos = createVector(width / 2, height / 2);
    this.rays = [];
    for (let a = 0; a < 360; a += 1) {
      this.rays.push(new Ray(this.pos, radians(a)));
    }
  }
  update(x, y) {
    this.pos.set(x, y);
  }

  look(walls) {

    for (var i = 0; i < this.rays.length; i++) {
      var ray = this.rays[i];
      let closest = null;
        let record = Infinity;
      for (let wall of walls) {
      var pt = ray.cast(wall);
        if (pt) {
          var d = p5.Vector.dist(this.pos, pt)
          if (d < record) {
            record = d;
            closest = pt;
          }
        }
      }
          if (closest) {
            stroke(255,100);
            line(this.pos.x, this.pos.y, closest.x, closest.y);
          }
        


      }

    }

    show() {
      fill(255);
      ellipse(this.pos.x, this.pos.y, 4);
      for (let ray of this.rays) {
        ray.show();
      }
    }

    }
    
//==================================================================================
