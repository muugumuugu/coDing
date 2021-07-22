async function getData(){
	const response = await fetch('/Read');
	const data=await response.json();
	console.log(data);
	for (item of data){
		const root= document.createElement('p');
		const geo = document.createElement('div');
		const dt = document.createElement('div');
		const aq = document.createElement('div');
		const temp = document.createElement('div');
		const register=document.querySelector('#reg');
		geo.textContent=item.lat +'°,' + item.lon + '°';
		temp.textContent=item.atmosphere.curr +"°C";
		aq.textContent=item.atmosphere.aq +"micrograms/m^3";
		dtStr=new Date(item.timestamp).toLocaleString();
		dt.textContent=dtStr;
		root.append(dt,geo , temp ,aq );
		register.append(root);

	}
}

getData();
document.querySelector('#refresh').addEventListener('click', getData);
