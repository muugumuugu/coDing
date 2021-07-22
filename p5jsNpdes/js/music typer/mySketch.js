let myFont;
let myFont2;
let myFont3;
let state = 0;
let bars = [];
let letters = [
	"q",
	"w",
	"e",
	"r",
	"t",
	"y",
	"u",
	"i",
	"o",
	"p",
	"q",
	"s",
	"d",
	"f",
	"g",
	"h",
	"j",
	"k",
	"l",
	"z",
	"x",
	"c",
	"v",
	"b",
	"n",
	"m"
];

let keys = [];

let pos = [];
let pos2 = [];

let spd = 1;
let bar;
let is_on = 0;
let is_on2 = 0;
let point = 0;
let start = 0;
let combo = 0;
let cur;
let string = '';
let first_time = 1;
let notes = [];
let product = [];
// let off = 0;

function preload() {
	song = loadSound("cruel_summer.mp3");
	beat = loadSound("beat.wav");
	d1 = loadSound("do1.mp3");
	r1 = loadSound("re1.mp3");
	m1 = loadSound("mi1.mp3");
	f1 = loadSound("fa1.mp3");
	s1 = loadSound("sol1.mp3");
	l1 = loadSound("la1.mp3");
	t1 = loadSound("ti1.mp3");
	d2 = loadSound("do2.mp3");
	r2 = loadSound("re2.mp3");
	m2 = loadSound("mi2.mp3");
	f2 = loadSound("fa2.mp3");
	s2 = loadSound("sol2.mp3");
	l2 = loadSound("la2.mp3");
	t2 = loadSound("ti2.mp3");
	d3 = loadSound("do3.mp3");
	silence = loadSound("s.mp3");
	icon1 = loadImage("flag.png");
	icon2 = loadImage("target.png");
	icon3 = loadImage("play.png");
	icon4 = loadImage("iconmonstr-check-mark-1-240.png");
	icon5 = loadImage("iconmonstr-x-mark-1-240.png");
	icon6 = loadImage("stop.png");
	myFont = loadFont('AlienLeagueRegular-9D3Z.otf');
	myFont2 = loadFont('AlienLeagueBold-1WRj.otf');
	myFont3 = loadFont('Quicksand.ttf');
	icon7 = loadImage("text.png");
	icon8 = loadImage("hp.png");
	icon9 = loadImage("key2.png");
	icon10 = loadImage("play2.png");
	icon11 = loadImage("undo.png");
	icon12 = loadImage("iconmonstr-refresh-1-240.png");
	icon13 = loadImage("iconmonstr-refresh-1-240-2.png");
	icon14 = loadImage("disc.png");
	icon15 = loadImage("disc2.png");
	icon16 = loadImage("iconmonstr-undo-1-240-2.png");
}



function setup() {
	createCanvas(1180, 600);
	background(0);
	//canvas.mousePressed(userStartAudio);
	bar = new Bar();
	frameRate((170 / 60) * 8);
	for (let i = 0; i < 10; i++) {
		pos.push(480 + i * 68.8);
		pos2.push(random(120, 150));
	}
	for (let i = 0; i < 9; i++) {
		pos.push(500 + i * 68.75);
		pos2.push(random(285, 315));
	}
	for (let i = 0; i < 7; i++) {
		pos.push(600 + i * 60);
		pos2.push(random(450, 480));
	}
	for (let i = 65; i < 91; i++) {
		keys.push(i);
	}
	// notes.push(m0);
	// notes.push(f0);
	// notes.push(s0);
	// notes.push(l0);
	// notes.push(t0);
	notes.push(d1);
	notes.push(r1);
	notes.push(m1);
	notes.push(f1);
	notes.push(s1);
	notes.push(l1);
	notes.push(t1);
	notes.push(d2);
	notes.push(r2);
	notes.push(m2);
	notes.push(f2);
	notes.push(s2);
	notes.push(l2);
	notes.push(t2);
	notes.push(d3);
	// notes.push(r3);
	// notes.push(m3);
	// notes.push(f3);
	// notes.push(s3);
	// notes.push(l3);
	// notes.push(t3);
	notes.push(d1);
	notes.push(r1);
	notes.push(m1);
	notes.push(f1);
	notes.push(s1);
	notes.push(l1);
	notes.push(t1);
	notes.push(d2);
	notes.push(r2);
	notes.push(m2);
	notes.push(f2);
	product.push(silence);
}



function mousePressed() {
	if (state == 0 && ptInRect(mouseX, mouseY, 230, 285, 570, 405)) {
		state = 1;
		point = 0;
		combo = 0;
	}
	if (state == 0 && ptInRect(mouseX, mouseY, 610, 285, 950, 405)) {
		state = 2;
	}
	if (state == 1 && is_on == 0 && dist(mouseX, mouseY, 84, 88) <= 28) {
		cur = frameCount;
		song.play();
		point = 0;
	}
	if (state == 1 && is_on == 1 && dist(mouseX, mouseY, 84, 88) <= 29) {
		song.stop();
	}
	if (state == 1 && is_on == 0 && ptInRect(mouseX, mouseY, 140, 60, 310, 120)) {
		state = 0;
	}
	if (state == 2 && ptInRect(mouseX, mouseY, 30, 450, 340, 570)) {
		state = 0;
		string = '';
		// off = 1;
		product = [silence];
	}
	if (state == 2 && ptInRect(mouseX, mouseY, 30, 300, 340, 420)) {
		string = '';
		// off = 1;
		product = [silence];
	}
	if (state == 1 && is_on == 0 && ptInRect(mouseX, mouseY, 60, 165, 185, 235)) {
		spd = 1;
	}
	if (state == 1 && is_on == 0 && ptInRect(mouseX, mouseY, 185, 165, 310, 235)) {
		spd = 2;
	}
	if (state == 2 && dist(mouseX, mouseY, 84, 88) <= 28) {
		//off = 0;
		if (product.length > 1) {
			ArrayPlusDelay(product.slice(1, ), function(obj) {
				obj.play();
			}, 500);
		}
	}
}



function draw() {
	//console.log(off);
	if (state == 0) {
		background(0);
		noFill();
		stroke(255);
		line(230, 250, 950, 250);
		if (ptInRect(mouseX, mouseY, 230, 285, 570, 405)) {
			fill(255);
		}
		rect(230, 285, 340, 120);
		noFill();
		stroke(255);
		line(230, 250, 950, 250);
		if (ptInRect(mouseX, mouseY, 610, 285, 950, 405)) {
			fill(255);
		}
		rect(610, 285, 340, 120);

		image(icon8, 230, 100, 150, 130);
		image(icon9, 275, 160, 60 * icon2.width / icon2.height, 60);
		image(icon2, 255, 315, 60 * icon2.width / icon2.height, 60);
		image(icon7, 635, 315, 60 * icon2.width / icon2.height, 60);

		noStroke();
		textFont(myFont);
		fill(255);
		textSize(80);
		text('TYPE YOUR MUSiC', 420, 220);
		if (ptInRect(mouseX, mouseY, 230, 285, 570, 405)) {
			textFont(myFont2);
			fill(0);
			textSize(18);
			text('Type the correct chArActer in time \nwith the music And see how mAny \npoints you cAn get!', 255, 330);
		} else {
			textFont(myFont);
			fill(200);
			textSize(20);
			text('MODE1', 340, 323);
			fill(255);
			textSize(35);
			text('RHYTHM GAME', 340, 372);
		}
		if (ptInRect(mouseX, mouseY, 610, 285, 950, 405)) {
			textFont(myFont2);
			fill(0);
			textSize(18);
			text('Type whAtever you like to creAte A \nsong of your own!', 635, 340);
		} else {
			textFont(myFont);
			fill(200);
			textSize(20);
			text('MODE2', 720, 323);
			fill(255);
			textSize(35);
			text('TYPE A SONG', 720, 372);
		}
	}

	if (state == 1) {
		background(0);
		noFill();
		stroke(255);
		strokeWeight(1);
		line(370, 30, 370, 570);
		rect(30, 30, 310, 240);
		rect(30, 300, 310, 120);
		rect(30, 450, 310, 120);

		// 		noStroke();
		// 		fill(50);
		// 		rect(60, 165, 250, 70);

		// 		stroke(255);
		// 		strokeWeight(1);
		// 		line(60 + 250 * (song.currentTime() / song.duration()), 165, 60 + 250 * (song.currentTime() / song.duration()), 235);
		// 		fill(255);
		// 		rect(55 + 250 * (song.currentTime() / song.duration()), 235, 10, 10);

		if (is_on == 0) {
			if (spd == 1) {
				strokeWeight(1);
				fill(255);
				rect(60, 165, 125, 70);
				fill(0);
				rect(185, 165, 125, 70);
				fill(0);
				noStroke();
				textFont(myFont);
				textSize(30);
				text('EASY', 95, 210);
				fill(255);
				textFont(myFont);
				textSize(30);
				text('HARD', 220, 210);
			} else {
				strokeWeight(1);
				fill(0);
				rect(60, 165, 125, 70);
				fill(255);
				rect(185, 165, 125, 70);
				fill(255);
				noStroke();
				textFont(myFont);
				textSize(30);
				text('EASY', 95, 210);
				fill(0);
				textFont(myFont);
				textSize(30);
				text('HARD', 220, 210);
			}
			if (dist(mouseX, mouseY, 84, 88) <= 29) {
				fill(255);
				circle(84, 88, 37);
				image(icon10, 55, 60, 60 * icon1.width / icon1.height, 60);
			} else {
				image(icon3, 55, 60, 60 * icon1.width / icon1.height, 60);
			}
			if (ptInRect(mouseX, mouseY, 140, 60, 310, 120)) {
				fill(255);
				rect(140, 60, 170, 60);
				fill(0);
				noStroke();
				textFont(myFont);
				textSize(30);
				text('GO BACK', 165, 102);
			} else {
				noFill();
				strokeWeight(1);
				stroke(255);
				rect(140, 60, 170, 60);
				fill(255);
				noStroke();
				textFont(myFont);
				textSize(30);
				text('GO BACK', 165, 102);
			}
		}
		if (is_on == 1) {
			noStroke();
			fill(50);
			rect(60, 165, 250, 70);
			stroke(255);
			strokeWeight(1);
			line(60 + 250 * (song.currentTime() / song.duration()), 165, 60 + 250 * (song.currentTime() / song.duration()), 235);
			fill(255);
			rect(55 + 250 * (song.currentTime() / song.duration()), 235, 10, 10);
			noStroke();
			textFont(myFont);
			textSize(20);
			text(round(song.currentTime() / song.duration() * 100) + '%', 55 + 250 * (song.currentTime() / song.duration()), 160);
			image(icon6, 55, 60, 60 * icon1.width / icon1.height, 60);
		}
		image(icon1, 55, 330, 60 * icon1.width / icon1.height, 60);
		image(icon2, 55, 480, 60 * icon2.width / icon2.height, 60);

		noStroke();
		if (is_on == 1) {
			fill(200);
			textFont(myFont);
			textSize(20);
			text('PLAYING', 140, 71);
			fill(255);
			textFont(myFont);
			textSize(30);
			text('CRUEL SUMMER', 140, 112);
		}
		noStroke();
		fill(200);
		textFont(myFont);
		textSize(20);
		text('SCORE', 140, 336);
		fill(255);
		textFont(myFont);
		textSize(50);
		text(point, 140, 392);

		fill(200);
		textFont(myFont);
		textSize(20);
		text('COMBO', 140, 486);
		fill(255);
		textFont(myFont);
		textSize(50);
		text(combo, 140, 542);

		// textFont(myFont);
		// textSize(20);
		// text(round(song.currentTime() / song.duration() * 100) + '%', 55 + 250 * (song.currentTime() / song.duration()), 160);

		if (song.isPlaying()) {
			is_on = 1;
		} else {
			is_on = 0;
			start = 0;
		}

		// change speed here
		if (song.isPlaying() && (frameCount - cur) % (int(32 / spd)) == 0) {
			bar = new Bar();
			start = 1;
		}

		if (song.isPlaying() && start == 1) {
			bar.display();
			bar.move();
			bar.aging();
			bar.doNothing();
		}
	}

	if (state == 2) {
		background(0);
		noFill();
		stroke(255);
		strokeWeight(1);
		line(370, 30, 370, 570);
		rect(400, 30, 720, 540);
		rect(30, 30, 310, 240);
		//rect(30, 300, 310, 120);
		// rect(30, 450, 310, 120);
		if (dist(mouseX, mouseY, 84, 88) <= 29) {
			image(icon15, 55, 60, 60 * icon1.width / icon1.height, 60);
		} else {
			image(icon14, 55, 60, 60 * icon1.width / icon1.height, 60);
		}
		fill(200);
		noStroke();
		textFont(myFont);
		textSize(20);
		text('CLiCK TO', 140, 71);
		fill(255);
		textFont(myFont);
		textSize(27);
		text('PLAY YOUR WORK', 140, 112);


		if (ptInRect(mouseX, mouseY, 30, 300, 340, 420)) {
			fill(255);
			rect(30, 300, 310, 120);
			image(icon13, 55, 330, 60 * icon1.width / icon1.height, 60);
			fill(0);
			noStroke();
			textFont(myFont);
			textSize(50);
			text('REFRESH', 140, 380);
		} else {
			noFill();
			strokeWeight(1);
			stroke(255);
			rect(30, 300, 310, 120);
			image(icon12, 55, 330, 60 * icon1.width / icon1.height, 60);
			fill(255);
			noStroke();
			textFont(myFont);
			textSize(50);
			text('REFRESH', 140, 380);
		}

		if (ptInRect(mouseX, mouseY, 30, 450, 340, 570)) {
			fill(255);
			rect(30, 450, 310, 120);
			image(icon16, 55, 480, 60 * icon1.width / icon1.height, 60);
			fill(0);
			noStroke();
			textFont(myFont);
			textSize(50);
			text('GO BACK', 140, 530);
		} else {
			noFill();
			strokeWeight(1);
			stroke(255);
			rect(30, 450, 310, 120);
			image(icon11, 55, 480, 60 * icon2.width / icon2.height, 60);
			fill(255);
			noStroke();
			textFont(myFont);
			textSize(50);
			text('GO BACK', 140, 530);
		}

		fill(200);
		textFont(myFont);
		textSize(20);
		text("YOU'VE TYPED", 60, 170);
		fill(255);
		textFont(myFont);
		textSize(50);
		text((product.length - 1) + ' notes', 60, 230);


		fill(255);
		textFont('Arial');
		textSize(18);
		text(string, 430, 60, 650, 500);
	}
}




class Bar {
	constructor() {
		this.letter = random(letters);
		this.x = pos[letters.indexOf(this.letter)];
		this.y = pos2[letters.indexOf(this.letter)];
		this.x1 = 95;
		this.y1 = 38;
		this.yspd = 5;
		this.typeChance = 1;
		this.c = 255;
		this.f = 2;
		this.age = 0;
	}

	display() {
		push();
		noStroke();
		fill(255);
		circle(this.x, this.y, 100);
		noFill();
		strokeWeight(2);
		stroke(this.c);
		circle(this.x, this.y, 100 + this.yspd / 2)
		circle(this.x, this.y, 100 + this.yspd);
		noStroke();
		if (this.f == 2) {
			fill(0);
			textFont(myFont);
			textSize(50);
			text(this.letter, this.x - 10, this.y + 20);
		}
		if (this.f == 1) {
			image(icon4, this.x - 30, this.y - 30, 60 * icon1.width / icon1.height, 60);
		}
		if (this.f == 0) {
			image(icon5, this.x - 30, this.y - 30, 60 * icon1.width / icon1.height, 60);
		}
	}

	move() {
		if (this.f != 0) {
			this.yspd += 1;
		}
	}

	aging() {
		this.age += 1;
	}

	doNothing() {
		if (this.age == int(32 / spd) && this.f == 2) {
			combo = 0;
		}
	}

	punchRight(typed) {
		if (this.typeChance == 1) {
			if (typed == this.letter) {
				point += (10 + combo * 2);
				combo += 1;
				if (this.age <= int(32 / spd / 2)) {
					point += 5;
				}
				if (int(32 / spd / 2) < this.age <= int(3 * 32 / spd / 4)) {
					point += 3;
				}
				if (int(3 * 32 / spd / 4) < this.age <= int(32 / spd)) {
					point += 1;
				}
				this.f = 1;
				this.c = 200;
				this.typeChance -= 1;
			} else {
				point -= 10;
				this.f = 0;
				this.c = 200;
				combo = 0;
				this.typeChance -= 1;
			}
		}
	}
}




function keyTyped() {
	if (state == 1) {
		bar.punchRight(key);
	}
	if (state == 2) {
		if (keyCode === 13) {
			string += '\n';
			return;
		}
		if (keyCode === 8) {
			string = string.slice(0, -1);
			if (product.length > 1) {
				product.pop();
			}
			return;
		}
		if (65 <= keyCode && keyCode <= 90) {
			string += key;
			notes[keys.indexOf(keyCode)].play();
			product.push(notes[keys.indexOf(keyCode)]);
			return;
		}
		string += key;
		return;
	}
}



function ptInRect(x, y, left, top, right, bottom) {
	return isBetween(x, left, right) && isBetween(y, top, bottom);
}

function isBetween(x, start, stop) {
	return (start < x && x < stop);
}


function ArrayPlusDelay(array, delegate, delay) {
	var i = 0

	function loop() {
		// each loop, call passed in function
		delegate(array[i]);

		// increment, and if we're still here, call again
		if (i++ < array.length - 1)
			setTimeout(loop, delay); //recursive
	}

	// seed first call
	setTimeout(loop, delay);
}