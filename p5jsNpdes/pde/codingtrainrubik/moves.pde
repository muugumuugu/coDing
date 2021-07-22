class Index{
  int a,b;
  
  Index(int a_, int b_){
    a=a_;
    b=b_;
  }
}

Index[] order={
  new Index(0,0),
  new Index(1,0),
  new Index(2,0),
  new Index(2,1),
  new Index(2,2),
  new Index(1,2),
  new Index(0,2),
  new Index(0,1),
};

void turnZ(int j, boolean clockwise){
  Config[] configs=new Config[order.length];
  for (int i =0 ; i < order.length; i++){
    int a = order[i].a;
    int b = order[i].b;
    cube[a][b][j].config.rotateZ(clockwise);
    configs[i]=cube[a][b][j].config.copy();
    }
  
  for (int i =0 ; i<order.length; i++){
     int a = order[i].a;
     int b = order[i].b;
     int ind;
     if (clockwise){ind=i+order.length-2;}
     else{ind=i+2;}
     ind=ind%order.length;
     cube[a][b][j].config=configs[ind%order.length];
  }
} 

void turnY(int j, boolean clockwise){
  Config[] configs=new Config[order.length];
  for (int i =0 ; i < order.length; i++){
    int a = order[i].a;
    int b = order[i].b;
    cube[a][j][b].config.rotateY(clockwise);
    configs[i]=cube[a][j][b].config.copy();
    }
  for (int i =0 ; i<order.length; i++){
     int a = order[i].a;
     int b = order[i].b;
     int ind;
     if (clockwise){ind=i+order.length-2;}
     else{ind=i+2;}
     ind=ind%order.length;
     cube[a][j][b].config=configs[ind%order.length];
  }
}
  
void turnX(int j, boolean clockwise){
  Config[] configs=new Config[order.length];
  for (int i =0 ; i < order.length; i++){
    int a = order[i].a;
    int b = order[i].b;
    cube[j][a][b].config.rotateX(clockwise);
    configs[i]=cube[j][a][b].config.copy();
    }
  for (int i =0 ; i<order.length; i++){
     int a = order[i].a;
     int b = order[i].b;
     int ind;
     if (!clockwise){ind=i+order.length-2;}
     else{ind=i+2;}
     ind=ind%order.length;
     cube[j][a][b].config=configs[ind%(order.length)];
  }
}
