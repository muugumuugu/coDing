function Cell(q, r){
  this.bee = false;
  this.revealed = false;
  this.q = q;
  this.r = r;
  this.s = -q-r;
  this.neighborCount = 0;
}
  
Cell.prototype.toString = function(){
  return this.q + " " + this.r + " " + this.s; 
}

function hex_corner(center, size, i){
    var angle_deg = 60 * i   + 30
    var angle_rad = PI/180 * angle_deg;
    return createVector(center.x + size * cos(angle_rad),
                 center.y + size * sin(angle_rad));
}

Cell.prototype.reveal = function(){
  this.revealed = true;
  if(this.neighborCount <= 0)
    this.floodFill();
}



Cell.prototype.countNeighbors = function(){
  if(this.bee)
    return -1;
  //console.log("countNeighbors");
  /*Hex(1, 0, -1), Hex(1, -1, 0), Hex(0, -1, 1),
    Hex(-1, 0, 1), Hex(-1, 1, 0), Hex(0, 1, -1)*/
  var neighbors = this.getNeighbors();
  var count = 0;
  for(var i = 0; i < neighbors.length; i++){
    if(!neighbors[i])
      continue;
    if(neighbors[i].bee)
      count++;
  }
  this.neighborCount = count;
  return count;
}

Cell.prototype.getNeighbors = function(){
  var neighbors = [];
  neighbors.push(cellMap[(this.q + 1) + " " + (this.r + 0) + " " + (this.s - 1)]);
  neighbors.push(cellMap[(this.q + 1) + " " + (this.r - 1) + " " + (this.s - 0)]);
  neighbors.push(cellMap[(this.q + 0) + " " + (this.r - 1) + " " + (this.s + 1)]);
  neighbors.push(cellMap[(this.q - 1) + " " + (this.r + 0) + " " + (this.s + 1)]);
  neighbors.push(cellMap[(this.q - 1) + " " + (this.r + 1) + " " + (this.s - 0)]);
  neighbors.push(cellMap[(this.q + 0) + " " + (this.r + 1) + " " + (this.s - 1)]);
  return neighbors;
}

Cell.prototype.floodFill = function(){
  var neighbors = this.getNeighbors();
  for(var i = 0; i < neighbors.length; i++){
    if(!neighbors[i])
      continue;
    if(neighbors[i].revealed)
      continue;
    neighbors[i].reveal(); 
  }
}

Cell.prototype.show = function(center, size){
  var q = this.q;
  var r = this.r;
  points = [];
  for(var i = 0; i < 6; i++){
    points.push(hex_corner(center, size - padding, i));
    var c = hex_corner(center, size, i);
  }
  noStroke();
  beginShape();
  for(i = 1; i <= 6; i++){
    if(this.revealed == false || this.bee == true){
    fill(map(-q-r, -map_radius, map_radius, 0, 255),
      map(r, -map_radius, map_radius, 0, 255), 
        map(q, -map_radius, map_radius, 0, 255));}
    else if(this.bee == false){fill(200);}
    point(points[i % 6].x, points[i % 6].y);
    vertex(points[i % 6].x, points[i % 6].y);
    line(points[i-1].x, points[i-1].y, points[i % 6].x, points[i % 6].y);
  }
  endShape();
  fill(200);
  //noFill();
  stroke(0);
  if(this.revealed){
    if(this.bee){
      ellipse(center.x, center.y, size - 4, size - 4); 
    }else if(this.neighborCount != 0){
        textAlign(CENTER, CENTER);
        textFont("Helvetica");
        fill(0);
        textSize(12);
        //noStroke();
        text(this.neighborCount, center.x, center.y);
    }
  }
  
  //textSize(6);
  //text(q + " " + r + " \n" + (-q-r), center.x + 1, center.y + 2)
}
