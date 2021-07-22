






document.addEventListener('mousemove', function(e){ 
    mouse.x = e.clientX || e.pageX; 
    mouse.y = e.clientY || e.pageY 
}, false);var mouseDown = 0;
document.body.onmousedown = function() { 
  mouseDown=true;
}
document.body.onmouseup = function() {
  mouseDown=false;
}
c.fillStyle = 'black';
c.fillRect(0,0,width,height);
c.fillStyle = 'white';
c.fillRect(width/2-1,0,1,height);
c.fillRect(0,height/2-1,width,1);
var divWidth = width/15;
var divHeight = height/15;

var color = 0;
setInterval(draw,10);




function draw(){

	if(mouseDown){
		var size = 5;
		if(variation == 14){
			 size = 10;
		}
		var color = getColor();
		var blob = {x : getXPos(mouse.x-20),
				y : getYPos(mouse.y-20),
				xSpeed : 0,
				ySpeed : 0,
				size : size,
				lastPos : [],
				color : color,
				direction : 1,
				count : 1
			};
		blobArray.push(blob);
	
		var blob = {x : getXPos(mouse.x-20),
				y : getYPos(mouse.y-20),
				xSpeed : 0,
				ySpeed : 0,
				size : size,
				lastPos : [],
				color : color,
				direction : -1,
				count : 1
			};
		blobArray.push(blob);
	
	}
	//c.clearRect(0,0,width,height);
	var length = blobArray.length;
	for(var i = 0; i < length; i++){
		blob = blobArray[i];

		drawCircle(getXPrint(blob.x),getYPrint(-blob.y),blob.size, blob.color);
	
		blob.x += blob.xSpeed;
		blob.y += blob.ySpeed;
		var x = blob.x;
		var y = blob.y;
		var stepsize = 0.005;
		
		var k1x = getSlopeX(x,y);
		var k1y = getSlopeY(x,y);
		
		var k2x = getSlopeX(x + blob.direction * stepsize * k1x, y + blob.direction * stepsize * k1y);
		var k2y = getSlopeY(x + blob.direction * stepsize * k1x, y + blob.direction * stepsize * k1y);
		
		var k3x = getSlopeX(x + blob.direction * stepsize * k2x, y + blob.direction * stepsize * k2y);
		var k3y = getSlopeY(x + blob.direction * stepsize * k2x, y + blob.direction * stepsize * k2y);
		
		var k4x = getSlopeX(x + blob.direction * 2*stepsize * k3x, y + blob.direction * 2*stepsize * k3y);
		var k4y = getSlopeY(x + blob.direction * 2*stepsize * k3x, y + blob.direction * 2*stepsize * k3y);
		
		
		blob.xSpeed = blob.direction * stepsize/3*(k1x+2*k2x+2*k3x+k4x);
		blob.ySpeed = blob.direction * stepsize/3*(k1y+2*k2y+2*k3y+k4y);
		
				
		
		
		//blob.xSpeed = blob.direction * getSlopeX(x, y)*5;
		//blob.ySpeed = blob.direction * getSlopeY(x, y)*5;

		if(blob.x < -500 || blob.y < -500 || blob.x > width+500 || blob.y > height+500){
			blobArray.splice(i,1);
			i--;
		}
	}
}

function drawCircle(centerX, centerY, diameter,color){
	c.beginPath();
    c.arc(centerX, centerY, diameter/2, 0, 2 * Math.PI, false);
    c.fillStyle = color;
    c.fill();
    c.lineWidth = 0;
   // c.strokeStyle = color;
    //c.stroke();
}

function getColor(){
	return RainBowColor(color++ % 300);
}

	function RainBowColor(length)
{
    var i = (length * 255 / 300);
    var r = Math.round(Math.sin(0.024 * i + 0) * 127 + 128);
    var g = Math.round(Math.sin(0.024 * i + 2) * 127 + 128);
    var b = Math.round(Math.sin(0.024 * i + 4) * 127 + 128);
    return 'rgb(' + r + ',' + g + ',' + b + ')';
}

function getSlopeY(x, y){
	switch(variation){
		case 0:return Math.cos(x*y);
		case 1:return x+y;
		case 2:return Math.sin(x)*Math.cos(y);
		case 3:return Math.cos(x)*y*y;
		case 4:return Math.log(Math.abs(x))*Math.log(Math.abs(y));
		case 5:return Math.tan(x)*Math.cos(y);
		case 6:return 4*y*(1-y);
		case 7:return -Math.sin(x);
		case 8:return -2*x;
		case 9:return -y- Math.sin(1.5*x) + 0.7;
		case 10: return -y*(1-x);
		case 11: return -x-y;
		case 12: return Math.sin(x);
		case 13: return Math.sin(x)*Math.cos(y);
		case 14: return Math.random();
		case 15: x = x/4; return x-x*x*x;
		case 16: x=x/5; y = y/5; return x+y-y*(x*x+y*y);
		case 17: return y*(-1 + x) ;
	}
}
	
function getSlopeX(x,y){
	//return y;
	//return 3*x+2*y;
	switch(variation){
		case 0: 
		case 1: 
		case 2: 
		case 3: 
		case 4: 
		case 5: 
		case 6:	return 1;
		case 7: 
		case 8: return y;		
		case 9: return 1.5*y;
		case 10: return x*(1-y);
		case 11: return y;
		case 12: return Math.cos(y);
		case 13: return Math.sin(y)*Math.cos(x);
		case 14: return Math.random();
		case 15: return y/4;
		case 16: x=x/5; y = y/5; return x-y-x*(x*x+y*y);
		case 17: return x*(-x+5)-y*x;
	}
}

function getXPos(x){
	return (x-width/2)/(width/20);
}

function getYPos(y){
	return -(y-height/2)/(height/15);
}

function getXPrint(x){
	return (width/20)*x+width/2;
}
function getYPrint(y){
	return (height/15)*y+height/2;
}



	
	
	
