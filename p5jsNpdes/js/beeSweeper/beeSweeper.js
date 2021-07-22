var hex_size = 20;
var map_radius = 8; // FIXME: This should be called map size, but I started with hexagons, and refactoring would be too hard
var origin;
var padding = 3;
var totalBees = 60;
var grid_type = "HEXAGON" // Change this value for different grid types (HEXAGON, TRIANGLE, PARRALELOGRAM, RECTANGLE)

var cellMap = {}
var gameOver = true;

function setup() { 
  createCanvas(600, 600);
  angleMode(RADIANS);
  origin = createVector(width/2, height/2);
  gameOver = false;
  cellMap = {};
  background(32);
  stroke(255);
  strokeWeight(1);
  if(grid_type == "HEXAGON"){
    cellMap = {};
    for (var q = -map_radius; q <= map_radius; q++) {
        var r1 = max(-map_radius, -q - map_radius);
        var r2 = min(map_radius, -q + map_radius);
        for (var r = r1; r <= r2; r++) {
          //draw_hexagon(hex_to_pixel(q, r), hex_size, q, r);
          var cell = new Cell(q,r);
          cellMap[q + " " + r + " " + (-q-r)] = cell;
        }
    }
  }
  
  
  for(var i = 0; i < totalBees; i++){
    s = map_radius+1;
    while(abs(s) > map_radius){
      q = floor(random(-map_radius, map_radius));
      r = floor(random(-map_radius, map_radius));
      s = -q-r;
    }
    try
    {
    cellMap[q + " " + r + " " + s].bee = true;
    }
    catch(err){
      console.log(q + " " + r + " " + s);
    }
  }
  
  
  for(var key in cellMap){
    var value = cellMap[key];
    value.countNeighbors();
  }

} 

function draw() { 
  for(var key in cellMap){
    var value = cellMap[key];
    value.show(hex_to_pixel(value.q, value.r), hex_size);
  }
  if(gameOver){
   fill(255);
    textAlign(CENTER);
    textSize(100);
    text("GAME OVER", width/2, height/2);
    textSize(30);
    text("Press SPACE to RESTART", width/2, height/2 + 80);
    if(keyIsDown(32)){
      setup();
      console.log("RESTART");
    }
  }

}

function pixel_to_hex(x, y){
  var q = (x * sqrt(3)/3 - y / 3) / hex_size
  var r = y * 2/3 / hex_size
  var sr = round(-q-r);
  var qr = round(q);
  var rr = round(r);
  var q_diff = abs(qr - q);
  var r_diff = abs(rr - r);
  var s_diff = abs(sr - (-q-r));
  if(q_diff > r_diff && q_diff > s_diff){
    qr = -rr - sr;
  }else if(r_diff > s_diff){
    rr = -qr - sr;
  }else {
    sr = -qr-rr;
  }
  return qr + " " + rr + " " + sr; 
}

function hex_to_pixel(q, r) {
  // This is basically a matrix multiplication between a hexagon orientation matrix 
  // and the vector {q; r}
    var x = (sqrt(3) * q + sqrt(3)/2 * r) * (hex_size ) ;
    var y = (0 * q + 3/2 * r) * hex_size;
    return createVector(x + origin.x, y + origin.y);
}

function mouseClicked(){
  var s = pixel_to_hex(mouseX - origin.x, mouseY - origin.y);
  //console.log(s);
  if(!cellMap[s])
    return;
  cellMap[s].reveal();
  if(cellMap[s].bee){
    gameOver = true;
    for(var key in cellMap){
      var value = cellMap[key];
      value.revealed = true;
    }
  }
  //console.log(cellMap[s].neighborCount);
}
