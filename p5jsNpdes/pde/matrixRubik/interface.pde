String moveInd= "rldufb";
String moveCap="RLDUFB";
//=============================================
void keyPressed(){
  int[] loc= new int[3];
  loc=getLoc(key);
  turn(loc[0],loc[1],loc[2]);
}

//void move(char key){
//    if (key=='m' || key =='M'){
//    mode=!mode;}
//        if (key=='a'|| key=='A'){
//    auto=!auto;}
//  if (mode){
//  switch(key){
//    case 'r'://front
//    turnZ(2,true);
//    break;
//    case 'R':
//    turnZ(2,false);
//    break;
//    case 'o'://back
//    turnZ(0,false);
//    break;
//    case 'O':
//    turnZ(0,true);
//    break;
//    case 'y'://up
//    turnY(0,true);
//    break;
//    case 'Y':
//    turnY(0,false);
//    break;
//    case 'w':
//    turnY(2,false);
//    break;
//    case 'W':
//    turnY(2,true);
//    break;
//    case 'b'://right
//    turnX(2,false);
//    break;
//    case 'B':
//    turnX(2,true);
//    break;
//    case 'g':
//    turnX(0,true);
//    break;
//    case 'G':
//    turnX(0,false);
//    break;
//  }
//  }
//  else{
//  switch(key){
//    case 'f'://front
//    turnZ(2,true);
//    break;
//    case 'F':
//    turnZ(2,false);
//    break;
//    case 'b'://back
//    turnZ(0,false);
//    break;
//    case 'B':
//    turnZ(0,true);
//    break;
//    case 'u'://up
//    turnY(0,true);
//    break;
//    case 'U':
//    turnY(0,false);
//    break;
//    case 'd':
//    turnY(2,false);
//    break;
//    case 'D':
//    turnY(2,true);
//    break;
//    case 'r'://right
//    turnX(2,false);
//    break;
//    case 'R':
//    turnX(2,true);
//    break;
//    case 'l':
//    turnX(0,true);
//    break;
//    case 'L':
//    turnX(0,false);
//    break;
//  }
//  }
//}

////============================
