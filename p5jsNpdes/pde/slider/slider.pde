
boolean MP; 
SliderClass slider;  
void setup() {
  size(600, 400);
  smooth();
  // x, y, length of slider, start value, end value, step value, int or float, sticky 
  slider = new SliderClass(20, 40, 300, 0, 200, 20, false, true); 
  rectMode(CENTER); 
  textAlign(CENTER);
}
void draw() {
  background(255);
  slider.move();
  slider.display(); 
}
void mousePressed() {
  MP = true;
}
void mouseReleased() {
  MP = false;
}

/* 
 Needs a global  boolean called MP and two scripts to catch the mousepress and release.
 void mousePressed() {
 MP = true;
 }
 void mouseReleased() {
 MP = false;
 }
 */

class SliderClass {
  float x, y, xEnd, xStart, xDif;
  float sliderValue, startValue, endValue, interval, totalLength, screenInterval; 
  color sliderColor = color(100, 120, 160, 255); 
  int knobWidth = 12; 
  int knobHeight = 20;
  float fade = 255; // for knob color
  boolean clicked, floats, sticky;
  int sliderValueInt; 
  // x, y, length of slider, start value, end value, step value, int or float, sticky 
  SliderClass(float _x, float _y, int _length, int _startValue, int _endValue, int _interval, boolean _floats, boolean _sticky) { 
    x = _x; 
    y = _y;
    xEnd = x + _length; 
    xStart = x; 
    startValue = _startValue; 
    endValue = _endValue; 
    floats = _floats; 
    interval = _interval; 
    totalLength = _length; 
    sticky = _sticky;
  }

  void move() {
    // check to see if it's clicked 
    if (dist(mouseX, mouseY, x, y) < knobWidth) {  // use this if you want a round knob on the slider 
      //if (mouseX > x - (knobWidth/2) && mouseX < x + knobWidth/2
      //  && mouseY > y - (knobHeight/2) && mouseY < y + knobHeight /2) { 
      if (MP && clicked == false) { // if mouse was pressed
        xDif = mouseX - x; 
        clicked = true;
      }
      fade = 100; // mouseOver but not clicked
    } else {
      fade = 0;
    }
    if (clicked == true) {
      fade = 255;
    }
    if (MP == false && clicked == true) { // if the mouse was just released
      clicked = false; 
      if (sticky) { // if you set it to jump to the closest line 
        float modDif = sliderValue % interval; // value to show how close it is to last line 
        int div = int(sliderValue/interval); // vlaue to show how MANY intervals it's passed 
        if (modDif < interval/2) { // so it goes to closest line not just lower 
          x = xStart + (div * screenInterval);
        } else {
          x = xStart + ((div + 1) * screenInterval);
        }
      }
    }
    if (clicked) {
      x = mouseX - xDif; // so the slider doens't "jump" to the mouse x. 
      x = constrain(x, xStart, xEnd); // keep the knob on the slider
    }
    sliderValue  = map(x, xStart, xEnd, startValue, endValue); // get the slider position relative to the values
    sliderValueInt = int(sliderValue); // make that number an int
  }

  void display() {
    stroke(1); 
    screenInterval = map(interval, 0, endValue - startValue, 0, totalLength); // get the size of the gaps for the screen relative to the intervals 
    for (int i = int(screenInterval); i < totalLength; i += screenInterval) { // go from the first gap to the end of slider by the screenInterval
      line(i + xStart, y+12, i + xStart, y-12); // draw lines
    }
    line(xStart, y+12, xStart, y-12); // draw first line (optional) 
    line(xEnd, y+12, xEnd, y-12); // draw last line (optional) 
    line(xStart, y, xEnd, y); // draw center line 
    sliderColor = color(red(sliderColor), green(sliderColor), blue(sliderColor), fade); 
    fill(255); 
    //ellipse (x, y, knobWidth, knobWidth); 
    rect(x, y, knobWidth, knobHeight); // so it's opaque
    fill(sliderColor); 
    //ellipse (x, y, knobWidth, knobWidth); 
    rect(x, y, knobWidth, knobHeight); // add color 
    fill(1); 
    if (floats) {
      text(sliderValue, x, y+30);
    } else {
      text(sliderValueInt, x, y+30);
    }
    text(int(startValue), xStart, y+30); 
    text(int(endValue), xEnd, y+30);
  }
}
