int samplesPerFrame = 4;
int numFrames = 60;//60        
float shutterAngle = .8;
float mn = .5*sqrt(3), ia = atan(sqrt(.5));

boolean recording = true;

float R = 1.2;
float L = 160;
float scl = 0.013;

float radius = 800;

int n = 40000;

Star[] array = new Star[n];
