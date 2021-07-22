// modified from "Generative Art: A Practical Guide Using Processing (Matt Pearson)"

let _cellArray =[];
let _cellSize = 10;
let _numX, _numY;


function setup() {
  createCanvas(windowWidth, windowHeight);
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
  colorMode(HSB, 360, 100, 100,100);
  restart();
  frameRate(10);
}


function restart(){
  //_cellArray = new Cell[_numX][_numY];
  for(let x =0; x<_numX;x++){
    _cellArray[x] = []
    for(let y =0; y<_numY; y++){
      let newCell = new Cell(x,y);
      _cellArray[x][y]=newCell;
    }
  }
  
  for(let x=0;x<_numX;x++){
    for(let y=0; y<_numY;y++){
      let above = y-1;
      let below = y+1;
      let left = x-1;
      let right = x+1;
      
      if(above<0){ above=_numY-1;}
      if(below==_numY){below = 0;}
      if(left<0){left = _numX-1;}
      if(right==_numX){right = 0;}
      
      _cellArray[x][y].addNeighbour(_cellArray[left][above]);
      _cellArray[x][y].addNeighbour(_cellArray[left][y]);
      _cellArray[x][y].addNeighbour(_cellArray[left][below]);
      _cellArray[x][y].addNeighbour(_cellArray[x][below]);
      _cellArray[x][y].addNeighbour(_cellArray[right][above]);
      _cellArray[x][y].addNeighbour(_cellArray[right][y]);
      _cellArray[x][y].addNeighbour(_cellArray[right][below]);
      _cellArray[x][y].addNeighbour(_cellArray[x][above]);
      
    }
  }
}

function draw() {
  background(0);
  for( let x=0;x<_numX;x++){
    for(let y=0;y<_numY; y++){
      _cellArray[x][y].calcNextState();
    }
  }
  
  translate(_cellSize/2, _cellSize/2);
  
  for(let x=0; x<_numX; x++){
    for(let y=0;y<_numY;y++){
      _cellArray[x][y].drawMe();
    }
  }
  
}

function mousePressed(){
  restart();
}

class Cell{
  constructor(ex, why){
    this.x = ex*_cellSize;
    this.y = why*_cellSize;
    if(random(2)>1){
      this.nextState = true;
    }else{
      this.nextState = false;
    }
    this.state = this.nextState;
    this.neighbours = [];
    this.neighboursLength = 8;
  }
  addNeighbour(cell){
    this.neighbours = append(this.neighbours,cell);
  }
  calcNextState(){
    let liveCount = 0;

    for(let i=0; i<this.neighboursLength; i++){
      if(this.neighbours[i].state==true){
        liveCount++;
      }
    }
    if(this.state==true){
      if((liveCount==2)||(liveCount==3)){
        this.nextState = true;
      }else{
        this.nextState=false;
      }
    }else{
        if(liveCount==3){
          this.nextState= true;
        }else{
          this.nextSate= false;
        }
      }
    }
    
  drawMe(){
    this.state = this.nextState;
    noStroke();
    if(this.state==true){
      fill((180+random(50))%360,100,100,100);
      circle(this.x,this.y,_cellSize);
    }
  }
}
