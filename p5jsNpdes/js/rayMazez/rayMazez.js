function setup() {
  createCanvas(640, 320);
  background(100);
}
var p = [
1,1,1,1,1,1,1,1,+
1,0,0,0,0,0,0,1,+
1,0,0,1,0,0,0,1,+
1,0,1,0,0,0,0,1,+
1,0,0,0,0,0,0,1,+
1,0,0,0,0,1,0,1,+
1,0,1,1,0,0,0,1,+
1,1,1,1,1,1,1,1
];
var pA = 1;//map generation
var py = 0;//
var px = 0;//
var Px = 165;//player
var Py = 165;//
var dx = 165;//ray
var dy = 165;//
var a = 0;/////
var rd = 0.0174533;//radiant
var numR=0;//number of rays
var dis=0;//distance
var aDif=0;//angle diference
function draw() {
  background(100);
  place();
  player();
}
