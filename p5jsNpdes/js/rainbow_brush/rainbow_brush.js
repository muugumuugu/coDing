let paintbrushes = [];

function setup() {
  // createCanvas(windowWidth, windowHeight);
  createCanvas(1280, 960);
  paintbrushes[0] = new RainbowBrush(7, 90, "none");
}

function draw() {
  for (let i = 0; i < paintbrushes.length; i++) {
    paintbrushes[i].move();
    paintbrushes[i].show();
  }
}

class RainbowBrush {
  constructor(rmin, rmax, hand) {
    this.x = mouseX;
    this.y = mouseY;
    this.rmin = rmin;
    this.rmax = rmax;
    this.hand = hand;    // this will be a string for possibly attaching the brush to a PoseNet hand: "left", "right", or "none"
  }

  move() {    
    if (this.hand == "none") {
      this.x =  mouseX + random(-100, 100);                // the +random() spreads out the paint splatter
      this.y =  mouseY + random(-80, 80);                  // a rectangular spread looks more natural (vs. square), so y range is smaller
    }
    // else if (this.hand == "left") {
    //   this.x =  pose.leftWrist.x + random(-100, 100);    
    //   this.y =  pose.leftWrist.y + random(-80, 80);      
    // } else if (this.hand == "right") {
    //   this.x =  pose.rightWrist.x + random(-100, 100);
    //   this.y =  pose.rightWrist.y + random(-80, 80);
    // } 
  }

  show() {
    if (mouseIsPressed) {
      noStroke();
      
      // R will change as you move horizontally, G will change as you move vertically, and B is based on the radius
      fill(this.x/3, this.y/2, this.rmax * random(0.8, 1.4) );  // made the B value dynamic
      
      // draws one drop of paint, per frame
      ellipse(this.x, this.y, random(this.rmin, this.rmax) );    // instead of spawning 2+ objects with different (and fixed) radii,
                                                                // just randomize between a min & max.
    }
  }
  
}
