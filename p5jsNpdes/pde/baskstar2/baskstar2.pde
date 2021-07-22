// basket_star_3

float X[] = new float[5000] ; float Y[] = new float[5000] ; 
float A[] = new float[5000] ; float L[] = new float[5000] ;
float SX = 0 ; float SY = 0 ; float SA = 0 ;
float FA[] = new float[5000] ; float F[] = new float[5000] ;
int B[] = new int[5000] ; int D[] = new int[5000] ;
int I = 0 ; int II = 0 ; 
int N = 0 ; int Nmax = 0 ;
float RX = 0 ; float RY = 0 ; float LX = 0 ; float LY = 0 ;
float RR = 0 ; float RL = 0 ; float RA = 0 ; float LA = 0 ;
float RM = 0 ;



void setup(){
  
  size(700,700) ;
  background(0,0,0) ;
  noFill() ;
  
  for ( I = 0 ; I <= 4 ; I++ ){
    A[I] = (2*PI/5)*I ;
    FA[I] = A[I] ; F[I] = FA[I] ;
    L[I] = 8 ;
    X[I] = 350 + (10*L[I]*sin(A[I])) ;
    Y[I] = 350 + (10*L[I]*cos(A[I])) ;
    D[I] = 1 ;
  }
  
  Nmax = 4 ;
  I = 0 ;
  while( Nmax < 4998 ){
   A[Nmax+1] =  A[I] - ((PI/(random(5.0,15.0)))*(D[I])) ;
   A[Nmax+2] =  A[I] + ((PI/(random(5.0,15.0)))*(D[I])) ;
   FA[Nmax+1] = A[Nmax+1]-A[I] ; F[I] = FA[I] ;
   FA[Nmax+2] = A[Nmax+2]-A[I] ; F[I] = FA[I] ;
   L[Nmax+1] = L[I] * (random(0.7,0.9)) ;
   L[Nmax+2] = L[I] * (random(0.7,0.9)) ;
   B[Nmax+1] = I ;
   B[Nmax+2] = I ;
   D[Nmax+1] = D[I] + 1 ;
   D[Nmax+2] = D[I] + 1 ;
   Nmax = Nmax + 2 ;
   I = I + 1 ;  
  }
  
} // setup()



void draw(){
  
  background(0,0,0) ;
  TENTACLES() ;
  
} // draw()



void TENTACLES(){
  
  strokeWeight(10) ;
  stroke(255,120,120) ;
  fill(255,120,120) ;
  beginShape() ;
  vertex(X[0],Y[0]) ;
  vertex(X[2],Y[2]) ;
  vertex(X[4],Y[4]) ;
  vertex(X[1],Y[1]) ;
  vertex(X[3],Y[3]) ;  
  endShape(CLOSE) ;
  fill(0,0,0) ;
  strokeWeight(3) ;
  ellipse(350,350,30,30) ;
  
  for ( I = 0 ; I <= 4 ; I++ ){
   
   line(350+(15*sin(A[I])),350+(15*cos(A[I])),350+(10*sin(A[I])),350+(10*cos(A[I]))) ;
    
  }
  
  
  noFill() ;
  
  for ( I = 5 ; D[I] <= 9 ; I++ ){
   
    SX = X[B[I]] ; SY =Y[B[I]] ; SA = A[B[I]] ;
    RX = SX ; RY = SY ; RA = SA ;
    LX = SX ; LY = SY ; LA = SA ;
    stroke(255,135-(D[I]*15),135-(D[I]*15)) ;
    strokeWeight(10-D[I]) ; 
    beginShape() ;
    
    for ( II = 0 ; II < 10 ; II++ ){
     
     vertex(SX,SY) ;
     SA = SA + ((A[I]-A[B[I]])/10) ;
     SX = SX + (L[I]*sin(SA)) ;
     SY = SY + (L[I]*cos(SA)) ;
     RA = RA + (((A[I]+0.1)-A[B[I]])/10) ;
     RX = RX + (L[I]*sin(RA)) ;
     RY = RY + (L[I]*cos(RA)) ;
     LA = LA + (((A[I]-0.1)-A[B[I]])/10) ;
     LX = LX + (L[I]*sin(LA)) ;
     LY = LY + (L[I]*cos(LA)) ;
           
    }
    
    vertex(SX,SY) ;
    endShape() ;
    X[I] = SX ; Y[I] = SY ;
    RM = sqrt( ( (mouseX-SX)*(mouseX-SX) ) + ( (mouseY-SY)*(mouseY-SY) ) ) ;
    if ( RM < 200 ){
     RR = sqrt( ( (mouseX-RX)*(mouseX-RX) ) + ( (mouseY-RY)*(mouseY-RY) ) ) ;
     RL = sqrt( ( (mouseX-LX)*(mouseX-LX) ) + ( (mouseY-LY)*(mouseY-LY) ) ) ;
     if ( RR < RL ){ A[I] = A[I] + (D[I]*0.01) ; }
     if ( RR > RL ){ A[I] = A[I] - (D[I]*0.01) ; }
     if ( (A[I]-A[B[I]]) > (FA[I]+D[I]*PI/8) ){ A[I] = A[I] - (D[I]*0.02) ; }
     if ( (A[I]-A[B[I]]) < (FA[I]-D[I]*PI/8) ){ A[I] = A[I] + (D[I]*0.02) ; }
    }else{
     if ( (A[I]-A[B[I]]) > (F[I]) ){ A[I] = A[I] - (D[I]*0.01) ; }
     if ( (A[I]-A[B[I]]) < (F[I]) ){ A[I] = A[I] + (D[I]*0.01) ; }
     if ( random(0.0,100.0) > 90 ){ F[I] = FA[I] + random(-PI/2,PI/2) ; }
    }    
    
  } 
  
} // TENTACLES()
