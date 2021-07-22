let cx = 0;
let cy = 0;
let secondsRadius = 0;
let minutesRadius = 0;
let hoursRadius = 0;
let clockDiameter = 0;
let radius = 0;
let secondsMesh;
let minutesMesh;
let hoursMesh;
let modifier = 0;
function setup(){
    createCanvas(windowWidth, windowHeight, P2D);
    colorMode(HSB, 255);
    radius=min(windowWidth, windowHeight) / 2;
    secondsRadius=radius * 0.72;
    minutesRadius=radius * 0.60;
    hoursRadius=radius * 0.50;
    clockDiameter=radius * 1.8;
    cx=windowWidth / 2;
    cy=windowHeight / 2;
    let secondsPalette = [color(0, 255, 255), color(0, 100, 100)];
    secondsMesh=new ParticleMesh(20, radius, radius * 0.72, secondsPalette);
    secondsMesh.modifier = modifier;
    let minutesPalette = [color(168, 255, 255), color(168, 100, 100)];
    minutesMesh=new ParticleMesh(20, radius, radius * 0.71, minutesPalette);
    minutesMesh.modifier = modifier;
    let hoursPalette = [color(85, 255, 255), color(85, 100, 100)];
    hoursMesh=new ParticleMesh(20, radius, radius * 0.7, hoursPalette);
    hoursMesh.modifier = modifier;
}

function draw(){
    background(0);
    let s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
    let m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
    let h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
    if(floor(random(15 * frameRate)) == 0) {
        applyEffect();
    }
    secondsMesh.position=new p5.Vector(cx + cos(s) * secondsMesh.radius, cy + sin(s) * secondsMesh.radius);
    if(secondsMesh.position.dist(minutesMesh.position) < secondsMesh.size * 1.5) {
        secondsMesh.updateWithMesh(minutesMesh);
    }
    if(secondsMesh.position.dist(hoursMesh.position) < secondsMesh.size * 1.5) {
        secondsMesh.updateWithMesh(hoursMesh);
    }
    else secondsMesh.update();
    minutesMesh.position=new p5.Vector(cx + cos(m) * minutesMesh.radius, cy + sin(m) * minutesMesh.radius);
    if(minutesMesh.position.dist(hoursMesh.position) < minutesMesh.size * 1.5) {
        minutesMesh.updateWithMesh(hoursMesh);
    }
    else minutesMesh.update();
    hoursMesh.position=new p5.Vector(cx + cos(h) * hoursMesh.radius, cy + sin(h) * hoursMesh.radius);
    hoursMesh.update();
}

function applyEffect(){
    switch(floor(random(3))){
        case 0:{
            switch(floor(random(3))){
                case 0:{
                    if(secondsMesh.respawning == false) secondsMesh.respawning=true;
                    break;
                }
                case 1:{
                    if(minutesMesh.respawning == false) minutesMesh.respawning=true;
                    break;
                }
                case 2:{
                    if(hoursMesh.respawning == false) hoursMesh.respawning=true;
                    break;
                }
            }
            break;
        }
        case 1:{
            switch(floor(random(3))){
                case 0:{
                    secondsMesh.movingToCenter=!hoursMesh.movingToCenter;
                    break;
                }
                case 1:{
                    minutesMesh.movingToCenter=!hoursMesh.movingToCenter;
                    break;
                }
                case 2:{
                    hoursMesh.movingToCenter=!hoursMesh.movingToCenter;
                    break;
                }
            }
            break;
        }
        case 2:{
            switch(floor(random(3))){
                case 0:{
                    if(secondsMesh.exploding == 0) secondsMesh.exploding=20;
                    break;
                }
                case 1:{
                    if(minutesMesh.exploding == 0) minutesMesh.exploding=20;
                    break;
                }
                case 2:{
                    if(hoursMesh.exploding == 0) hoursMesh.exploding=20;
                    break;
                }
            }
            break;
        }
    }
}

function keyPressed(){
    switch(keyCode){
        // 1
        case 49:
          modifier += 0.01;
          console.log(modifier);
          secondsMesh.modifier = modifier;
          minutesMesh.modifier = modifier;
          hoursMesh.modifier = modifier;
          break;
        // 2
        case 50:
          modifier -= 0.01;
          console.log(modifier);
          secondsMesh.modifier = modifier;
          minutesMesh.modifier = modifier;
          hoursMesh.modifier = modifier;
          break;
        // space
        case 32:
          applyEffect();
        break;
    }
}

class Particle{
    constructor(pos, c){
        this.maxSpeed = 1;
        this.position=pos;
        this.velocity=p5.Vector.random2D();
        this.acceleration=p5.Vector.random2D();
        this.particleColor=c;
        this.charge=floor(random(-1, 1));
        if(this.charge == 0) this.charge=1;
    }

    applyForce(force){
        this.acceleration.add(force);
    }

    update(){
        this.applyForce(p5.Vector.random2D());
        this.velocity.add(this.acceleration);
        this.velocity.limit(this.maxSpeed);
        this.position.add(this.velocity);
    }

    display(){
        stroke(this.particleColor);
        strokeWeight(5);
        point(this.position.x, this.position.y);
    }

    displayManual(size, c){
        c = color(255, 255, 255);
        stroke(c);
        strokeWeight(size);
        point(this.position.x, this.position.y);
    }

}

class ParticleMesh{
    constructor(n, s, r, cs){
        this.maxSpeed = 1;
        this.respawning = false;
        this.movingToCenter = false;
        this.exploding = 0;
        this.blink = 0;
        this.position=p5.Vector.random2D();
        this.position.x=map(this.position.x, -1, 1, 0, width);
        this.position.y=map(this.position.y, -1, 1, 0, height);
        this.seed=random(100000);
        this.velocity=p5.Vector.random2D();
        this.acceleration=new p5.Vector();
        this.modifier=0.05;
        this.colors=cs;
        this.velocity=p5.Vector.random2D();
        this.particles=new Array();
        this.numberOfParticles=n;
        this.size=s;
        this.radius=r;
        this._radius=r;
        for(let i = 0;i < this.numberOfParticles;i++) {
            this.particles.push(new Particle(this.randomPosition(), this.colors[floor(random(this.colors.length))]));
        }
    }

    kill(){
        if(this.particles.length == 0) this.respawning=false;
    else if(floor(random(60)) == 0) this.particles.splice(floor(random(this.particles.length)),1)[0];
    }

    applyForce(force){
        this.acceleration.add(force);
    }

    updateWithMesh(connectedMesh){
        if(this.exploding > 0) {
            this.explode();
        }
    else {
            if(this.particles.length < this.numberOfParticles && noise(this.seed, frameCount * 0.00025) <= 0.7 && !this.respawning) {
                this.particles.push(new Particle(this.randomPosition(), this.colors[floor(random(this.colors.length))]));
            }
            this.applyForce(p5.Vector.random2D());
            this.velocity.add(this.acceleration);
            this.velocity.limit(this.maxSpeed);
            this.position.add(this.velocity);
            for(let i = 0;i < this.particles.length;i++) {
                if(floor(random(60)) == 0) {
                    this.particles.splice(i,1)[0];
                }
    else {
                    let particle = this.particles[i];
                    this.moveToCenter();
                    particle.maxSpeed+=this.modifier;
                    particle.acceleration.mult(this.modifier);
                    particle.update();
                    if(this.blink > 0) {
                        this.blink();
                    }
    else {
                        particle.display();
                    }
                    this.connectParticle(particle);
                    this.connectMesh(particle, connectedMesh);
                }
            }
            if(this.respawning && this.particles.length == 0) this.respawning=false;
        }
    }

    update(){
        this.size=round(1000 * noise(this.seed, frameCount * 0.001));
        if(this.exploding > 0) {
            this.explode();
        }
    else {
            if(this.particles.length < this.numberOfParticles && noise(this.seed, frameCount * 0.00025) <= 0.7 && !this.respawning) {
                this.particles.push(new Particle(this.randomPosition(), this.colors[floor(random(this.colors.length))]));
            }
            this.applyForce(p5.Vector.random2D());
            this.velocity.add(this.acceleration);
            this.velocity.limit(this.maxSpeed);
            this.position.add(this.velocity);
            for(let i = 0;i < this.particles.length;i++) {
                if(floor(random(60)) == 0) {
                    this.particles.splice(i,1)[0];
                }
    else {
                    let particle = this.particles[i];
                    this.moveToCenter();
                    particle.maxSpeed+=this.modifier;
                    particle.acceleration.mult(this.modifier);
                    particle.update();
                    if(this.blink > 0) {
                        this.blink();
                    }
    else {
                        particle.display();
                    }
                    this.connectParticle(particle);
                }
            }
            if(this.respawning && this.particles.length == 0) this.respawning=false;
        }
    }

    moveToCenter(){
        if(this.movingToCenter) {
            if(this.radius > 20) this.radius-=0.2;
    else this.movingToCenter=false;
        }
        if(!this.movingToCenter) {
            if(this.radius < this._radius) {
                this.radius+=0.2;
            }
        }
    }

    blink(){
        if(floor(this.blink) < this.particles.length - 1) this.particles[floor(this.blink)].displayManual(10, color(255, 255,255));
        this.blink-=0.02;
    }

    explode(){
        if(this.particles.length == 0) {
            this.exploding=0;
        }
        for(let i = 0;i < this.particles.length;i++) {
            let particle = this.particles[i];
            if(particle.position.x < 0 || particle.position.x > width || particle.position.y < 0 || particle.position.y > height) {
                this.particles.splice(i,1)[0];
            }
            let direction = p5.Vector.sub(particle.position, this.position);
            direction.normalize();
            let factor = map(this.exploding, 20, 0, -0.2, 2);
            direction.mult(1 / factor);
            particle.applyForce(direction);
            particle.position=p5.Vector.add(particle.position, particle.acceleration);
            particle.display();
            this.connectParticle(particle);
        }
        this.exploding-=0.01;
    }

    grow(factor){
    }

    randomDirectionalPosition(){
        return new p5.Vector();
    }

    randomPosition(){
        let radius = random(this.size / 2);
        let a = random(TWO_PI);
        let x = this.position.x + cos(a) * radius;
        let y = this.position.y + sin(a) * radius;
        let pos = new p5.Vector(x, y);
        return pos;
    }

    getGradientColor(color1, color2){
        let gradientPalette = new Array(3);
        for(let i = 0;i < 3;i++) {
            let inter = map(i, 0, 3, 0, 1);
            gradientPalette[i]=lerpColor(color1, color2, inter);
        }
        return gradientPalette[1];
    }

    connectParticle(particle){
        for(let p = 0;p < this.particles.length;p++) {
            let _particle = this.particles[p];
            if(_particle != particle) {
                let distance = particle.position.dist(_particle.position);
                if(distance < this.size / 3) {
                    let c = this.getGradientColor(particle.particleColor, _particle.particleColor);// color(0);
                    c.setAlpha(map(distance, 0, this.size / 3, 0, 100));
                    stroke(c);//, map(distance, 0, this.size / 3, 0, 100));
                    strokeWeight(1);
                    line(particle.position.x, particle.position.y, _particle.position.x, _particle.position.y);
                }
            }
        }
    }

    connectMesh(particle, connectedMesh){
        for(let p = 0;p < connectedMesh.particles.length;p++) {
            let _particle = connectedMesh.particles[p];
            if(_particle != particle) {
                let distance = particle.position.dist(_particle.position);
                if(distance < this.size / 3) {
                    let c = this.getGradientColor(particle.particleColor, _particle.particleColor);
                    c.setAlpha(50);
                    stroke(c);
                    strokeWeight(1);
                    line(particle.position.x, particle.position.y, _particle.position.x, _particle.position.y);
                }
            }
        }
    }

}
