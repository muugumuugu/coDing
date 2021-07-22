var constellation = [];
var n;
var d;
var a;
var click;

function setup() {
  createCanvas(windowWidth, screen.availHeight);

  pixelDensity(2); // Set 1 because it's too slow on firefox
  pixelDensity(displayDensity());
  n = 15;

  for (var i = 0; i <= n; i++) {
    constellation.push(new star());
  }
  strokeWeight(.5);
  mouseX = width / 2;
  mouseY = height / 2;
  mousePressed();
}

function mousePressed(){
  if (mouseX < width * .9){
  a = random(230, 255)
  stroke(random(50, 110), random(60, 117), random(240, 250));
  for (var i = 0; i <= n; i++) {
    constellation.push(new star());
  }  
  click+=1;
  }else{
    save('pix.jpg');
  }
}


function draw() {

  background('#000000');

  for (var i = 0; i < constellation.length; i++) {
    constellation[i].update();
    for (var j = 0; j < constellation.length; j++) {
      if (i > j) { // "if (i > j)" => to check one time distance between two stars
        d = constellation[i].loc.dist(constellation[j].loc); // Distance between two stars
        if (d <= width / 10) { // if d is less than width/10 px, we draw a line between the two stars
          line(constellation[i].loc.x, constellation[i].loc.y, constellation[j].loc.x, constellation[j].loc.y)
        }
      }
    }
  }

}

function star() {

  this.a = random(3 * TAU); // "5*TAU" => render will be more homogeneous
  this.r = random(width * .2, width * .25); // first position will look like a donut
  this.loc = createVector(mouseX,mouseY);
  this.speed = createVector();
  this.speed = p5.Vector.random2D();
  this.bam = createVector();
  this.m;


  this.update = function() {
    this.bam = p5.Vector.random2D(); // movement of star will be a bit erratic
      this.bam.mult(0.1);
      this.speed.add(this.bam);
      // speed is done according distance between loc and the mouse :
      this.m = constrain(map(dist(this.loc.x, this.loc.y, mouseX, mouseY), 0, width, 1, .05), .05, 1); // constrain => avoid returning "not a number"
      this.speed.normalize().mult(this.m);

      // No collision detection, instead loc is out of bounds
      // it reappears on the opposite side 
      if (dist(this.loc.x, this.loc.y, width/2 , height/2) > (width/2) * 0.8) {
        if (this.loc.x < width/2 ) {
          this.loc.x = width - this.loc.x - 4; // "-4" => avoid blinking stuff
        } else if (this.loc.x > width/2 ) {
          this.loc.x = width - this.loc.x + 4; // "+4"  => avoid blinking stuff
        }
        if (this.loc.y < height / 2) {
          this.loc.y = width - this.loc.y - 4;
        } else if (this.loc.x > height / 2) {
          this.loc.y = width - this.loc.y + 4;
        }
      }
      this.loc = this.loc.add(this.speed);
      
    } // End of update()
} // End of class
