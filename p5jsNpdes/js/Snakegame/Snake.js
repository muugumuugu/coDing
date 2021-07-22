function Snake(){
  this.x=0;
  this.y=0;
  this.xspeed=1;
  this.yspeed=0;
  this.total=0;
  this.tail= [] ;
  this.eat = function(pos) {
   var d = dist(this.x,this.y,pos.x,pos.y);
   if (d < (scl/2)) {
     this.total = this.total+1 ;
     return true ;
   } else {
     return false ;
   }
  }
  this.dir =function(x,y) {
    this.xspeed=x;
    this.yspeed=y;
  }
  this.update = function() {
    if (this.total== this.tail.length){
      
      for (var i=0; i < this.tail.length-1; i++){
        this.tail[i]=this.tail[i+1];
      }
      
    }
    this.tail[total-1]=createVector(this.x,this.y);
    this.x=this.x+this.xspeed*scl;
    this.y=this.y+this.yspeed*scl; 
    this.x=constrain(this.x,0,width-scl);
    this.y=constrain(this.y,0,height-scl);
  }
  this.show = function(){
    fill(255);
    for (var i=0; i< this.total; i++){
        rect(this.tail[i].x,this.tail[i].y,scl,scl);
      }
     rect(this.x,this.y,scl,scl);
  }
  this.bite = function(){
   for (var i=0; i< this.tail.length; i++){
       var pos=this.tail[i];
       var d= dist(this.x,this.y,pos.x,pos.y);
       if (d< (scl/2)){
         this.total=0;
         this.tail=[];
       }
      }
  }
    
    
  
}
