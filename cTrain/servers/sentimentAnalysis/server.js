var app;
var server;
//modules
var express;//hosting a webpage, handling requests and responses.
var fs; //filesystem handler module
var parser;// for parsing post requests.
var cors;// for other ppl to use this api
//persistaance dtabase
var addnwordsStream;
var afinnwords;
var addnwords;
//-----------------------------------------------
function startup(){
	console.log("server starting...");
	// import packages as a function 
	express= require('express'); 
	fs=require('fs');
	parser=require('body-parser');
	cors=require('cors');
	//
	app=express();
	server=app.listen(4000, listening);//callback
	function listening(){
		console.log('http://localhost:4000/');
		}
	app.use(express.static('frontend'));//hosted folder
	//
	app.use(parser.urlencoded({extended:true}));//parse options
	app.use(parser.json());//format to parse to
	//
	app.use(cors());
	//
	//Loadin in Sync --> locks the server and loads whole thing first
	var addnwordsStream= fs.readFileSync('data/additionalwords.json'); //bit stream
	var afinnwordsStream= fs.readFileSync('data/afinnwords.json'); //bit stream
	//Parse As JS object.
	addnwords= JSON.parse(addnwordsStream);
	afinnwords=JSON.parse(afinnwordsStream);
	}
startup();
//-----------------------------------------------------------
app.get('/search/:word/',searchWord);//creating a route and :xxx is what the user enters, like a parameter
//GET-->gives out info to client based on query.
function searchWord(request, response){
	var word=request.params.word;
	var reply;
	if (addnwords[word]){
		reply={input:word,score:addnwords[word]};
	}
	else if (afinnwords[word]){
		reply={input:word,score:afinnwords[word]};
	}
	else{
		reply={msg:"not found" }
	}
	response.send(reply);
}
//------------------------------------------------------
app.get('/all',sendall);
function sendall(request, response){
	response.send(addnwords);//express auto formats object as json
}
//---------------------------------------------------------
app.get('/add/:word/:num?',addWord);//:param? --> optional parameters
//practically posting data
// uses a route for  getting back the succes log, to post easy smol data recieved through query string.
function addWord(request, response){
	var data=request.params;
	//
	var num=Number(data.num);
	var word=data.word;
	//
	var reply;
	if (!num){
		reply={msg:"no score given " }
		response.send(reply);
	}
	else{
		addnwords[word]=num;
		var addnwordsOut=JSON.stringify(addnwords,null,2) ;//stringify indent spacing=2
	    fs.writeFile('data/additionalwords.json',addnwordsOut ,finished);// fname,data,callback
	    function finished(){
	    	console.log("written");
			reply={msg: "thnx for word", keyword :word, score:num};
			response.send(reply);
	    }
	}
}
//--------------------------------------------------------
app.post('/analyze',analyzetxt);//POST-->takes in info from client to process
function analyzetxt(request,response){
	console.log("posting")
	var totalScore=0;
	var txt=request.body.text;
	var tokens=txt.split(/\W+/);
	for (let i=0; i<tokens.length; i++){
		var key=tokens[i]
		if (addnwords.hasOwnProperty(key)){
			totalScore+=addnwords[key];
		}
		else if (afinnwords.hasOwnProperty(key)){
			totalScore+=afinnwords[key];
		}
	}
	var score=totalScore/tokens.length;
	var reply={
		msg:"thnx for posting ur txt",
		comparitivescore:score
	}
	console.log("posted and analyzed");
	response.send(reply);
}