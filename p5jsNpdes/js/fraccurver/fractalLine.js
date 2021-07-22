class FractalLine {
  constructor(p1, p2, inverted, depth){
    this.p1 = new p5.Vector(...p1);
    this.p2 = new p5.Vector(...p2);
    this.inverted = inverted;
    this.depth = depth;
    
    this.subLines = [];
  }
  
  iterate(){
    if(this.depth === 0) return
    const mappedPts = pts.map(p => [p[0] - 250 / 2, p[1] - 200 / 2]).map(p => new p5.Vector(p[0], p[1]).rotate(this.p2.copy().sub(this.p1).heading() + Math.PI * this.inverted)),
          mulFactor = this.p1.dist(this.p2) / mappedPts[0].dist(mappedPts[mappedPts.length - 1]),
          centerPos = this.p1.copy().add(this.p2).div(2);
    
    for(let i = 0; i < mappedPts.length - 1; i ++){
      this.subLines.push(new FractalLine([mappedPts[i].x * mulFactor + centerPos.x, mappedPts[i].y * mulFactor + centerPos.y], [mappedPts[i + 1].x * mulFactor + centerPos.x, mappedPts[i + 1].y * mulFactor + centerPos.y], inversions[i], this.depth - 1));
    }
    for(let line of this.subLines){
      line.iterate();
    }
  }
  
  draw(){
    if(this.depth === 0) line(this.p1.x * 3 - 250, this.p1.y * 3 - 200, this.p2.x * 3 - 250, this.p2.y * 3 - 200);
    
    for(let line of this.subLines){
      line.draw();
    }
  }
}

function buildFractal(){
  lines = [];
  for(let i = 0; i < pts.length - 1; i ++){
    //line(...pts[i], ...pts[i + 1]);
    lines.push(new FractalLine(pts[i], pts[i + 1], inversions[i], level - 1));
  }

  for(let ln of lines){
    ln.iterate();
  }
}
