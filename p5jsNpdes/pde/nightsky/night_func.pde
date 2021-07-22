void initMoon(){
  rotationIncrement = lerp(0, TWO_PI, 0.0005); //for the web
//  rotationIncrement = lerp(0, TWO_PI, 0.0001); //for desktop
  float totalDimension = ( radius + glowOffset ) * 2;
  float totalRadius = radius + glowOffset;
  float vx=0, vy=0; //noise control
  float opacity = 0f;
  moon_x = width / 10 * 7  - totalRadius;
  moon_y = height / 7 * 4 - totalRadius;
  gMoon = createGraphics((int)totalDimension, (int)totalDimension);
  gMoon.beginDraw();
   for(int x = 0; x < totalDimension; x++){
    for(int y = 0; y < totalDimension; y++){
      float distance = dist(x, y, totalDimension/2 , totalDimension/2);
      vx+=0.04;
      if(distance <= totalRadius){
        float varNoise = 0f;
        if(distance<=radius){
           //main
           opacity = 255; 
           varNoise = map(noise(vx, vy), 0, 1, 0, 60);
        }else if(distance<= totalRadius){
           opacity = map(distance, totalRadius , radius, 0, 100); 
           varNoise = 0;
        }
        float brightness = 200   + varNoise;
        gMoon.stroke(brightness, brightness, brightness, opacity);
        gMoon.point(x, y);
      }
    }
   vx = 0;
   vy+= 0.04;
  }
  gMoon.endDraw();
}

void initGround(){
  gGround = createGraphics(width, height);
  gGround.beginDraw();
  gGround.noStroke();
  gGround.fill(0);
  float locationY = height/5*4;
  gGround.rect(0, locationY, width, locationY);
  gGround.stroke(0);
  //grass
  for(int x = 0; x < width; x+=2){
    gGround.pushMatrix();
    gGround.translate(x, locationY);
    new Blade(4, random(-20, 20), random(4,8)).display(gGround);
    gGround.popMatrix();
  }
  gGround.endDraw();
}

void initTree(){
  gTree = createGraphics(width, height);
  gTree.beginDraw();
  gTree.translate(width / 10 * 8, height/5*4);
  new Tree().display(gTree);
  gTree.endDraw();
}




void drawStars(){
  pushMatrix();
  translate(-starsoffset/2, -starsoffset/2);
  translate(gStars.width/2, gStars.height/2);
  skyRotation += rotationIncrement;
  rotate(skyRotation);
  translate(-gStars.width/2, -gStars.height/2);
  image(gStars, 0, 0);
  popMatrix();
}


void drawMoon(){
  image(gMoon, moon_x, moon_y);
}

void drawNebula(){
   image(createNebula(), 0,0);
}

PImage createNebula(){
  PImage imgNebula = createImage(width, height, RGB);
  imgNebula.loadPixels();
  tx = 0f;
  for (int x = 0; x < width; x++){
   ty = 0f;
   for (int y = 0; y < height; y++) { 
    float n = noise(tx, ty, tz);
    float r = map(n, 0, 1, 0, 255);
    float g = map(n, 0, 1, 126, 255);
    float b = 255;
    float opacity = map(n, 0, 1, 0,150);
    imgNebula.pixels[x+y*width] = color(r, g, b, opacity);
    ty += noiseY;
   }
   tx += noiseX;
   tz += noiseZ;
  }
  imgNebula.updatePixels();
  return imgNebula;
}

void drawGround(){
  image(gGround, 0,0 );
}

void drawTree(){
  image(gTree, 0,0 );
}


class Blade{
 float segments;
 float angle;
 float bladeLength;
 Blade(float segments_, float angle_, float bladeLength_){
  segments = segments_;
  angle = angle_;
  bladeLength = bladeLength_;
 }
 
 void display(PGraphics g){
  branch(bladeLength, g);
 } 
 
 void branch(float len, PGraphics g){
  g.strokeWeight(map(len, 1, bladeLength, 0.1, 3));
  g.line(0, 0, 0, -len);
  g.translate(0, -len);
  len *= 0.6;
  if(len >= 1){
    g.pushMatrix();
    g.rotate(radians(angle));
    branch(len, g);
    g.popMatrix();
  }
 }
}

class Tree{
  void display(PGraphics g){
      branch(40, 3, 8, g);
  }
  
  void branch(float len, float sWeight, float depth, PGraphics g){
   if(depth<=1){
    g.stroke(0, 40, 47); 
   }else{
    g.stroke(0, 0, 0); 
   }
   g.strokeWeight(sWeight);
   g.line(0, 0, 0, -len);
   g.translate(0, -len);
   
   len *= random(0.5, 0.9);
   sWeight *= 0.75;
   
   if(depth > 0){
     depth--;
     g.pushMatrix();
     g.rotate(PI/random(3, 10));
     branch(len, sWeight, depth, g);
     g.popMatrix();
     
     g.pushMatrix();
     g.rotate(-PI/random(3, 10));
     branch(len, sWeight, depth, g);
     g.popMatrix(); 
     
     g.pushMatrix();
     g.rotate(6);
     branch(len, sWeight, depth, g);
     g.popMatrix(); 
   }
  } 
}
