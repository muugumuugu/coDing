let frontend={cnvs:{},cam:{}};
//---------------------------------------------
function makeSlider(mini,maxi,step,value,parent,onchangeFunc){
	let temp=document.createElement('input');
	temp.type="range";
	if(parent){parent.appendChild(temp);}
	else{document.body.appendChild(temp);}
	if(onchangeFunc){temp.onchange=onchangeFunc;}
	if(mini){temp.min=mini;}
	if(maxi){temp.max=maxi;}
	if(step){temp.step=step;}
	if(value){temp.value=value;}
	return temp;
}
//-----------------------------------------------
function toggleSliderTbl(){
	if (select('#switchView').html()=='MATRIX VIEW &gt;&gt;'){
		document.getElementById("matrices").style.display='block';
		select('#switchView').html('Sliding Controls &gt;&gt;');
	}
	else{
		document.getElementById("matrices").style.display='none';
		select('#switchView').html('MATRIX VIEW &gt;&gt;');
	}
}