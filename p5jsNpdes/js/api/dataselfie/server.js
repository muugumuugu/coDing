const express= require('express'); // import equivalent.
const app= express();
//
const Datastore=require('nedb');
app.listen(3000,() => console.log('listening @ 3000'));
app.use(express.static('client'));
app.use(express.json({ limit: '5mb',}));
const db=[];
const database= new Datastore('database.db');
database.loadDatabase();

app.get(
'/fetchpost', (request,response)=>
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
		//response.json({ test : 123});
	}
 );

app.post(
'/fetchpost', (request,response)=>
 {
 console.log("updating...");
 console.log(request.body);
 const timestamp=Date.now();
 data=request.body;
 data.timestamp=timestamp;
 db.push(request.body);
 database.insert(data);
 console.log(db);
 //console.log(database);
 response.json(
	 {
	 stats:'success',
	 }
	 );
 }
 );
