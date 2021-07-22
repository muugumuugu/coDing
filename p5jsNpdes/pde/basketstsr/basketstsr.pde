// basket star

float X[] = new float[1600] ;
float Y[] = new float[1600] ;
float A[] = new float[1600] ;
float Az[] = new float[1600] ;
float L[] = new float[1600] ;
int D[] = new int [1600] ;
float KX = 0 ;
float KY = 0 ;
float K = 0 ;
float PX = 0 ;
float PY = 0 ;
float P = 0 ;
float Rone = 0 ;
float Rtwo = 0 ;
int N = 0 ;
int Nmax = 0 ;
int B[] = new int [1600] ;
int I = 0 ;
int Q = 0 ;
int LR[] = new int [1600] ;
int PHASE = 1 ;



void setup(){
  
  size(800,800) ;
  background(0,0,0) ;
  fill(0,255,0) ;
  stroke(0,255,0) ;
  
} // setup()



void draw(){
  
  if ( PHASE == 2 ){    
    background(0,0,0) ;
    STARmove() ;
    STARdraw() ;    
  } // PHASE == 2
  
  if ( PHASE == 1 ){
   STARmake() ;
   STARdraw() ;
   PHASE = 2 ;
  } // PHASE == 1
  
} // draw()



void STARmake(){
  
  X[0] = 0 ; Y[0] = 0 ; A[0] = 0 ; L[0] = 15 ; D[0] = 5 ;
  
  for ( I = 1 ; I <= 5 ; I++ ){
   A[I] = I * ( 2 * PI / 5 ) ;
   Az[I] = A[I] ;
   D[I] = 6 ;
   B[I] = 0 ;
   L[I] = L[B[I]] * 0.8 ;
   LR[I] = 0 ;
   X[I] = L[I] * sin(A[I]*2)  ;
   Y[I] = L[I] * cos(A[I]*2)  ;
  }

  N = 1 ; Nmax = 5 ;  
  
  while ( Q == 0 ){
    
    if ( (int(D[N]/10) * 10 ) == D[N] ){ 
    B[Nmax+1] = N ;
    D[Nmax+1] = D[N] + 1 ;
    A[Nmax+1] = A[N] - ( PI / 20 ) ;
    Az[Nmax+1] = A[Nmax+1] ;
    L[Nmax+1] = L[N] * 0.98 ;
    LR[Nmax+1] = +1 ;
    B[Nmax+2] = N ;
    D[Nmax+2] = D[N] + 1 ;
    A[Nmax+2] = A[N] + ( PI / 20 ) ;
    Az[Nmax+2] = A[Nmax+2] ;
    L[Nmax+2] = L[N] * 0.98 ;
    LR[Nmax+2] = -1 ;
    Nmax = Nmax + 2 ;
    N = N + 1 ;
    }else{
    B[Nmax+1] = N ;
    D[Nmax+1] = D[N] + 1 ;
    A[Nmax+1] = A[N] - ( LR[N] *  PI / 100 ) ;
    Az[Nmax+1] = A[Nmax+1] ;
    L[Nmax+1] = L[N] * 0.98 ;
    LR[Nmax+1] = LR[N] ;
    Nmax = Nmax + 1 ;
    N = N + 1 ;  
    }
        
    if ( Nmax > 1500 ){ Q = 1 ; }
    
  }
    
} // STARmake()



void STARdraw(){
  
  beginShape() ;
  for ( I = 1 ; I <= 5 ; I++ ){
    strokeWeight( L[I] * 0.3 ) ;
    stroke(255,196,196) ;
    fill(255,196,196) ;
    line(400,400,400+X[I],400+Y[I]) ;
    vertex(400+(X[I]*3),400+Y[I]*3) ;
  }
  endShape() ;
  fill(0,0,0) ;
  ellipse(400,400,20,20) ;
  for( I = 1 ; I <= 5 ; I++ ){
    strokeWeight(2) ;
    line(400+(X[I]/1),400+(Y[I]/1),400+(X[I]/3),400+(Y[I]/3)) ;
  }
  
  for ( I = 6 ; I <= 1270 ; I++ ){
   X[I] = L[I] * sin(A[B[I]]+A[I]) + X[B[I]] ;
   Y[I] = L[I] * cos(A[B[I]]+A[I]) + Y[B[I]] ;
   strokeWeight( L[I] * 0.3 ) ;
   stroke(255,200-(4*D[I]),200-(4*D[I])) ;
   line(400+X[I],400+Y[I],400+X[B[I]],400+Y[B[I]]) ;   
  }
    
} // STARdraw()



void STARmove(){
  
  if ( (((mouseX-400)*(mouseX-400))+((mouseY-400)*(mouseY-400))) < (370*370) ){
    
    for ( I = 31 ; I <= 1270 ; I++ ){
      KX = L[I] * sin(A[B[I]]+(A[I]+0.01)) + X[B[I]] ;
      KY = L[I] * cos(A[B[I]]+(A[I]+0.01)) + Y[B[I]] ;
      PX = L[I] * sin(A[B[I]]+(A[I]-0.01)) + X[B[I]] ;
      PY = L[I] * cos(A[B[I]]+(A[I]-0.01)) + Y[B[I]] ;
      K = (((mouseX-400)-KX)*((mouseX-400)-KX))+(((mouseY-400)-KY)*((mouseY-400)-KY)) ;
      P = (((mouseX-400)-PX)*((mouseX-400)-PX))+(((mouseY-400)-PY)*((mouseY-400)-PY)) ;
      Rone = ( (X[I]-mouseX)*(X[I]-mouseX) ) + ( (Y[I]-mouseY)*(Y[I]-mouseY) ) ;
      Rtwo = ( (X[B[I]]-mouseX)*(X[B[I]]-mouseX) ) + ( (Y[B[I]]-mouseY)*(Y[B[I]]-mouseY) ) ;
      if ( ( ( Rone < ( Rtwo * 0.8) ) && ( K > P ) ) || ( ( Rone > ( Rtwo * 0.8) ) && ( K < P ) ) ){
        A[I] = A[I] + (0.0002*D[I]) ;
      }else{
        A[I] = A[I] - (0.0002*D[I]) ;
      }
      
      if ( (A[I]-Az[I]) > (PI*2.5/12) ){ A[I] = A[I] - (0.0002*D[I]) ; }
      if ( (A[I]-Az[I]) < (-PI*2.5/12) ){ A[I] = A[I] + (0.0002*D[I]) ; }
    }
    
  }else{
    
    for ( I = 31 ; I <= 1270 ; I++ ){
      if ( (A[I]-Az[I]) > 0 ){ A[I] = A[I] - 0.005 ; }
      if ( (A[I]-Az[I]) < 0 ){ A[I] = A[I] + 0.005 ; }
    }
    
  }
  
} // STARmove()
