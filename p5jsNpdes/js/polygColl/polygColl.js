var polygon = [ [0.5, 0.2], [0.4, 0.6], [0.4, 0.8], [0.5, 0.6], [0.6, 0.7], [0.4, 0.3] ];
var polygonHole = [ [0.44, 0.5],[0.44, 0.6],[0.49, 0.5] ];

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(100);
  
  polygon = convertPolygon(polygon);
  polygonHole = convertPolygon(polygonHole);
}

function draw() {
  background(255);
  
  // ray casting
  for( var i=0, j=polygon.length-1, old=false; i < polygon.length; j = i++ ){
    if( ((polygon[i][1]>mouseY)!=(polygon[j][1]>mouseY)) && 
        (mouseX < (polygon[j][0]-polygon[i][0]) * (mouseY-polygon[i][1]) / (polygon[j][1]-polygon[i][1]) + polygon[i][0]) ){
      old = !old;
    }
  }
  
  // if the ray hit an odd number of sides, it's colliding (returns if odd)
  var collision1 = raycast(polygon, mouseX, mouseY);
  var collision2 = raycast(polygonHole, mouseX, mouseY);
  
  fill(0);
  if(collision1 && !collision2){fill(255);}
  renderPolygon(polygon);
  fill(255);
  renderPolygon(polygonHole);

}

function convertPolygon(polygon){
  // Convert polygon from percentages to pixels
  var converted = [];
  for( var point of polygon ){
    converted.push( [point[0]*width, point[1]*height] );
  }
  return converted;
}

function renderPolygon(polygon){
  beginShape();
  for( var point of polygon ){
    vertex(point[0], point[1]);
  }
  endShape(CLOSE);
}

function raycast(polygon, x, y){ // x&y are test point
  var i, j, odd;
  for( i=0, j=polygon.length-1, odd=false; i < polygon.length; j = i++ ){
    if( ((polygon[i][1]>y)!=(polygon[j][1]>y)) && 
        (x < (polygon[j][0]-polygon[i][0]) * (y-polygon[i][1]) / (polygon[j][1]-polygon[i][1]) + polygon[i][0]) ){
      odd = !odd;
    }
  }
  return odd;
}
