//dom
	var submit;
	var analyze;
	var wordIn;
	var scoreIn;
	var txtIn;
	var scoreOut;

function setup(){
	console.log("running sketch");
	//
	var cnv=createCanvas(800,400);
	cnv.parent(select('#sketch'));
	//
	background(51);
	textSize(32);
	textAlign(CENTER,CENTER);
	//
	drawdata();
	//
	submit=select('#submit');
	analyze=select('#analyze');
	txtIn=select('#data2analyze');
	wordIn=select('#word');
	scoreIn=select('#score');
	scoreOut=select('#analyzed');
	submit.mousePressed(submitit);
	analyze.mousePressed(analyzeit);
}
//---------------------------------------
//graphical represantation of data
function drawdata(data){
	loadJSON('/all',loaded)// creating a front end for the server
}
function loaded(data){
	background(51);
	console.log(data);
	var keys =Object.keys(data);
	for (i=0; i<keys.length;i++){
		word=keys[i];
		score=data[word];
		let buffer=100;
		var wd=width-buffer;
		var ht=height-buffer;
		x=random(buffer/2,wd+buffer/2);
		y=random(buffer/2,ht+buffer/2);
		if (score>0){
			fill(255,map(score,0,5,0,255));
		}
		else{
			fill(0,map(score,0,-5,0,255));
		}
		text(word,x,y);
	}
}
//----------------------------------------------------
//front end to api's add route.
function submitit(){
	var word=wordIn.value();
	var score=scoreIn.value();
	if (!word.trim==""){
		loadJSON('/add/'+word+"/"+score,sent); // use GET to send data.
		function sent(data){
			console.log(data);
			drawdata(data);
		}
	}

}
//---------------------------------------------------
//front end to api's analyze route.
function analyzeit(){
	var txt=txtIn.value();
	var data={text:txt}
	httpPost('analyze/',data,'json',dataPosted,postError)//P5 function.

}
function dataPosted(result){
	console.log(result);
	scoreOut.html(nf(result.comparitivescore,0,3));
}
function postError(err){
	console.log("encounter error");
	console.log(err);
	console.log("sorry")
}