// evolving_something

int KYM[][][] = new int[20][20][20] ; 

int RRR[] = new int [400] ; int GGG[] = new int [400] ; int BBB[] = new int[400] ;
int Z[][] = new int [400][1000] ; // 1:IF~THEN~ 2:MOVE 3:DEVIDE 4:STAY 5:ATTACK
int ZZ[][] = new int [400][1000] ; // 1:== 2:> 3:<
int ZZL[][] = new int [400][1000] ; // 1:HP/10 2:CLN 3:CLE 4:CLS 5:CLW 6:ZZN 7:SRD 8:CLU 9:CLD
int ZZR[][] = new int [400][1000] ; // 1:Random 2:ZZN
int ZZN[][] = new int [400][1000] ;
int NXTone[][] = new int [400][1000]; int NXTtwo[][] = new int [400][1000] ;
int CLN = 0 ; int CLE = 0 ; int CLS = 0 ; int CLW = 0 ; int CLM = 0 ; int CLU = 0 ; int CLD = 0 ; int SRD = 0 ;
int ZD[][] = new int[400][1000] ; // 1:Random 2:D
int D[][] = new int[400][1000] ;
int Nmax[] = new int[400] ;
int EXT[] = new int[400] ;
int N = 0 ; int HP = 0 ;
int X = 0 ; int Y = 0 ; int W = 0 ;
int L = 0 ; int R = 0 ;
int FN = 0 ; int BN = 0 ;

int I = 0 ; int II = 0 ; int III = 0 ; int IIII = 0 ; int IIIII = 0 ;
int Q = 0 ; int QQ = 0 ;
int RND = 0 ; int T = 0 ;
int PHASE = 1 ; int MODE = 1 ;

int SLDX = 40 ; int SLDY = 40 ;
int LY = 0 ;

float A = 0 ; int ROT = 1 ; int P = 0 ; 



void setup(){
  
  size(600,730) ;
  background(0,0,0) ;
  strokeWeight(2) ;
  
   I = 1 ;
   Z[I][0] = 1 ; ZZ[I][0] = 3 ; ZZL[I][0] = 6 ; ZZR[I][0] = 1 ; ZZN[I][0] = 8 ; NXTone[I][0] = 1 ; NXTtwo[I][0] = 2 ;  // 0: IF 8<random THEN goto 1 else goto 2
   Z[I][1] = 1 ; ZZ[I][1] = 3 ; ZZL[I][1] = 6 ; ZZR[I][1] = 1 ; ZZN[I][1] = 5 ; NXTone[I][1] = 3 ; NXTtwo[I][1] = 4 ;  // 1: IF 5<random THEN goto 3 else goto 4
   Z[I][2] = 2 ; ZD[I][2] = 1 ;                                                                                        // 2: MOVE randomly
   Z[I][3] = 4 ; ZD[I][3] = 1 ;                                                                                        // 3: STAY
   Z[I][4] = 3 ; ZD[I][4] = 1 ;                                                                                        // 4: DEVIDE randomly
   Nmax[I] = 5 ;
   EXT[I] = 1 ;
   RRR[I] = 255 ; GGG[I] = 255 ; BBB[I] = 0 ;
      
} // setup()



void draw(){
  
  if ( PHASE == 4 ){
   
   background(200,200,200) ;
   ALGdraw() ; 
   CONTROLLERdraw() ;
    
  } // PHASE == 4
  
  if ( PHASE == 2 ){
    
    QQ = 0 ;
    while( QQ == 0 ){ 
     if ( MODE == 1 ){ QQ = 1 ; }
     if ( MODE == 2 ){ QQ = 0 ; }
     ACTION() ;
     HPcheck() ;
     GRAVITY() ;
     T = T + 1 ;
     if ( T > 50 ){ QQ = 1 ; T = 0 ; }
    }
     FIELDdraw() ;
     CONTROLLERdraw() ;
              
  } // PHASE == 2
  
  if ( PHASE == 1 ){
    
    FIELDset() ;
    PHASE = 2 ;
    
  } // PHASE == 1
  
} // draw()



void FIELDset(){
  
  for ( IIIII = 0 ; IIIII <= 19 ; IIIII++ ){
   for ( I = 0 ; I <= 19 ; I++ ){
    for ( II = 0 ; II <= 19 ; II++ ){
     KYM[I][II][IIIII] = 0 ; 
    }
   }
  }
  
  KYM[10][10][19] = 1200 ;
  
} // FIELDset



void ACTION(){
  
  for ( IIIII = 0 ; IIIII <= 19 ; IIIII++ ){
  for ( I = 0 ; I <= 19 ; I++ ){
  for ( II = 0 ; II <= 19 ; II++ ){
  
  X = I ; Y = II ; W = IIIII ;
  COLcheck() ;
  HP = KYM[I][II][IIIII] - (CLM*1000) - 100 ;
 
  Q = 0 ; N = 0 ;
 
  while( ( Q == 0 ) && ( CLM != 0 ) ){ 
  
  RND = int(random(0.0,9.9)) ;  
    
  if ( Z[CLM][N] == 1 ){
    
    if ( ZZL[CLM][N] == 1 ){ L = int(HP/10) ; }
    if ( ZZL[CLM][N] == 2 ){ L = CLN ; }
    if ( ZZL[CLM][N] == 3 ){ L = CLE ; }
    if ( ZZL[CLM][N] == 4 ){ L = CLS ; }
    if ( ZZL[CLM][N] == 5 ){ L = CLW ; }
    if ( ZZL[CLM][N] == 6 ){ L = ZZN[CLM][N] ; }
    if ( ZZL[CLM][N] == 7 ){ L = SRD ; }
    if ( ZZL[CLM][N] == 8 ){ L = CLU ; }
    if ( ZZL[CLM][N] == 9 ){ L = CLD ; }
    if ( ZZR[CLM][N] == 1 ){ R = RND ; }
    if ( ZZR[CLM][N] == 2 ){ R = ZZN[CLM][N] ; }
    if ( ZZ[CLM][N] == 1 ){
     if ( L == R ){ N = NXTone[CLM][N] ; }else{ N = NXTtwo[CLM][N] ; }
     }else{ 
     if ( ZZ[CLM][N] == 2 ){
     if ( L > R ){ N = NXTone[CLM][N] ; }else{ N = NXTtwo[CLM][N] ; }
     }else{ 
     if ( ZZ[CLM][N] == 3 ){
     if ( L < R ){ N = NXTone[CLM][N] ; }else{ N = NXTtwo[CLM][N] ; }
     }}} 
    
  } // Z == 1 
  
  if ( Z[CLM][N] == 2 ){
    
    if ( ZD[CLM][N] == 1 ){ D[CLM][N] = int(random(1.0,6.9)) ; }
    if ( ( D[CLM][N] == 1 ) && ( CLN == 0 ) ){ KYM[X][Y-1][W] = KYM[X][Y][W]  ; KYM[X][Y][W] = 0 ; }
    if ( ( D[CLM][N] == 2 ) && ( CLE == 0 ) ){ KYM[X+1][Y][W] = KYM[X][Y][W]  ; KYM[X][Y][W] = 0 ; }
    if ( ( D[CLM][N] == 3 ) && ( CLS == 0 ) ){ KYM[X][Y+1][W] = KYM[X][Y][W]  ; KYM[X][Y][W] = 0 ; }
    if ( ( D[CLM][N] == 4 ) && ( CLW == 0 ) ){ KYM[X-1][Y][W] = KYM[X][Y][W]  ; KYM[X][Y][W] = 0 ; }
    if ( ( D[CLM][N] == 5 ) && ( CLU == 0 ) ){ KYM[X][Y][W-1] = KYM[X][Y][W]  ; KYM[X][Y][W] = 0 ; }
    if ( ( D[CLM][N] == 6 ) && ( CLD == 0 ) ){ KYM[X][Y][W+1] = KYM[X][Y][W]  ; KYM[X][Y][W] = 0 ; }
    Q = 1 ;
    
  } // Z == 2
  
  if ( Z[CLM][N] == 3 ){
    
   if ( int(random(0.0,49.9)) < 49 ){ 
    if ( ZD[CLM][N] == 1 ){ D[CLM][N] = int(random(1.0,6.9)) ; }
    if ( ( D[CLM][N] == 1 ) && ( CLN == 0 ) ){ KYM[X][Y-1][W] = KYM[X][Y][W] - (int(HP/2)) - 1 ; KYM[X][Y][W] = KYM[X][Y][W] - (int(HP/2)) - 1 ; }
    if ( ( D[CLM][N] == 2 ) && ( CLE == 0 ) ){ KYM[X+1][Y][W] = KYM[X][Y][W] - (int(HP/2)) - 1 ; KYM[X][Y][W] = KYM[X][Y][W] - (int(HP/2)) - 1 ; }
    if ( ( D[CLM][N] == 3 ) && ( CLS == 0 ) ){ KYM[X][Y+1][W] = KYM[X][Y][W] - (int(HP/2)) - 1 ; KYM[X][Y][W] = KYM[X][Y][W] - (int(HP/2)) - 1 ; }
    if ( ( D[CLM][N] == 4 ) && ( CLW == 0 ) ){ KYM[X-1][Y][W] = KYM[X][Y][W] - (int(HP/2)) - 1 ; KYM[X][Y][W] = KYM[X][Y][W] - (int(HP/2)) - 1 ; }
    if ( ( D[CLM][N] == 5 ) && ( CLU == 0 ) ){ KYM[X][Y][W-1] = KYM[X][Y][W] - (int(HP/2)) - 1 ; KYM[X][Y][W] = KYM[X][Y][W] - (int(HP/2)) - 1 ; }
    if ( ( D[CLM][N] == 6 ) && ( CLD == 0 ) ){ KYM[X][Y][W+1] = KYM[X][Y][W] - (int(HP/2)) - 1 ; KYM[X][Y][W] = KYM[X][Y][W] - (int(HP/2)) - 1 ; }
    
   }else{
     MUTATION() ;
   }
   
    Q = 1 ;
    
  } // Z == 3
  
  if ( ( Z[CLM][N] == 0 ) || ( Z[CLM][N] == 4 ) ){
    
    if ( SRD == 0 ){ KYM[X][Y][W] = KYM[X][Y][W] + 15 ; }
    Q = 1 ;
    
  } // Z == 4
 
  if ( Z[CLM][N] == 5 ){
    
    if ( ZD[CLM][N] == 1 ){ D[CLM][N] = int(random(1.0,6.9)) ; }
    if ( ( D[CLM][N] == 1 ) && ( CLN != 0 ) && ( CLN != 6 ) ){ KYM[X][Y-1][W] = KYM[X][Y-1][W] - 30 ; KYM[X][Y][W] = KYM[X][Y][W] + 30 ; }
    if ( ( D[CLM][N] == 2 ) && ( CLE != 0 ) && ( CLE != 6 ) ){ KYM[X+1][Y][W] = KYM[X+1][Y][W] - 30 ; KYM[X][Y][W] = KYM[X][Y][W] + 30 ; }
    if ( ( D[CLM][N] == 3 ) && ( CLS != 0 ) && ( CLS != 6 ) ){ KYM[X][Y+1][W] = KYM[X][Y+1][W] - 30 ; KYM[X][Y][W] = KYM[X][Y][W] + 30 ; }
    if ( ( D[CLM][N] == 4 ) && ( CLW != 0 ) && ( CLW != 6 ) ){ KYM[X-1][Y][W] = KYM[X-1][Y][W] - 30 ; KYM[X][Y][W] = KYM[X][Y][W] + 30 ; }
    if ( ( D[CLM][N] == 5 ) && ( CLU != 0 ) && ( CLU != 6 ) ){ KYM[X][Y][W-1] = KYM[X][Y][W-1] - 30 ; KYM[X][Y][W] = KYM[X][Y][W] + 30 ; }
    if ( ( D[CLM][N] == 6 ) && ( CLD != 0 ) && ( CLD != 6 ) ){ KYM[X][Y][W+1] = KYM[X][Y][W+1] - 30 ; KYM[X][Y][W] = KYM[X][Y][W] + 30 ; }
    Q = 1 ; 
    
  } // Z == 5 
  
  } // Q == 0 
  
  if ( SRD == 1 ){ KYM[X][Y][W] = KYM[X][Y][W] - 3 ; }
  
  }
  }
  }
  
} // ACTION()



void COLcheck(){
  
  CLM = int(KYM[X][Y][W]/1000) ;
  
  if ( X > 0 ){ CLW = int(KYM[X-1][Y][W]/1000) ; }else{ CLW = 6 ; }
  if ( X < 19 ){ CLE = int(KYM[X+1][Y][W]/1000) ; }else{ CLE = 6 ; }
  if ( Y > 0 ){ CLN = int(KYM[X][Y-1][W]/1000) ; }else{ CLN = 6 ; }
  if ( Y < 19 ){ CLS = int(KYM[X][Y+1][W]/1000) ; }else{ CLS = 6 ; }
  if ( W > 0 ){ CLU = int(KYM[X][Y][W-1]/1000) ; }else{ CLU = 6 ; }
  if ( W < 19 ){ CLD = int(KYM[X][Y][W+1]/1000) ; }else{ CLD = 6 ; }
  if ( CLN == CLM ){ CLN = 2 ; }else{ if ( ( CLN != 0 ) && ( CLN != 6 ) ){ CLN = 4 ; } }
  if ( CLE == CLM ){ CLE = 2 ; }else{ if ( ( CLE != 0 ) && ( CLE != 6 ) ){ CLE = 4 ; } }
  if ( CLS == CLM ){ CLS = 2 ; }else{ if ( ( CLS != 0 ) && ( CLS != 6 ) ){ CLS = 4 ; } }
  if ( CLW == CLM ){ CLW = 2 ; }else{ if ( ( CLW != 0 ) && ( CLW != 6 ) ){ CLW = 4 ; } }
  if ( CLU == CLM ){ CLU = 2 ; }else{ if ( ( CLU != 0 ) && ( CLU != 6 ) ){ CLU = 4 ; } }
  if ( CLD == CLM ){ CLD = 2 ; }else{ if ( ( CLD != 0 ) && ( CLD != 6 ) ){ CLD = 4 ; } }
  
  if ( ( CLN != 0 ) && ( CLE != 0 ) && ( CLS != 0 ) && ( CLW != 0 ) && ( CLU != 0 ) && ( CLD != 0 ) ){ SRD = 1 ; }else{ SRD = 0 ; }
  
} // COLcheck()



void HPcheck(){
  
  for ( I = 0 ; I <= 390 ; I++ ){
   EXT[I] = 0 ; 
  }
  
  for ( IIIII = 0 ; IIIII <= 19 ; IIIII++ ){
   for ( I = 0 ; I <= 19 ; I++ ){
    for ( II = 0 ; II <= 19 ; II++ ){
   
      X = I ; Y = II ; W = IIIII ; 
      COLcheck() ;
      EXT[CLM] = 1 ;
      HP = KYM[I][II][IIIII] - (CLM*1000) - 100 ;
      if ( HP < 0 ){ KYM[I][II][IIIII] = 0 ; }
      if ( HP > 100 ){ KYM[I][II][IIIII] = KYM[I][II][IIIII] - (HP-100) ; }
      
    }
   }
  }
  
  EXT[0] = 0 ;
  
} // HPcheck()



void GRAVITY(){
  
  Q = 0 ;
  while( Q == 0 ){
   Q = 1 ;
   
   for ( IIIII = 0 ; IIIII <= 18 ; IIIII++ ){
    for ( I = 0 ; I <= 19 ; I++ ){
     for ( II = 0 ; II <= 19 ; II++ ){
   
     if ( ( KYM[I][II][IIIII] != 0 ) && ( KYM[I][II][IIIII+1] == 0 ) ){
      KYM[I][II][IIIII+1] = KYM[I][II][IIIII] ;
      KYM[I][II][IIIII] = 0 ;
      Q = 0 ; 
     }
      
     }
    }
   }
    
  }
  
} // GRAVITY()



void FIELDdraw(){
  
  background(200,200,200) ;
  
  stroke(0,0,0) ; noFill() ;
   for ( I = 0 ; I <= 19 ; I++ ){
     line( (((I*20)-200)*cos(A))-(((0*20)-200)*sin(A)) +300 , ( (((I*20)-200)*sin(A))+(((0*20)-200)*cos(A)) )/2 +450 +15 , (((I*20)-200)*cos(A))-(((19*20)-200)*sin(A)) +300 , ( (((I*20)-200)*sin(A))+(((19*20)-200)*cos(A)) )/2 +450 +15 ) ;
     line( (((0*20)-200)*cos(A))-(((I*20)-200)*sin(A)) +300 , ( (((0*20)-200)*sin(A))+(((I*20)-200)*cos(A)) )/2 +450 +15, (((19*20)-200)*cos(A))-(((I*20)-200)*sin(A)) +300 , ( (((19*20)-200)*sin(A))+(((I*20)-200)*cos(A)) )/2 +450 +15 ) ;
   }
  
  if ( ( A >= 0 ) && ( A <(PI/2) ) ){ 
  for ( IIIII = 19 ; IIIII >= 0 ; IIIII-- ){
   for ( I = 0 ; I <= 19 ; I++ ){
    for ( II = 0 ; II <= 19 ; II++ ){
   
     X = I ; Y = II ; W = IIIII ; 
     COLcheck() ;
     HP = KYM[I][II][IIIII] - (CLM*1000) - 100 ;
     if ( EXT[CLM] == 1 ){ stroke(0,0,0) ; fill(RRR[CLM],GGG[CLM],BBB[CLM]) ; ellipse( (((X*20)-200)*cos(A))-(((Y*20)-200)*sin(A)) +300 , ( (((X*20)-200)*sin(A))+(((Y*20)-200)*cos(A)) )/2 +450 -((19-W)*15) ,(HP/4)+5,(HP/4)+5) ; } 
           
    }
   }  
  }
  }
  
  if ( ( A >= (PI/2) ) && ( A <(PI) ) ){ 
  for ( IIIII = 19 ; IIIII >= 0 ; IIIII-- ){
   for ( II = 19 ; II >= 0 ; II-- ){
    for ( I = 0 ; I <= 19 ; I++ ){
   
     X = I ; Y = II ; W = IIIII ; 
     COLcheck() ;
     HP = KYM[I][II][IIIII] - (CLM*1000) - 100 ;
     if ( EXT[CLM] == 1 ){ stroke(0,0,0) ; fill(RRR[CLM],GGG[CLM],BBB[CLM]) ; ellipse( (((X*20)-200)*cos(A))-(((Y*20)-200)*sin(A)) +300 , ( (((X*20)-200)*sin(A))+(((Y*20)-200)*cos(A)) )/2 +450 -((19-W)*15) ,(HP/4)+5,(HP/4)+5) ; } 
           
    }
   }  
  }
  }
  
  if ( ( A >= (PI) ) && ( A <(PI*3/2) ) ){ 
  for ( IIIII = 19 ; IIIII >= 0 ; IIIII-- ){
   for ( I = 19 ; I >= 0 ; I-- ){
    for ( II = 19 ; II >= 0 ; II-- ){
   
     X = I ; Y = II ; W = IIIII ; 
     COLcheck() ;
     HP = KYM[I][II][IIIII] - (CLM*1000) - 100 ;
     if ( EXT[CLM] == 1 ){ stroke(0,0,0) ; fill(RRR[CLM],GGG[CLM],BBB[CLM]) ; ellipse( (((X*20)-200)*cos(A))-(((Y*20)-200)*sin(A)) +300 , ( (((X*20)-200)*sin(A))+(((Y*20)-200)*cos(A)) )/2 +450 -((19-W)*15) ,(HP/4)+5,(HP/4)+5) ; } 
           
    }
   }  
  }
  }
  
  if ( ( A >= (PI*3/2) ) && ( A <(2*PI) ) ){ 
  for ( IIIII = 19 ; IIIII >= 0 ; IIIII-- ){
   for ( II = 0 ; II <= 19 ; II++ ){
    for ( I = 19 ; I >= 0 ; I-- ){
   
     X = I ; Y = II ; W = IIIII ; 
     COLcheck() ;
     HP = KYM[I][II][IIIII] - (CLM*1000) - 100 ;
     if ( EXT[CLM] == 1 ){ stroke(0,0,0) ; fill(RRR[CLM],GGG[CLM],BBB[CLM]) ; ellipse( (((X*20)-200)*cos(A))-(((Y*20)-200)*sin(A)) +300 , ( (((X*20)-200)*sin(A))+(((Y*20)-200)*cos(A)) )/2 +450 -((19-W)*15) ,(HP/4)+5,(HP/4)+5) ; } 
           
    }
   }  
  }
  }
  
  if ( ROT == 1 ){
   A = A + 0.03 ;
   if ( A >= (2*PI) ){ A = 0 ; } 
  }
  
} // FIELDdraw()



void MUTATION(){
   
   BN = CLM ; FN = 0 ;
   for ( III = 1 ; III <= 399 ; III++ ){
    if ( ( EXT[III] == 0 ) && ( III != 6 ) ){ FN = III ; III = 400 ; } 
   }
   
     
   for ( III = 0 ; III <= 999 ; III++ ){
  
   Z[FN][III] = Z[BN][III]  ;
   ZZ[FN][III] = ZZ[BN][III] ;
   ZZL[FN][III] = ZZL[BN][III] ;
   ZZR[FN][III] = ZZR[BN][III] ;
   ZZN[FN][III] = ZZN[BN][III] ;
   NXTone[FN][III] = NXTone[BN][III] ;
   NXTtwo[FN][III] = NXTtwo[BN][III] ;
   ZD[FN][III] = ZD[BN][III] ;
   D[FN][III] = D[BN][III] ;
  
   } 
   
   EXT[FN] = 1 ;
   Nmax[FN] = Nmax[BN] ;
   RRR[FN] = int(random(0.0,255.9)) ;
   GGG[FN] = int(random(0.0,255.9)) ;
   BBB[FN] = int(random(0.0,255.9)) ;
   KYM[X][Y][W] = (1000*FN)+100+HP ;
   
     
  for ( III = 0 ; III <= (int(random(1.0,3.9))) ; III++ ){
   
   RND = int(random(0.0,Nmax[FN]+0.9)) ;
   
   Z[FN][RND] = int(random(1.0,5.9)) ;
   ZZ[FN][RND] = int(random(1.0,3.9)) ;
   ZZL[FN][RND] = int(random(1.0,9.9)) ;
   ZZR[FN][RND] = int(random(1.0,2.9)) ;
   ZZN[FN][RND] = int(random(0.0,9.9)) ;
   NXTone[FN][RND] = int(random(RND+1,Nmax[FN]+1.9)) ;
   NXTtwo[FN][RND] = int(random(RND+1,Nmax[FN]+1.9)) ;
   ZD[FN][RND] = int(random(1.0,2.9)) ;
   D[FN][RND] = int(random(1.0,4.9)) ;
   if ( NXTone[FN][RND] > Nmax[FN] ){ Nmax[FN] = NXTone[FN][RND] ; }
   if ( NXTtwo[FN][RND] > Nmax[FN] ){ Nmax[FN] = NXTtwo[FN][RND] ; }  
   if ( Nmax[FN] > 990 ){ Nmax[FN] = 990 ; }
    
  }
  
} // MUTATION()



void CONTROLLERdraw(){
  
  fill(200,200,200) ; stroke(200,200,200) ;
  rect(0,630,630,100) ;
  
  noFill() ; stroke(0,0,0) ;
  ellipse(100,680,70,70) ;
  if ( MODE == 0 ){ fill(255,255,0) ; }else{ noFill() ; }
  ellipse(200,680,70,70) ;
  if ( MODE == 1 ){ fill(255,255,0) ; }else{ noFill() ; }
  ellipse(300,680,70,70) ;
  if ( MODE == 2 ){ fill(255,255,0) ; }else{ noFill() ; }
  ellipse(400,680,70,70) ;
  if ( ROT == 1 ){ fill(255,255,0) ; }else{ noFill() ; }
  ellipse(500,680,70,70) ;
  
  fill(0,0,0) ;
  beginShape() ;
  vertex(95,680) ; vertex(95,660) ; vertex(75,680) ; vertex(95,700) ;
  vertex(95,680) ; vertex(115,660) ; vertex(115,700) ; vertex(95,680) ;
  endShape() ;
  
  beginShape() ;
  vertex(405,680) ; vertex(405,660) ; vertex(425,680) ; vertex(405,700) ;
  vertex(405,680) ; vertex(385,660) ; vertex(385,700) ; vertex(405,680) ;
  endShape() ;
  
  beginShape() ;
  vertex(290,660) ; vertex(290,700) ; vertex(320,680) ;
  endShape(CLOSE) ;
  
  rect(185,660,10,40) ;
  rect(205,660,10,40) ;
  
  noFill() ; strokeWeight(6) ;
  arc(500,680,40,40,-PI,PI/2) ;
  strokeWeight(2) ; fill(0,0,0) ;
  beginShape();
  vertex(490,700) ; vertex(500,690) ; vertex(500,710) ;
  endShape(CLOSE) ;
  
} // CONTROLLERdraw()



void mousePressed(){

 P = int(((mouseX-100)*(mouseX-100))+((mouseY-680)*(mouseY-680))) ;
 if ( P < (35*35) ){ MODE = 1 ; RESET() ; }
 P = int(((mouseX-200)*(mouseX-200))+((mouseY-680)*(mouseY-680))) ;
 if ( P < (35*35) ){ MODE = 0 ; PHASE = 4 ; }
 P = int(((mouseX-300)*(mouseX-300))+((mouseY-680)*(mouseY-680))) ;
 if ( P < (35*35) ){ MODE = 1 ; PHASE = 2 ; }
 P = int(((mouseX-400)*(mouseX-400))+((mouseY-680)*(mouseY-680))) ;
 if ( P < (35*35) ){ MODE = 2 ; PHASE = 2 ; }
 P = int(((mouseX-500)*(mouseX-500))+((mouseY-680)*(mouseY-680))) ;
 if ( P < (35*35) ){ if ( ROT == 1 ){ ROT = 0 ; }else{ ROT = 1 ; } }
 
 if ( ( mouseY < 580 ) && ( mouseY > 50 ) && ( mouseX < 50 ) ){ SLDX = SLDX + 40 ; }
 if ( ( mouseY < 580 ) && ( mouseY > 50 ) && ( mouseX > 580 ) ){ SLDX = SLDX - 40 ; }
 if ( ( mouseY < 630 ) && ( mouseY > 580 ) ){ SLDY = SLDY - 40 ; }
 if ( ( mouseY < 50 ) ){ SLDY = SLDY + 40 ; }
  
} // mousePressed



void RESET(){
  
   I = 1 ;
   Z[I][0] = 1 ; ZZ[I][0] = 3 ; ZZL[I][0] = 6 ; ZZR[I][0] = 1 ; ZZN[I][0] = 8 ; NXTone[I][0] = 1 ; NXTtwo[I][0] = 2 ;  // 0:IF 8<random THEN goto 1 else goto 2
   Z[I][1] = 1 ; ZZ[I][1] = 3 ; ZZL[I][1] = 6 ; ZZR[I][1] = 1 ; ZZN[I][1] = 5 ; NXTone[I][1] = 3 ; NXTtwo[I][1] = 4 ;  // 1:IF 5<random THEN goto 3 else goto 4
   Z[I][2] = 2 ; ZD[I][2] = 1 ;                                                                                        // 2: MOVE randomly
   Z[I][3] = 4 ; ZD[I][3] = 1 ;                                                                                        // 3: STAY
   Z[I][4] = 3 ; ZD[I][4] = 1 ;                                                                                        // 4: DEVIDE randomly
   Nmax[I] = 5 ;
   EXT[I] = 1 ;
   RRR[I] = 255 ; GGG[I] = 255 ; BBB[I] = 0 ;
   PHASE = 1 ; T = 0 ; SLDX = 40 ; SLDY = 40 ;
    
} // RESET()



void ALGdraw(){
  
  LY = 0 ;
  
  for ( III = 1 ; III <= 399 ; III++ ){
    if ( EXT[III] == 1 ){ LY = LY + 1 ; }
    for ( IIII = 0 ; IIII <= Nmax[III] ; IIII++ ){
      
      if ( Z[III][IIII] == 1 ){
        noFill() ;
        stroke(0,0,0) ; 
        arc( ((40*IIII+SLDX)+(40*NXTone[III][IIII]+SLDX))/2,LY*100+SLDY,((((40*IIII+SLDX)+(40*NXTone[III][IIII]+SLDX))/2)-(40*IIII+SLDX))*2,80,-PI,0) ;
        arc( ((40*IIII+SLDX)+(40*NXTtwo[III][IIII]+SLDX))/2,LY*100+SLDY,((((40*IIII+SLDX)+(40*NXTtwo[III][IIII]+SLDX))/2)-(40*IIII+SLDX))*2,80,0,PI) ;
        stroke(0,0,0) ;
        fill(RRR[III],GGG[III],BBB[III]) ;
        beginShape();
        vertex( (40*IIII+SLDX) , LY*100-20+SLDY ) ;
        vertex( (40*IIII+SLDX)+20 , LY*100+SLDY ) ;
        vertex( (40*IIII+SLDX) , LY*100+20+SLDY ) ;
        vertex( (40*IIII+SLDX)-20 , LY*100+SLDY ) ;
        endShape(CLOSE) ;
      }
      
      if ( ( Z[III][IIII] >= 2 ) && ( Z[III][IIII] <= 5 ) ){
        stroke(0,0,0) ;
        fill(RRR[III],GGG[III],BBB[III]) ;
        rect( (40*IIII+SLDX)-15 , LY*100-15+SLDY , 30 , 30 ) ;
      }
      
    }
  }
  
 if ( ( mouseY < 580 ) && ( mouseY > 50 ) && ( mouseX < 50 ) ){ SLDX = SLDX + 4 ; }
 if ( ( mouseY < 580 ) && ( mouseY > 50 ) && ( mouseX > 580 ) ){ SLDX = SLDX - 4 ; }
 if ( ( mouseY < 630 ) && ( mouseY > 580 ) ){ SLDY = SLDY - 4 ; }
 if ( ( mouseY < 50 ) ){ SLDY = SLDY + 4 ; }
  
} // ALGdraw() 
