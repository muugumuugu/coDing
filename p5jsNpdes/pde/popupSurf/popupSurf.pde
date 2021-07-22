void setup() {  //setup function called initially, only once
  size(500, 500, P3D);
  
  smooth();
  sphereDetail(10);
}

void draw(){
background(0);  //set background black
fill(255);
noStroke();
lights();
for (int x = -100; x < width + 100; x += 20){
    for (int y = -100; y < height + 100; y += 20){
        pushMatrix();
        float d = sqrt(sq(x - mouseX) + sq(y - mouseY)); //distance to cursor
        float z = -100; // default z -location
        if (d < 200){
            z += 0.5 * sqrt(sq(200) - sq(d));
        }
        translate(x,y,z);
        sphere(5);
        popMatrix();
        }
        }
}
