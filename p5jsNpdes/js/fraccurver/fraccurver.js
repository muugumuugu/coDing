let pts = [[-100 + 250 / 2, 200 / 2]],
    inversions = [0],
    ended = false,
    lines = [],
    
    dragging = false,
    
    cam = new p5.Vector(0, 0, 1),
    
    level = 3;

function setup() {
  createCanvas(windowWidth, windowHeight);
  
  textSize(20);
  textStyle(BOLD);
  textAlign(CENTER, TOP);
}

function draw() {
  background(20);
  push();
  translate(width/2 - 250 / 2 + cam.x, height/2 - 200 / 2 + cam.y);
  scale(1 / cam.z);
  
  stroke(255);
  for(let ln of lines){
    ln.draw();
  }
  pop();
  
  noFill();
  stroke(255);
  rect(1, 0, 250, 200);
    
  for(let i = 0; i < pts.length - 1; i ++){
    line(...pts[i], ...pts[i+1]);
    push();
    translate((pts[i][0] + pts[i+1][0]) / 2, (pts[i][1] + pts[i+1][1]) / 2);
    rotate(new p5.Vector(pts[i][0] - pts[i+1][0], pts[i][1] - pts[i+1][1]).heading() + HALF_PI - PI * inversions[i]);
    stroke(0, 0, 255, 200);
    line(0, 0, 10, 0);
    pop();
  }
  
  noStroke();
  fill(255);
  text("Click to add points\nSPACE to toggle normals\nR to reset", 130, 220);
  
  text("Fractal level: " + level + "\n+/- to change\n\nWARNING: Do not\nmake this too high!", width - 130, 20);
  
  for(let pt of pts){
    const col = pts.indexOf(pt) === 0 || (ended && pts.indexOf(pt) === pts.length - 1) ? [0, 0, 255] : [255, 0, 0];
    fill(...col, 100);
    ellipse(...pt, 25, 25);
    fill(...col, 200);
    ellipse(...pt, 7, 7);
  }
  
  if(!ended){
    fill(0, 0, 255, 100);
    ellipse(100 + 250 / 2, 200 / 2, 25, 25);
    fill(0, 0, 255, 200);
    ellipse(100 + 250 / 2, 200 / 2, 7, 7);
  }
  
  if(dragging) {
    pts[dragging] = [constrain(mouseX, 0, 250), constrain(mouseY, 0, 200)];
    buildFractal();
  }
}

function mouseMoved(){
  for(let i = 0; i < pts.length; i ++){
    if(dist(...pts[i], mouseX, mouseY) < 25 / 2){
      cursor(i === 0 || i === pts.length - 1 * ended ? ARROW : 'move');
      return
    }
  }
  
  if(mouseX > 250 || mouseY > 200) cursor('grab');
  else cursor(ARROW);
}

function mouseDragged(){
  if(dragging) return
  for(let i = 1; i < pts.length - 1 * ended; i ++){
    if(dist(...pts[i], mouseX, mouseY) < 25 / 2){
      dragging = i;
      return
    }
  }
  
  if(mouseX > 250 || mouseY > 200) {
    cam.add(mouseX - pmouseX, mouseY - pmouseY);
    cursor('grabbing');
  }
}

function mouseReleased(){
  dragging = false;
  cursor(mouseX < 250 && mouseY < 250 ? ARROW : 'grab');
}

function mousePressed() {
  if(ended || pts.find(p => dist(...p, mouseX, mouseY) < 25 / 2)) return
  if(mouseX < 250 && mouseY < 200) {
    if(new p5.Vector(100 + 250 / 2, 200 / 2).dist(new p5.Vector(mouseX, mouseY)) < 25){
       ended = true;
      pts.push([100 + 250 / 2, 200 / 2]);
    } else {
      inversions.push(0);
      pts.push([mouseX, mouseY]);
    }
    
    buildFractal();
  } else cursor('grabbing');
}

function keyPressed(){
  if(key === ' '){
    for(let i = 0; i < pts.length - 1; i ++){
      if(new p5.Vector((pts[i][0] + pts[i + 1][0]) / 2, (pts[i][1] + pts[i + 1][1]) / 2).dist(new p5.Vector(mouseX, mouseY)) < new p5.Vector(...pts[i]).dist(new p5.Vector(...pts[i + 1])) / 3){
        inversions[i] = inversions[i] ? 0 : 1;
        buildFractal();
        break;
      }
    }
  }
  
  else if(key === 'r'){
    pts = [[-100 + 250 / 2, 200 / 2]];
    inversions = [0];
    lines = [];
    level = 3;
    
    cam.set(0, 0, 1);
    
    ended = false;
    dragging = false;
  }
  
  else if(key === '='){ // +
    level ++;
    buildFractal();
  } else if(key === '-' && level > 1) {
    level --;
    buildFractal();
  }
}

function mouseWheel(event){
  cam.z += event.delta / 200;
  cam.z = constrain(cam.z, 0.3, 5);
}
