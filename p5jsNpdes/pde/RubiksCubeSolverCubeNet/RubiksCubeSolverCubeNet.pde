//-----------------------------------------
// Programmed by John Costello  07/06/2020
//-----------------------------------------

byte[] cell = new byte[55];            // The two-dimensional visual grid of cells, where each sticker is located.
byte[] stickerRequiredByCell = new byte[55]; // The stickerRequiredByCell[k] gives the sticker_number required by cell[k] for the sticker to be in the correct cell relative the cube's center stickers.
byte[] cellOfStickerRequiredByCell = new byte[55];  // Is the cell number that a stricker is in, where that sticker is required by a different cell.
byte[] stickerColour = new byte[55];  // The sticker_color of each sticker.
byte[] cellOfSticker = new byte[55];  // Gives the value of the cell where a sticker is held
byte[] cellRequiredBySticker= new byte[55];
byte startColourFrontFace=-1;         // The colour of the front face of the cube when stage one is started.
byte startColourTopFace=-2;           // The colour of the top face of the cube when stage one is started.
byte activeSticker=0;                   // The sticker that the programs is currently try to move to its correct cell.
byte animatedMode=0;
byte stage=0;
byte stageToComplete=1;
byte stageCounter=0;
byte subStage=0;
byte subStageCounter=0;
byte subSubStage=0;
int scrambleCounter;
int autoButtonSequence;
int sequenceCounter;
//int delayValue=10;
int frameRateCounter=0;
int frameRateModValue=2;
float[] cellXLoc = new float[55];     // The visual display x-location of each cell.
float[] cellYLoc= new float[55];      // The visual display y-location of each cell.
float[] buttonXLoc= new float[19];    // The visual display x-location of each circular button.
float[] buttonYLoc= new float[19];    // The visual display y-location of each circular button.
float[] disToButton= new float[19];   // The distance of the mouse to the centre of that button.
float rectTitleDatumX=80;             // The visual display datum in the x-axis for the title.
float rectTitleDatumY=150;            // The visual display datum in the y-axis for the title.
float cellLength=50;                  // The visual display length of each cell.
float cellDatumX=100;                 // The visual display datum in the x-axis of the cells.
float cellDatumY=250;                 // The visual display datum in the y-axis of the cells.
float rectButtonDatumX=850;           // The visual display datum in the x-axis of the rectangular buttons.
float rectButtonDatumY=120;           // The visual display datum in the y-axis of the rectangular buttons.
float rectButtonWidth=130;            // The visual display length in the x-axis of the rectangular buttons.
float rectButtonHeight=40;            // The visual display height in the y-axis of the rectangular buttons.
float buttonDiameter=0.8*cellLength;  // The visual display diameter of circular buttons.
float buttonRadius=0.4*buttonDiameter;  // The visual display diameter of circular buttons.
byte buttonPrimed,buttonHoovering, buttonReleased, buttonSelected;  // Conditions relating to pressing the buttons
boolean mouseLongTimePressed;      // Conditions relating to pressing the buttons such that the buttons does not activate until mouse is released
boolean displayNumbers=false;         // Set to 'true' to show numbers relating to cells.
String name;

byte[] centerStickers={26,5,29,50,23,32};

byte[] centerCellsFrBtBkTp={26,50,32,5};     byte[] centerStickersFrBtBkTp={26,50,32,5};
byte[] centerCellsLtFrRtBk={26,29,32,23};   byte[] centerStickersLtFrRtBk={26,29,32,23};

byte[] frontFaceEdgeCells={38,25,14,27};      byte[] frontFaceEdgeStickers={38,25,14,27};
byte[] topFaceEdgeCells={2,4,6,8};               byte[] topFaceEdgeStickers={2,4,6,8};
byte[] bottomFaceEdgeCells={47,49,51,53};   byte[] bottomFaceEdgeStickers={47,49,51,53};
byte[] leftFaceEdgeCells={11,22,24,35};       byte[] leftFaceEdgeStickers={11,22,24,35};
byte[] rightFaceEdgeCells={17,28,41,30};    byte[] rightFaceEdgeStickers={17,28,41,30};
byte[] backFaceEdgeCells={20,31,44,33};      byte[] backFaceEdgeStickers={20,31,44,33};

byte[] frontRimEdgeCells={8,24,47,28};         byte[] frontRimEdgeStickers={8,24,47,28};
byte[] topRimEdgeCells={11,14,17,20};         byte[] topRimEdgeStickers={11,14,17,20};
byte[] bottomRimEdgeCells={35,38,41,44};     byte[] bottomRimEdgeStickers={35,38,41,44};
byte[] backRimEdgeCells={2,22,30,53};          byte[] backRimEdgeStickers={2,22,30,53};
byte[] leftRimEdgeCells={4,25,33,49};           byte[] leftRimEdgeStickers={4,25,33,49};
byte[] rightRimEdgeCells={6,27,31,51};        byte[] rightRimEdgeStickers={6,27,31,51};

byte[] frontFaceCornerCells={13,15,37,39};
byte[] frontRimCornerCells={7,9,12,16,36,40,46,48};
byte[] backFaceCornerCells={19,21,43,45};
byte[] backRimCornerCells={1,3,10,18,34,42,52,54};

byte[] redCornerStickers={13,15,37,39};
byte[] yellowCornerStickers={1,3,7,9};
byte[] greenCornerStickers={16,18,40,42};
byte[] whiteCornerStickers={46,48,52,54};
byte[] blueCornerStickers={10,12,34,36};
byte[] orangeCornerStickers={19,21,43,45};

byte[] redEdgeStickers={38,25,14,27};
byte[] yellowEdgeStickers={2,4,6,8};
byte[] greenEdgeStickers={17,28,41,30};
byte[] whiteEdgeStickers={47,49,51,53};
byte[] blueEdgeStickers={11,22,24,35};
byte[] orangeEdgeStickers={20,31,44,33};

byte[] redOrangeAxisMidRegionEdgeStickers={4,6,11,17,35,41,49,51};
byte[] yellowWhiteAxisMidRegionEdgeStickers={22,24,25,27,28,30,31,33};
byte[] greenBlueAxisMidRegionEdgeStickers={2,8,14,20,38,44,47,53};
byte[] activeMidRegionEdgeStickers={0,0,0,0,0,0,0,0};

byte[][] cellCornerCubelet={{0,0,0},{7,12,13},{9,15,16},{39,40,48},{36,37,46},{1,10,21},{3,18,19},{42,43,54},{34,45,52}};

void setup()
{
   frameRate(60);
   size(1050,850);
   background(212);
   reset();
   //----------------------
   stroke(0);
   strokeWeight(1);
   textSize(100);
   fill(0,0,255);
   text('R',rectTitleDatumX,rectTitleDatumY);
   fill(255,255,0);
   text('u',rectTitleDatumX+75,rectTitleDatumY);
   fill(0,255,0);
   text('b',rectTitleDatumX+135,rectTitleDatumY);
   fill(255,0,0);
   text('i',rectTitleDatumX+195,rectTitleDatumY);  
   fill(255);
   text('k',rectTitleDatumX+225,rectTitleDatumY); 
   fill(255,127,0);
   text("'",rectTitleDatumX+285,rectTitleDatumY); 
   fill(255,127,0);
   text("s",rectTitleDatumX+300,rectTitleDatumY);
   fill(255,0,0);
   text('C',rectTitleDatumX+415,rectTitleDatumY);
   fill(0,255,0);
   text('u',rectTitleDatumX+490,rectTitleDatumY);
   fill(0,0,255);
   text('b',rectTitleDatumX+550,rectTitleDatumY);
   fill(255,255,0);
   text('e',rectTitleDatumX+610,rectTitleDatumY);   
}
//====================================================================================================================
void draw()
{  
   frameRateCounter++;
   if(frameRateCounter>59)frameRateCounter=0;
   if(animatedMode==0)
   {
      for(byte k=1;k<=18;k++)
      {
         disToButton[k]=(sqrt(sq(mouseX-buttonXLoc[k])+sq(mouseY-buttonYLoc[k])));
      }
      if(mousePressed==true && mouseLongTimePressed==false)
      {  
         if(mouseX>=rectButtonDatumX && mouseX<=rectButtonDatumX+rectButtonWidth)
         {
            if(mouseY>=rectButtonDatumY && mouseY<=rectButtonDatumY+rectButtonHeight){buttonPrimed=19;}
            else if(mouseY>=rectButtonDatumY+2*rectButtonHeight && mouseY<=rectButtonDatumY+3*rectButtonHeight){buttonPrimed=20;}
            else if(mouseY>=rectButtonDatumY+4*rectButtonHeight && mouseY<=rectButtonDatumY+5*rectButtonHeight){buttonPrimed=21;}
            else if(mouseY>=rectButtonDatumY+6*rectButtonHeight && mouseY<=rectButtonDatumY+7*rectButtonHeight){buttonPrimed=22;}
            else if(mouseY>=rectButtonDatumY+8*rectButtonHeight && mouseY<=rectButtonDatumY+9*rectButtonHeight){buttonPrimed=23;}
            else if(mouseY>=rectButtonDatumY+10*rectButtonHeight && mouseY<=rectButtonDatumY+11*rectButtonHeight){buttonPrimed=24;}
            else if(mouseY>=rectButtonDatumY+12*rectButtonHeight && mouseY<=rectButtonDatumY+13*rectButtonHeight){buttonPrimed=25;}
            else if(mouseY>=rectButtonDatumY+14*rectButtonHeight && mouseY<=rectButtonDatumY+15*rectButtonHeight){buttonPrimed=26;}
            else if(mouseY>=rectButtonDatumY+16*rectButtonHeight && mouseY<=rectButtonDatumY+17*rectButtonHeight){buttonPrimed=27;}
         }
         else
         {
            for(byte k=1;k<=18;k++)
            {
               if(disToButton[k]<=buttonRadius){buttonPrimed=k;}
            }
         }
         mouseLongTimePressed=true;
      }
      if(mousePressed==true && mouseLongTimePressed==true) 
      {
         buttonHoovering=0;
         if(mouseX>=rectButtonDatumX && mouseX<=rectButtonDatumX+rectButtonWidth)
         {
            if(mouseY>=rectButtonDatumY && mouseY<=rectButtonDatumY+rectButtonHeight){buttonHoovering=19;}
            else if(mouseY>=rectButtonDatumY+2*rectButtonHeight && mouseY<=rectButtonDatumY+3*rectButtonHeight){buttonHoovering=20;}
            else if(mouseY>=rectButtonDatumY+4*rectButtonHeight && mouseY<=rectButtonDatumY+5*rectButtonHeight){buttonHoovering=21;}
            else if(mouseY>=rectButtonDatumY+6*rectButtonHeight && mouseY<=rectButtonDatumY+7*rectButtonHeight){buttonHoovering=22;}
            else if(mouseY>=rectButtonDatumY+8*rectButtonHeight && mouseY<=rectButtonDatumY+9*rectButtonHeight){buttonHoovering=23;}
            else if(mouseY>=rectButtonDatumY+10*rectButtonHeight && mouseY<=rectButtonDatumY+11*rectButtonHeight){buttonHoovering=24;}
            else if(mouseY>=rectButtonDatumY+12*rectButtonHeight && mouseY<=rectButtonDatumY+13*rectButtonHeight){buttonHoovering=25;}
            else if(mouseY>=rectButtonDatumY+14*rectButtonHeight && mouseY<=rectButtonDatumY+15*rectButtonHeight){buttonHoovering=26;}
            else if(mouseY>=rectButtonDatumY+16*rectButtonHeight && mouseY<=rectButtonDatumY+17*rectButtonHeight){buttonHoovering=27;}
         }
         else
         {
            for(byte k=1;k<=18;k++)
            {
               if(disToButton[k]<=buttonRadius){buttonHoovering=k;}
            }   
         }
         strokeWeight(2);
         stroke(0);
         fill(255,255,0);
         for(byte k=1;k<=18;k++)
         {
            if(buttonPrimed==k)
            {
               if(buttonHoovering==k)
               {  
                  strokeWeight(2);
                  stroke(0);
                  fill(225,255,0);
                  ellipse(buttonXLoc[k],buttonYLoc[k],buttonDiameter,buttonDiameter);
               }
               else
               {
                  strokeWeight(4);
                  stroke(255,150,50);
                  fill(212);
                  ellipse(buttonXLoc[k],buttonYLoc[k],buttonDiameter-6,buttonDiameter-6);
               }  
            }
         }
         strokeWeight(2);
         stroke(0);
         fill(225,255,0);
         if(buttonPrimed==19 && buttonHoovering==19){rect(rectButtonDatumX,rectButtonDatumY,rectButtonWidth,rectButtonHeight);}
         if(buttonPrimed==20 && buttonHoovering==20){rect(rectButtonDatumX,rectButtonDatumY+2*rectButtonHeight,rectButtonWidth,rectButtonHeight);}
         if(buttonPrimed==21 && buttonHoovering==21){rect(rectButtonDatumX,rectButtonDatumY+4*rectButtonHeight,rectButtonWidth,rectButtonHeight);}
         if(buttonPrimed==22 && buttonHoovering==22){rect(rectButtonDatumX,rectButtonDatumY+6*rectButtonHeight,rectButtonWidth,rectButtonHeight);}
         if(buttonPrimed==23 && buttonHoovering==23){rect(rectButtonDatumX,rectButtonDatumY+8*rectButtonHeight,rectButtonWidth,rectButtonHeight);}
         if(buttonPrimed==24 && buttonHoovering==24){rect(rectButtonDatumX,rectButtonDatumY+10*rectButtonHeight,rectButtonWidth,rectButtonHeight);}
         if(buttonPrimed==25 && buttonHoovering==25){rect(rectButtonDatumX,rectButtonDatumY+12*rectButtonHeight,rectButtonWidth,rectButtonHeight);}
         if(buttonPrimed==26 && buttonHoovering==26){rect(rectButtonDatumX,rectButtonDatumY+14*rectButtonHeight,rectButtonWidth,rectButtonHeight);}
         if(buttonPrimed==27 && buttonHoovering==27){rect(rectButtonDatumX,rectButtonDatumY+16*rectButtonHeight,rectButtonWidth,rectButtonHeight);}
         drawFastSlowLine();
         strokeWeight(4);
         stroke(255,150,50);
         fill(212);
         if(buttonPrimed==19 && buttonHoovering!=19){rect(rectButtonDatumX+3,rectButtonDatumY+3,rectButtonWidth-6,rectButtonHeight-6);}
         if(buttonPrimed==20 && buttonHoovering!=20){rect(rectButtonDatumX+3,rectButtonDatumY+3+2*rectButtonHeight,rectButtonWidth-6,rectButtonHeight-6);}
         if(buttonPrimed==21 && buttonHoovering!=21){rect(rectButtonDatumX+3,rectButtonDatumY+3+4*rectButtonHeight,rectButtonWidth-6,rectButtonHeight-6);}
         if(buttonPrimed==22 && buttonHoovering!=22){rect(rectButtonDatumX+3,rectButtonDatumY+3+6*rectButtonHeight,rectButtonWidth-6,rectButtonHeight-6);}
         if(buttonPrimed==23 && buttonHoovering!=23){rect(rectButtonDatumX+3,rectButtonDatumY+3+8*rectButtonHeight,rectButtonWidth-6,rectButtonHeight-6);}
         if(buttonPrimed==24 && buttonHoovering!=24){rect(rectButtonDatumX+3,rectButtonDatumY+3+10*rectButtonHeight,rectButtonWidth-6,rectButtonHeight-6);}
         if(buttonPrimed==25 && buttonHoovering!=25){rect(rectButtonDatumX+3,rectButtonDatumY+3+12*rectButtonHeight,rectButtonWidth-6,rectButtonHeight-6);}
         if(buttonPrimed==26 && buttonHoovering!=26){rect(rectButtonDatumX+3,rectButtonDatumY+3+14*rectButtonHeight,rectButtonWidth-6,rectButtonHeight-6);}
         if(buttonPrimed==27 && buttonHoovering!=27){rect(rectButtonDatumX+3,rectButtonDatumY+3+16*rectButtonHeight,rectButtonWidth-6,rectButtonHeight-6);}     
         drawButtonSymbols();
         drawFastSlowLine();
      }
      buttonReleased=0;
      buttonSelected=0;
      if(mousePressed==false && mouseLongTimePressed==true)
      {   
         if(mouseX>=rectButtonDatumX && mouseX<=rectButtonDatumX+rectButtonWidth)
         {
            if(mouseY>=rectButtonDatumY && mouseY<=rectButtonDatumY+rectButtonHeight){if(buttonPrimed==19){buttonSelected=19;}}
            else if(mouseY>=rectButtonDatumY+2*rectButtonHeight && mouseY<=rectButtonDatumY+3*rectButtonHeight){if(buttonPrimed==20){buttonSelected=20;}}
            else if(mouseY>=rectButtonDatumY+4*rectButtonHeight && mouseY<=rectButtonDatumY+5*rectButtonHeight){if(buttonPrimed==21){buttonSelected=21;}}
            else if(mouseY>=rectButtonDatumY+6*rectButtonHeight && mouseY<=rectButtonDatumY+7*rectButtonHeight){if(buttonPrimed==22){buttonSelected=22;}}
            else if(mouseY>=rectButtonDatumY+8*rectButtonHeight && mouseY<=rectButtonDatumY+9*rectButtonHeight){if(buttonPrimed==23){buttonSelected=23;}}
            else if(mouseY>=rectButtonDatumY+10*rectButtonHeight && mouseY<=rectButtonDatumY+11*rectButtonHeight){if(buttonPrimed==24){buttonSelected=24;}}
            else if(mouseY>=rectButtonDatumY+12*rectButtonHeight && mouseY<=rectButtonDatumY+13*rectButtonHeight){if(buttonPrimed==25){buttonSelected=25;}}
            else if(mouseY>=rectButtonDatumY+14*rectButtonHeight && mouseY<=rectButtonDatumY+15*rectButtonHeight){if(buttonPrimed==26){buttonSelected=26;}}
            else if(mouseY>=rectButtonDatumY+16*rectButtonHeight && mouseY<=rectButtonDatumY+17*rectButtonHeight){if(buttonPrimed==27){buttonSelected=27;}}
         }
         else
         {
            for(byte k=1;k<=18;k++)
            {  
               if(disToButton[k]<=buttonRadius){buttonReleased=k;}
               if(buttonPrimed==k && buttonReleased==k){buttonSelected=k;}
            }
         }   
         mouseLongTimePressed=false;
         drawButtons();
      }
      if(mousePressed==false)
      {
         mouseLongTimePressed=false;
         buttonPrimed=0;
      }
      if(buttonSelected>=1 && buttonSelected<=18)
      { 
         cubeButton(buttonSelected);
         drawCube();
      }
      if(buttonSelected==19)
      {
         //name=JOptionPane.showInputDialog("        Greetings\n\n"+"Please enter your name: " + "");
         //JOptionPane.showMessageDialog(null,"     Hello "+name+"\n\nBest of luck with Rubik's Cube");
         //JOptionPane.showMessageDialog(null,"With the Rubik's Cube, a popular way to solve it is to pick a\n side and firstly get the four edge cubelets for that side.\n"+
         // "Then get the four corner cublets for the same side.\nThen get the four edge cubelets for the mid region of the cube.\n"+
         // "Then the four edge cubelets for the far side of the cube.\nAnd lastly the four corner cubelets of the far side of the cube.");  
         toggleDelayValue();
      }
      if(buttonSelected==20)
      {  
         reset();
      }
      if(buttonSelected==21)
      {
         animatedMode=1;
         scrambleCounter=0;
      }
      if(buttonSelected==22)
      {
         solveOne();
      }
      if(buttonSelected==23)
      {
         solveTwo();
      }
      if(buttonSelected==24)
      {
         solveThree();
      }
      if(buttonSelected==25)
      {
         solveFour();
      }
      if(buttonSelected==26)
      {  
         solveFive();
      }
      if(buttonSelected==27)
      {  
         toggleNumbers();
      }
   }
   else if(animatedMode==1)
   {    
      if(frameRateCounter%frameRateModValue==0)
      {
         scramble();
         drawCube();
      }
   }  
   else if(animatedMode==2)
   {
      //print(" ("+stage+","+subStage+","+subSubStage+") ");
      if(stage==1 && stage<=stageToComplete){stageOne();}
      else if(stage==2 && stage<=stageToComplete){stageTwo();}
      else if(stage==3 && stage<=stageToComplete){stageThree();}
      else if(stage==4 && stage<=stageToComplete){stageFour();}
      else if(stage==5 && stage<=stageToComplete){stageFive();}
      else{animatedMode=0;}
      
   }
   else if(animatedMode==3)
   {
      if(frameRateCounter%frameRateModValue==0)
      {
         cubeAutomatedSequence();
         drawCube();
      }   
   }
}
//====================================================================================================================
void reset()
{  
   for(byte k=0;k<=54;k++)
   {
      cell[k]=k;
      stickerRequiredByCell[k]=k;
      cellOfStickerRequiredByCell[k]=k; 
      cellRequiredBySticker[k]=k;
   }
   for(byte k=0;k<=54;k++)
   {
      cellOfSticker[cell[k]]=k;
   }
   for(byte i=1;i<=3;i++)
   {
      for(byte j=0;j<3;j++)
      {
          stickerColour[i+j*3]=-2;     // Yellow stickers are represented by the stickerColour value -2.
          stickerColour[9+i+j*12]=-5;  // Blue stickers are represented by the stickerColour value -5.
          stickerColour[12+i+j*12]=-1;  // Red stickers are represented by the stickerColour value -1. 
          stickerColour[15+i+j*12]=-3;  // Green stickers are represented by the stickerColour value -3.
          stickerColour[18+i+j*12]=-6;  // Orange sticker are represented by the stickerColour value -6.
          stickerColour[45+i+j*3]=-4;   // White stickers are represented by the stickerColour value -4.
          //--------------------------------------------------------------
          cellXLoc[i+j*3]=cellDatumX+(2+i)*cellLength;
          cellXLoc[9+i+j*12]=cellDatumX+(i-1)*cellLength;
          cellXLoc[12+i+j*12]=cellDatumX+(2+i)*cellLength;
          cellXLoc[15+i+j*12]=cellDatumX+(5+i)*cellLength;
          cellXLoc[18+i+j*12]=cellDatumX+(8+i)*cellLength;
          cellXLoc[45+i+j*3]=cellDatumX+(2+i)*cellLength;
          //--------------------------------------------------------------
          cellYLoc[i+j*3]=cellDatumY+(j)*cellLength;
          cellYLoc[9+i+j*12]=cellDatumY+(3+j)*cellLength;
          cellYLoc[12+i+j*12]=cellDatumY+(3+j)*cellLength;
          cellYLoc[15+i+j*12]=cellDatumY+(3+j)*cellLength;
          cellYLoc[18+i+j*12]=cellDatumY+(3+j)*cellLength;
          cellYLoc[45+i+j*3]=cellDatumY+(6+j)*cellLength;
      }
   }
   drawCube();
   drawButtons();
}
//=============================================================================================
void solveOne()
{  
   stage=1;
   subStage=1;
   subSubStage=1;
   stageToComplete=1;
   animatedMode=2;
}  
//=============================================================================================
void solveTwo()
{    
   stage=1;
   subStage=1;
   subSubStage=1;
   stageToComplete=2;
   animatedMode=2;
}  
//=============================================================================================
void solveThree()
{  
   stage=1;
   subStage=1;
   subSubStage=1;
   stageToComplete=3;
   animatedMode=2;
}  
//=============================================================================================
void solveFour()
{   
   stage=1;
   subStage=1;
   subSubStage=1;
   stageToComplete=4;
   animatedMode=2;
}  
//=============================================================================================
void solveFive()
{  
   stage=1;
   subStage=1;
   subSubStage=1;
   stageToComplete=5;
   animatedMode=2;
}  
//===============================================================================================
void scramble()
{   
    //delay(delayValue);
    if(scrambleCounter<100)
    {
       cubeButton(byte(1+random(18)));
       scrambleCounter++;
    }  
    else
    {
       animatedMode=0;
    }  
}
//=====================================================
void toggleNumbers()
{
   if(displayNumbers==false)
   {
      displayNumbers=true;
   } 
   else
   {
      displayNumbers=false; 
   }  
   drawCube();
}  
//=======================================================
void toggleDelayValue()
{
   if(frameRateModValue<10)
   {
      frameRateModValue=15;
   } 
   else
   {
      frameRateModValue=2;
   }
   drawButtons();
}  
//================================================================================================
void drawCube()
{  
   strokeWeight(1);
   for(byte k=1;k<=54;k++)
   {
      if(stickerColour[cell[k]]==-2){fill(255,255,0);}  // Fill cell yellow.
      else if(stickerColour[cell[k]]==-5){fill(0,0,255);}  // Fill cell blue.
      else if(stickerColour[cell[k]]==-1){fill(255,0,0);}  // Fill cell red.
      else if(stickerColour[cell[k]]==-3){fill(0,255,0);}  // Fill cell green.
      else if(stickerColour[cell[k]]==-6){fill(255,127,0);}  // Fill cell orange.     
      else if(stickerColour[cell[k]]==-4){fill(255,255,255);}  // Fill cell white.
      rect(cellXLoc[k],cellYLoc[k],cellLength,cellLength);
      textSize(cellLength/5);
      fill(0);
      if(displayNumbers==true)
      {
         text(k,cellXLoc[k]+1,cellYLoc[k]+10);
         text(stickerRequiredByCell[k],cellXLoc[k]+1,cellYLoc[k]+cellLength-12);
         text(cellOfStickerRequiredByCell[k],cellXLoc[k]+1,cellYLoc[k]+cellLength-2);
         textSize(cellLength*3/10);
         text(cell[k],cellXLoc[k]+cellLength-19,cellYLoc[k]+15);
         textSize(cellLength/5);
         text(cellRequiredBySticker[cell[k]],cellXLoc[k]+cellLength-13,cellYLoc[k]+cellLength-12);
         //text("",cellXLoc[k]+cellLength-13,cellYLoc[k]+cellLength-2);
      }
   }
}
//=============================================================================================
void drawButtons()
{
   buttonXLoc[1]=cellXLoc[1]+cellLength/2;
   buttonXLoc[2]=cellXLoc[2]+cellLength/2;
   buttonXLoc[3]=cellXLoc[3]+cellLength/2;
   buttonXLoc[4]=cellXLoc[52]+cellLength/2;
   buttonXLoc[5]=cellXLoc[53]+cellLength/2;
   buttonXLoc[6]=cellXLoc[54]+cellLength/2;
   buttonXLoc[7]=cellXLoc[10]-cellLength/2;
   buttonXLoc[8]=cellXLoc[22]-cellLength/2;
   buttonXLoc[9]=cellXLoc[34]-cellLength/2;
   buttonXLoc[10]=cellXLoc[21]+3*cellLength/2;
   buttonXLoc[11]=cellXLoc[33]+3*cellLength/2;
   buttonXLoc[12]=cellXLoc[45]+3*cellLength/2;
   buttonXLoc[13]=cellXLoc[16]+cellLength/2;
   buttonXLoc[14]=cellXLoc[16]+cellLength/2+0.75*cellLength;
   buttonXLoc[15]=cellXLoc[16]+cellLength/2+0.75*2*cellLength;
   buttonXLoc[16]=cellXLoc[40]+cellLength/2;
   buttonXLoc[17]=cellXLoc[40]+cellLength/2+0.75*cellLength;
   buttonXLoc[18]=cellXLoc[40]+cellLength/2+0.75*2*cellLength;
   
   buttonYLoc[1]=cellYLoc[1]-cellLength/2;
   buttonYLoc[2]=cellYLoc[2]-cellLength/2;
   buttonYLoc[3]=cellYLoc[3]-cellLength/2;
   buttonYLoc[4]=cellYLoc[52]+3*cellLength/2;
   buttonYLoc[5]=cellYLoc[53]+3*cellLength/2;
   buttonYLoc[6]=cellYLoc[54]+3*cellLength/2;
   buttonYLoc[7]=cellYLoc[10]+cellLength/2;
   buttonYLoc[8]=cellYLoc[22]+cellLength/2;
   buttonYLoc[9]=cellYLoc[34]+cellLength/2;
   buttonYLoc[10]=cellYLoc[21]+cellLength/2;
   buttonYLoc[11]=cellYLoc[33]+cellLength/2;
   buttonYLoc[12]=cellYLoc[45]+cellLength/2;
   buttonYLoc[13]=cellYLoc[9]+cellLength/2;
   buttonYLoc[14]=cellYLoc[9]+cellLength/2-0.75*cellLength;
   buttonYLoc[15]=cellYLoc[9]+cellLength/2-0.75*2*cellLength;
   buttonYLoc[16]=cellYLoc[48]+cellLength/2;
   buttonYLoc[17]=cellYLoc[48]+cellLength/2+0.75*cellLength;
   buttonYLoc[18]=cellYLoc[48]+cellLength/2+0.75*2*cellLength;
   strokeWeight(2);
   stroke(0);
   fill(212);
   for(byte k=1;k<=18;k++)
   {
     ellipse(buttonXLoc[k],buttonYLoc[k],buttonDiameter,buttonDiameter);
   }
   rect(rectButtonDatumX,rectButtonDatumY,rectButtonWidth,rectButtonHeight);   
   rect(rectButtonDatumX,rectButtonDatumY+2*rectButtonHeight,rectButtonWidth,rectButtonHeight);
   rect(rectButtonDatumX,rectButtonDatumY+4*rectButtonHeight,rectButtonWidth,rectButtonHeight);
   rect(rectButtonDatumX,rectButtonDatumY+6*rectButtonHeight,rectButtonWidth,rectButtonHeight);
   rect(rectButtonDatumX,rectButtonDatumY+8*rectButtonHeight,rectButtonWidth,rectButtonHeight);
   rect(rectButtonDatumX,rectButtonDatumY+10*rectButtonHeight,rectButtonWidth,rectButtonHeight);
   rect(rectButtonDatumX,rectButtonDatumY+12*rectButtonHeight,rectButtonWidth,rectButtonHeight);
   rect(rectButtonDatumX,rectButtonDatumY+14*rectButtonHeight,rectButtonWidth,rectButtonHeight);
   rect(rectButtonDatumX,rectButtonDatumY+16*rectButtonHeight,rectButtonWidth,rectButtonHeight);
   drawButtonSymbols();
   drawFastSlowLine(); 
}
//=================================================================================================
void drawButtonSymbols()
{
   strokeWeight(1);
   stroke(0);
   noFill();
   for(byte k=1;k<=3;k++)
   {
      line(buttonXLoc[k],buttonYLoc[k]-buttonRadius*0.5,buttonXLoc[k],buttonYLoc[k]+buttonRadius*0.5);
      line(buttonXLoc[k],buttonYLoc[k]-buttonRadius*0.5,buttonXLoc[k]-buttonRadius*0.25,buttonYLoc[k]-buttonRadius*0.012);
      line(buttonXLoc[k],buttonYLoc[k]-buttonRadius*0.5,buttonXLoc[k]+buttonRadius*0.25,buttonYLoc[k]-buttonRadius*0.012);
   }
   for(byte k=4;k<=6;k++)
   {
      line(buttonXLoc[k],buttonYLoc[k]-buttonRadius*0.5,buttonXLoc[k],buttonYLoc[k]+buttonRadius*0.5);
      line(buttonXLoc[k],buttonYLoc[k]+buttonRadius*0.5,buttonXLoc[k]-buttonRadius*0.25,buttonYLoc[k]+buttonRadius*0.012);
      line(buttonXLoc[k],buttonYLoc[k]+buttonRadius*0.5,buttonXLoc[k]+buttonRadius*0.25,buttonYLoc[k]+buttonRadius*0.012);
   }
   for(byte k=7;k<=9;k++)
   {
      line(buttonXLoc[k]-buttonRadius*0.5,buttonYLoc[k],buttonXLoc[k]+buttonRadius*0.5,buttonYLoc[k]);
      line(buttonXLoc[k]-buttonRadius*0.5,buttonYLoc[k],buttonXLoc[k]-buttonRadius*0.012,buttonYLoc[k]-buttonRadius*0.25);
      line(buttonXLoc[k]-buttonRadius*0.5,buttonYLoc[k],buttonXLoc[k]-buttonRadius*0.012,buttonYLoc[k]+buttonRadius*0.25);
   }
   for(byte k=10;k<=12;k++)
   {
      line(buttonXLoc[k]+buttonRadius*0.5,buttonYLoc[k],buttonXLoc[k]-buttonRadius*0.5,buttonYLoc[k]);
      line(buttonXLoc[k]+buttonRadius*0.5,buttonYLoc[k],buttonXLoc[k]+buttonRadius*0.012,buttonYLoc[k]-buttonRadius*0.25);
      line(buttonXLoc[k]+buttonRadius*0.5,buttonYLoc[k],buttonXLoc[k]+buttonRadius*0.012,buttonYLoc[k]+buttonRadius*0.25);
   }
   for(byte k=13;k<=15;k++)
   {
      arc(buttonXLoc[k]-buttonRadius*0.45,buttonYLoc[k]+buttonRadius*0.05,buttonDiameter*0.515,buttonDiameter*0.515,-.4*PI,0.25*PI);
      line(buttonXLoc[k]-buttonRadius*0.2,buttonYLoc[k]-buttonRadius*0.6,buttonXLoc[k]+buttonRadius*0.33,buttonYLoc[k]-buttonRadius*0.5);
      line(buttonXLoc[k]-buttonRadius*0.3,buttonYLoc[k]-buttonRadius*0.6,buttonXLoc[k]-buttonRadius*0.15,buttonYLoc[k]+buttonRadius*0.012);
   }
   for(byte k=16;k<=18;k++)
   {
      arc(buttonXLoc[k]-buttonRadius*0.45,buttonYLoc[k]-buttonRadius*0.05,buttonDiameter*0.515,buttonDiameter*0.515,-.25*PI,0.4*PI);
      line(buttonXLoc[k]-buttonRadius*0.2,buttonYLoc[k]+buttonRadius*0.6,buttonXLoc[k]+buttonRadius*0.33,buttonYLoc[k]+buttonRadius*0.5);
      line(buttonXLoc[k]-buttonRadius*0.3,buttonYLoc[k]+buttonRadius*0.6,buttonXLoc[k]-buttonRadius*0.15,buttonYLoc[k]-buttonRadius*0.012);
   } 
   textSize(18);
   stroke(0);
   fill(0);
   text("Fast/Slow",rectButtonDatumX+13,rectButtonDatumY+27);
   text("Reset",rectButtonDatumX+13,rectButtonDatumY+27+2*rectButtonHeight);
   text("Scramble",rectButtonDatumX+13,rectButtonDatumY+27+4*rectButtonHeight);
   text("Stage One",rectButtonDatumX+13,rectButtonDatumY+27+6*rectButtonHeight);
   text("Stage Two",rectButtonDatumX+13,rectButtonDatumY+27+8*rectButtonHeight);
   text("Stage Three",rectButtonDatumX+13,rectButtonDatumY+27+10*rectButtonHeight);
   text("Stage Four",rectButtonDatumX+13,rectButtonDatumY+27+12*rectButtonHeight);
   text("Solve",rectButtonDatumX+13,rectButtonDatumY+27+14*rectButtonHeight);
   text("Numbers",rectButtonDatumX+13,rectButtonDatumY+27+16*rectButtonHeight);
}
//========================================
void drawFastSlowLine()
{
  if(frameRateModValue<10)
   {
      strokeWeight(1);
      stroke(0);
      line(rectButtonDatumX+15,rectButtonDatumY+30,rectButtonDatumX+45,rectButtonDatumY+30);
   } 
   else
   {
      strokeWeight(1);
      stroke(0);
      line(rectButtonDatumX+60,rectButtonDatumY+30,rectButtonDatumX+90,rectButtonDatumY+30);
   }  
}  
//=============================================================================================
//This method moves the pieces from their old cell to their new cell.
//
void cubeButton(byte b)
{  
   byte[] oldCell = new byte[55];
   byte[] newCell = new byte[55];
   byte[] oldStkrRqrd = new byte[55];
   byte[] newStkrRqrd = new byte[55];
   for(byte k=0;k<=54;k++)
   {   oldCell[k]=cell[k];
       newCell[k]=oldCell[k];
       oldStkrRqrd[k]=stickerRequiredByCell[k];
       newStkrRqrd[k]=oldStkrRqrd[k];
   }
   //print("Button: "+b+". ");
   if(b==1)
   {
      newCell[1]=oldCell[13]; newCell[4]=oldCell[25]; newCell[7]=oldCell[37];
      newCell[13]=oldCell[46]; newCell[25]=oldCell[49]; newCell[37]=oldCell[52];
      newCell[46]=oldCell[45]; newCell[49]=oldCell[33]; newCell[52]=oldCell[21];
      newCell[45]=oldCell[1]; newCell[33]=oldCell[4]; newCell[21]=oldCell[7];
      newCell[10]=oldCell[12]; newCell[11]=oldCell[24]; newCell[12]=oldCell[36]; 
      newCell[22]=oldCell[11]; newCell[24]=oldCell[35]; 
      newCell[34]=oldCell[10]; newCell[35]=oldCell[22]; newCell[36]=oldCell[34];
   }
   else if(b==4)
   {
      newCell[13]=oldCell[1]; newCell[25]=oldCell[4]; newCell[37]=oldCell[7];
      newCell[46]=oldCell[13]; newCell[49]=oldCell[25]; newCell[52]=oldCell[37];
      newCell[45]=oldCell[46]; newCell[33]=oldCell[49]; newCell[21]=oldCell[52];
      newCell[1]=oldCell[45]; newCell[4]=oldCell[33]; newCell[7]=oldCell[21];
      newCell[12]=oldCell[10]; newCell[24]=oldCell[11]; newCell[36]=oldCell[12]; 
      newCell[11]=oldCell[22]; newCell[35]=oldCell[24]; 
      newCell[10]=oldCell[34]; newCell[22]=oldCell[35]; newCell[34]=oldCell[36];
   }
   else if(b==2)
   {  
      newCell[2]=oldCell[14]; newCell[5]=oldCell[26]; newCell[8]=oldCell[38];
      newCell[14]=oldCell[47]; newCell[26]=oldCell[50]; newCell[38]=oldCell[53];
      newCell[47]=oldCell[44]; newCell[50]=oldCell[32]; newCell[53]=oldCell[20];
      newCell[44]=oldCell[2]; newCell[32]=oldCell[5]; newCell[20]=oldCell[8];
   }
   else if(b==5)
   {  
      newCell[14]=oldCell[2]; newCell[26]=oldCell[5]; newCell[38]=oldCell[8];
      newCell[47]=oldCell[14]; newCell[50]=oldCell[26]; newCell[53]=oldCell[38];
      newCell[44]=oldCell[47]; newCell[32]=oldCell[50]; newCell[20]=oldCell[53];
      newCell[2]=oldCell[44]; newCell[5]=oldCell[32]; newCell[8]=oldCell[20];
   }
   else if(b==3)
   {
      newCell[3]=oldCell[15]; newCell[6]=oldCell[27]; newCell[9]=oldCell[39];
      newCell[15]=oldCell[48]; newCell[27]=oldCell[51]; newCell[39]=oldCell[54];
      newCell[48]=oldCell[43]; newCell[51]=oldCell[31]; newCell[54]=oldCell[19];
      newCell[43]=oldCell[3]; newCell[31]=oldCell[6]; newCell[19]=oldCell[9];
      newCell[16]=oldCell[40]; newCell[17]=oldCell[28]; newCell[18]=oldCell[16]; 
      newCell[28]=oldCell[41]; newCell[30]=oldCell[17]; 
      newCell[40]=oldCell[42]; newCell[41]=oldCell[30]; newCell[42]=oldCell[18];
   }
   else if(b==6)
   {
      newCell[15]=oldCell[3]; newCell[27]=oldCell[6]; newCell[39]=oldCell[9];
      newCell[48]=oldCell[15]; newCell[51]=oldCell[27]; newCell[54]=oldCell[39];
      newCell[43]=oldCell[48]; newCell[31]=oldCell[51]; newCell[19]=oldCell[54];
      newCell[3]=oldCell[43]; newCell[6]=oldCell[31]; newCell[9]=oldCell[19];
      newCell[40]=oldCell[16]; newCell[28]=oldCell[17]; newCell[16]=oldCell[18]; 
      newCell[41]=oldCell[28]; newCell[17]=oldCell[30]; 
      newCell[42]=oldCell[40]; newCell[30]=oldCell[41]; newCell[18]=oldCell[42];
   }
   else if(b==7)
   {
      newCell[10]=oldCell[13]; newCell[11]=oldCell[14]; newCell[12]=oldCell[15];
      newCell[13]=oldCell[16]; newCell[14]=oldCell[17]; newCell[15]=oldCell[18];
      newCell[16]=oldCell[19]; newCell[17]=oldCell[20]; newCell[18]=oldCell[21];
      newCell[19]=oldCell[10]; newCell[20]=oldCell[11]; newCell[21]=oldCell[12];
      newCell[7]=oldCell[9]; newCell[8]=oldCell[6]; newCell[9]=oldCell[3]; 
      newCell[4]=oldCell[8]; newCell[6]=oldCell[2]; 
      newCell[1]=oldCell[7]; newCell[2]=oldCell[4]; newCell[3]=oldCell[1];
   }
   else if(b==10)
   {
      newCell[13]=oldCell[10]; newCell[14]=oldCell[11]; newCell[15]=oldCell[12];
      newCell[16]=oldCell[13]; newCell[17]=oldCell[14]; newCell[18]=oldCell[15];
      newCell[19]=oldCell[16]; newCell[20]=oldCell[17]; newCell[21]=oldCell[18];
      newCell[10]=oldCell[19]; newCell[11]=oldCell[20]; newCell[12]=oldCell[21];
      newCell[9]=oldCell[7]; newCell[6]=oldCell[8]; newCell[3]=oldCell[9]; 
      newCell[8]=oldCell[4]; newCell[2]=oldCell[6]; 
      newCell[7]=oldCell[1]; newCell[4]=oldCell[2]; newCell[1]=oldCell[3];
   }
   else if(b==8)
   {  
      newCell[22]=oldCell[25]; newCell[23]=oldCell[26]; newCell[24]=oldCell[27];
      newCell[25]=oldCell[28]; newCell[26]=oldCell[29]; newCell[27]=oldCell[30];
      newCell[28]=oldCell[31]; newCell[29]=oldCell[32]; newCell[30]=oldCell[33];
      newCell[31]=oldCell[22]; newCell[32]=oldCell[23]; newCell[33]=oldCell[24];
   }
   else if(b==11)
   {  
      newCell[25]=oldCell[22]; newCell[26]=oldCell[23]; newCell[27]=oldCell[24];
      newCell[28]=oldCell[25]; newCell[29]=oldCell[26]; newCell[30]=oldCell[27];
      newCell[31]=oldCell[28]; newCell[32]=oldCell[29]; newCell[33]=oldCell[30];
      newCell[22]=oldCell[31]; newCell[23]=oldCell[32]; newCell[24]=oldCell[33];
   }
   else if(b==9)
   {
      newCell[34]=oldCell[37]; newCell[35]=oldCell[38]; newCell[36]=oldCell[39];
      newCell[37]=oldCell[40]; newCell[38]=oldCell[41]; newCell[39]=oldCell[42];
      newCell[40]=oldCell[43]; newCell[41]=oldCell[44]; newCell[42]=oldCell[45];
      newCell[43]=oldCell[34]; newCell[44]=oldCell[35]; newCell[45]=oldCell[36];
      newCell[46]=oldCell[48]; newCell[47]=oldCell[51]; newCell[48]=oldCell[54]; 
      newCell[49]=oldCell[47]; newCell[51]=oldCell[53]; 
      newCell[52]=oldCell[46]; newCell[53]=oldCell[49]; newCell[54]=oldCell[52];
   }
   else if(b==12)
   {
      newCell[37]=oldCell[34]; newCell[38]=oldCell[35]; newCell[39]=oldCell[36];
      newCell[40]=oldCell[37]; newCell[41]=oldCell[38]; newCell[42]=oldCell[39];
      newCell[43]=oldCell[40]; newCell[44]=oldCell[41]; newCell[45]=oldCell[42];
      newCell[34]=oldCell[43]; newCell[35]=oldCell[44]; newCell[36]=oldCell[45];
      newCell[48]=oldCell[46]; newCell[51]=oldCell[47]; newCell[54]=oldCell[48]; 
      newCell[47]=oldCell[49]; newCell[53]=oldCell[51]; 
      newCell[46]=oldCell[52]; newCell[49]=oldCell[53]; newCell[52]=oldCell[54];
   }
   else if(b==13)
   {
      newCell[16]=oldCell[48]; newCell[28]=oldCell[47]; newCell[40]=oldCell[46];
      newCell[48]=oldCell[36]; newCell[47]=oldCell[24]; newCell[46]=oldCell[12];
      newCell[36]=oldCell[7]; newCell[24]=oldCell[8]; newCell[12]=oldCell[9];
      newCell[7]=oldCell[16]; newCell[8]=oldCell[28]; newCell[9]=oldCell[40];
      newCell[13]=oldCell[15]; newCell[14]=oldCell[27]; newCell[15]=oldCell[39]; 
      newCell[25]=oldCell[14]; newCell[27]=oldCell[38]; 
      newCell[37]=oldCell[13]; newCell[38]=oldCell[25]; newCell[39]=oldCell[37];
   }
   else if(b==16)
   {
      newCell[48]=oldCell[16]; newCell[47]=oldCell[28]; newCell[46]=oldCell[40];
      newCell[36]=oldCell[48]; newCell[24]=oldCell[47]; newCell[12]=oldCell[46];
      newCell[7]=oldCell[36]; newCell[8]=oldCell[24]; newCell[9]=oldCell[12];
      newCell[16]=oldCell[7]; newCell[28]=oldCell[8]; newCell[40]=oldCell[9];
      newCell[15]=oldCell[13]; newCell[27]=oldCell[14]; newCell[39]=oldCell[15]; 
      newCell[14]=oldCell[25]; newCell[38]=oldCell[27]; 
      newCell[13]=oldCell[37]; newCell[25]=oldCell[38]; newCell[37]=oldCell[39];
   }
   else if(b==14)
   {  
      newCell[4]=oldCell[17]; newCell[5]=oldCell[29]; newCell[6]=oldCell[41];
      newCell[35]=oldCell[4]; newCell[23]=oldCell[5]; newCell[11]=oldCell[6];
      newCell[51]=oldCell[35]; newCell[50]=oldCell[23]; newCell[49]=oldCell[11];
      newCell[17]=oldCell[51]; newCell[29]=oldCell[50]; newCell[41]=oldCell[49];
   }
   else if(b==17)
   {  
      newCell[17]=oldCell[4]; newCell[29]=oldCell[5]; newCell[41]=oldCell[6];
      newCell[4]=oldCell[35]; newCell[5]=oldCell[23]; newCell[6]=oldCell[11];
      newCell[35]=oldCell[51]; newCell[23]=oldCell[50]; newCell[11]=oldCell[49];
      newCell[51]=oldCell[17]; newCell[50]=oldCell[29]; newCell[49]=oldCell[41];
   }   
   else if(b==15)
   {
      newCell[1]=oldCell[18]; newCell[2]=oldCell[30]; newCell[3]=oldCell[42];
      newCell[18]=oldCell[54]; newCell[30]=oldCell[53]; newCell[42]=oldCell[52];
      newCell[54]=oldCell[34]; newCell[53]=oldCell[22]; newCell[52]=oldCell[10];
      newCell[34]=oldCell[1]; newCell[22]=oldCell[2]; newCell[10]=oldCell[3];
      newCell[19]=oldCell[43]; newCell[20]=oldCell[31]; newCell[21]=oldCell[19]; 
      newCell[31]=oldCell[44]; newCell[33]=oldCell[20]; 
      newCell[43]=oldCell[45]; newCell[44]=oldCell[33]; newCell[45]=oldCell[21];
   }
   else if(b==18)
   {
      newCell[18]=oldCell[1]; newCell[30]=oldCell[2]; newCell[42]=oldCell[3];
      newCell[54]=oldCell[18]; newCell[53]=oldCell[30]; newCell[52]=oldCell[42];
      newCell[34]=oldCell[54]; newCell[22]=oldCell[53]; newCell[10]=oldCell[52];
      newCell[1]=oldCell[34]; newCell[2]=oldCell[22]; newCell[3]=oldCell[10];
      newCell[43]=oldCell[19]; newCell[31]=oldCell[20]; newCell[19]=oldCell[21]; 
      newCell[44]=oldCell[31]; newCell[20]=oldCell[33]; 
      newCell[45]=oldCell[43]; newCell[33]=oldCell[44]; newCell[21]=oldCell[45];
   }
   //-------------------------------------------------------------------------------
   if(b==2)
   {
      newStkrRqrd[1]=oldStkrRqrd[13]; newStkrRqrd[4]=oldStkrRqrd[25]; newStkrRqrd[7]=oldStkrRqrd[37];
      newStkrRqrd[13]=oldStkrRqrd[46]; newStkrRqrd[25]=oldStkrRqrd[49]; newStkrRqrd[37]=oldStkrRqrd[52];
      newStkrRqrd[46]=oldStkrRqrd[45]; newStkrRqrd[49]=oldStkrRqrd[33]; newStkrRqrd[52]=oldStkrRqrd[21];
      newStkrRqrd[45]=oldStkrRqrd[1]; newStkrRqrd[33]=oldStkrRqrd[4]; newStkrRqrd[21]=oldStkrRqrd[7];
      newStkrRqrd[10]=oldStkrRqrd[12]; newStkrRqrd[11]=oldStkrRqrd[24]; newStkrRqrd[12]=oldStkrRqrd[36]; 
      newStkrRqrd[22]=oldStkrRqrd[11]; newStkrRqrd[24]=oldStkrRqrd[35]; 
      newStkrRqrd[34]=oldStkrRqrd[10]; newStkrRqrd[35]=oldStkrRqrd[22]; newStkrRqrd[36]=oldStkrRqrd[34];
     
      newStkrRqrd[2]=oldStkrRqrd[14]; newStkrRqrd[5]=oldStkrRqrd[26]; newStkrRqrd[8]=oldStkrRqrd[38];
      newStkrRqrd[14]=oldStkrRqrd[47]; newStkrRqrd[26]=oldStkrRqrd[50]; newStkrRqrd[38]=oldStkrRqrd[53];
      newStkrRqrd[47]=oldStkrRqrd[44]; newStkrRqrd[50]=oldStkrRqrd[32]; newStkrRqrd[53]=oldStkrRqrd[20];
      newStkrRqrd[44]=oldStkrRqrd[2]; newStkrRqrd[32]=oldStkrRqrd[5]; newStkrRqrd[20]=oldStkrRqrd[8];

      newStkrRqrd[3]=oldStkrRqrd[15]; newStkrRqrd[6]=oldStkrRqrd[27]; newStkrRqrd[9]=oldStkrRqrd[39];
      newStkrRqrd[15]=oldStkrRqrd[48]; newStkrRqrd[27]=oldStkrRqrd[51]; newStkrRqrd[39]=oldStkrRqrd[54];
      newStkrRqrd[48]=oldStkrRqrd[43]; newStkrRqrd[51]=oldStkrRqrd[31]; newStkrRqrd[54]=oldStkrRqrd[19];
      newStkrRqrd[43]=oldStkrRqrd[3]; newStkrRqrd[31]=oldStkrRqrd[6]; newStkrRqrd[19]=oldStkrRqrd[9];
      newStkrRqrd[16]=oldStkrRqrd[40]; newStkrRqrd[17]=oldStkrRqrd[28]; newStkrRqrd[18]=oldStkrRqrd[16]; 
      newStkrRqrd[28]=oldStkrRqrd[41]; newStkrRqrd[30]=oldStkrRqrd[17]; 
      newStkrRqrd[40]=oldStkrRqrd[42]; newStkrRqrd[41]=oldStkrRqrd[30]; newStkrRqrd[42]=oldStkrRqrd[18];
   }
   else if(b==5)
   {
      newStkrRqrd[13]=oldStkrRqrd[1]; newStkrRqrd[25]=oldStkrRqrd[4]; newStkrRqrd[37]=oldStkrRqrd[7];
      newStkrRqrd[46]=oldStkrRqrd[13]; newStkrRqrd[49]=oldStkrRqrd[25]; newStkrRqrd[52]=oldStkrRqrd[37];
      newStkrRqrd[45]=oldStkrRqrd[46]; newStkrRqrd[33]=oldStkrRqrd[49]; newStkrRqrd[21]=oldStkrRqrd[52];
      newStkrRqrd[1]=oldStkrRqrd[45]; newStkrRqrd[4]=oldStkrRqrd[33]; newStkrRqrd[7]=oldStkrRqrd[21];
      newStkrRqrd[12]=oldStkrRqrd[10]; newStkrRqrd[24]=oldStkrRqrd[11]; newStkrRqrd[36]=oldStkrRqrd[12]; 
      newStkrRqrd[11]=oldStkrRqrd[22]; newStkrRqrd[35]=oldStkrRqrd[24]; 
      newStkrRqrd[10]=oldStkrRqrd[34]; newStkrRqrd[22]=oldStkrRqrd[35]; newStkrRqrd[34]=oldStkrRqrd[36];
    
      newStkrRqrd[14]=oldStkrRqrd[2]; newStkrRqrd[26]=oldStkrRqrd[5]; newStkrRqrd[38]=oldStkrRqrd[8];
      newStkrRqrd[47]=oldStkrRqrd[14]; newStkrRqrd[50]=oldStkrRqrd[26]; newStkrRqrd[53]=oldStkrRqrd[38];
      newStkrRqrd[44]=oldStkrRqrd[47]; newStkrRqrd[32]=oldStkrRqrd[50]; newStkrRqrd[20]=oldStkrRqrd[53];
      newStkrRqrd[2]=oldStkrRqrd[44]; newStkrRqrd[5]=oldStkrRqrd[32]; newStkrRqrd[8]=oldStkrRqrd[20];
   
      newStkrRqrd[15]=oldStkrRqrd[3]; newStkrRqrd[27]=oldStkrRqrd[6]; newStkrRqrd[39]=oldStkrRqrd[9];
      newStkrRqrd[48]=oldStkrRqrd[15]; newStkrRqrd[51]=oldStkrRqrd[27]; newStkrRqrd[54]=oldStkrRqrd[39];
      newStkrRqrd[43]=oldStkrRqrd[48]; newStkrRqrd[31]=oldStkrRqrd[51]; newStkrRqrd[19]=oldStkrRqrd[54];
      newStkrRqrd[3]=oldStkrRqrd[43]; newStkrRqrd[6]=oldStkrRqrd[31]; newStkrRqrd[9]=oldStkrRqrd[19];
      newStkrRqrd[40]=oldStkrRqrd[16]; newStkrRqrd[28]=oldStkrRqrd[17]; newStkrRqrd[16]=oldStkrRqrd[18]; 
      newStkrRqrd[41]=oldStkrRqrd[28]; newStkrRqrd[17]=oldStkrRqrd[30]; 
      newStkrRqrd[42]=oldStkrRqrd[40]; newStkrRqrd[30]=oldStkrRqrd[41]; newStkrRqrd[18]=oldStkrRqrd[42];
   }
   else if(b==8)
   {
      newStkrRqrd[10]=oldStkrRqrd[13]; newStkrRqrd[11]=oldStkrRqrd[14]; newStkrRqrd[12]=oldStkrRqrd[15];
      newStkrRqrd[13]=oldStkrRqrd[16]; newStkrRqrd[14]=oldStkrRqrd[17]; newStkrRqrd[15]=oldStkrRqrd[18];
      newStkrRqrd[16]=oldStkrRqrd[19]; newStkrRqrd[17]=oldStkrRqrd[20]; newStkrRqrd[18]=oldStkrRqrd[21];
      newStkrRqrd[19]=oldStkrRqrd[10]; newStkrRqrd[20]=oldStkrRqrd[11]; newStkrRqrd[21]=oldStkrRqrd[12];
      newStkrRqrd[7]=oldStkrRqrd[9]; newStkrRqrd[8]=oldStkrRqrd[6]; newStkrRqrd[9]=oldStkrRqrd[3]; 
      newStkrRqrd[4]=oldStkrRqrd[8]; newStkrRqrd[6]=oldStkrRqrd[2]; 
      newStkrRqrd[1]=oldStkrRqrd[7]; newStkrRqrd[2]=oldStkrRqrd[4]; newStkrRqrd[3]=oldStkrRqrd[1];
     
      newStkrRqrd[22]=oldStkrRqrd[25]; newStkrRqrd[23]=oldStkrRqrd[26]; newStkrRqrd[24]=oldStkrRqrd[27];
      newStkrRqrd[25]=oldStkrRqrd[28]; newStkrRqrd[26]=oldStkrRqrd[29]; newStkrRqrd[27]=oldStkrRqrd[30];
      newStkrRqrd[28]=oldStkrRqrd[31]; newStkrRqrd[29]=oldStkrRqrd[32]; newStkrRqrd[30]=oldStkrRqrd[33];
      newStkrRqrd[31]=oldStkrRqrd[22]; newStkrRqrd[32]=oldStkrRqrd[23]; newStkrRqrd[33]=oldStkrRqrd[24];
   
      newStkrRqrd[34]=oldStkrRqrd[37]; newStkrRqrd[35]=oldStkrRqrd[38]; newStkrRqrd[36]=oldStkrRqrd[39];
      newStkrRqrd[37]=oldStkrRqrd[40]; newStkrRqrd[38]=oldStkrRqrd[41]; newStkrRqrd[39]=oldStkrRqrd[42];
      newStkrRqrd[40]=oldStkrRqrd[43]; newStkrRqrd[41]=oldStkrRqrd[44]; newStkrRqrd[42]=oldStkrRqrd[45];
      newStkrRqrd[43]=oldStkrRqrd[34]; newStkrRqrd[44]=oldStkrRqrd[35]; newStkrRqrd[45]=oldStkrRqrd[36];
      newStkrRqrd[46]=oldStkrRqrd[48]; newStkrRqrd[47]=oldStkrRqrd[51]; newStkrRqrd[48]=oldStkrRqrd[54]; 
      newStkrRqrd[49]=oldStkrRqrd[47]; newStkrRqrd[51]=oldStkrRqrd[53]; 
      newStkrRqrd[52]=oldStkrRqrd[46]; newStkrRqrd[53]=oldStkrRqrd[49]; newStkrRqrd[54]=oldStkrRqrd[52];
   }
   else if(b==11)
   {
      newStkrRqrd[13]=oldStkrRqrd[10]; newStkrRqrd[14]=oldStkrRqrd[11]; newStkrRqrd[15]=oldStkrRqrd[12];
      newStkrRqrd[16]=oldStkrRqrd[13]; newStkrRqrd[17]=oldStkrRqrd[14]; newStkrRqrd[18]=oldStkrRqrd[15];
      newStkrRqrd[19]=oldStkrRqrd[16]; newStkrRqrd[20]=oldStkrRqrd[17]; newStkrRqrd[21]=oldStkrRqrd[18];
      newStkrRqrd[10]=oldStkrRqrd[19]; newStkrRqrd[11]=oldStkrRqrd[20]; newStkrRqrd[12]=oldStkrRqrd[21];
      newStkrRqrd[9]=oldStkrRqrd[7]; newStkrRqrd[6]=oldStkrRqrd[8]; newStkrRqrd[3]=oldStkrRqrd[9]; 
      newStkrRqrd[8]=oldStkrRqrd[4]; newStkrRqrd[2]=oldStkrRqrd[6]; 
      newStkrRqrd[7]=oldStkrRqrd[1]; newStkrRqrd[4]=oldStkrRqrd[2]; newStkrRqrd[1]=oldStkrRqrd[3];
  
      newStkrRqrd[25]=oldStkrRqrd[22]; newStkrRqrd[26]=oldStkrRqrd[23]; newStkrRqrd[27]=oldStkrRqrd[24];
      newStkrRqrd[28]=oldStkrRqrd[25]; newStkrRqrd[29]=oldStkrRqrd[26]; newStkrRqrd[30]=oldStkrRqrd[27];
      newStkrRqrd[31]=oldStkrRqrd[28]; newStkrRqrd[32]=oldStkrRqrd[29]; newStkrRqrd[33]=oldStkrRqrd[30];
      newStkrRqrd[22]=oldStkrRqrd[31]; newStkrRqrd[23]=oldStkrRqrd[32]; newStkrRqrd[24]=oldStkrRqrd[33];

      newStkrRqrd[37]=oldStkrRqrd[34]; newStkrRqrd[38]=oldStkrRqrd[35]; newStkrRqrd[39]=oldStkrRqrd[36];
      newStkrRqrd[40]=oldStkrRqrd[37]; newStkrRqrd[41]=oldStkrRqrd[38]; newStkrRqrd[42]=oldStkrRqrd[39];
      newStkrRqrd[43]=oldStkrRqrd[40]; newStkrRqrd[44]=oldStkrRqrd[41]; newStkrRqrd[45]=oldStkrRqrd[42];
      newStkrRqrd[34]=oldStkrRqrd[43]; newStkrRqrd[35]=oldStkrRqrd[44]; newStkrRqrd[36]=oldStkrRqrd[45];
      newStkrRqrd[48]=oldStkrRqrd[46]; newStkrRqrd[51]=oldStkrRqrd[47]; newStkrRqrd[54]=oldStkrRqrd[48]; 
      newStkrRqrd[47]=oldStkrRqrd[49]; newStkrRqrd[53]=oldStkrRqrd[51]; 
      newStkrRqrd[46]=oldStkrRqrd[52]; newStkrRqrd[49]=oldStkrRqrd[53]; newStkrRqrd[52]=oldStkrRqrd[54];
   }
   else if(b==14)
   {
      newStkrRqrd[16]=oldStkrRqrd[48]; newStkrRqrd[28]=oldStkrRqrd[47]; newStkrRqrd[40]=oldStkrRqrd[46];
      newStkrRqrd[48]=oldStkrRqrd[36]; newStkrRqrd[47]=oldStkrRqrd[24]; newStkrRqrd[46]=oldStkrRqrd[12];
      newStkrRqrd[36]=oldStkrRqrd[7]; newStkrRqrd[24]=oldStkrRqrd[8]; newStkrRqrd[12]=oldStkrRqrd[9];
      newStkrRqrd[7]=oldStkrRqrd[16]; newStkrRqrd[8]=oldStkrRqrd[28]; newStkrRqrd[9]=oldStkrRqrd[40];
      newStkrRqrd[13]=oldStkrRqrd[15]; newStkrRqrd[14]=oldStkrRqrd[27]; newStkrRqrd[15]=oldStkrRqrd[39]; 
      newStkrRqrd[25]=oldStkrRqrd[14]; newStkrRqrd[27]=oldStkrRqrd[38]; 
      newStkrRqrd[37]=oldStkrRqrd[13]; newStkrRqrd[38]=oldStkrRqrd[25]; newStkrRqrd[39]=oldStkrRqrd[37];
  
      newStkrRqrd[4]=oldStkrRqrd[17]; newStkrRqrd[5]=oldStkrRqrd[29]; newStkrRqrd[6]=oldStkrRqrd[41];
      newStkrRqrd[35]=oldStkrRqrd[4]; newStkrRqrd[23]=oldStkrRqrd[5]; newStkrRqrd[11]=oldStkrRqrd[6];
      newStkrRqrd[51]=oldStkrRqrd[35]; newStkrRqrd[50]=oldStkrRqrd[23]; newStkrRqrd[49]=oldStkrRqrd[11];
      newStkrRqrd[17]=oldStkrRqrd[51]; newStkrRqrd[29]=oldStkrRqrd[50]; newStkrRqrd[41]=oldStkrRqrd[49];

      newStkrRqrd[1]=oldStkrRqrd[18]; newStkrRqrd[2]=oldStkrRqrd[30]; newStkrRqrd[3]=oldStkrRqrd[42];
      newStkrRqrd[18]=oldStkrRqrd[54]; newStkrRqrd[30]=oldStkrRqrd[53]; newStkrRqrd[42]=oldStkrRqrd[52];
      newStkrRqrd[54]=oldStkrRqrd[34]; newStkrRqrd[53]=oldStkrRqrd[22]; newStkrRqrd[52]=oldStkrRqrd[10];
      newStkrRqrd[34]=oldStkrRqrd[1]; newStkrRqrd[22]=oldStkrRqrd[2]; newStkrRqrd[10]=oldStkrRqrd[3];
      newStkrRqrd[19]=oldStkrRqrd[43]; newStkrRqrd[20]=oldStkrRqrd[31]; newStkrRqrd[21]=oldStkrRqrd[19]; 
      newStkrRqrd[31]=oldStkrRqrd[44]; newStkrRqrd[33]=oldStkrRqrd[20]; 
      newStkrRqrd[43]=oldStkrRqrd[45]; newStkrRqrd[44]=oldStkrRqrd[33]; newStkrRqrd[45]=oldStkrRqrd[21];
   }
      else if(b==17)
   {
      newStkrRqrd[48]=oldStkrRqrd[16]; newStkrRqrd[47]=oldStkrRqrd[28]; newStkrRqrd[46]=oldStkrRqrd[40];
      newStkrRqrd[36]=oldStkrRqrd[48]; newStkrRqrd[24]=oldStkrRqrd[47]; newStkrRqrd[12]=oldStkrRqrd[46];
      newStkrRqrd[7]=oldStkrRqrd[36]; newStkrRqrd[8]=oldStkrRqrd[24]; newStkrRqrd[9]=oldStkrRqrd[12];
      newStkrRqrd[16]=oldStkrRqrd[7]; newStkrRqrd[28]=oldStkrRqrd[8]; newStkrRqrd[40]=oldStkrRqrd[9];
      newStkrRqrd[15]=oldStkrRqrd[13]; newStkrRqrd[27]=oldStkrRqrd[14]; newStkrRqrd[39]=oldStkrRqrd[15]; 
      newStkrRqrd[14]=oldStkrRqrd[25]; newStkrRqrd[38]=oldStkrRqrd[27]; 
      newStkrRqrd[13]=oldStkrRqrd[37]; newStkrRqrd[25]=oldStkrRqrd[38]; newStkrRqrd[37]=oldStkrRqrd[39];
     
      newStkrRqrd[17]=oldStkrRqrd[4]; newStkrRqrd[29]=oldStkrRqrd[5]; newStkrRqrd[41]=oldStkrRqrd[6];
      newStkrRqrd[4]=oldStkrRqrd[35]; newStkrRqrd[5]=oldStkrRqrd[23]; newStkrRqrd[6]=oldStkrRqrd[11];
      newStkrRqrd[35]=oldStkrRqrd[51]; newStkrRqrd[23]=oldStkrRqrd[50]; newStkrRqrd[11]=oldStkrRqrd[49];
      newStkrRqrd[51]=oldStkrRqrd[17]; newStkrRqrd[50]=oldStkrRqrd[29]; newStkrRqrd[49]=oldStkrRqrd[41];
   
      newStkrRqrd[18]=oldStkrRqrd[1]; newStkrRqrd[30]=oldStkrRqrd[2]; newStkrRqrd[42]=oldStkrRqrd[3];
      newStkrRqrd[54]=oldStkrRqrd[18]; newStkrRqrd[53]=oldStkrRqrd[30]; newStkrRqrd[52]=oldStkrRqrd[42];
      newStkrRqrd[34]=oldStkrRqrd[54]; newStkrRqrd[22]=oldStkrRqrd[53]; newStkrRqrd[10]=oldStkrRqrd[52];
      newStkrRqrd[1]=oldStkrRqrd[34]; newStkrRqrd[2]=oldStkrRqrd[22]; newStkrRqrd[3]=oldStkrRqrd[10];
      newStkrRqrd[43]=oldStkrRqrd[19]; newStkrRqrd[31]=oldStkrRqrd[20]; newStkrRqrd[19]=oldStkrRqrd[21]; 
      newStkrRqrd[44]=oldStkrRqrd[31]; newStkrRqrd[20]=oldStkrRqrd[33]; 
      newStkrRqrd[45]=oldStkrRqrd[43]; newStkrRqrd[33]=oldStkrRqrd[44]; newStkrRqrd[21]=oldStkrRqrd[45];
   }
   //-------------------------------------------------------------------------------
   for(byte k=0;k<=54;k++)
   {   
      cell[k]=newCell[k];
      stickerRequiredByCell[k]=newStkrRqrd[k];
   }
   //---------------------------------------
   for(byte k=1;k<=54;k++)
   {
      cellOfSticker[cell[k]]=k;  
   }  
   //---------------------------------------
   for(byte k=1;k<=54;k++)
   {
      cellOfStickerRequiredByCell[k]=cellOfSticker[stickerRequiredByCell[k]];
   }   
   //---------------------------------------
   cellRequiredBySticker[0]=0;
   for(byte k=1;k<=54;k++)
   {
      for(byte s=1;s<=54;s++)
      {
         if(stickerRequiredByCell[k]==s)
         {
            cellRequiredBySticker[s]=k; 
         }  
      }  
   }   
   //---------------------------------------
   for(int i=0;i<4;i++)
   {
       centerStickersFrBtBkTp[i]=cell[int(centerCellsFrBtBkTp[i])];   
       centerStickersLtFrRtBk[i]=cell[int(centerCellsLtFrRtBk[i])];   
       
       frontFaceEdgeStickers[i]=cell[int(frontFaceEdgeCells[i])];     
       topFaceEdgeStickers[i]=cell[int(topFaceEdgeCells[i])];         
       bottomFaceEdgeStickers[i]=cell[int(bottomFaceEdgeCells[i])];   
       leftFaceEdgeStickers[i]=cell[int(leftFaceEdgeCells[i])];       
       rightFaceEdgeStickers[i]=cell[int(rightFaceEdgeCells[i])];     
       backFaceEdgeStickers[i]=cell[int(backFaceEdgeCells[i])];       

       frontRimEdgeStickers[i]=cell[int(frontRimEdgeCells[i])];       
       topRimEdgeStickers[i]=cell[int(topRimEdgeCells[i])];           
       bottomRimEdgeStickers[i]=cell[int(bottomRimEdgeCells[i])];     
       backRimEdgeStickers[i]=cell[int(backRimEdgeCells[i])];         
       leftRimEdgeStickers[i]=cell[int(leftRimEdgeCells[i])];         
       rightRimEdgeStickers[i]=cell[int(rightRimEdgeCells[i])];   
   }      
}
//=============================================================================================================================
void cubeAutoSequence(int buttonSequence)
{
   autoButtonSequence=buttonSequence;
   sequenceCounter=0;
   animatedMode=3;
}
//=============================================================================================================================
void cubeAutomatedSequence()
{  
   //delay(delayValue);
   int buttonSequence=autoButtonSequence;
   if(buttonSequence==1)
   {
      if(sequenceCounter==0){cubeButton(byte(1));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==2)
   {
      if(sequenceCounter==0){cubeButton(byte(2));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==3)
   {
      if(sequenceCounter==0){cubeButton(byte(3));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==4)
   {
      if(sequenceCounter==0){cubeButton(byte(4));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==5)
   {
      if(sequenceCounter==0){cubeButton(byte(5));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==6)
   {
      if(sequenceCounter==0){cubeButton(byte(6));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==7)
   {
      if(sequenceCounter==0){cubeButton(byte(7));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==8)
   {
      if(sequenceCounter==0){cubeButton(byte(8));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==9)
   {
      if(sequenceCounter==0){cubeButton(byte(9));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==10)
   {
      if(sequenceCounter==0){cubeButton(byte(10));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==11)
   {
      if(sequenceCounter==0){cubeButton(byte(11));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==12)
   {
      if(sequenceCounter==0){cubeButton(byte(12));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==13)
   {
      if(sequenceCounter==0){cubeButton(byte(13));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==14)
   {
      if(sequenceCounter==0){cubeButton(byte(14));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==15)
   {
      if(sequenceCounter==0){cubeButton(byte(15));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==16)
   {
      if(sequenceCounter==0){cubeButton(byte(16));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==17)
   {
      if(sequenceCounter==0){cubeButton(byte(17));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==18)
   {
      if(sequenceCounter==0){cubeButton(byte(18));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==102)
   {
      if(sequenceCounter==0){cubeButton(byte(1));}
      else if(sequenceCounter==1){cubeButton(byte(2));}
      else if(sequenceCounter==2){cubeButton(byte(3));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==105)
   {
      if(sequenceCounter==0){cubeButton(byte(4));}
      else if(sequenceCounter==1){cubeButton(byte(5));}
      else if(sequenceCounter==2){cubeButton(byte(6));}
      else{animatedMode=2;}
   }
   else if(buttonSequence==108)
   {
      if(sequenceCounter==0){cubeButton(byte(7));}
      else if(sequenceCounter==1){cubeButton(byte(8));}
      else if(sequenceCounter==2){cubeButton(byte(9));}
      else{animatedMode=2;}     
   }
   else if(buttonSequence==111)
   {
      if(sequenceCounter==0){cubeButton(byte(10));}
      else if(sequenceCounter==1){cubeButton(byte(11));}
      else if(sequenceCounter==2){cubeButton(byte(12));}
      else{animatedMode=2;}     
   }
   else if(buttonSequence==114)
   {
      if(sequenceCounter==0){cubeButton(byte(13));}
      else if(sequenceCounter==1){cubeButton(byte(14));}
      else if(sequenceCounter==2){cubeButton(byte(15));}
      else{animatedMode=2;}     
   }
   else if(buttonSequence==117)
   {
      if(sequenceCounter==0){cubeButton(byte(16));}
      else if(sequenceCounter==1){cubeButton(byte(17));}
      else if(sequenceCounter==2){cubeButton(byte(18));}
      else{animatedMode=2;}     
   }
   else if(buttonSequence==150)
   {
      if(sequenceCounter==0){cubeButton(byte(10));}
      else if(sequenceCounter==1){cubeButton(byte(10));}
      else{animatedMode=2;}     
   }
   else if(buttonSequence==151)
   {
      if(sequenceCounter==0){cubeButton(byte(8));}
      else if(sequenceCounter==1){cubeButton(byte(9));}
      else{animatedMode=2;}     
   }
   else if(buttonSequence==152)
   {
      if(sequenceCounter==0){cubeButton(byte(13));}
      else if(sequenceCounter==1){cubeButton(byte(14));}
      else{animatedMode=2;}     
   }
   else if(buttonSequence==153)
   {
      if(sequenceCounter==0){cubeButton(byte(9));}
      else if(sequenceCounter==1){cubeButton(byte(9));}
      else{animatedMode=2;}       
   }
   else if(buttonSequence==154)
   {
      if(sequenceCounter==0){cubeButton(byte(1));}
      else if(sequenceCounter==1){cubeButton(byte(1));}
      else{animatedMode=2;}       
   }
   else if(buttonSequence==155)
   {
      if(sequenceCounter==0){cubeButton(byte(7));}
      else if(sequenceCounter==1){cubeButton(byte(7));}
      else{animatedMode=2;}       
   }
   else if(buttonSequence==156)
   {
      if(sequenceCounter==0){cubeButton(byte(3));}
      else if(sequenceCounter==1){cubeButton(byte(3));}
      else{animatedMode=2;}       
   }
   //-------------------
   byte F=16;
   byte Fi=13;
   byte L=4;
   byte Li=1;
   byte U=7;
   byte Ui=10;
   byte R=3;
   byte Ri=6;
   byte D=12;
   byte Di=9;
   byte B=15;
   byte Bi=18;
   byte C=17;
   byte Ci=14;
   //------------------
   if(buttonSequence==1001)
   {
      if(sequenceCounter==0){cubeButton(byte(Fi));}
      else if(sequenceCounter==1){cubeButton(byte(U));}
      else if(sequenceCounter==2){cubeButton(byte(Li));}
      else if(sequenceCounter==3){cubeButton(byte(Ui));}
      else{animatedMode=2;}     
   }
   if(buttonSequence==1002)
   {
      if(sequenceCounter==0){cubeButton(byte(Ri));}
      else if(sequenceCounter==1){cubeButton(byte(Di));}
      else if(sequenceCounter==2){cubeButton(byte(R));}
      else if(sequenceCounter==3){cubeButton(byte(D));}
      else{animatedMode=2;}         
   }
   if(buttonSequence==1003)
   {
      if(sequenceCounter==0){cubeButton(byte(Ui));}
      else if(sequenceCounter==1){cubeButton(byte(Li));}
      else if(sequenceCounter==2){cubeButton(byte(U));}
      else if(sequenceCounter==3){cubeButton(byte(L));}
      else if(sequenceCounter==4){cubeButton(byte(U));}
      else if(sequenceCounter==5){cubeButton(byte(F));}
      else if(sequenceCounter==6){cubeButton(byte(Ui));}
      else if(sequenceCounter==7){cubeButton(byte(Fi));}
      else{animatedMode=2;}         
   }
   if(buttonSequence==10031)
   {
      if(sequenceCounter==0){cubeButton(byte(F));}
      else if(sequenceCounter==1){cubeButton(byte(U));}
      else if(sequenceCounter==2){cubeButton(byte(Fi));}
      else if(sequenceCounter==3){cubeButton(byte(Ui));}
      else if(sequenceCounter==4){cubeButton(byte(Li));}
      else if(sequenceCounter==5){cubeButton(byte(Ui));}
      else if(sequenceCounter==6){cubeButton(byte(L));}
      else if(sequenceCounter==7){cubeButton(byte(U));}
      else{animatedMode=2;} 
   }
   if(buttonSequence==1004)
   {
      if(sequenceCounter==0){cubeButton(byte(U));}
      else if(sequenceCounter==1){cubeButton(byte(R));}
      else if(sequenceCounter==2){cubeButton(byte(Ui));}
      else if(sequenceCounter==3){cubeButton(byte(Ri));}
      else if(sequenceCounter==4){cubeButton(byte(Ui));}
      else if(sequenceCounter==5){cubeButton(byte(Fi));}
      else if(sequenceCounter==6){cubeButton(byte(U));}
      else if(sequenceCounter==7){cubeButton(byte(F));}
      else{animatedMode=2;} 
   }
   if(buttonSequence==10041)
   {
      if(sequenceCounter==0){cubeButton(byte(Fi));}
      else if(sequenceCounter==1){cubeButton(byte(Ui));}
      else if(sequenceCounter==2){cubeButton(byte(F));}
      else if(sequenceCounter==3){cubeButton(byte(U));}
      else if(sequenceCounter==4){cubeButton(byte(R));}
      else if(sequenceCounter==5){cubeButton(byte(U));}
      else if(sequenceCounter==6){cubeButton(byte(Ri));}
      else if(sequenceCounter==7){cubeButton(byte(Ui));}
      else{animatedMode=2;} 
   }   
   if(buttonSequence==1005)
   {
      if(sequenceCounter==0){cubeButton(byte(F));}
      else if(sequenceCounter==1){cubeButton(byte(R));}
      else if(sequenceCounter==2){cubeButton(byte(U));}
      else if(sequenceCounter==3){cubeButton(byte(Ri));}
      else if(sequenceCounter==4){cubeButton(byte(Ui));}
      else if(sequenceCounter==5){cubeButton(byte(Fi));}
      else{animatedMode=2;} 
   }
   if(buttonSequence==1006)
   {
      if(sequenceCounter==0){cubeButton(byte(R));}
      else if(sequenceCounter==1){cubeButton(byte(U));}
      else if(sequenceCounter==2){cubeButton(byte(Ri));}
      else if(sequenceCounter==3){cubeButton(byte(U));}
      else if(sequenceCounter==4){cubeButton(byte(R));}
      else if(sequenceCounter==5){cubeButton(byte(U));}
      else if(sequenceCounter==6){cubeButton(byte(U));}
      else if(sequenceCounter==7){cubeButton(byte(Ri));}
      else{animatedMode=2;}      
   }
   if(buttonSequence==1007)
   {
      if(sequenceCounter==0){cubeButton(byte(U));}
      else if(sequenceCounter==1){cubeButton(byte(R));}
      else if(sequenceCounter==2){cubeButton(byte(Ui));}
      else if(sequenceCounter==3){cubeButton(byte(Li));}
      else if(sequenceCounter==4){cubeButton(byte(U));}
      else if(sequenceCounter==5){cubeButton(byte(Ri));}
      else if(sequenceCounter==6){cubeButton(byte(Ui));}
      else if(sequenceCounter==7){cubeButton(byte(L));}
      else{animatedMode=2;}      
   }
   if(buttonSequence==1008)
   {
      if(sequenceCounter==0){cubeButton(byte(Ri));}
      else if(sequenceCounter==1){cubeButton(byte(Di));}
      else if(sequenceCounter==2){cubeButton(byte(R));}
      else if(sequenceCounter==3){cubeButton(byte(D));}
      else{animatedMode=2;}      
   }
   if(buttonSequence==1011)
   {
      if(sequenceCounter==0){cubeButton(byte(Fi));}
      else if(sequenceCounter==1){cubeButton(byte(D));}
      else if(sequenceCounter==2){cubeButton(byte(Ri));}
      else if(sequenceCounter==3){cubeButton(byte(Di));} 
      else{animatedMode=2;}
      cubeButton(Fi);cubeButton(D);cubeButton(Ri);cubeButton(Di);
   }
   if(buttonSequence==1012)
   {
      if(sequenceCounter==0){cubeButton(byte(Fi));}
      else if(sequenceCounter==1){cubeButton(byte(L));}
      else if(sequenceCounter==2){cubeButton(byte(Di));}
      else if(sequenceCounter==3){cubeButton(byte(Li));}
      else{animatedMode=2;}
   }
   if(buttonSequence==1013)
   {
      if(sequenceCounter==0){cubeButton(byte(Fi));}
      else if(sequenceCounter==1){cubeButton(byte(U));}
      else if(sequenceCounter==2){cubeButton(byte(Li));}
      else if(sequenceCounter==3){cubeButton(byte(Ui));}
      else{animatedMode=2;}
   }
   if(buttonSequence==1014)
   {
      if(sequenceCounter==0){cubeButton(byte(Fi));}
      else if(sequenceCounter==1){cubeButton(byte(R));}
      else if(sequenceCounter==2){cubeButton(byte(Ui));}
      else if(sequenceCounter==3){cubeButton(byte(Ri));} 
      else{animatedMode=2;}
   }
   if(buttonSequence==1021)
   {
      if(sequenceCounter==0){cubeButton(byte(D));}
      else if(sequenceCounter==1){cubeButton(byte(C));}
      else if(sequenceCounter==2){cubeButton(byte(Di));}
      else if(sequenceCounter==3){cubeButton(byte(Ci));}
      else{animatedMode=2;}
   }
   if(buttonSequence==1022)
   {
      if(sequenceCounter==0){cubeButton(byte(L));}
      else if(sequenceCounter==1){cubeButton(byte(C));}
      else if(sequenceCounter==2){cubeButton(byte(Li));}
      else if(sequenceCounter==3){cubeButton(byte(Ci));} 
      else{animatedMode=2;}
   }
   if(buttonSequence==1023)
   {
      if(sequenceCounter==0){cubeButton(byte(U));}
      else if(sequenceCounter==1){cubeButton(byte(C));}
      else if(sequenceCounter==2){cubeButton(byte(Ui));}
      else if(sequenceCounter==3){cubeButton(byte(Ci));} 
      else{animatedMode=2;}
      cubeButton(U);cubeButton(C);cubeButton(Ui);cubeButton(Ci);
   }
   if(buttonSequence==1024)
   {
      if(sequenceCounter==0){cubeButton(byte(R));}
      else if(sequenceCounter==1){cubeButton(byte(C));}
      else if(sequenceCounter==2){cubeButton(byte(Ri));}
      else if(sequenceCounter==3){cubeButton(byte(Ci));} 
      else{animatedMode=2;}
   }
   if(buttonSequence==1031)
   {
      if(sequenceCounter==0){cubeButton(byte(Bi));}
      else if(sequenceCounter==1){cubeButton(byte(Di));}
      else if(sequenceCounter==2){cubeButton(byte(B));}
      else if(sequenceCounter==3){cubeButton(byte(D));}  
      else{animatedMode=2;}
   }
   sequenceCounter++;
}   
//=============================================================================================
// This method checks if an element is a member of a set of number and return 'true' if it is.
//
boolean elementOfSet(byte element, byte[] set)
{ 
  boolean elementOfSetValue=false;
  for(byte i=0; i<set.length;i++)
  {
     if(set[i]==element){elementOfSetValue=true;}
  }
  return(elementOfSetValue);
}  

//=============================================================================================================================
// This method does a sequence of steps to get the first four edge pieces in place.
//---------------------------------------- Stage one ------------------------------------------
void stageOne()
{  
   if(subStage==1)
   {
      if(stageCounter==0)
      {
         startColourFrontFace=stickerColour[cell[26]];
         startColourTopFace=stickerColour[cell[5]];
      }
      if(stageCounter<4)
      {
         int i=stageCounter;
         if(startColourFrontFace==-1){activeSticker=redEdgeStickers[i];}
         else if(startColourFrontFace==-2){activeSticker=yellowEdgeStickers[i];}
         else if(startColourFrontFace==-3){activeSticker=greenEdgeStickers[i];}
         else if(startColourFrontFace==-4){activeSticker=whiteEdgeStickers[i];}
         else if(startColourFrontFace==-5){activeSticker=blueEdgeStickers[i];}
         else if(startColourFrontFace==-6){activeSticker=orangeEdgeStickers[i];}
         stageCounter++;
         subStage=2;
      }
      else
      {
        subStage=13;
      }  
   }
   else if(subStage==2)
   {
      if(cellOfSticker[activeSticker]!=cellRequiredBySticker[activeSticker])
      {
         subStage=3;
      }
      else
      {
         subStage=1;
      }  
   }
   else if(subStage==3)
   {
      if(cellRequiredBySticker[activeSticker]!=38)
      {
         cubeAutoSequence(117);
      }
      else
      {
         subStage=4;
         subSubStage=1;
      }
   }
   else if(subStage==4)  //-----------------------------------------
   {
      if(subStage==4 && subSubStage==1)
      {
         if(elementOfSet(cellOfSticker[activeSticker],bottomRimEdgeCells)==true)
         {
            subSubStage=2;
         }
         else
         {
            subStage=5;
            subSubStage=1;
            subStageCounter=0;
         } 
      }
      else if(subStage==4 && subSubStage==2)
      {
         if(cellOfSticker[activeSticker]!=cellRequiredBySticker[activeSticker])
         {
            cubeAutoSequence(9);
         }
         else
         {
            subStage=2;
            subSubStage=1;
            subStageCounter=0;
         } 
      }  
   }
   else if(subStage==5)  //-----------------------------------------
   {
      if(subStage==5 && subSubStage==1)
      {
         if(elementOfSet(cellOfSticker[activeSticker],leftRimEdgeCells)==true && elementOfSet(cellOfSticker[activeSticker],backFaceEdgeCells)==false)
         {
            subSubStage=2;
         }
         else
         {
            subStage=6;
            subSubStage=1;
            subStageCounter=0;            
         }
      }  
      else if(subStage==5 && subSubStage==2)
      {  
         if(subStageCounter<4)
         {
            subStageCounter++;
            subSubStage=3;
         }
         else
         {
            subStage=2;
            subSubStage=1;
            subStageCounter=0;            
         }  
      }
      else if(subStage==5 && subSubStage==3)
      {
         cubeAutoSequence(1);
         subSubStage=4;
      }
      else if(subStage==5 && subSubStage==4)
      {
         if(elementOfSet(cellOfSticker[activeSticker],leftRimEdgeCells)==true && elementOfSet(cellOfSticker[activeSticker],backFaceEdgeCells)==true)
         {
            cubeAutoSequence(15);
         }
         subSubStage=2;
      }  
   }
   else if(subStage==6)  //--------------------------------------
   {
      if(subStage==6 && subSubStage==1)
      {
         if(elementOfSet(cellOfSticker[activeSticker],topRimEdgeCells)==true && elementOfSet(cellOfSticker[activeSticker],backFaceEdgeCells)==false)
         {
            subSubStage=2;
         }
         else
         {
            subStage=7;
            subSubStage=1;
            subStageCounter=0;            
         }
      }  
      else if(subStage==6 && subSubStage==2)
      {  
         if(subStageCounter<4)
         {
            subStageCounter++;
            subSubStage=3;
         }
         else
         {
            subStage=2;
            subSubStage=1;
            subStageCounter=0;            
         }  
      }
      else if(subStage==6 && subSubStage==3)
      {
         cubeAutoSequence(7);
         subSubStage=4;
      }
      else if(subStage==6 && subSubStage==4)
      {
         if(elementOfSet(cellOfSticker[activeSticker],topRimEdgeCells)==true && elementOfSet(cellOfSticker[activeSticker],backFaceEdgeCells)==true)
         {
            cubeAutoSequence(15);
         }
         subSubStage=2;
      }  
   } 
   else if(subStage==7)  //--------------------------------------
   {
      if(subStage==7 && subSubStage==1)
      {
         if(elementOfSet(cellOfSticker[activeSticker],rightRimEdgeCells)==true && elementOfSet(cellOfSticker[activeSticker],backFaceEdgeCells)==false)
         {
            subSubStage=2;
         }
         else
         {
            subStage=8;
            subSubStage=1;
            subStageCounter=0;            
         }
      }  
      else if(subStage==7 && subSubStage==2)
      {  
         if(subStageCounter<4)
         {
            subStageCounter++;
            subSubStage=3;
         }
         else
         {
            subStage=2;
            subSubStage=1;
            subStageCounter=0;            
         }  
      }
      else if(subStage==7 && subSubStage==3)
      {
         cubeAutoSequence(3);
         subSubStage=4;
      }
      else if(subStage==7 && subSubStage==4)
      {
         if(elementOfSet(cellOfSticker[activeSticker],rightRimEdgeCells)==true && elementOfSet(cellOfSticker[activeSticker],backFaceEdgeCells)==true)
         {
            cubeAutoSequence(15);
         }
         subSubStage=2;
      }  
   } 
   else if(subStage==8)  //--------------------------------------
   {
      if(elementOfSet(cellOfSticker[activeSticker],backFaceEdgeCells)==true && elementOfSet(cellOfSticker[activeSticker],bottomRimEdgeCells)==false)
      {
         cubeAutoSequence(15);
      }
      else
      {
         subStage=9;
      }  
   } 
   else if(subStage==9)  //--------------------------------------
   {
      if(elementOfSet(cellOfSticker[activeSticker],backRimEdgeCells)==true && elementOfSet(cellOfSticker[activeSticker],bottomFaceEdgeCells)==false)
      {
         cubeAutoSequence(15);
      }
      else
      {
         subStage=10;
      }  
   } 
   else if(subStage==10)  //--------------------------------------
   {
      if(elementOfSet(cellOfSticker[activeSticker],backRimEdgeCells)==true && elementOfSet(cellOfSticker[activeSticker],bottomFaceEdgeCells)==true)
      {
         cubeAutoSequence(153);
      }
      else
      {
         subStage=11;
         subSubStage=1;
      }  
   } 
   else if(subStage==11)  //--------------------------------------
   {
      if(subStage==11 && subSubStage==1)
      {
         if(elementOfSet(cellOfSticker[activeSticker],frontRimEdgeCells)==true && elementOfSet(cellOfSticker[activeSticker],bottomFaceEdgeCells)==false)
         {
            subSubStage=2;
         }
         else
         {
            subStage=12; 
         }
      }
      else if(subStage==11 && subSubStage==2)
      {
         if(elementOfSet(cellOfSticker[activeSticker],leftFaceEdgeCells)==true)
         {
            cubeAutoSequence(154);
            subSubStage=3;
         }
         else if(elementOfSet(cellOfSticker[activeSticker],topFaceEdgeCells)==true)
         {
            cubeAutoSequence(155); 
            subSubStage=3;
         }
         else if(elementOfSet(cellOfSticker[activeSticker],rightFaceEdgeCells)==true)
         {
            cubeAutoSequence(156);
            subSubStage=3;
         } 
         else
         {
            subStage=2;
            subSubStage=1;
            subStageCounter=0;
         }
      }   
      else if(subStage==11 && subSubStage==3)
      {
         subStage=2;
         subSubStage=1;
         subStageCounter=0;
      }  
   }
   else if(subStage==12)  //--------------------------------------
   {
      if(elementOfSet(cellOfSticker[activeSticker],frontRimEdgeCells)==true && elementOfSet(cellOfSticker[activeSticker],bottomFaceEdgeCells)==true)
      {
         cubeAutoSequence(1021);
      }
      else
      {
         subStage=2;
         subSubStage=1;
         subStageCounter=0;
      }  
   }
   else if(subStage==13)  //--------------------------------------
   {
      if(subStage==13 && subSubStage==1)
      {
         if(stickerColour[cell[26]]!=startColourFrontFace)
         {
            subSubStage=2;
         }
         else
         {
            subStage=14;
            subStageCounter=0;
            subSubStage=1; 
         }
      }      
      if(subStage==13 && subSubStage==2)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[26]]!=startColourFrontFace){cubeAutoSequence(byte(102));}
            subStageCounter++;
         }
         else
         {
            subSubStage=3;
            subStageCounter=0;
         }   
      }
      if(subStage==13 && subSubStage==3)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[26]]!=startColourFrontFace){cubeAutoSequence(byte(108));}
            subStageCounter++;
         }
         else
         {           
            subSubStage=1;
            subStageCounter=0;
         }   
      }
   }
   //---------------------------------------
   if(subStage==14)  
   {
      if((stickerColour[cell[5]]!=startColourTopFace))
      {
         cubeAutoSequence(114);  
      }
      else
      {
          subStage=15;
          subStageCounter=0;
          subSubStage=1;
      }  
   }
   else if(subStage==15)  //--------------------------------------
   {
      stage=2;
      subStage=1;
      subSubStage=1;
      stageCounter=0;
      subStageCounter=0; 
   }
}   

//=============================================================================================================================
// This method does a sequence of steps to get the front face corner pieces in place.
//---------------------------------------- Stage two ------------------------------------------
void stageTwo()
{
   if(subStage==1 && stageCounter<4)
   {
      int i =stageCounter;
      if(startColourFrontFace==-1){activeSticker=redCornerStickers[i];}
      else if(startColourFrontFace==-2){activeSticker=yellowCornerStickers[i];}
      else if(startColourFrontFace==-3){activeSticker=greenCornerStickers[i];}
      else if(startColourFrontFace==-4){activeSticker=whiteCornerStickers[i];}
      else if(startColourFrontFace==-5){activeSticker=blueCornerStickers[i];}
      else if(startColourFrontFace==-6){activeSticker=orangeCornerStickers[i];}
      stageCounter++;
      subStage=2;
   }
   else if(subStage==1 && stageCounter>=4)
   {
      subStage=5; 
      subSubStage=1;
   }  
   else if(subStage==2)
   {
      if(elementOfSet(cellOfSticker[activeSticker],cellCornerCubelet[4])==false && elementOfSet(cellOfSticker[activeSticker],cellCornerCubelet[8])==false)
      {
         cubeAutoSequence(byte(114));
      }
      else
      {
         subStage=3;
      }  
   } 
   else if(subStage==3)
   {
       if(stickerRequiredByCell[37]!=activeSticker || cell[37]!=activeSticker)
       {
          subStage=4;
          subSubStage=1;
       }
       else
       {
          subStage=1;
       }  
   }
   else if(subStage==4 && subSubStage==1)
   {
      if(elementOfSet(cellOfSticker[activeSticker],frontFaceCornerCells)==true || elementOfSet(cellOfSticker[activeSticker],frontRimCornerCells)==true)
      {
         subStage=4;
         subSubStage=2;
      }
      else
      {
         subStage=4;
         subSubStage=3;
      }  
   }
   else if(subStage==4 && subSubStage==2)
   {
      if(elementOfSet(cellOfSticker[activeSticker],frontFaceCornerCells)==true || elementOfSet(cellOfSticker[activeSticker],frontRimCornerCells)==true)
      {
         cubeAutoSequence(1031);
      }
      else
      {
         subStage=4;
         subSubStage=3;
      }  
   }
   else if(subStage==4 && subSubStage==3)
   {
      if(stickerRequiredByCell[37]!=activeSticker)
      {
         cubeAutoSequence(152);
      }
      else
      {
         subStage=4;
         subSubStage=4;
      }  
   }
   else if(subStage==4 && subSubStage==4)
   {
     if(cell[37]!=activeSticker)
     {
        cubeAutoSequence(1031);
     }
     else
     {
        subStage=1;
     }  
   }    
   //---------------
   else if(subStage==5) 
   {
      if(subStage==5 && subSubStage==1)
      {
         if(stickerColour[cell[26]]!=startColourFrontFace)
         {
            subSubStage=2;
         }
         else
         {
            subStage=6;
            subStageCounter=0;
            subSubStage=1; 
         }
      }      
      if(subStage==5 && subSubStage==2)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[26]]!=startColourFrontFace){cubeAutoSequence(byte(102));}
            subStageCounter++;
         }
         else
         {
            subSubStage=3;
            subStageCounter=0;
         }   
      }
      if(subStage==5 && subSubStage==3)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[26]]!=startColourFrontFace){cubeAutoSequence(byte(108));}
            subStageCounter++;
         }
         else
         {           
            subSubStage=1;
            subStageCounter=0;
         }   
      }
   }
   //---------------------------------------
   if(subStage==6)  
   {
      if((stickerColour[cell[5]]!=startColourTopFace))
      {
         cubeAutoSequence(114);  
      }
      else
      {
          subStage=7;
          subStageCounter=0;
          subSubStage=1;
      }  
   }
   else if(subStage==7)  //--------------------------------------
   {
      stage=3;
      subStage=1;
      subSubStage=1;
      stageCounter=0;
      subStageCounter=0; 
   }
}
//=============================================================================================================================
// This method does a sequence of steps to get the mid region edge corner pieces in place.
//---------------------------------------- Stage three ------------------------------------------
void stageThree()
{  
   if(subStage==1) 
   {
      if(subStage==1 && subSubStage==1)
      {
         if(stickerColour[cell[50]]!=startColourFrontFace)
         {
            subSubStage=2;
         }
         else
         {
            subStage=2;
            subStageCounter=0;
            subSubStage=1; 
         }
      }      
      else if(subStage==1 && subSubStage==2)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[50]]!=startColourFrontFace){cubeAutoSequence(byte(102));}
            subStageCounter++;
         }
         else
         {
            subSubStage=3;
            subStageCounter=0;
         }   
      }
      else if(subStage==1 && subSubStage==3)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[50]]!=startColourFrontFace){cubeAutoSequence(byte(114));}
            subStageCounter++;
         }
         else
         {           
            subSubStage=1;
            subStageCounter=0;
         }   
      }
   }    
   //----------------------------------------
   if(subStage==2)
   {
      for(byte i=0;i<8;i++)
      {
         if(stickerColour[cell[50]]==-1 || stickerColour[cell[50]]==-6){activeMidRegionEdgeStickers[i]=redOrangeAxisMidRegionEdgeStickers[i];}
         else if (stickerColour[cell[50]]==-2 || stickerColour[cell[50]]==-4){activeMidRegionEdgeStickers[i]=yellowWhiteAxisMidRegionEdgeStickers[i];}
         else if (stickerColour[cell[50]]==-3 || stickerColour[cell[50]]==-5){activeMidRegionEdgeStickers[i]=greenBlueAxisMidRegionEdgeStickers[i];}
      } 
      subStage=3;
      subStageCounter=0;
      subSubStage=1;
   }
   //---------------------------------------
   if(subStage==3)
   {
      if(subStage==3 && subSubStage==1 && subStageCounter<8)
      {
         int i=subStageCounter;
         activeSticker=activeMidRegionEdgeStickers[i];
         subStageCounter++;
         subSubStage=2;
      }
      else if(subStage==3 && subSubStage==1 && subStageCounter>=8)
      {
         subStage=4;
         subStageCounter=0;
         subSubStage=1;
      } 
      else if(subStage==3 && subSubStage==2)
      {
         if(cellOfSticker[activeSticker]!=cellRequiredBySticker[activeSticker])
         {
            subSubStage=3;
         }
         else
         {
            subSubStage=1;
         }  
      }
      else if(subStage==3 && subSubStage==3)
      {
         if(elementOfSet(cellOfSticker[activeSticker],frontFaceEdgeCells)==false && cellOfSticker[activeSticker]!=8)
         {
            cubeAutoSequence(108);
         }
         else
         {
            subSubStage=4;
         }  
      }
      else if(subStage==3 && subSubStage==4)
      {
         if(elementOfSet(cellOfSticker[activeSticker],frontFaceEdgeCells)==true)
         {
            if(cellOfSticker[activeSticker]==25){cubeAutoSequence(10031);}
            else if(cellOfSticker[activeSticker]==27){cubeAutoSequence(10041);}
            subSubStage=5;
         }
         else if(cellOfSticker[activeSticker]==8)
         {
            subSubStage=7;
         }
         else
         {
            subSubStage=2;
         }
      }   
      else if(subStage==3 && subSubStage==5)
      {
         if(elementOfSet(cellRequiredBySticker[activeSticker],frontFaceEdgeCells)==false)
         {
            cubeAutoSequence(151);
         }
         else
         {
            subSubStage=6;
         }  
      }
      else if(subStage==3 && subSubStage==6)
      {
         if(cellRequiredBySticker[activeSticker]==25)
         {
            cubeAutoSequence(1003);
         }
         else if(cellRequiredBySticker[activeSticker]==27)
         {
            cubeAutoSequence(1004);
         }
         subSubStage=2; 
      }
      else if(subStage==3 && subSubStage==7)
      {
         if(cellRequiredBySticker[activeSticker]!=24 && cellRequiredBySticker[activeSticker]!=28)
         {
            cubeAutoSequence(151);
         }
         else
         {
            subSubStage=8;
         }  
      }
      else if(subStage==3 && subSubStage==8)
      {
         if(cellRequiredBySticker[activeSticker]==24)
         {
            cubeAutoSequence(1003);
         }
         else if(cellRequiredBySticker[activeSticker]==28)
         {
            cubeAutoSequence(1004);
         }
         subSubStage=2; 
      }
   }   
   //---------------------------------------
   if(subStage==4) 
   {
      if(subStage==4 && subSubStage==1)
      {
         if(stickerColour[cell[26]]!=startColourFrontFace)
         {
            subSubStage=2;
         }
         else
         {
            subStage=5;
            subStageCounter=0;
            subSubStage=1; 
         }
      }      
      if(subStage==4 && subSubStage==2)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[26]]!=startColourFrontFace){cubeAutoSequence(byte(102));}
            subStageCounter++;
         }
         else
         {
            subSubStage=3;
            subStageCounter=0;
         }   
      }
      if(subStage==4 && subSubStage==3)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[26]]!=startColourFrontFace){cubeAutoSequence(byte(108));}
            subStageCounter++;
         }
         else
         {           
            subSubStage=1;
            subStageCounter=0;
         }   
      }   
   }
   //---------------------------------------
   if(subStage==5)  
   {
      if((stickerColour[cell[5]]!=startColourTopFace))
      {
         cubeAutoSequence(114);  
      }
      else
      {
          subStage=6;
          subStageCounter=0;
          subSubStage=1;
      }  
   }
   //---------------------------------------
   if(subStage==6)
   {
      stage++;
      subStage=1;
   }   
}
//=============================================================================================================================
// This method does a sequence of steps to get the back face edge pieces in place.
//---------------------------------------- Stage four ------------------------------------------
void stageFour()
{  
   if(subStage==1) 
   {
      if(subStage==1 && subSubStage==1)
      {
         if(stickerColour[cell[50]]!=startColourFrontFace)
         {
            subSubStage=2;
         }
         else
         {
            subStage=2;
            subStageCounter=0;
            subSubStage=1; 
         }
      }      
      else if(subStage==1 && subSubStage==2)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[50]]!=startColourFrontFace){cubeAutoSequence(byte(102));}
            subStageCounter++;
         }
         else
         {
            subSubStage=3;
            subStageCounter=0;
         }   
      }
      else if(subStage==1 && subSubStage==3)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[50]]!=startColourFrontFace){cubeAutoSequence(byte(114));}
            subStageCounter++;
         }
         else
         {           
            subSubStage=1;
            subStageCounter=0;
         }   
      }
   }    
   //---------------------------------------
   if(subStage==2)
   {
      if(subStage==2 && subSubStage==1)
      {
         if(stickerColour[cell[2]]!=stickerColour[cell[5]] || stickerColour[cell[4]]!=stickerColour[cell[5]] || stickerColour[cell[6]]!=stickerColour[cell[5]] || stickerColour[cell[8]]!=stickerColour[cell[5]])
         {
            subSubStage=2;
         }
         else
         {
            subStage=3;
            subStageCounter=0;
            subSubStage=1;
         }  
      }   
      else if(subStage==2 && subSubStage==2)
      {
         if(stickerColour[cell[2]]!=stickerColour[cell[5]] && stickerColour[cell[4]]!=stickerColour[cell[5]] && stickerColour[cell[6]]!=stickerColour[cell[5]] && stickerColour[cell[8]]!=stickerColour[cell[5]])
         {
            cubeAutoSequence(1005);
         }
         else
         {
            subSubStage=3;
         }  
      }         
      else if(subStage==2 && subSubStage==3)
      {
         if(stickerColour[cell[2]]!=stickerColour[cell[5]] && stickerColour[cell[4]]==stickerColour[cell[5]] && stickerColour[cell[6]]!=stickerColour[cell[5]] && stickerColour[cell[8]]==stickerColour[cell[5]])
         {
            cubeAutoSequence(7);
         }
         else
         {
            subSubStage=4;
         }  
      }
      else if(subStage==2 && subSubStage==4)
      {
         if(stickerColour[cell[2]]!=stickerColour[cell[5]] && stickerColour[cell[4]]!=stickerColour[cell[5]] && stickerColour[cell[6]]==stickerColour[cell[5]] && stickerColour[cell[8]]==stickerColour[cell[5]])
         {
            cubeAutoSequence(150);
         }
         else
         {
            subSubStage=5;
         }
      }
      else if(subStage==2 && subSubStage==5)
      {
         if(stickerColour[cell[2]]==stickerColour[cell[5]] && stickerColour[cell[4]]!=stickerColour[cell[5]] && stickerColour[cell[6]]==stickerColour[cell[5]] && stickerColour[cell[8]]!=stickerColour[cell[5]])
         {
            cubeAutoSequence(10);
         }
         else
         {
            subSubStage=6;
         }
      }
      else if(subStage==2 && subSubStage==6)
      {
         if(stickerColour[cell[2]]==stickerColour[cell[5]] && stickerColour[cell[4]]==stickerColour[cell[5]] && stickerColour[cell[6]]!=stickerColour[cell[5]] && stickerColour[cell[8]]!=stickerColour[cell[5]])
         {
            cubeAutoSequence(1005);
         }
         else
         {
            subSubStage=7;
         }
      }
      else if(subStage==2 && subSubStage==7)
      {
         if(stickerColour[cell[2]]==stickerColour[cell[5]] && stickerColour[cell[4]]!=stickerColour[cell[5]] && stickerColour[cell[6]]!=stickerColour[cell[5]] && stickerColour[cell[8]]==stickerColour[cell[5]])
         {
            cubeAutoSequence(10);
         }
         else
         {
            subSubStage=8;
         }
      }
      else if(subStage==2 && subSubStage==8)
      {
         if(stickerColour[cell[2]]!=stickerColour[cell[5]] && stickerColour[cell[4]]==stickerColour[cell[5]] && stickerColour[cell[6]]==stickerColour[cell[5]] && stickerColour[cell[8]]!=stickerColour[cell[5]])
         {
            cubeAutoSequence(1005);
         }
         else
         {
            subSubStage=1;
         }
      } 
   }
   //---------------------------------------
   if(subStage==3)
   {
      if(subStage==3 && subSubStage==1)
      {
         if(stickerRequiredByCell[11]!=cell[11] || stickerRequiredByCell[14]!=cell[14] || stickerRequiredByCell[17]!=cell[17] || stickerRequiredByCell[20]!=cell[20])
         {
            subSubStage=2;
         }
         else
         {
            subStage=4;
            subStageCounter=0;
            subSubStage=1;
         }
      }   
      else if(subStage==3 && subSubStage==2)
      {
         if(stickerRequiredByCell[20]!=cell[20])
         {
            cubeAutoSequence(10);
         }
         else
         {
            subSubStage=3;
         }  
      }  
      else if(subStage==3 && subSubStage==3)
      {
         if(stickerRequiredByCell[20]==cell[20] && stickerRequiredByCell[11]==cell[11] && stickerRequiredByCell[14]!=cell[14] && stickerRequiredByCell[17]!=cell[17])
         {
            cubeAutoSequence(108);  
         }
         subSubStage=4;
      }
      else if(subStage==3 && subSubStage==4)
      {
         if(stickerRequiredByCell[20]==cell[20] && stickerRequiredByCell[14]==cell[14] && stickerRequiredByCell[17]!=cell[17] && stickerRequiredByCell[11]!=cell[11])
         {
            cubeAutoSequence(1006); 
         }
         subSubStage=5;
      }
      else if(subStage==3 && subSubStage==5)
      {
         if(stickerRequiredByCell[20]==cell[20] && stickerRequiredByCell[17]==cell[17] && stickerRequiredByCell[14]!=cell[14] && stickerRequiredByCell[11]!=cell[11])
         {
            cubeAutoSequence(1006); 
         }
         subSubStage=6;
      }
      else if(subStage==3 && subSubStage==6)
      {
         if(stickerRequiredByCell[20]==cell[20] && stickerRequiredByCell[17]!=cell[17] && stickerRequiredByCell[14]!=cell[14] && stickerRequiredByCell[11]!=cell[11])
         {
            cubeAutoSequence(108);  
         }
         subSubStage=1;
      }
   }
   //---------------------------------------
   if(subStage==4) 
   {
      if(subStage==4 && subSubStage==1)
      {
         if(stickerColour[cell[26]]!=startColourFrontFace)
         {
            subSubStage=2;
         }
         else
         {
            subStage=5;
            subStageCounter=0;
            subSubStage=1; 
         }
      }      
      if(subStage==4 && subSubStage==2)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[26]]!=startColourFrontFace){cubeAutoSequence(byte(102));}
            subStageCounter++;
         }
         else
         {
            subSubStage=3;
            subStageCounter=0;
         }   
      }
      if(subStage==4 && subSubStage==3)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[26]]!=startColourFrontFace){cubeAutoSequence(byte(108));}
            subStageCounter++;
         }
         else
         {           
            subSubStage=1;
            subStageCounter=0;
         }   
      }   
   }
   //---------------------------------------
   if(subStage==5)  
   {
      if((stickerColour[cell[5]]!=startColourTopFace))
      {
         cubeAutoSequence(114);  
      }
      else
      {
          subStage=6;
          subStageCounter=0;
          subSubStage=1;
      }  
   }
   //---------------------------------------
   if(subStage==6)
   {
      stage++;
      subStage=1;
   }  
}   
//=============================================================================================================================
// This method gives a number that represents which cubelet that a corner sticker is on.
byte cubeletOfCell(byte kIn)
{   
   byte cubeletOut=0;
   for(byte j=0;j<=8;j++)
   {
     if(elementOfSet(kIn,cellCornerCubelet[j])==true){cubeletOut=j;}
   }
   return(cubeletOut);
} 
//=============================================================================================================================
// This method does a sequence of steps to get the back face corner pieces in place.
//---------------------------------------- Stage five ------------------------------------------
void stageFive()
{   
   if(subStage==1) 
   {
      if(subStage==1 && subSubStage==1)
      {
         if(stickerColour[cell[50]]!=startColourFrontFace)
         {
            subSubStage=2;
         }
         else
         {
            subStage=2;
            subStageCounter=0;
            subSubStage=1; 
         }
      }      
      else if(subStage==1 && subSubStage==2)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[50]]!=startColourFrontFace){cubeAutoSequence(byte(102));}
            subStageCounter++;
         }
         else
         {
            subSubStage=3;
            subStageCounter=0;
         }   
      }
      else if(subStage==1 && subSubStage==3)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[50]]!=startColourFrontFace){cubeAutoSequence(byte(114));}
            subStageCounter++;
         }
         else
         {           
            subSubStage=1;
            subStageCounter=0;
         }   
      }
   }     
   //---------------------------------------  
   if(subStage==2)
   {
      if(subStageCounter<4)
      {
         if(cubeletOfCell(cellOfStickerRequiredByCell[9])!=cubeletOfCell(byte(9)))
         {
            cubeAutoSequence(108);
         }
         subStageCounter++;
      }
      else
      {
         subStage=3;
         subStageCounter=0;
         subSubStage=1;
      }
   }
   //---------------------------------------
   if(subStage==3)
   {
      if(subStage==3 && subSubStage==1)
      {
         if(cubeletOfCell(cellOfStickerRequiredByCell[9])!=cubeletOfCell(byte(9)))
         {            
            cubeAutoSequence(1007);
            subSubStage=2;
         }
         else
         {
            subStage=4;
            subStageCounter=0;
            subSubStage=1;
         }  
      }
      else if(subStage==3 && subSubStage==2)  
      {
         if(subStageCounter<4)
         {
            if(cubeletOfCell(cellOfStickerRequiredByCell[9])!=cubeletOfCell(byte(9)))
            {
               cubeAutoSequence(108);
            }
            subStageCounter++;
         }
         else
         {
            subStage=4;
            subStageCounter=0;
            subSubStage=1;
         }  
      }  
   }
   //------------------------------------------
   if(subStage==4)  
   {
      if(subStageCounter<3)
      {
         if(cubeletOfCell(cellOfStickerRequiredByCell[7])!=cubeletOfCell(byte(7)))
         {
             cubeAutoSequence(1007);
         }
         subStageCounter++;
      }
      else
      {
            subStage=5;
            subStageCounter=0;
      }  
   }
   //---------------------------------------
   if(subStage==5) 
   {
      if(subStageCounter<4)
      {
         if(stickerColour[cell[9]]!=stickerColour[cell[6]] || stickerColour[cell[15]]!=stickerColour[cell[14]] || stickerColour[cell[16]]!=stickerColour[cell[17]])
         {
            cubeAutoSequence(1008);
         }
         else
         {
            cubeAutoSequence(7);
            subStageCounter++;
         }  
      } 
      else
      {
            subStage=6;
            subStageCounter=0;
            subSubStage=1;           
      }
   }
   //---------------------------------------
   if(subStage==6) 
   {
      if(subStage==6 && subSubStage==1)
      {
         if(stickerColour[cell[26]]!=startColourFrontFace)
         {
            subSubStage=2;
         }
         else
         {
            subStage=7;
            subStageCounter=0;
            subSubStage=1; 
         }
      }      
      if(subStage==6 && subSubStage==2)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[26]]!=startColourFrontFace){cubeAutoSequence(byte(102));}
            subStageCounter++;
         }
         else
         {
            subSubStage=3;
            subStageCounter=0;
         }   
      }
      if(subStage==6 && subSubStage==3)
      {
         if(subStageCounter<4)
         {
            if(stickerColour[cell[26]]!=startColourFrontFace){cubeAutoSequence(byte(108));}
            subStageCounter++;
         }
         else
         {           
            subSubStage=1;
            subStageCounter=0;
         }   
      }   
   }
   //---------------------------------------
   if(subStage==7)  
   {
      if((stickerColour[cell[5]]!=startColourTopFace))
      {
         cubeAutoSequence(114);  
      }
      else
      {
          subStage=8;
          subStageCounter=0;
          subSubStage=1;
      }  
   }
   //---------------------------------------
   if(subStage==8)
   {
      stage++;
      subStage=1;
   }  
}
//=============================================================================================================================
