async function getData(){
	const response = await fetch('/fetchpost'); // default is get , so no need to set method like for post , and  route fetchpost isnt used yet for getting
	const data=await response.json();
	console.log(data);
	for (item of data){
		const root= document.createElement('p');
		const mood= document.createElement('div');
		const geo = document.createElement('div');
		const dt = document.createElement('div');
		const imgBlock =document.createElement('img');
		const brk= document.createElement('br');
		const register=document.querySelector('#reg');
		mood.textContent='mood: ' +  item.mood;
		geo.textContent=item.latitude +'°,' + item.longitude + '°';
		dtStr=new Date(item.timestamp).toLocaleString();
		dt.textContent=dtStr;
		imgBlock.src= item.img;
		imgBlock.alt=item.mood;
		root.append(dt,geo ,mood, imgBlock ,brk);
		console.log(imgBlock);
		register.append(root);

	}
}

getData();
document.querySelector('#refresh').addEventListener('click', getData);
