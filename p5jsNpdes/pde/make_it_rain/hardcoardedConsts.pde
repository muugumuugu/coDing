int[][] pixelSet;
//--------------------------
int samplesPerFrame = 4;//5
int numFrames = 50;     //10   
float shutterAngle = 0.9;//random(0.5,0.9);//0.8

boolean saving = true;

float t, c;
//------------------------
float fieldDensity=9;//int(random(2,20));//15
int intensityExp=26;//int(random(5,45));//35
float dt = 0.4;//integration limit//0.2
//--------------------------
int NParticles = 1000;//5000
int NOrigins = 50;//60
Origin[] midPts = new Origin[NOrigins];
Locus[] loci = new Locus[NParticles];
//---------------------------------
int nsteps =25;//int(random(5,200));//100
//--------------------------------------
float bound=5;
float drag =0.90;//random(0.90.99999995);// 0.95; // fluid friction time
