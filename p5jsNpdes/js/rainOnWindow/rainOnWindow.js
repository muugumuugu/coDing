var particles = [], t = 0;

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(255);
  fill(255, 20);
}

function draw() {
  t++;
  if(t % 30 == 0){
    noStroke();
    rect(0, 0, width, height);
  }
  particles.push({x:random(width), y:0, r:noise(t / 1000) * 255, g:noise(t / 1000, 200) * 255, b:noise(t / 1000, 400) * 255});
  for(var i in particles){
    const p = particles[i];
    stroke(p.r, p.g, p.b);
    point(p.x, p.y);
    p.y += 0.5;
    p.x += noise(p.x / 50, p.y / 50, t / 2000) - 0.5;
    if(p.y > height){
      particles.splice(i, 1);
    }
  }
}
