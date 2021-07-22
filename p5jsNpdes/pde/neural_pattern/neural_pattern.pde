int count = 300;
int j;
float xminD = 2;
float xmaxD = 10;
int[] reachedX = new int[count];
int[] reachedY = new int[count];
float[] distance = new float[count];
int shadow1x = 1;
int shadow2x = 2;
int shadow1y = 1;
int shadow2y = 2;
int alpha = 255;
int cursorAlpha = 255;
float cursorX = mouseX;
float cursorY = mouseY;
int inconnect;
int outconnect;
float mindistance;
int current;
int next=-1;
int pos;
float easing = 0.2;
int reset = 0;


int line1;
int line2;
int line3;
int line4;
int line5;
int line6;
int line7;
int line8;
int line9;
int line10;
int line11;
int line12;
int line13;
int line14;
int line15;
int line16;



int relativePos;

class Point {
  
  float x;
  float y;
  float size;
  float xspeed;
  float yspeed;
  float alpha;
  int[] linksin = new int[count];
  int[] linksout = new int[count];
  int numlinksin;
  int numlinksout;
  
  float newx;
  float newy;
  float prevx;
  float prevy;
  float targetx;
  float targety;
  
  Point(float xcoord, float ycoord, float xminD,  float xmaxD, float xcircspeed, float ycircspeed)
     {
       
       x = xcoord;
       y = ycoord;
       size = random(xminD, xmaxD);
       xspeed = xcircspeed;
       yspeed = ycircspeed;
       newx = x;
       newy = y;
       alpha = map(size, xminD,xmaxD, 50, 255);
       numlinksin = 2;//round(random(1,2));
       numlinksout = round(random(1,2));
       for(int i=0; i < numlinksin; i++)
         linksin[i] = round(random(0,count-1));
       for(int i=0; i < numlinksout; i++)
         linksout[i] = round(random(0,count-1));
     }
  
  void setTarget(int centre)
  {
    if(centre==1)
    {
      targetx = x;
      targety = y;
    }
    else
    {
      targetx = x+round(random(-20,20));
      targety = y+round(random(-20,20));
    }
  }
  
    float updateLocX()
  {
    prevx = newx;
    if(targetx>newx) {      
    newx = newx+xspeed;
    }
  else 
    newx = newx - xspeed;
  return newx;
  }
  
    float updateLocY()
  {
    prevy = newy;
    if(targety>newy) {
    newy = newy+yspeed;
    }
  else 
    newy = newy - yspeed;
  return newy;
  }
}


Point[] pt;

void setup()
{
size(800,800);
//fullScreen();
background(0);
noStroke();
noCursor();
  smooth();
  pt = new Point[count]; // initialise 200 points;
  for (int i = 0; i < count; i++) {
    pt[i] = new Point(round(random(0, width)), round(random(0, height)), xminD, xmaxD, 0.25,0.25);// random(0, 1), random(0, 1)); //initialise x and y positions, diameters, speed in x and y
    reachedX[i] = 0;
    reachedY[i] = 0;
    pt[i].setTarget(0);
  }
  
}


void draw()
{
    background(0);
    noStroke();

  //for (int i = 0; i < count; i++) {
  //  ellipse(pt[i].x, pt[i].y, pt[i].size, pt[i].size);
  //}
  
    for (int i = 0; i < count; i++) {

      if(reachedX[i] == 1 && reachedY[i] == 1) 
      {
      if(pt[i].targetx == pt[i].x)
        pt[i].setTarget(0);
      else
        pt[i].setTarget(1);
      reachedX[i] = 0;
      reachedY[i] = 0;
      
      }
      if(reachedX[i] == 0 && reachedY[i] == 0)
      {
        //#2E6DAA

        fill(#7D62A2, pt[i].alpha-10);
        ellipse(pt[i].updateLocX()+shadow2x, pt[i].updateLocY()+shadow2y, pt[i].size+6, pt[i].size+6);
        fill(#2E98AA, pt[i].alpha-10);
        ellipse(pt[i].updateLocX()+shadow1x, pt[i].updateLocY()+shadow1y, pt[i].size+3, pt[i].size+3);
        fill(255, pt[i].alpha);
        ellipse(pt[i].updateLocX(), pt[i].updateLocY(), pt[i].size, pt[i].size);


     
      }
      else if(reachedX[i] == 1 && reachedY[i] == 0)
      {

        fill(#7D62A2, pt[i].alpha-10);
        ellipse(pt[i].newx+shadow2x, pt[i].updateLocY()+shadow2y, pt[i].size+6, pt[i].size+6);        
        fill(#2E98AA, pt[i].alpha-10);
        ellipse(pt[i].newx+shadow1x, pt[i].updateLocY()+shadow1y, pt[i].size+3, pt[i].size+3);        
        fill(255, pt[i].alpha);
        ellipse(pt[i].newx, pt[i].updateLocY(), pt[i].size, pt[i].size);

     
      }
      else if(reachedX[i] == 0 && reachedY[i] == 1)
      {

        fill(#7D62A2, pt[i].alpha-10);
        ellipse(pt[i].updateLocX()+shadow2x, pt[i].newy+shadow2y, pt[i].size+6, pt[i].size+6);        
        fill(#2E98AA, pt[i].alpha-10);
        ellipse(pt[i].updateLocX()+shadow1x, pt[i].newy+shadow1y, pt[i].size+3, pt[i].size+3);        
        fill(255, pt[i].alpha);
        ellipse(pt[i].updateLocX(), pt[i].newy, pt[i].size, pt[i].size);
      }
      
      for (int j = 0; j < pt[i].numlinksin; j++)
      {
        inconnect = pt[i].linksin[j];
        stroke(#97D5FA, 50);
        strokeWeight(1.3);
        line(pt[i].newx, pt[i].newy, pt[inconnect].newx, pt[inconnect].newy);
      }
      


      if(pt[i].newx == pt[i].targetx)
      {
        reachedX[i] = 1;
      }
      if(pt[i].newy == pt[i].targety)
      {
        reachedY[i] = 1;
      }
      
  } //end of big for loop
  
      for(int k=0; k<count; k++)
      distance[k] = sqrt(sq(mouseX-pt[k].newx)+sq(mouseY-pt[k].newy));
    mindistance = min(distance);
    for(int k=0; k<count;k++)
    {
      if(distance[k] == mindistance)
      {
      pos = k; //establish closest circle to mouse pointer
      break;
      }
    }

//#F2AD16
//#F0F0F0
    fill(255,cursorAlpha);
    line1 = pt[pos].linksin[0];
    line2 = pt[pos].linksin[1];
    line3 = pt[line1].linksin[0];
    line4 = pt[line1].linksin[1];
    line5 = pt[line2].linksin[0];
    line6 = pt[line2].linksin[1];
    line7 = pt[line3].linksin[0];
    line8 = pt[line3].linksin[1];
    line9 = pt[line4].linksin[0];
    line10 = pt[line4].linksin[1];
    line11 = pt[line5].linksin[0];
    line12 = pt[line5].linksin[1];
    line13 = pt[line6].linksin[0];
    line14 = pt[line6].linksin[1];
    line15 = pt[line7].linksin[0];
    line16 = pt[line7].linksin[1];
    
    ellipse(pt[pos].newx, pt[pos].newy, pt[pos].size+10, pt[pos].size+10);
    ellipse(pt[line1].newx, pt[line1].newy, pt[line1].size+10, pt[line1].size+1);
    ellipse(pt[line2].newx, pt[line2].newy, pt[line2].size+10, pt[line2].size+10);  
    ellipse(pt[line3].newx, pt[line3].newy, pt[line3].size+10, pt[line3].size+10);    
    ellipse(pt[line4].newx, pt[line4].newy, pt[line4].size+10, pt[line4].size+10);    
    ellipse(pt[line5].newx, pt[line5].newy, pt[line5].size+10, pt[line5].size+10);    
    ellipse(pt[line6].newx, pt[line6].newy, pt[line6].size+10, pt[line6].size+10);    
    ellipse(pt[line7].newx, pt[line7].newy, pt[line7].size+10, pt[line7].size+10);    
    ellipse(pt[line8].newx, pt[line8].newy, pt[line8].size+10, pt[line8].size+10);    
    ellipse(pt[line9].newx, pt[line9].newy, pt[line9].size+10, pt[line9].size+10);    
    ellipse(pt[line10].newx, pt[line10].newy, pt[line10].size+10, pt[line10].size+10);    
    ellipse(pt[line11].newx, pt[line11].newy, pt[line11].size+10, pt[line11].size+10);    
    ellipse(pt[line12].newx, pt[line12].newy, pt[line12].size+10, pt[line12].size+10);    
    ellipse(pt[line13].newx, pt[line13].newy, pt[line13].size+10, pt[line13].size+10);    
    ellipse(pt[line14].newx, pt[line14].newy, pt[line14].size+10, pt[line14].size+10);    
    ellipse(pt[line15].newx, pt[line15].newy, pt[line15].size+10, pt[line15].size+10);    
    ellipse(pt[line16].newx, pt[line16].newy, pt[line16].size+10, pt[line16].size+10);    
    
    strokeWeight(1);
    stroke(255,cursorAlpha);
    line(pt[pos].newx, pt[pos].newy, pt[line1].newx, pt[line1].newy);
    line(pt[pos].newx, pt[pos].newy, pt[line2].newx, pt[line2].newy);
    line(pt[line1].newx, pt[line1].newy, pt[line3].newx, pt[line3].newy);
    line(pt[line1].newx, pt[line1].newy, pt[line4].newx, pt[line4].newy);
    line(pt[line2].newx, pt[line2].newy, pt[line5].newx, pt[line6].newy);
    line(pt[line2].newx, pt[line2].newy, pt[line6].newx, pt[line6].newy);    
    line(pt[line3].newx, pt[line3].newy, pt[line7].newx, pt[line7].newy);
    line(pt[line3].newx, pt[line3].newy, pt[line8].newx, pt[line8].newy);      
    line(pt[line4].newx, pt[line4].newy, pt[line9].newx, pt[line9].newy);
    line(pt[line4].newx, pt[line4].newy, pt[line10].newx, pt[line10].newy);  
    line(pt[line5].newx, pt[line5].newy, pt[line11].newx, pt[line11].newy);
    line(pt[line5].newx, pt[line5].newy, pt[line12].newx, pt[line12].newy);    
    line(pt[line6].newx, pt[line6].newy, pt[line13].newx, pt[line13].newy);
    line(pt[line6].newx, pt[line6].newy, pt[line14].newx, pt[line14].newy);     
    line(pt[line7].newx, pt[line7].newy, pt[line15].newx, pt[line15].newy);
    line(pt[line7].newx, pt[line7].newy, pt[line16].newx, pt[line16].newy);        
    
      cursorAlpha-=10;

}

void mouseMoved()
{
  cursorAlpha = 255;
  reset = 1;
}
