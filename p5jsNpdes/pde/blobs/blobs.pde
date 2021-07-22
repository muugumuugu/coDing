int numBlobs = 3;

int[] blogPx = { 0, 90, 120 };
int[] blogPy = { 0, 120, 45 };

// Movement vector for each blob
float[] blogDx = { 1, 0.8, 0.6 };
float[] blogDy = { 1, 1, -0.3 };

PGraphics pg;
int[][] vy,vx; 
String name = "metaball";

void setup() {
 size(400, 400);
 pg = createGraphics(90, 90); 
 vy = new int[numBlobs][pg.height];
 vx = new int[numBlobs][pg.width];
 frameRate(30);
}

void draw() {
 for (int i=0; i<numBlobs; ++i) {
   blogPx[i]+=blogDx[i];
   blogPy[i]+=blogDy[i];

   // bounce across screen
   if (blogPx[i] < 0) {
     blogDx[i] = 1;
   }
   if (blogPx[i] > pg.width) {
     blogDx[i] = -1;
   }
   if (blogPy[i] < 0) {
     blogDy[i] = 1;
   }
   if (blogPy[i] > pg.height) {
     blogDy[i]=-1;
   }

   for (int x = 0; x < pg.width; x++) {
     vx[i][x] = int(sq(blogPx[i]-x));
   }

   for (int y = 0; y < pg.height; y++) {
     vy[i][y] = int(sq(blogPy[i]-y)); 
   }
 }

 // Output into a buffered image for reuse
 pg.beginDraw();
 pg.loadPixels();
 for (int y = 0; y < pg.height; y++) {
   for (int x = 0; x < pg.width; x++) {
     int m = 1;
     for (int i = 0; i < numBlobs; i++) {
       // Increase this number to make your blobs bigger
       m += 60000/(vy[i][y] + vx[i][x]+1);
     }
     pg.pixels[x+y*pg.width] = color(0, m+x, (x+m+y)/2);
   }
 }
 pg.updatePixels();
 pg.endDraw();

 // Display the results
 image(pg, 0, 0, width, height); 
}
