import processing.pdf.*;
import processing.svg.*;
void setup() {
  size(6000,6000,PDF,"fnnm.pdf");//,SVG, "filename.svg");
  //fullScreen();
// beginRecord(PDF, "collatz.pdf");

}

void draw(){
  background(0);
  strokeWeight(0.3);
  for (int i = 1; i < 6000; i++) {
    IntList sequence = new IntList();
    int n = i;
    do {
      sequence.append(n);
      n = collatz(n);
    } while (n != 1);
    sequence.append(1);
    sequence.reverse();
    float len = PI*10; // height/100.0;
    float angle = PI/15;
    resetMatrix();

    translate(width/3,7*height/8);
    rotate(-PI/3);
    for (int j = 0; j < sequence.size(); j++) {
      int value = sequence.get(j);
      if (value % 2 == 0) {
        rotate(angle);
      } else {
        rotate(-angle/1.5);
      }
      stroke(255, 2);
      line(0, 0, 0, -len);
      translate(0, -len);
    }

  }
  //endRecord();
      println("DONE");
      exit();
}
int collatz(int n) {
  // even
  if (n % 2 == 0) {
    return n / 2;
    // odd
  } else {
    return (n * 3 + 1)/2; // skip a stwp cause 3n+1 is odd anyway
  }
}
