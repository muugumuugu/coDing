let fft, mic,amp;
function setSoundSys(instn){
	if(instn){
		instn.mic = new p5.AudioIn();
		instn.mic.start();
		instn.amp=new p5.Amplitude();
		instn.amp.setInput(instn.mic);
		instn.amp.toggleNormalize(true);
		instn.fft = new p5.FFT();
		instn.fft.setInput(instn.mic);
	}
	mic = new p5.AudioIn();
	mic.start();
	amp=new p5.Amplitude();
	amp.setInput(mic);
	amp.toggleNormalize(true);
	fft = new p5.FFT();
	fft.setInput(mic);
}
//==========================================
let cublings=[];
let numb=36;
let cubeD=Math.PI*sz*0.4/(numb*2)
function makePos(){
  for (let i=0; i<numb;i++){
    let ang=map(i,0,numb,2*Math.PI,0);
    let x=sz*0.4*Math.cos(ang);
    let z=sz*0.4*Math.sin(ang);
    let y=0;
    let rotn=Rotor([0,Math.PI/2-ang,0])
    cublings.push({
      'x':x,
      'y':y,
      'z':z,
      'rot':rotn,
      'val':null,
      'offset':0
    });
  }

}
//--------------
function rotSpec(spec){
	for (let i=0; i<numb; i++){
		let ind=Math.floor(i*spec.length*0.8/numb);
		let h=25+spec[ind]*sz*0.5/255;
		strokeWeight(0.8);
		stroke(0,0,0,200);
		let off=Math.floor((i+frameCount)%numb);
		let fills=i;
		cublings[off].val=h;
		cublings[off].offset=i;
		if (scene.cnv){scene.cnv.fill("hsba("+cublings[i].offset*360/numb+",100%,100%,0.4)");}
		else{fill("hsba("+cublings[i].offset*360/numb+",100%,100%,0.4)");}
		cuboidV(
		[cubeD,cublings[i].val,cubeD],
		null,//default Pen
		[cublings[i].x,cublings[i].y,cublings[i].z],
		cublings[i].rot,
		true//digitizee
		);
	}
}
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~
const SCL=50;
let rows=Math.floor(sz*1.5/SCL),cols=Math.floor(sz*1.5/SCL);
let terrain=[];
function makeTerrain(){
  for (var x = 0; x < cols; x++) {
    terrain[x] = [];
    for (var y = 0; y < rows; y++) {
      terrain[x][y] = 0;
    }
  }
}
//--------------
function terrainG(spec){
	for (let y = 0; y < rows; y++) {
		let xoff = 0;
		let r=(cols/2)*(cols/2)+(rows/2)*(rows/2);
		for (let x = 0; x < cols; x++) {
			let dx=(x-cols/2);dx*=dx;
			let dy=(y-rows/2);dy*=dy;
			let radwise=Math.floor((dx+dy)*800/r);
			let freqen=spec[radwise]/255;
			terrain[x][y] =freqen*freqen*255;
		}
	}
	for (let z = 1; z < rows-1; z++) {
		let terrainpts=[];
		let tstyles=new Pen(4);
		for (let x = 1; x < cols; x++) {
			const cor=Math.floor(240-120*log(1+terrain[x][z])/log(16));
			tstyles.color.fill.push("hsba("+cor+",100%,100%,0.4)");
			tstyles.color.fill.push("hsba("+cor+",100%,100%,0.4)");
			let t1=vec3((x-cols/2)*SCL, terrain[x][z]  ,(z-rows/2)*SCL);
			t1=vecDigitize(t1);
			terrainpts.push(t1);
			let t2=vec3((x-cols/2)*SCL, terrain[x][z+1],(z-rows/2)*SCL+SCL);
			t2=vecDigitize(t2)
			terrainpts.push(t2);
		}
		let t0=vec3((cols/2)*SCL, terrain[cols-1][z]  ,(z-rows/2)*SCL+SCL);
		t0=vecDigitize(t0);
		terrainpts.push(t0);
		tristripV(processPoints(terrainpts),OPEN,tstyles);
	}
}
//============================================