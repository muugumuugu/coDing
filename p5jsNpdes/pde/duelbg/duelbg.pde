// Pressing Control-R will render this sketch.
 
PImage bg;
 
PImage makeBackground(int wall, int brickrows){
    pushStyle();
    pushMatrix();
    //noStroke();
    
    fill(120);
    rect(0,0,width,height);
    float brickHeight = wall/brickrows;
    
    translate(width/2, height/2);
    for (int i = 0; i < 4; i++){
        stroke(125);
        for (float y = 0; y < wall; y += brickHeight){
            float x = 0;
            while (x < width - 30){
                fill(random(50)+125);
                float oldX = x;
                x += random(15) + 15;
                beginShape();
                vertex(map(oldX, 0, width, y-width/2, width/2-y), y-height/2);
                vertex(map(x, 0, width, y-width/2, width/2-y), y-height/2);
                vertex(map(x, 0, width, y+brickHeight-width/2, width/2-y-brickHeight), y+brickHeight-height/2);
                vertex(map(oldX, 0, width, y+brickHeight-width/2, width/2-y-brickHeight), y+brickHeight-height/2);
                endShape(CLOSE);
            }
            fill(random(50)+125);
            beginShape();
            vertex(map(width, 0, width, y-width/2, width/2-y), y-height/2);
            vertex(map(x, 0, width, y-width/2, width/2-y), y-height/2);
            vertex(map(x, 0, width, y+brickHeight-width/2, width/2-y-brickHeight), y+brickHeight-height/2);
            vertex(map(width, 0, width, y+brickHeight-width/2, width/2-y-brickHeight), y+brickHeight-height/2);
            endShape(CLOSE);
    
        }
        fill(0, 0, 0, 35*abs(2-i));
        noStroke();
        beginShape();
        vertex(-width/2, -height/2);
        vertex(width/2, -height/2);
        vertex(width/2-wall, -height/2+wall);
        vertex(-width/2+wall, -height/2+wall);
        endShape(CLOSE);
        rotate(HALF_PI);
        
    }
    popMatrix();
    stroke(120);
    
    splitRect(50, 50, 450, 450);
    popStyle();
    PImage temp = createImage (width, height, RGB);
    loadPixels();
    temp.pixels = pixels;
    temp.updatePixels;
    return temp;
}
 
int minStone = 12;
    
void splitRect (float x, float y, float w, float h){
    rectMode(CORNER);
    
    fill(random(50)+125);
    /*fill(hue, saturation, brightness, alpha);
 
    text("R" + x + ", " + y + ", " + w + ", " + h, j*170+10, i*12+12);
    i++;
    if(i*12+12 > height-10){
        i = 0;
        j++;
    }*/
 
    if (w <= minStone*2){
        if (h <= minStone*2){
            rect (x, y, w, h);
            
            saturation = saturation >= 6 ? 2 : (saturation + 1);
            brightness = brightness >= 6 ? 2 : (brightness + 1);
        } else {
            
            //vertical strip divide
            int stone = (int)random(minStone, h - minStone);
            splitRect(x, y, w, stone);
            splitRect(x, y + stone, w, h - stone);
        }
    } else {
        if (h <= minStone*2){
            //horizontal strip divide
            int stone = (int)random(minStone, w - minStone);
            boolean left = (random()<.5);
            splitRect(x, y, stone, h);
            splitRect(x + stone, y, w - stone, h);
        } else {
            //big rectangle divide
            //generate a legal side height and width 
            //decide which corner to cut into
            //cut off the rectangle with that height and width and send it to splitRect
            //give the remaining L to splitL
            int stoneY = (int) (random(minStone/2, (h-minStone)/2)+random(minStone/2, (h-minStone)/2));
            //int stoneY = (int) random(minStone, h - minStone);
            int stoneX = (int) (random(minStone/2, (w-minStone)/2)+random(minStone/2, (w-minStone)/2));
            //int stoneX = (int) random(minStone, w - minStone);
            boolean top = (random()<.5);
            boolean left = (random()<.5);
            if (top){
                if (left){
                    //bite out top left
                    splitRect(x, y, stoneX, stoneY);
                    splitL(x, y, w, h, stoneX, stoneY);
 
                } else {
                    //bite out top right
                    splitRect(x + w - stoneX, y, stoneX, stoneY);
                    splitL(x, y, w, h, -stoneX, stoneY);
                }
            } else {
                if (left){
                    //bite out bottom left
                    splitRect(x, y + h - stoneY, stoneX, stoneY);
                    splitL(x, y, w, h, stoneX, -stoneY);
                } else {
                    //bite out bottom right
                    splitRect(x + w - stoneX, y + h - stoneY, stoneX, stoneY);
                    splitL(x, y, w, h, -stoneX, -stoneY);
                }
            }
            
        }
    }
}
 
void splitL (float x, float y, float w, float h, float stoneX, float stoneY){
    //topleft corner, width, height
    //stoneX: if stoneX is positive, corner bitten from left, negative from right
    //stoneY: if stoneY is positive, corner bitten from top, negative from bottom
    //generate a rectangle with the same width or height as the cut-out area
    //give this rectangle to splitRect
    //check if remaining area is rectangle or L
    //if rectangle, give to splitRect
    //if L, give to splitL
    
    boolean horizontal = (random()<.5);
    
    hue = (hue + .4) % 6;
    fill (hue, saturation, brightness, alpha);
    if (horizontal){
        int newStoneX = w - abs(stoneX) < minStone * 2 ? w - abs(stoneX) : (int) random(minStone, w - abs(stoneX) - minStone + 1);
        
        /*text("L" + x + ", " + y + ", " + w + ", " + h + ", " + stoneX + ", " + stoneY + ", " + newStoneX, j*170+10, i*12+12);
        i++;
        if(i*12+12 > height-10){
            i = 0;
            j++;
        }*/
        
        if (newStoneX >= w - abs(stoneX) - minStone){
            //two rectangles
            //little rectangle
            splitRect((stoneX>0 ? x + stoneX : x), (stoneY>0 ? y : y + h + stoneY), w - abs (stoneX), abs(stoneY));
            //big rectangle
            splitRect(x, (stoneY>0 ? y + stoneY : y), w, h - abs(stoneY));
        } else {
            splitRect ((stoneX>0 ? (x + stoneX) : (x + w + stoneX - newStoneX)), (stoneY>0 ? y : (y + h + stoneY)), newStoneX, abs(stoneY))
            splitL(x, y, w, h, stoneX + (stoneX>0 ? newStoneX : -newStoneX), stoneY);
        }
    } else {//vertical
        int newStoneY = h - abs(stoneY) < minStone * 2 ? h - abs(stoneY) : (int) random(minStone, h - abs(stoneY) - minStone + 1);
        
        /*text("L" + x + ", " + y + ", " + w + ", " + h + ", " + stoneX + ", " + stoneY + ", " + newStoneY, j*170+10, i*12+12);
        i++;
        if(i*12+12 > height-10){
            i = 0;
            j++;
        }*/
        
        if (newStoneY >= h - abs(stoneY) - minStone){
            //two rectangles
            //little rectangle
            splitRect((stoneX>0 ? x : x + w + stoneX), (stoneY>0 ? y + stoneY : y), abs(stoneX), h - abs (stoneY));
            //big rectangle
            splitRect((stoneX>0 ? x + stoneX : x), y, w - abs(stoneX), h);
            
        } else {
            splitRect((stoneX>0 ? x : x +  w + stoneX), (stoneY>0 ? y + stoneY : y + h + stoneY - newStoneY),  abs(stoneX), newStoneY);
            splitL(x, y, w, h, stoneX, stoneY + (stoneY>0 ? newStoneY : -newStoneY));
        }
    }
    
    
}
 
void setup() {  // this is run once.   
    // set the background color
    background(255);
    
    // canvas size (Variable aren't evaluated. Integers only, please.)
    size(550, 550); 
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second
    frameRate(30);
    
    // set the width of the line. 
    bg = makeBackground (50, 8);
    //noStroke();
    
    
} 
 
void draw() {  // this is run repeatedly. 
    ellipse(width, height, 50, 50);
    //image (bg, 0, 0);
    //ellipse(random(width), random(height), 30, 30);
}
 
    
 
 
 
