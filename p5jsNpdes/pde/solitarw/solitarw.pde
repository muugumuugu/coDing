/*
*
*      Solitaire 
*     By: Nathan Durkee
*     Finished: March 19, 2019
*
*/

//Window size:
int wWidth = window.innerWidth; //Gets the size of window you are using
int wHeight = window.innerHeight*1.2; //We want a bit more room on the bottom of the screen because if you get a large stack of cards, it will
                                      //be slightly cut off the side of the screen.

//declare global variables:
int cardWidth = 96; //CardWidth
int cardHeight = 144; //CardHeight
int startY; 
int startX; 
int cardNumber; //Each number represents a card.    For example:  1 =  "Ace Of Spades"
boolean selected; //When clicking on a card, that card will be selected.... (it will be outlined)
int moveCardValue; //When you select a card, a variable for that card's value is saved to this for future conditonals.

//Used when determining the location previous click (the position of the selected card) (used in a 2D array kind of like a grid (visuals are irrelevant) ) :
int tempX; //X value (how many spaces over to the right/left)
int tempY; //Y value (how many spaces up/down)

//Pile Stack / Discard Pile:
int pileStackSize; //How many cards are in the pile on the top left that you click on to reveal a new card into the discardPile that you can use.
int discardStackSize; //How many cards are in the discardPile (This is the pile the cards are outputed to when you click on the pile to reveal a card)
int pileIndex; //Determines the index of the Pile (used to display the top card)
int selectCount; //Determines how many cards are selected (Basically when you click a card with multiple cards under it, it determines how many cards to move with it)

//End pile:
int endPileIndex1; //Used to display the top card of the end pile for SPADES
int endPileIndex2; //Used to display the top card of the end pile for CLUBS
int endPileIndex3; //Used to display the top card of the end pile of DIAMONDS
int endPileIndex4; //Used to display the top card of the end pile of HEARTS

boolean selected2;
byte selected2Value;

boolean[] flipped;
int cards[] = new int[52];
int boardCards[][] = new int[7][20]; // Tracks value of each card: 0 = none... 1 = Ace.. etc.  (91 integers)
flipped = new boolean[7][13]; //create the flipped boolean array
int select[][] = new int[7][20];
int boxX1[] = new int[7]; //Minimum X value Array
int boxX2[] = new int[7]; //Maximum X value Array
int boxY1[][] = new int[7][20]; //Minimum Y value 2D Array
int boxY2[][] = new int[7][20]; //Maximum Y value 2D Array
int pile[];
int discardPile[] = new int[24];
int endPile1[] = new int[13];
int endPile2[] = new int[13];
int endPile3[] = new int[13];
int endPile4[] = new int[13];
int cardStackSize[] = new int[7]; //Create a 1D array to keep track of all the stack sizes.

void setup(){
  startY = 250;
  startX = 250;
  background(130);
  textSize(12);
  size(wWidth,wHeight);  
 start();
} //End void setup

void start()
{
endPileIndex1 = 0;
endPileIndex2 = 0;
endPileIndex3 = 0;
endPileIndex4 = 0;
selected2Value = 0;
pileIndex = 0;
discardPileIndex = -1;
selected2 = false;
  for(int i = 0; i < 13; i++)
  {
    endPile1[i] = 0;
    endPile2[i] = 0;
    endPile3[i] = 0;
    endPile4[i] = 0;
  }
  
  selected = false;
  for(int i = 1; i < 53; i++) { cards[i-1] = i; }
  int tempNum;
  int tempCard;
  int tempCard2;
  int tempNum2;
  
  for(int c = 1; c < 53; c++) 
  {
    tempNum = int(random(1,53));
    tempNum2 = int(random(1,53));
    tempCard1 = cards[tempNum-1];
    tempCard2 = cards[tempNum2-1];
    cards[tempNum-1] = tempCard2;
    cards[tempNum2-1] = tempCard1;
    
  }   
  for(int i = 0; i < 24; i++) { discardPile[i] = 0; }
  for(int i = 0; i < 7; i++) { cardStackSize[i] = i; }
  
  for(int i = 0; i < 7; i++)
   {
    for(int j = 0; j < 20; j++)
    {
        boardCards[i][j] = 0;
    }
   }
  for(int i = 0; i < 7; i++) { cardStackSize[i] = i; } 
  
  
  for(int i = 0; i < 7; i++) { for(int j = 0; j < 20; j++) {  flipped[i][j] = true; }}
  for(int i = 0; i < 7; i++) { for(int j = 0; j < 20; j++) { select[i][j] = 0; }}
  
  cardNumber = 0;
  for(int i = 1; i < 8; i++)
  {
    for(int j = 1; j < i+1; j++)
    {
      boardCards[i-1][j-1] = cards[cardNumber];
      cardNumber++;
      if(i-1 != j-1) { flipped[i-1][j-1] = false; }
      
    } //End j For loop 
  } //End i For loop
  
  pileStackSize = 24;
  pile = new int[pileStackSize];
  for(int i = 0; i < pileStackSize; i++) //Make define the leftover cards to a Pile stack 
  {
    pile[i] = cards[cardNumber];
    cardNumber++;
    //print(".." + pile[i]);
  }
pileIndex = 1;
} //End void start
int offset = 9;
int xValue = 203;
for(int i = 0; i < 7; i++) //Fill out boxX1 and boxX2 values...
{
  
  boxX1[i] = xValue;
  boxX2[i] = xValue+cardWidth;
  xValue += offset+1+cardWidth;
}

void draw()
{
  background(130);
  rectMode(CENTER);
  noFill();
  stroke(0);

  rect(startX,90,cardWidth,cardHeight); //Pile Stack
   if(pileStackSize > 0 && pileIndex <= pileStackSize) //FaceDown cards from draw pile
  {
    fill(60);
    rect(startX,90,cardWidth,cardHeight);
  } 
  
  noFill();
  rect(startX+cardWidth+10,90,cardWidth,cardHeight); //DiscardPile outline
  
  if(discardPile[discardPileIndex] != 0 && discardPile[discardPileIndex] != undefined) //FaceDown cards from draw pile
  {
    fill(250); 

    if(selected2 == true && selected2Value == 1){ stroke(255,215,0); } else{ stroke(0); }
    rect(startX+cardWidth+10,90,cardWidth,cardHeight);
    fill(0);
    
    textSize(38);
    if(discardPile[discardPileIndex] > 0 && discardPile[discardPileIndex] < 14) { fill(0); text("♠",startX+cardWidth,90+10); byte cardActualValue = discardPile[discardPileIndex]; } //Black,Spades
        if(discardPile[discardPileIndex] > 13 && discardPile[discardPileIndex] < 27) {  fill(0); text("♣",startX+cardWidth,90+10); byte cardActualValue = discardPile[discardPileIndex] - 13;} //Black,Clubs
        if(discardPile[discardPileIndex] > 26 && discardPile[discardPileIndex] < 40) { fill(255,0,0); text("♦",startX+cardWidth,90+10); byte cardActualValue = discardPile[discardPileIndex] - 26; } //Red,Diamonds
        if(discardPile[discardPileIndex] > 39 && discardPile[discardPileIndex] < 53) { fill(255,0,0); text("♥",startX+cardWidth,90+10); byte cardActualValue = discardPile[discardPileIndex] - 39;} //Red,Hearts
        if(cardActualValue == 1){ String cardActualValueText = "A"; } 
        else if(cardActualValue == 11){ String cardActualValueText = "J"; }
        else if(cardActualValue == 12){ String cardActualValueText = "Q"; }
        else if(cardActualValue == 13){ String cardActualValueText = "K"; }
        else{ String cardActualValueText = cardActualValue; }
    textSize(14);
    text(cardActualValueText,startX+cardWidth+38,90-50);
    text(cardActualValueText,startX+cardWidth-25,90+60);
  } 
  stroke(0);
  noFill();
  rect(startX*2+30,90,cardWidth,cardHeight); //Spades pile Outline
   if(endPileIndex1 > 0) //Draw Top Card From Spades Pile
  {
    if(endPile1[endPileIndex1-1] != undefined)
    {
      textSize(38);
      fill(250);
     rect(startX*2+30,90,cardWidth,cardHeight);
    if(endPile1[endPileIndex1-1] > 0) { fill(0); text("♠",(startX+cardWidth*3)-14,90+10); byte cardActualValue = endPile1[endPileIndex1-1]; } //Black,Spades
      
        if(cardActualValue == 1){ String cardActualValueText = "A"; } 
        else if(cardActualValue == 11){ String cardActualValueText = "J"; }
        else if(cardActualValue == 12){ String cardActualValueText = "Q"; }
        else if(cardActualValue == 13){ String cardActualValueText = "K"; }
        else{ String cardActualValueText = cardActualValue; }
    textSize(14);
    text(cardActualValueText,startX+cardWidth*3+22,90-52);
    text(cardActualValueText,startX+cardWidth*3-44,90+62);
      
    
    }
  } 
  noFill();
  rect(startX*2+cardWidth+40,90,cardWidth,cardHeight); //Clubs Pile Outline
  if(endPileIndex2 > 0) //Draw Top Card From Clubs Pile
  {
    if(endPile2[endPileIndex2-1] != undefined)
    {
      textSize(38);
      fill(250);
     rect(startX*2+cardWidth+40,90,cardWidth,cardHeight);
    if(endPile2[endPileIndex2-1] > 13 && endPile2[endPileIndex2-1] < 27 ) { fill(0); text("♣",(startX+cardWidth*4)-6,90+10); byte cardActualValue = endPile2[endPileIndex2-1]-13;  }
    //  println(endPile2[endPileIndex2-1]);
        if(cardActualValue == 1){ String cardActualValueText = "A"; } 
        else if(cardActualValue == 11){ String cardActualValueText = "J"; }
        else if(cardActualValue == 12){ String cardActualValueText = "Q"; }
        else if(cardActualValue == 13){ String cardActualValueText = "K"; }
        else{ String cardActualValueText = cardActualValue; }
    textSize(14);
    text(cardActualValueText,startX+cardWidth*4+34,90-52);
    text(cardActualValueText,startX+cardWidth*4-36,90+62);
    }
  } //End Clubs 
  
  noFill();
  rect(startX*2+cardWidth*2+50,90,cardWidth,cardHeight); //Diamonds Pile Outline
  if(endPileIndex3 > 0) //Draw Top Card From Diamonds Pile
  {
    if(endPile3[endPileIndex3-1] != undefined)
    {
      textSize(38);
      fill(250);
     rect(startX*2+cardWidth*2+50,90,cardWidth,cardHeight);
    if(endPile3[endPileIndex3-1] > 13 && endPile2[endPileIndex3-1] < 27 ) {fill(255,0,0); text("♦",(startX+cardWidth*5)+2,90+12); byte cardActualValue = endPile3[endPileIndex3-1]-26;  } 
        if(cardActualValue == 1){ String cardActualValueText = "A"; } 
        else if(cardActualValue == 11){ String cardActualValueText = "J"; }
        else if(cardActualValue == 12){ String cardActualValueText = "Q"; }
        else if(cardActualValue == 13){ String cardActualValueText = "K"; }
        else{ String cardActualValueText = cardActualValue; }
    textSize(14);
    text(cardActualValueText,startX+cardWidth*5+46,90-52);
    text(cardActualValueText,startX+cardWidth*5-28,90+62);
    }
  } //End diamonds
  
  
  noFill();
  rect(startX*2+cardWidth*3+60,90,cardWidth,cardHeight); //Hearts Pile Outline
  if(endPileIndex4 > 0) //Draw Top Card From Spades Pile
  {
    if(endPile4[endPileIndex4-1] != undefined)
    {
      textSize(38);
      fill(250);
     rect(startX*2+cardWidth*3+60,90,cardWidth,cardHeight);
    if(endPile4[endPileIndex4-1] > 13 && endPile2[endPileIndex4-1] < 27 ) {fill(255,0,0); text("♥",(startX+cardWidth*6)+12,90+12); byte cardActualValue = endPile4[endPileIndex4-1]-39;  } 
        if(cardActualValue == 1){ String cardActualValueText = "A"; } 
        else if(cardActualValue == 11){ String cardActualValueText = "J"; }
        else if(cardActualValue == 12){ String cardActualValueText = "Q"; }
        else if(cardActualValue == 13){ String cardActualValueText = "K"; }
        else{ String cardActualValueText = cardActualValue; }
    textSize(14);
    text(cardActualValueText,startX+cardWidth*6+56,90-52);
    text(cardActualValueText,startX+cardWidth*6-16,90+62);
    }
  } //End hearts
  
  
  
  for(int i = 0; i < 7; i++)
  {
    for(int j = 0; j < cardStackSize[i]+1; j++)
    {
      if(flipped[i][j] == true) { 
        noFill();
        rectMode(CENTER);
        fill(250);
        stroke(0);
        
         if(select[i][j] == true)
         {
           stroke(255,215,0);
         }
        else{ stroke(0); }
        
      rect((startX)+((cardWidth+10)*i),(startY)+30*j,cardWidth,cardHeight);
        fill(0); 
      
        textSize(38);
        if(boardCards[i][j] > 0 && boardCards[i][j] < 14) { fill(0); text("♠",(startX)+((cardWidth+10)*i)-6,((startY)+30*j)+10); byte cardActualValue = boardCards[i][j]; } //Black,Spades
        if(boardCards[i][j] > 13 && boardCards[i][j] < 27) {  fill(0); text("♣",(startX)+((cardWidth+10)*i)-6,((startY)+30*j)+10); byte cardActualValue = boardCards[i][j] - 13;} //Black,Clubs
        if(boardCards[i][j] > 26 && boardCards[i][j] < 40) { fill(255,0,0); text("♦",(startX)+((cardWidth+10)*i)-6,((startY)+30*j)+10); byte cardActualValue = boardCards[i][j] - 26; } //Red,Diamonds
        if(boardCards[i][j] > 39 && boardCards[i][j] < 53) { fill(255,0,0); text("♥",(startX)+((cardWidth+10)*i)-6,((startY)+30*j)+10); byte cardActualValue = boardCards[i][j] - 39;} //Red,Hearts
        if(cardActualValue == 1){ String cardActualValueText = "A"; } 
        else if(cardActualValue == 11){ String cardActualValueText = "J"; }
        else if(cardActualValue == 12){ String cardActualValueText = "Q"; }
        else if(cardActualValue == 13){ String cardActualValueText = "K"; }
        else{ String cardActualValueText = cardActualValue; }
        
        textSize(14);
         text(cardActualValueText,(startX)+((cardWidth+10)*i)+28,((startY)+30*j)-48); 
        text(cardActualValueText,(startX)+((cardWidth+10)*i)-35,((startY)+30*j)+60);
        fill(0);
      } 
      else{ fill(60); stroke(0);
          rectMode(CENTER);
      rect((startX)+((cardWidth+10)*i),(startY)+30*j,cardWidth,cardHeight);
          }
      
    } //End j For loop
  } //End i For loop
  
  for(int i = 0; i < 7; i++)
  {
    int yVal = 182;
    int offset = 30;
    for(int j = 0; j < 20; j++)
    {
      if(j < cardStackSize[i])
      {
      boxY1[i][j] = yVal;
      yVal = yVal + offset;
      boxY2[i][j] = yVal;
      }
      else{
        boxY1[i][j] = yVal;
        yVal = yVal + cardHeight;
        boxY2[i][j] = yVal;
      } //End If/Else
      
    } //End j for loop
  }//End i for loop
} //End void draw

  
void mousePressed()
{ 
  

  if(mouseY > 250-cardHeight/2) 
  { 
    if(selected == false && selected2 == false)
    {
  int mouseLocationX = findLocationX();
  int mouseLocationY = findLocationY(mouseLocationX);
      
      if(mouseLocationX != undefined && mouseLocationY != undefined)  //If undefined
      {
      if(flipped[mouseLocationX][mouseLocationY] == true)
      {
      select[mouseLocationX][mouseLocationY] = 1;
      selected = true;
        selectCount = 0;
        for(int i = -1; i < cardStackSize[mouseLocationX] - mouseLocationY; i++)
        {
             selectCount+=1;
        }
        tempX = mouseLocationX;
        tempY = mouseLocationY;
      } //End if flippedX/Y = true
      } //End if Undefined...
    } //End if select == false
    else if(selected == true && selected2 == false){
      int mouseLocationX = findLocationX();
      int mouseLocationY = findLocationY(mouseLocationX);
       if(mouseLocationX != undefined && mouseLocationY != undefined)
       {
      if(select[mouseLocationX][mouseLocationY] == 1)
      {
        select[mouseLocationX][mouseLocationY] = 0;
      //  println("Closed");
        selected = false;
      }else{ 
        
        /*
        *             Rules for moving go here:
        *  Value - (1-13etc...)
        *  Color - (Red/Black || diamond Hearts/Spades Clubs)
        *              (legal/illegal move)
        */
      
        if(boardCards[tempX][tempY] <= 26) //(Black)
          {
            //We need a red
            if(boardCards[mouseLocationX][(cardStackSize[mouseLocationX])] >= 27)
              {  
                if(boardCards[mouseLocationX][(cardStackSize[mouseLocationX])]-1 == boardCards[tempX][tempY] + (13 * 1)
             || boardCards[mouseLocationX][(cardStackSize[mouseLocationX])]-1 == boardCards[tempX][tempY] + (13 * 2) 
             || boardCards[mouseLocationX][(cardStackSize[mouseLocationX])]-1 == boardCards[tempX][tempY] + (13 * 3) )
                {
                     void move();
                }
              }
          } //End if black
          else{ //Else(red)
            //We need a black
            if(boardCards[mouseLocationX][(cardStackSize[mouseLocationX])] <= 26)
              {
            //Now we need to check if its the correct card Number to be played there.
                if(boardCards[mouseLocationX][(cardStackSize[mouseLocationX])]-1 == boardCards[tempX][tempY] - (13 * 1)
             || boardCards[mouseLocationX][(cardStackSize[mouseLocationX])]-1 == boardCards[tempX][tempY] - (13 * 2) 
             || boardCards[mouseLocationX][(cardStackSize[mouseLocationX])]-1 == boardCards[tempX][tempY] - (13 * 3) )
                {
                     void move();
                }
              }
            
          } //End else Red
        
      } //End else if select=0
      
     }
    } //End of Else(!selected=true)
    
    if(selected == true && selected2 == false)
   {
  int mouseLocationX = findLocationX();
  int mouseLocationY = findLocationY(mouseLocationX);
      
      if(mouseLocationX != undefined && mouseLocationY == undefined)  //If undefined
       {
         //println(cardStackSize[mouseLocationX]);
          void kingMove();
       }
      
   }
        
        if(selected == false && selected2 == true)
        {
          int mouseLocationX = findLocationX();
          int mouseLocationY = findLocationY(mouseLocationX);
          
            if(mouseLocationX != undefined && mouseLocationY != undefined)
               { 
                 if(moveCardValue <= 26 ) //(black)
                {
                  //We need a Red..
                  if(boardCards[mouseLocationX][(cardStackSize[mouseLocationX])] >= 27)
              {  
                if(boardCards[mouseLocationX][(cardStackSize[mouseLocationX])]-1 == moveCardValue + (13 * 1)
             || boardCards[mouseLocationX][(cardStackSize[mouseLocationX])]-1 == moveCardValue + (13 * 2) 
             || boardCards[mouseLocationX][(cardStackSize[mouseLocationX])]-1 == moveCardValue + (13 * 3) )
                {
                     void discardMove();
                }
                
                }
          } //End if black
          else{ //Else(red)
            //We need a black
            if(boardCards[mouseLocationX][(cardStackSize[mouseLocationX])] <= 26)
              {
            //Now we need to check if its the correct card Number to be played there.
                if(boardCards[mouseLocationX][(cardStackSize[mouseLocationX])]-1 == moveCardValue - (13 * 1)
             || boardCards[mouseLocationX][(cardStackSize[mouseLocationX])]-1 == moveCardValue - (13 * 2) 
             || boardCards[mouseLocationX][(cardStackSize[mouseLocationX])]-1 == moveCardValue - (13 * 3) )
                {
                     void discardMove();
                }
              }
            
          } //End else Red
        }
      } //end if false&true  
    if(selected == false && selected2 == true)
   {
  int mouseLocationX = findLocationX();
  int mouseLocationY = findLocationY(mouseLocationX);
      
      if(mouseLocationX != undefined && mouseLocationY == undefined)  //If undefined
       {
         //println(cardStackSize[mouseLocationX]);
          void discardKingMove();
       }
      
   }
  }  //End if mouseY > 250  
  
  else{
    if(selected != true && selected2 == false)
    {
      
      if(mouseX > 202  && mouseX < 300 && mouseY > 19 && mouseY < 164)
        { 
           if(pileIndex > pileStackSize) 
            { 
              int tempPileSize = 0;
              for(int i = 0; i < pileStackSize; i++)
              {
                if(discardPile[i] != 0) 
                {
                  tempPileSize+=1;
                }
              }
                  int tempNum = pileStackSize;
                 pileStackSize = tempPileSize;
                  pile = new int[pileStackSize];
                 //Finish refresh pileStack code
              int tempPileStackSize = 0;
              for(int p = 0; p < tempNum; p++)
              {
              if(discardPile[p] != 0)
               {
                tempPileStackSize +=1;
               } 
              }
              int cnt = 0;
                 for(int j = 0; j < tempPileStackSize+1; j++)
                 {
                   if(discardPile[j] != 0)
                   {
                      pile[cnt] = discardPile[j]; 
                     cnt+=1;
                   }
                   else{
                      tempPileStackSize++;   
                   }
                   
                 } 
              for(int p = 0; p < tempNum; p++)
              {
                discardPile[p] = 0;
              }
              
                 for(int ii = 0; ii < pileStackSize; ii++)
                  {
                    discardPile[ii] = 0;
                  }
                      discardPileIndex = -1;
                       pileIndex = 1;
                
            }
            else{
            discardPile[pileIndex-1] = pile[pileIndex-1];
            pileIndex +=1;
            if(discardPileIndex != pileStackSize)
              {
                discardPileIndex+=1;
              while(discardPile[discardPileIndex] == 0)
                  {
              discardPileIndex+=1;
                  }
              }
            }//End Else pileIndex < pileStackSize
        } //end if mouse click is on card Pile
        else if(mouseX > 308 && mouseX < 406 && mouseY > 21 && mouseY < 167){
         if(selected2 == false)
         {
           if(discardPile[discardPileIndex] != 0 && discardPile[discardPileIndex] != undefined)
           {
             selected2 = true; //Select = true
             selected2Value = 1; //Vlaue for the visual effect
             moveCardValue = discardPile[discardPileIndex];
           } //End if discardPile cards exist
           
         } //End if select=false
         
        } //End if mouse click is on discardPile
    
      
    }
    else if(selected == false && selected2 == true)
    {
      if(mouseX > 308 && mouseX < 406 && mouseY > 21 && mouseY < 167)
        { 
    selected2 = false;
    selected2Value = 0;
    moveCardValue = 0;
        }
    }
            
              //End Piles (placing):
    
//Pile1 (Spades)
  if(mouseX >= 483 && mouseX <= 578 && mouseY >= 22 && mouseY <= 168)
  {
    if(selected == true && selected2 == false)
    {
      if(selectCount == 1)
       {
        if(boardCards[tempX][tempY] == endPileIndex1 + 1)
         {
           endPile1[endPileIndex1] = boardCards[tempX][tempY];
           boardCards[tempX][tempY] = 0;
           cardStackSize[tempX]-=1;
           flipped[tempX][tempY-1] = true;
           endPileIndex1 +=1;
           selected = false;
         }
       }
    }
    else if(selected == false && selected2 == true)
    {
      if(moveCardValue == endPileIndex1 + 1)
         {
      endPile1[endPileIndex1] = moveCardValue;
           endPileIndex1 +=1;
    selected2 = false;
  selected2Value = 0;
  discardPile[discardPileIndex] = 0;
  discardPileIndex -=1;
  while(discardPile[discardPileIndex] == 0)
  {
    discardPileIndex-=1;
  }
         }
      
    }
  }
  
  //Pile 2 Clubs
    if(mouseX >= 590 && mouseX <= 685 && mouseY >= 22 && mouseY <= 168)
      {
        
        if(selected == true && selected2 == false)
    {       
      if(selectCount == 1)
       {
        if(boardCards[tempX][tempY] == endPileIndex2 + 1 + 13 )
         {
           endPile2[endPileIndex2] = boardCards[tempX][tempY];
           boardCards[tempX][tempY] = 0;
           cardStackSize[tempX]-=1;
           flipped[tempX][tempY-1] = true;
           endPileIndex2 +=1;
           selected = false;
         }
       }
    }
    else if(selected == false && selected2 == true)
    {
      if(moveCardValue == endPileIndex2 + 1 + 13)
         {
      endPile2[endPileIndex2] = moveCardValue;
           endPileIndex2 +=1;
    selected2 = false;
  selected2Value = 0;
  discardPile[discardPileIndex] = 0;
  discardPileIndex -=1;
  while(discardPile[discardPileIndex] == 0)
  {
    discardPileIndex-=1;
  }
   }
     }  
      }
    
    if(mouseX >= 695 && mouseX <= 791 && mouseY >= 22 && mouseY <= 168)
      {
        
        if(selected == true && selected2 == false)
    {       
      if(selectCount == 1)
       {
        if(boardCards[tempX][tempY] == endPileIndex3 + 1 + 26 )
         {
           endPile3[endPileIndex3] = boardCards[tempX][tempY];
           boardCards[tempX][tempY] = 0;
           cardStackSize[tempX]-=1;
           flipped[tempX][tempY-1] = true;
           endPileIndex3 +=1;
           selected = false;
         }
       }
    }
    else if(selected == false && selected2 == true)
    {
      if(moveCardValue == endPileIndex3 + 1 + 26)
         {
      endPile3[endPileIndex3] = moveCardValue;
           endPileIndex3 +=1;
    selected2 = false;
  selected2Value = 0;
  discardPile[discardPileIndex] = 0;
  discardPileIndex -=1;
  while(discardPile[discardPileIndex] == 0)
  {
    discardPileIndex-=1;
  }
   }
     }  
      } //End diamonds
    
    if(mouseX >= 802 && mouseX <= 890 && mouseY >= 22 && mouseY <= 168)
      {
        
        if(selected == true && selected2 == false)
    {       
      if(selectCount == 1)
       {
        if(boardCards[tempX][tempY] == endPileIndex4 + 1 + 39 )
         {
           endPile4[endPileIndex4] = boardCards[tempX][tempY];
           boardCards[tempX][tempY] = 0;
           cardStackSize[tempX]-=1;
           flipped[tempX][tempY-1] = true;
           endPileIndex4 +=1;
           selected = false;
         }
       }
    }
    else if(selected == false && selected2 == true)
    {
      if(moveCardValue == endPileIndex4 + 1 + 39)
         {
      endPile4[endPileIndex4] = moveCardValue;
           endPileIndex4 +=1;
    selected2 = false;
  selected2Value = 0;
  discardPile[discardPileIndex] = 0;
  discardPileIndex -=1;
  while(discardPile[discardPileIndex] == 0)
  {
    discardPileIndex-=1;
  }
   }
     }  
      }
    
    
    /*
        //EndPile Selecting cards:
    if(mouseX >= 483 && mouseX <= 578 && mouseY >= 22 && mouseY <= 168)
     {
       if(selected == false && selected2 == false && endPile1[endPileIndex1-1] != undefined)
       {
           selected2 = true;
          selected2Value = 2;
       }
       else{
       if(selected == false && selected2 == true && selected2Value < 2)
       {
       selected2 = false;
       selected2Value = 0;
       }
     }
    
    else if(mouseX >= 590 && mouseX <= 685 && mouseY >= 22 && mouseY <= 168)
     {
         if(selected == false && selected2 == false && endPile[endPileIndex2-1] != undefined)
        {
          selected2 = true;
          selected2Value = 2;
        }
        else{
        if(selected == false && selected2 == true && selected2Value < 2)
        {
        selected2 = false;
        selected2Value = 0;
        }
     }
    
    
    */
    
    
    
    
  } //End if mouseY is above 250
} //End void mousePressed





void findLocationX()
{
    for(int i = 0; i < 7; i++)
    {
      if(mouseX > boxX1[i] && mouseX < boxX2[i])
      {
        return(i);
      }
    } //End for loop
} //End void FindLocationX

void findLocationY(int loc)
{
  for(int i = 0; i < cardStackSize[loc]+1; i++)
  {
     if(mouseY > boxY1[loc][i] && mouseY < boxY2[loc][i])
     {
       return(i);
     } 
  } //End i For loop
} //End void FindLocationY

void move(){
  int mouseLocationX = findLocationX();
  int mouseLocationY = findLocationY(mouseLocationX);
  
  for(int i = 0; i < selectCount; i++)
        {
          // println("Select:  " + selectCount);
          // println(" card: " + boardCards[tempX][tempY+i]);
          boardCards[mouseLocationX][(cardStackSize[mouseLocationX]+1)] = boardCards[tempX][tempY+i];
          // println(" card: " + boardCards[tempX][tempY+i]);
          // println(" card: " + boardCards[mouseLocationX][(cardStackSize[mouseLocationX]+1+i)]);
          cardStackSize[tempX]-=1;
            cardStackSize[mouseLocationX] +=1;
            flipped[tempX][tempY-1] = true;
            boardCards[tempX][tempY] = 0;
            selected = false;  
        } 
        for(int i = 0; i < 7; i++)
            {
              for(int j = 0; j < 13; j++)
                {
                   select[i][j] = 0;
                }
            }
        
} //End void Move

void keyPressed(){
  //
} //End void keyPressed


void kingMove(){
   int mouseLocationX = findLocationX();
if(cardStackSize[mouseLocationX] == -1)
 {
  if(boardCards[tempX][tempY] == 13 || boardCards[tempX][tempY] == 26 || boardCards[tempX][tempY] == 39 || boardCards[tempX][tempY] == 52)
  {
    for( int i = 0; i < selectCount; i++)
    {
      boardCards[mouseLocationX][(cardStackSize[mouseLocationX]+1)] = boardCards[tempX][tempY+i];
      cardStackSize[tempX]-=1;
      cardStackSize[mouseLocationX] +=1;
      flipped[tempX][tempY-1] = true;
      boardCards[tempX][tempY] = 0;
      selected = false;
      select[tempX][tempY] = 0;
    }
  }
 }
} //End void kingMove

void discardMove(){
  int mouseLocationX = findLocationX();
  int mouseLocationY = findLocationY(mouseLocationX);
  
  boardCards[mouseLocationX][(cardStackSize[mouseLocationX]+1)] = moveCardValue;
  cardStackSize[mouseLocationX]+=1;
  selected2 = false;
  selected2Value = 0;
  discardPile[discardPileIndex] = 0;
  discardPileIndex -=1;
  while(discardPile[discardPileIndex] == 0)
  {
    discardPileIndex-=1;
  }
  
} //End void discardMove


void discardKingMove(){
  int mouseLocationX = findLocationX();
  if(cardStackSize[mouseLocationX] == -1)
 { 
  if(discardPile[discardPileIndex] == 13 || discardPile[discardPileIndex] == 26 || discardPile[discardPileIndex] == 39 || discardPile[discardPileIndex] == 52)
  { 
    boardCards[mouseLocationX][(cardStackSize[mouseLocationX]+1)] = moveCardValue;
    selected2 = false;
    selected2Value = 0;
    cardStackSize[mouseLocationX]+=1;
    discardPile[discardPileIndex] = 0;
    discardPileIndex -=1;
    while(discardPile[discardPileIndex] == 0)
       {
    discardPileIndex-=1;
       }
    select[mouseLocationX][0] = 0;
    } 
  }
} //End void discardKingMove


/*
1-Spades
2-Clubs
3-diamonds
4-hearts
*/

/*
*             Notes:
* ---------------------------------------
*
* Increase the max stack size for each spot on the board...
* 
* Make the end Pile Cards selectable
*
* Calculate for wins/win screen popup
*
*/
