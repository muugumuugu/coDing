var p;
var c;

function setup() {
    createCanvas(windowWidth, windowHeight);
    p=new Particle();
    c=new Confetti();

    console.log(p);
    console.log(c);

  }

  function draw() {
    background(0);
    p.update();
    p.show();
    c.update();
    c.show();
  }
    