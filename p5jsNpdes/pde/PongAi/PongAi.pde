boolean gameStart = false;
//pallina
float x = 150;
float y = 150;
//variabili AI
float vy=150;
float cambio=0;

float speedX = random(3, 5);
float speedY = random(3, 5);

//variabili utility 
int leftColor = 128;
int rightColor = 128;
int diam;
int rectSize = 150;
float diamHit;

//posizioni centrali barre
int posizione1 = 200;
int posizione2 = 200;

//punteggi
int punteggio1=0;
int punteggio2=0;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  ellipseMode(CENTER);
}
void reset(){
  //reset
    if (keyPressed) {
    if (key == 't' || key == 'T') {
      posizione1=200;
      posizione2=200;
      punteggio1=0;
      punteggio2=0;
      
    }
  }
}
void spostamento(){
  
  //sposto il sinistro
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      if(posizione1>50)
        posizione1=posizione1-5;
      
    }
  }
  
    if (keyPressed) {
    if (key == 's' || key == 'S') {
      if(posizione1<350)
        posizione1=posizione1+5;
      
    }
  }
  
  //sposto il destro
    if (keyPressed) {
    if (key == 'i' || key == 'I') {
      if(posizione2>50)
        posizione2=posizione2-10;
      
    }
  }
  
    if (keyPressed) {
    if (key == 'k' || key == 'K') {
      if(posizione2<350)
        posizione2=posizione2+10;
      
    }
  }
}


void ai(){//funzione inteligenza artificiale
  //gAIa
  if(gameStart){
    
  if(vy<y&&posizione2<350&& cambio<=10&& y-posizione2>30)
    posizione2+=5.5;
  if(vy<y&&posizione2<350&& cambio<=10 && y-posizione2<30)
    posizione2+=3.5; 
    
  if(vy>y&&posizione2>50&& cambio<=10 && posizione2-y>30)
     posizione2-=5.5;
   if(vy>y&&posizione2>50&& cambio<=10 && posizione2-y<30)
     posizione2-=3.5;
     
  if(posizione2<=100 && posizione2>=50){
    if(posizione2<y)
      posizione2+=3.5;
    if(posizione2>y)
      posizione2-=3.5;
  } 
    if(posizione2<=350 && posizione2>=300){
    if(posizione2<y)
      posizione2+=3.5;
    if(posizione2>y)
      posizione2-=3.5;
  } 
   
  }
  cambio-=10;

}

void gioco(){
  //se viene clicckato il mouse parte il gioco 
  if (gameStart) {
    vy=y;
    x = x + speedX;
    y = y + speedY;

    // se la palla colpisce la barra giocatore2 inverto la direzione
    if ( x > width-25  && y > posizione2-50 && y < posizione2+50 ) {
      speedX = speedX * -1.1;
      x = x + speedX;
   
    } 
    //se la palla colpisce la barra del giocatore1 inverto la direzione
        else if (x < 25 && y > posizione1-50 && y < posizione1+50) {
      speedX = speedX * -1.1;
      x = x + speedX;
    
    }




    // resetta se supero il margine
    if (x <20 || x > width-20) { 
      //cambio i punteggi
      if(x<20)
        punteggio2++;
      if(x>width-20)
        punteggio1++;
      posizione1 = 200;
      posizione2 = 200; 
       
      gameStart = false;
      x = 200;
      y = 200; 
      speedX = random(3, 5);
      speedY = random(3, 5);
      rectSize = 150;

    }    
  }
  
}
void bordialt(){
      // se la palla colpisce il bordo alto o basso inverto Y  
    if ( y > height || y < 0 ) {
      speedY = speedY * -1;
      y = y + speedY;
      cambio=x;
    }
}


  void clean(){
    //sfondo
    background(0);
    //scritte 
    text("A: ",50,50);
    text("B: ", 250, 50);
    text("T for Reset", 160,300);
    text("W/S for Move", 160,320);
    text("Click for Play", 160,340);
    text(punteggio1, 70,50);
    text(punteggio2, 270,50);
    
    stroke(255);
    //scrittura barre
    line(20, posizione1 + 50, 20, posizione1 -50 );
    line(380, posizione2 + 50, 380, posizione2 -50);
    //scrittura del campo
    for(int i =0; i< 400; i++){
      if(i%10==0){
        line(200, i, 200, i+2);
      }
    }
    
    line(0,0,400,0);
    line(0,400, 400,400);
    //line(0,400, 400,0);
    line(0,400, 0,0);
    line(399,399, 399,0);
    line(399,399, 0,399);
  }



void draw() { 
  //ottengo posizione giocatore uno dalla y del mouse
  //posizione1=mouseY;
  //pulisco
  clean();
  //creo la pallina
  diam = 20;
  ellipse(x, y, diam, diam);
  //se premo t resetto
  reset();
  //se vengono premuti i tasti di movimento sposto i rettangoli
  spostamento();
  //muovo la pallina
  gioco();
  //ai
  ai();
  //inverto la posizione se arrivo ai bordi
  bordialt();
}



void mousePressed() {
  gameStart = !gameStart;
   posizione1 = 200;
   posizione2 = 200;
}
