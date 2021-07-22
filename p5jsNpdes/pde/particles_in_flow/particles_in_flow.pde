boolean debug = false;
float zoff=0;
int resolution=16;
// Flowfield object
FlowField flowfield;
// An ArrayList of vehicles
ArrayList<Vehicle> vehicles;

void setup() {
  size(1024, 1024);
  background(255);
  // Make a new flow field with "resolution" of 16
  flowfield = new FlowField(resolution);
  vehicles = new ArrayList<Vehicle>();
  // Make a whole bunch of vehicles with random maxspeed and maxforce values
  for (int i = 0; i < 200; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(2, 5), random(0.1, 0.5)));
  }
}

void draw() {

  // Display the flowfield in "debug" mode
  if (debug){
    background(255);
    flowfield.display();
  }
  // Tell all the vehicles to follow the flow field
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }

  // Instructions
  fill(0);

  flowfield.init();
 // text("Hit space bar to toggle debugging lines.\nClick the mouse to generate a new flow field.",10,height-20);
}


void keyPressed() {
  if (key == ' ') {
    background(255);
    debug = !debug;
  }
}

// Make a new flowfield
void mousePressed() {
  flowfield.init();
}
