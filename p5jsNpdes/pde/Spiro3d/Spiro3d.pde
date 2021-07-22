float d=5;
float x;
float y;
int nombreCercle = 3;    // Change number of rectangle
boolean b = true;

float x2=0;
float y2=0;
float i2=0;
float r;
boolean chocapic = false;

float dimx=50;
float dimy=10;


Cercle[] cercle = new Cercle[nombreCercle];

void setup()
{
  size(900, 900);
  background(0);
  //noStroke();
  r = random(100, 150);

  for (int i = 0; i<nombreCercle; i++)
  {
    //                              vitesse          rayon            sens          couleur
    cercle[i] = new Cercle(x, y, d, random(30, 100), random(40, 150), random(1, 3), random(50, 255), random(50, 255), random(50, 255));
  }
}

void draw()
{
  //translate(width/2, height/2);
  translate(width/2, height/2);
  x2 = cos(i2/r)*(200);
  y2 = sin(i2/r)*(200);
  i2++;


  translate(x2, y2);
  if (chocapic == true)background(0);


  for (Cercle ball : cercle) 
  {

    ball.move();
    ball.display();
  }
}

class Cercle
{

  float x;
  float y;
  float dimension; 
  float vitesse; 
  float rayon; 
  float sensRotation;
  float i;
  float couleur;
  float couleur2;
  float couleur3;


  Cercle(float xC, float yC, float dimensionC, float vitesseC, float rayonC, float sensRotationC, float couleurC, float couleur2C, float couleur3C)
  {
    x= xC;
    y=yC;
    dimension = dimensionC;
    vitesse = vitesseC;
    rayon = rayonC;
    sensRotation = sensRotationC;

    couleur = couleurC;
    couleur2 = couleur2C;
    couleur3 = couleur3C;
    i = random(0, 360);
  }

  void move() 
  {

    x = cos(i/vitesse)*rayon;
    y = sin(i/vitesse)*rayon;
    //i++;
    i = (sensRotation < 2) ? i+1 : i-1;
  }

  void display() 
  {
    fill(couleur, couleur2, couleur3);
    rotate(PI/3.0);
    rect(x, y, dimx, dimy);
  }
}

void mouseClicked() {
  if(chocapic == true)
  {
    chocapic = false;
  } else
  {
    chocapic = true;
  }
}
