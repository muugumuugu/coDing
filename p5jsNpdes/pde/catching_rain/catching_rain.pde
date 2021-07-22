

//===================================================================
// The live video camera Capture object:
import processing.video.*;
Capture video;

float letterGravity = 1.0;
int brightnessThreshold = 100;
float initialLetterYPosition = 10;
TextRainLetter poemLetters[];
int nLetters;

//-----------------------------------
void setup() {
  size (320,240); 
  
  // 640x480 is also a good option, but 320x240 is faster.
  video = new Capture (this, width,height);
  video.start();  

  String poemString = "mogi mogi mooooogi o o o"; 
  
  nLetters = poemString.length();
  poemLetters = new TextRainLetter[nLetters];
  for (int i=0; i<nLetters; i++) {
    char c = poemString.charAt(i);
    float x = width * ((float)(i+1)/(nLetters+1));
    float y = initialLetterYPosition;
    poemLetters[i] = new TextRainLetter(c,x,y);
  }
}

//-----------------------------------
void draw() {
  if (video.available()) {
    video.read();
    video.loadPixels();
    
    // this translate & scale flips the video left/right. 
    pushMatrix();
    translate (width,0); 
    scale (-1,1);
    image (video, 0, 0, width, height);
    popMatrix();
    
    for (int i=0; i<nLetters; i++) {
      poemLetters[i].update();
      poemLetters[i].draw();
    }
  }
}

//-----------------------------------
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      brightnessThreshold = min(255, brightnessThreshold+1);
      println("brightnessThreshold = " + brightnessThreshold); 
    } else if (keyCode == DOWN) {
      brightnessThreshold = max(0, brightnessThreshold-1);
      println("brightnessThreshold = " + brightnessThreshold);
    } 
  } else if (key == ' '){
    // pressing the spacebar reset the letters to the top of the canvas.
    for (int i=0; i<nLetters; i++) {
      poemLetters[i].reset();
    }
  }
}


//===================================================================
class TextRainLetter {
  // A class to contain a single letter in the TextRain poem. 
  // Basically, a particle that associates a position and a char.
  
  char  c;
  float x; 
  float y;
  
  TextRainLetter (char cc, float xx, float yy) {
    c = cc;
    x = xx;
    y = yy;
  }

  //-----------------------------------
  void update() {
    // Update the position of a TextRainLetter. 
    
    // 1. Compute the pixel index corresponding to the (x,y) location of the TextRainLetter.
    int flippedX = (int)(width-1-x); // because we have flipped the video left/right.
    int index = width*(int)y + flippedX;
    index = constrain (index, 0, width*height-1);
    
    // Establish a grayscale range around the threshold, 
    // within which motion is not required.
    int thresholdTolerance = 5;
    int thresholdLo = brightnessThreshold - thresholdTolerance;
    int thresholdHi = brightnessThreshold + thresholdTolerance;

    // 2. Fetch the color of the pixel there, and compute its brightness.
    float pixelBrightness = brightness(video.pixels[index]);
    
    // 3. If the TextRainLetter is in a bright area, move downwards.
    //    If it's in a dark area, move up until we're in a light area.
    if (pixelBrightness > thresholdHi) {
      y += letterGravity; //move downward
      
    } else {
      while ((y > initialLetterYPosition) && (pixelBrightness < thresholdLo)){
        y -= letterGravity; // travel upwards intil it's bright again
        index = width*(int)y + flippedX;
        index = constrain (index, 0, width*height-1);
        pixelBrightness = brightness(video.pixels[index]);
      }
    }
    
    if ((y >= height-1) || (y < initialLetterYPosition)){
      y = initialLetterYPosition;
    }
  }
  
  //-----------------------------------
  void reset(){
    y = initialLetterYPosition;
  }

  //-----------------------------------
  void draw() {
    // Draw the letter. Use a simple black "drop shadow"
    // to achieve improved contrast for the typography. 
    fill(0,0,0);
    text (""+c, x+1,y+1); 
    text (""+c, x-1,y+1); 
    text (""+c, x+1,y-1); 
    text (""+c, x-1,y-1); 
    fill(255,255,255);
    text (""+c, x,y);
  }
}
