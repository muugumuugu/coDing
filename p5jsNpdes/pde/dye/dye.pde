//Fluid Dynamics 2D

FluidBox fSim;

void setup(){
  size(500,500);
  noStroke(); 
  fill(255);
  fSim = new FluidBox(126, 10, .00001, 111.01);
}

void draw(){
  background(0);
  fSim.simulate();
}

class FluidBox{
 
  int       N;
  float     diffusion;
  float     dt;
  float     visc;
  float[][] u, v;
  float[][] u_prv, v_prv;
  float[][] dens, dens_prv;
 
  FluidBox(int dim, float diff, float time, float vs){
  N         = dim;   
  dt        = time;
  diffusion = diff;
  visc      = vs;
 
  u        = new float[N+2][N+2];
  v        = new float[N+2][N+2];
  u_prv    = new float[N+2][N+2];
  v_prv    = new float[N+2][N+2];
  dens     = new float[N+2][N+2];
  dens_prv = new float[N+2][N+2];
 
  init();
  }

//_____________________INITIALIZING FORCES_______________________________
  void init() {
   
    float xoff = 0;
    for (int i = 0; i < N; i++) {
      float yoff = 0;
      for (int j = 0; j < N; j++) {
        float theta = map(noise(xoff,yoff),0,1,0,TWO_PI*2);
        u[i][j] = cos(theta)*1500;
        v[i][j] = sin(theta)*1500;       
        u_prv[i][j] = cos(theta)*1500;
        v_prv[i][j] = sin(theta)*1500;
        dens[i][j] = 0;
        dens_prv[i][j] = 0;
      
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }
 
//_____________________SIMULATION_______________________________ 
  void simulate(){
    vel_step (N, u, v, u_prv, v_prv, 1, dt);
    dens_step(N, dens, dens_prv, u, v, diffusion, dt);
    fluid_draw();     
  } 

  void dens_step ( int N, float[][] x, float[][] x0, float[][] u, float[][] v, float diff, float dt){
  
    if(mousePressed && (mouseButton == LEFT)) {
      dens[(int) mouseX/4][(int) mouseY/4] = 100;
    }
   
    add_source(x, x0, dt);
    SWAP(x0, x);   
    diffuse(N, 0, x, x0, diff, dt);   
    SWAP(x0, x);  
    advect(N, 0, x, x0, u, v, dt);
   
  }
 
  void vel_step (int N, float[][] u, float[][] v, float[][] u0, float[][] v0, float visc, float dt){
   
    add_source(u, u0, dt);
    add_source(v, v0, dt);
    SWAP(u0, u);
    diffuse(N, 1, u, u0, visc, dt);
    SWAP(v0, v);
    diffuse(N, 2, v, v0, visc, dt);
    project(N, u, v, u0, v0);
    SWAP(u0, u); SWAP(v0, v);
    advect(N, 1, u, u0, u0, v0, dt);
    advect(N, 1, v, v0, u0, v0, dt);
    project(N, u, v, u0, v0);
  } 

  void diffuse (int N, int b, float[][] x, float[][] x0, float diff, float dt){
    int i,j,k;
    float a = dt*diff*N*N;
    for( k=0 ; k<5 ; k++) {  //why 5 iterations?
      for( i=1 ; i<=N ; i++) { 
        for( j=1 ; j<=N ; j++) { 
          x[i][j] = (x0[i][j] + a*(x[i-1][j] + x[i+1][j]+x[i][j-1]+x[i][j+1]))/(1+4*a);
        }
      }
      set_bnd( N, b, x ); 
    } 
  }
 
  void advect(int N, int b, float[][] d, float[][] d0, float[][] u, float[][] v, float dt){
    int i, j, i0, j0, i1, j1;
    float x, y, s0, t0, s1, t1, dt0;
   
    dt0 = dt*N;
    for( i=1 ; i<=N ; i++){
      for( j=1 ; j<=N ; j++){
        x = i-dt0*u[i][j]; y = j-dt0*v[i][j];
        if (x<0.5) x=0.5; if (x>N+0.5) x=N+ 0.5; i0=(int)x; i1=i0+1;
        if (y<0.5) y=0.5; if (y>N+0.5) y=N+ 0.5; j0=(int)y; j1=j0+1;
        s1 = x-i0; s0 = 1-s1; t1 = y-j0; t0 = 1-t1;
        d[i][j] = s0*(t0*d0[i0][j0]+t1*d0[i0][j1])+
        s1*(t0*d0[i1][j0]+t1*d0[i1][j1]);
      } 
    }
    set_bnd( N, b, d );
  }

  void set_bnd ( int N, int b, float[][] x){
    int i;
    //reversing forces at edges
    for( i=1 ; i <= N ; i++) {
      x[ 0 ][ i ] = b==1 ? -x[1][i] : x[1][i];
      x[N+1][ i ] = b==1 ? -x[N][i] : x[N][i];
      x[ i ][ 0 ] = b==2 ? -x[i][1] : x[i][1];
      x[ i ][N+1] = b==2 ? -x[i][N] : x[i][N];
    }
    //corners
    x[ 0 ][ 0 ] = 0.5*(x[ 1 ][ 0 ]+x[ 0 ][ 1 ]);
    x[ 0 ][N+1] = 0.5*(x[ 1 ][N+1]+x[ 0 ][ N ]);
    x[N+1][ 0 ] = 0.5*(x[ N ][ 0 ]+x[N+1][ 1 ]);
    x[N+1][N+1] = 0.5*(x[ N ][N+1]+x[N+1][ N ]);
  }

  void add_source(float[][] x, float[][] s, double dt) {
        int i, j;
        for (i = 0; i < N; i++){
          for (j = 0; j < N; j++){
            x[i][j] += dt * s[i][j];
          }
        }
  }
    
  void project (int N, float[][] u, float[][] v, float[][] p, float[][] dv){
    
    int i, j, k;
    float h;  h = 1.0/N;
   
    for ( i=1 ; i<=N ; i++ ) {
      for ( j=1 ; j<=N ; j++ ) {
        dv[i][j] = -0.5*h*(u[i+1][j]-u[i-1][j]+
        v[i][j+1]-v[i][j-1]);
        p[i][j] = 0;
      }
    }

    set_bnd ( N, 0, dv ); set_bnd ( N, 0, p );
    for ( k=0 ; k<20 ; k++ ) {
      for ( i=1 ; i<=N ; i++ ) {
        for ( j=1 ; j<=N ; j++ ) {
          p[i][ j ] = (dv[i][j]+p[i-1][j]+p[i+1][j]+
          p[i][j-1]+p[i][j+1])/4;
        }
      }
      set_bnd ( N, 0, p );
    }
      for ( i=1 ; i<=N ; i++ ) {
        for ( j=1 ; j<=N ; j++ ) {
          u[i][j] -= 0.5*(p[i+1][ j ]-p[i-1][ j ])/h;
          v[i][j] -= 0.5*(p[ i ][j+1]-p[ i ][j-1])/h;
        }
      }
      set_bnd ( N, 1, u ); set_bnd ( N, 2, v );
  }
 
  void SWAP(float[][] x0, float[][] x) {
        float[][] tmp = new float[N+2][N+2];
        arraycopy(x0, tmp);
        arraycopy(x, x0);
        arraycopy(tmp, x);
  }

  void fluid_draw(){
    int i, j;
   
    for( i=0 ; i<=N ; i++){
      for( j=0 ; j<=N ; j++){
        stroke(255,0,0);
        line(i*4, j*4, i*4+u[i][j]*.006, j*4-v[i][j]*.006);
        noStroke();
        fill(map(dens[i][j],0,.75,150,255),map(dens[i][j],0,.75,0,255), map(dens[i][j],0,.75,255,100));
        ellipse(i*4, j*4, constrain(dens[i][j]*3,2,10), constrain(dens[i][j]*3,2,10));
      }
    }
  }
}
