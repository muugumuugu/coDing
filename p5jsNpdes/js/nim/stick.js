function Stick(pos_, thickness_, length_, color_) {
  this.pos = pos_.copy();
  this.thickness = thickness_;
  this.length = length_;
  this.color = color_;
  
  this.display = function () {
    fill(this.color);
    rect(this.pos.x, this.pos.y, this.thickness, this.length);
    circle(this.pos.x + this.thickness/2, this.pos.y, this.thickness);
    circle(this.pos.x + this.thickness/2, this.pos.y + this.length, this.thickness);
  }  
  
  this.goUp = function (d) {
    this.pos.y+=d;
  }  
}  
