let video;

async function setup(){//window on load equivalent
//noCanvas();
video=createCapture(VIDEO);
video.size(320,240);
video.hide();
createCanvas(320,240);
video.loadPixels();//load a canvas.
image(video,0,0);
}
async 	function draw(){
video.loadPixels();//load a canvas.
background(255);
image(video,0,0);
}

async function geoFindMe() {

	const status = document.querySelector('#status');
	const mapLink = document.querySelector('#map-link');
	mapLink.href = '';
	mapLink.textContent = '';

	async function success(position) {
		video.loadPixels();//load a canvas.
		const img=get().canvas.toDataURL() // base64 encoding of image
		draw();
	 	const latitude  = position.coords.latitude;
		const longitude = position.coords.longitude;
		const mood= document.querySelector('#mood').value;
		const data = { latitude, longitude , mood, img };

		const options = {
			method: 'POST',
			headers: { "Content-Type": "application/json"},
			body: JSON.stringify(data),
			};
		const resp= await fetch('/fetchpost', options);
		const parsed=await resp.json();
		console.log(parsed);
		status.textContent = '';
		mapLink.href="https://www.openstreetmap.org/#map=13/${latitude}/${longitude}";
		mapLink.textContent = `Latitude: ${latitude} °, Longitude: ${longitude} °`;
	}

	function error() {
		status.textContent = 'Unable to retrieve your location';
	}

	if(!navigator.geolocation) {
		status.textContent = 'Geolocation is not supported by your browser';
		}
	else {
		status.textContent = 'Locating…';
		navigator.geolocation.getCurrentPosition(success, error);
		}

}

document.querySelector('#myLoc').addEventListener('click', geoFindMe);
