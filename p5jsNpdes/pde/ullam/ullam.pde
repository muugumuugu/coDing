boolean[] prime_state=new boolean[1002002];
boolean[][] prime_spiral=new boolean[1001][1001];
int N=1001;
int Ni=N;
int Nj=N;

void setup()
{
   noLoop();
   size(1001,1001);
   
   //----------- Derive prime numbers --------------------
   prime_state[0]=false;
   prime_state[1]=false;
   prime_state[2]=true;
   for(int n=3;n<1002002;n++)
   {
      prime_state[n]=true;
   }  
   for(int n=2;n<1002002;n++)
   {
      if(prime_state[n]==true)
      {
         for(int m=n+n;m<1002002;m+=n)
         {
            prime_state[m]=false;
         }  
      }     
   }
   //-------------Derive Prime Spiral ----------------------------------
   for(int i=0;i<N;i++)
   {
      for(int j=0;j<N;j++)
      {
         prime_spiral[j][i]=false;
      }
   }   
   String direction="rightward";
   int i=500, j=500;
   int steps_taken=0, steps_target=1;
   for(int n=1;n<1002002;n++)
   {
      prime_spiral[j][i]=prime_state[n];
      if(direction.equals("rightward"))
      {
         steps_taken++;i++;
         if(steps_taken==steps_target)
         {
            direction="upward";
            steps_taken=0;
         }   
      }  
      else if(direction.equals("upward"))
      {
         steps_taken++;j++;
         if(steps_taken==steps_target)
         {
            direction="leftward";
            steps_taken=0;
            steps_target++;
         }  
      }
      else if (direction.equals("leftward"))
      {
         steps_taken++;i--;
         if(steps_taken==steps_target)
         {
            direction="downward";
            steps_taken=0;
         }
      }
      else if(direction.equals("downward"))
      {
         steps_taken++;j--;
         if(steps_taken==steps_target)
         {
            direction="rightward";
            steps_taken=0;
            steps_target++;
         }        
      }
   } 
}  
//-----------------------------------
void draw()
{
   loadPixels();
   for(int j=0; j<Nj;j++)
   {  
      for(int i=0;i<Ni;i++)
      {
         if(prime_spiral[j][i]==true)
         {
            pixels[i+(Nj-1-j)*Ni]=color(255);
            if(i==500&&j==500)
            {
               pixels[i+(Nj-1-j)*Ni]=color(0,255,255);
            } 
         }
         else
         {
            pixels[i+(Nj-1-j)*Ni]=color(0);
            if(i==500&&j==500)
            {
               pixels[i+(Nj-1-j)*Ni]=color(0,0,255);
            }  
         }   
      }
   }
   updatePixels();
  
   textSize(30);
   text("Prime number spiral",400,200);
}  
