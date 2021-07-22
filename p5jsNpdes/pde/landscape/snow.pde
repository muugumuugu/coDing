class Fall {
  float x =  random (width); //scatters the snowflakes around
  float y = random (-500, -100); //"  "
  float yspeed = random (1, 4); // makes them diff speeds
  float snowThickness = random(2, 5); //random thicknesses
  float snowHeight = random(2, 5); // "  "
  
  void snowing () {
    y = y + yspeed;
    
    if (y > height) {
      y = random (-500, -100); //keeps them continuously falling from diff heights
    }
  }
  
  void flakes () {
    fill (255);
    rect (x, y + 10, snowThickness, snowThickness); //snowflakes
  }
}
