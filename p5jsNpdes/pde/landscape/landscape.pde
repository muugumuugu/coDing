// press mouse to change the time of day

float yPos1 = 610; // left snowpile growth
float yPos2 = 580; // middle snowpile growth
float yPos3 = 610; // right snowpile growth
float yPos4 = 900; // bottom snow


Fall[] falls = new Fall[400];

void setup() {
  size(500, 500);
  rectMode(CENTER);
  noStroke ();
  for (int i = 0; i < falls.length; i ++) {
    falls[i] = new Fall ();
  }
}

void draw() {
  
    //day or night 
  if (mousePressed) {
    background(#BEE5F7); // day sky

      // snow piles
    int snowPileWidth = 600;
    fill (255);
    ellipse (0, yPos1, snowPileWidth, 200); // left snow pile
    yPos1 = yPos1 - 0.08;
    ellipse (250, yPos2, 500, 100); // middle snow pile
    yPos2 = yPos2 - 0.08;
    ellipse (500, yPos3, snowPileWidth, 200); // right snow pile
    yPos3 = yPos3 - 0.08;
    rect(250, yPos4, 500, 500); // bottom snow pile
    yPos4 = yPos4 - 0.08;
  }
  else {
    background(#001939); // night sky
  
    // moon
    fill (#DEF1FA); 
    ellipse (100, 100, 100, 100);
    fill (#C7DAE3);
    ellipse (100, 110, 10, 10);
    ellipse (110, 100, 15, 15); // moon craters
    ellipse (80, 90, 20, 20);
    ellipse (120, 80, 10, 10);
    
      // snow piles
    int snowPileWidth = 600;
    fill (255);
    ellipse (0, yPos1, snowPileWidth, 200); // left snow pile
    yPos1 = yPos1 - 0.08;
    ellipse (250, yPos2, 500, 100); // middle snow pile
    yPos2 = yPos2 - 0.08;
    ellipse (500, yPos3, snowPileWidth, 200); // right snow pile
    yPos3 = yPos3 - 0.08;
    rect(250, yPos4, 500, 500);
    yPos4 = yPos4 - 0.08;
  }

  // snowflake action
  for (int i = 0; i < falls.length; i ++) {
    falls[i].flakes(); // call snowflakes
    falls[i].snowing (); //call snowflakes
    
  }
  
  if (mousePressed) { // new mouse pressed so the translate doesn't interfere with the
                      // snowflakes falling
    fill(#F7F5DC);
    translate (100, 100);
    ellipse(0, 0, 100, 100); // sun
  }
}
