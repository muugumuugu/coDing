const side = 800;

const center = Math.floor(side * 0.5);
const radius = Math.floor(center * 0.9);

var initPoints = 5;
const iterPoints = 5000000;

var histLen = 0;
var hist = [];

var pointList = [];
var count = 0;

var canvas;
var a;
var aIndex;

const speed = 10000;

var wonky = 0;

var drawFrac = 0.5;

function setup() {
    canvas = createCanvas(side, side);
    background(0);    
    // stroke('white');
    stroke(255, 255, 255, 10);
    strokeWeight(1);

    hist = new Array(histLen);


    for (let i = 0; i < initPoints; i++) {

        let angle = 0;
        if (wonky == 0) {
            // Regular points
            angle = (i * Math.PI * 2) / initPoints;
        } else {
            //Semi-regular points
            angle = (Math.random() * Math.PI * 2);
        }
        let x = center + Math.cos(angle) * radius;
        let y = center + Math.sin(angle) * radius;

        point(x, y);
        p = {x: x, y: y};
        pointList.push(p);
    }

    aIndex = Math.floor(Math.random() * pointList.length);
    if (histLen > 0) {
        for (let i = 0; i < histLen; i++) {
            hist[i] = aIndex;
        }        
    }
    a = pointList[aIndex];
}

function draw() {

    for (let i = 0; i < speed; i++) {
        if (a == null) {
            aIndex = Math.floor(Math.random() * pointList.length);
            a = pointList[aIndex];
        }

        let bIndex = aIndex;
        // console.log(hist);
        if (histLen > 0) {            
            while (hist.includes(bIndex)) {
                bIndex = Math.floor(Math.random() * pointList.length);
            }            
        } else {
            bIndex = Math.floor(Math.random() * pointList.length);
        }
        let b = pointList[bIndex];

        let cx = (a.x * drawFrac)  + (b.x * (1-drawFrac));
        let cy = (a.y * drawFrac)  + (b.y * (1-drawFrac));
        point(cx, cy);

        aIndex = bIndex;
        a = {x: cx, y: cy};

        count++;

        if (histLen > 0) {
            hIndex = count % histLen;
            hist[hIndex] = aIndex;            
        }
    }
}

function mouseClicked() {
    // canvas = createCanvas(side, side);
    // background(0);    

    initPoints = 5 + Math.floor(Math.random() * 4);
    pointList = [];

    histLen = Math.floor(Math.random() * (initPoints - 2));
    hist = new Array(histLen);

    wonky = Math.floor(Math.random() * 2);

    drawFrac = Math.random();
    if (wonky == 1) {
        drawFrac = 0.5;
    }


    count = 0;

    setup();

}
