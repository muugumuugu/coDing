let lat, lon, atmosphere;

//const airQuality_url = `https://api.openaq.org/v1/latest?coordinates=${lat},${lon}`


if ('geolocation' in navigator){
 console.log('geolocator available');
 navigator.geolocation.getCurrentPosition(async position =>
	 {
	 	lat=position.coords.latitude;
	 	lon=position.coords.longitude;
	 	document.getElementById('lat').textContent=lat.toFixed(2);
	 	document.getElementById('long').textContent=lon.toFixed(2);
	 	const resp=await fetch(`/weather/${lat},${lon}`);
	 	atmosphere=await resp.json();
	 	document.getElementById('weather').textContent= atmosphere.descp + ", " + atmosphere.curr + "°C";
	 }
 );

}
else{
	console.log("no GPS");
}


const button= document.getElementById('submit');
button.addEventListener('click', async event=>{
	 const data={lat, lon, atmosphere};
	 const options={
	 	method:'POST',
		headers: { "Content-Type": "application/json"},
		body: JSON.stringify(data),
			};
	const resp= await fetch('/Log', options);
	const parsed=await resp.json();
	console.log(parsed);

	}
);
