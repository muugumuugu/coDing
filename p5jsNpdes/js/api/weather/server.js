const express= require('express'); // import equivalent.
const app= express();
//
const Datastore=require('nedb');
//
const latitude="28.70";
const longitude="77.10";
const fetch=require('node-fetch');
//
app.listen(3001,() => console.log('listening @ 3001'));
app.use(express.static('client'));

app.use(express.json({ limit: '5mb',}));
const db=[];
const database= new Datastore('database.db');
database.loadDatabase();
//
const apikey='4bab551078997be8ef5be064cf7c08a7';
//
const aqurl = `https://api.openaq.org/v2/latest?coordinates=${latitude},${longitude}`
app.get(
'/Read', (request,response)=>
	{
		database.find(
			{},//object for query
			(err,data)=>
				{
					if (err){
					response.end();
					return;
					}
					response.json(data);
				}
		);
	}
 );

app.post(
'/Log', (request,response)=>
 {
 console.log("updating...");
 console.log(request.body);
 const timestamp=Date.now();
 data=request.body;
 data.timestamp=timestamp;
 db.push(request.body);
 database.insert(data);
 console.log(db);
 response.json(
	 {
	 stats:'success',
	 }
	 );
 }
 );


app.get(
'/weather/:latlon', async(request,response)=>
	{
		const latlon=request.params.latlon.split(',');
		const lat=latlon[0];
		const lon=latlon[1];
		let aq="Null";
		console.log(lat,lon);
		const apiurl=`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apikey}&units=metric`
		const fetched=await fetch(apiurl, {method: "GET"});
		const aqD=await fetch(aqurl);
		const aqJ=await aqD.json();
		try{
		aq= aqJ.results[0].measurements[0].value;
		}
		catch(error){
		console.log("no aq");
		aq = "No data";
		}
		const json= await fetched.json();
	//	console.log(json);
	//	const weather=json;
		const descp=json.weather[0].description;
		const curr=json.main.temp; // celsius
		const minT=json.main.temp_min;
		const maxT=json.main.temp_max;
		const rng={minT,maxT}//min, max
		const feel=json.main.feels_like;
		const hum=json.main.humidity; //%
		const wind=json.wind; //speed, deg  //m/s , meteorological degrees
		const loc=json.name;
		const cloudy = json.clouds.all; //%
		const rain=json.rain;//mm
		const hereat= {descp,curr,rng,feel,hum,wind, cloudy,loc, rain, aq};
		response.json(hereat);//proxy server for weather
	}
 );
