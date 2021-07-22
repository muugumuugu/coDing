/*
This sketch builds on a prior work, "Mandelbrot", created by CrossyCoder
http://studio.sketchpad.cc/sp/pad/view/ro.9PMQ9fIqoOdlz/rev.1458
*/
 
 
 
 
// Pressing Control-R will render this sketch.
//This sketch is based on Daniel Shiffmans Mandelbrot approach
 
float minX=-2;
float maxX=2;
float minY=-2;
float maxY=2;
float maxIterations=100;
float zoom=0.6;//in percent
 
void setup() {  
    size(600, 600); 
    noLoop();
    m();
} 
 
void m(){
    
    loadPixels();    
    for(int x = 0;x<width;x++){
        for(int y = 0;y<height;y++){
            float xpos = map(x,0,width,minX,maxX)-1.4065;
            float ypos = map(y,0,height,minY,maxY);
            float bright=0;
            
            float startx = xpos;
            float starty = ypos;
            
            for(int i = 0;i<maxIterations;i++){
                float aa = xpos*xpos -ypos*ypos;
                float bb = 2*xpos*ypos;
                xpos = aa+startx;
                ypos = bb+starty;
                
                if(Math.abs(xpos+ypos)>16){
                    bright = map(i,0,maxIterations,0,255);
                    break;
                }
            
            }
            
            pixels[x+y*width] = color(1.0*bright, bright/2, 0.0*bright);
        }
    }
    
    updatePixels();
    fill(100,200,300);  
    text("Click to zoom, hit space to return",10,10);
    text("x-range: "+Math.round(minX*100)/100+","+Math.round(maxX*100)/100+"      y-range: "+Math.round(minY*100)/100+","+Math.round(maxY*100)/100,10,height-10);
}
 
void mousePressed(){
    minX = map(mouseX,0,width,minX,maxX)-(Math.abs(maxX-minX))/2*zoom;
    maxX = map(mouseX,0,width,minX,maxX)+(Math.abs(maxX-minX))/2*zoom;
    minY = map(mouseY,0,height,minY,maxY)-(Math.abs(maxY-minY))/2*zoom;
    maxY = map(mouseY,0,height,minY,maxY)+(Math.abs(maxY-minY))/2*zoom;
    maxIterations*=1.1;
    m();
}
 
void keyPressed(){
    if(keyCode == 32){
        minX=-2;
        maxX=2;
        minY=-2;
        maxY=2;
        maxIterations = 100;
        m();
    }    
}
