var wifi = true;
let grid = false;
var level = 0;
var maps = [
        //length of 24 height of10;
        //1: dirt
        //2: grass top
        //3: fruitlocked portal || collect all fruit before it opens
        //4: eaten fruit (/random fruit)
        //5: orange
        //6: lemon
        //7: cherry
        //8: spike
        //9: spike w/ screw
    [   //vvvvvvv easy
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,0,8,9,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,3,0,0,1,1,2,2,8,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,8,0,0,0,0,0,0],
        [0,0,0,0,0,4,0,0,0,0,0,0,2,0,0,0,1,2,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1,1,0,0,0,0,0,0],
        [0,0,0,0,0,0,2,2,2,2,0,2,2,0,0,0,1,1,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,1,1,1,8,9,1,1,1,1,1,1,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0]
    ],[   //vv easy
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,2,8,0,0,0,0,0,0],
        [0,0,0,0,4,0,0,0,0,0,8,8,2,0,0,8,0,8,0,0,0,0,0,0],
        [0,0,0,2,0,0,0,0,0,0,8,0,1,0,0,0,0,0,0,2,0,0,0,0],
        [0,0,0,0,0,0,8,2,2,2,8,0,1,8,0,0,4,0,3,1,0,0,0,0],
        [0,0,0,0,0,0,8,9,1,8,8,0,1,2,9,8,2,2,2,1,8,0,0,0]
    ],[   //vv medium
        [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1],
        [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1],
        [1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1],
        [0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,1,1,1],
        [0,0,0,0,2,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1],
        [0,0,0,0,1,0,2,9,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,1,1,1,1],
        [1,0,0,0,1,0,0,8,8,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1],
        [1,0,0,1,1,0,0,0,0,0,2,2,0,0,0,2,8,8,0,8,3,1,1,1,1,1,1],
        [1,1,1,1,1,0,0,4,0,0,0,0,0,0,2,1,0,0,0,8,0,1,1,1,1,1,1],
        [1,1,1,1,1,2,0,0,0,8,0,0,0,0,1,0,0,2,2,9,0,1,1,1,1,1,1],
        [1,1,1,1,1,1,0,8,8,8,2,0,0,2,1,4,4,0,0,0,0,1,1,1,1,1,1],
        [1,1,1,1,1,1,2,2,2,2,1,2,2,1,1,2,2,0,0,0,0,1,1,1,1,1,1]
    ],[ //erik
        [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
        [1,1,1,1,9,8,9,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1],
        [1,1,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1],
        [1,1,0,0,0,0,0,0,1,1,0,0,0,0,2,0,0,0,0,0,0,0,1,1],
        [1,0,0,0,0,0,0,0,1,8,0,8,2,4,1,9,8,2,0,0,0,0,0,1],
        [1,0,0,4,0,0,2,0,1,8,0,8,1,4,8,0,0,0,0,0,3,0,0,1],
        [1,0,0,0,0,0,8,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,1],
        [1,0,0,0,0,0,8,0,0,0,4,8,9,8,8,0,0,0,8,9,8,8,2,1],
        [1,0,0,8,2,2,9,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,1,1],
        [1,0,0,2,1,1,8,0,0,1,0,0,0,0,2,0,0,0,0,0,0,0,0,1],
        [1,0,0,1,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1],
    ],[ //medium?
        [0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,4,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,8,2,2,2,2,9,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0]
    ],[ //erik 2
        [0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,8,0,0],
        [0,0,0,0,8,0,9,8,8,8,9,2,0,8,0,8,8,8,2,2,0,8,0,0],
        [0,0,0,0,8,0,0,0,0,0,0,0,0,8,4,9,0,0,0,8,3,8,0,0],
        [0,0,0,0,9,2,2,2,2,2,4,8,0,9,0,8,0,0,0,8,8,9,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,9,0,8,0,8,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,2,4,1,4,8,0,0,0,9,8,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,4,0,0,1,0,8,0,0,0,0,8,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,9,0,0,1,0,9,0,0,2,0,2,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,8,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
        [0,0,0,0,2,0,2,0,2,1,0,0,0,0,1,9,1,0,0,0,0,0,0,0],
        [0,0,0,0,1,0,1,0,1,1,0,0,0,0,1,0,1,0,0,0,0,0,0,0]   
    ],[ //erik 3
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0],
        [0,0,9,8,8,9,8,8,9,2,8,8,0,9,8,2,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,4,0,0,2,4,0,0,0,2,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,4,0,0,1,0,0,0,0,1,0,0,0,0,0,0],
        [0,0,0,0,2,0,0,2,2,0,0,0,1,0,0,0,0,1,0,0,8,0,0,0],
        [0,0,0,0,1,0,0,1,1,0,0,0,1,0,0,0,0,1,0,0,8,0,0,0],
        [0,0,0,0,1,9,8,1,1,0,0,0,1,0,0,0,0,1,2,2,9,0,0,0],
        [0,0,0,0,1,0,0,1,1,0,0,0,1,0,0,0,0,1,1,1,0,0,0,0]
    ],[ //rop
        [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1],
        [1,1,1,0,0,0,0,0,0,0,0,0,0,0,2,2,8,8,9,0,0,0,2,1],
        [1,1,1,2,8,0,0,0,0,0,0,0,2,2,1,1,0,0,0,0,0,0,1,1],
        [1,1,1,1,4,0,2,8,2,8,2,0,1,0,0,1,3,0,0,0,0,0,1,1],
        [1,1,1,1,0,0,8,0,0,0,8,0,1,4,0,1,0,0,0,0,0,0,1,1],
        [1,1,1,1,0,0,0,4,0,4,8,0,0,4,0,1,8,8,8,0,0,0,1,1],
        [1,1,1,1,0,0,0,2,0,0,2,2,2,0,0,1,0,9,0,0,0,9,1,1],
        [1,1,1,1,2,2,0,0,0,0,0,0,0,2,2,0,0,0,4,0,0,2,1,1],
        [1,1,1,1,1,1,0,0,0,0,8,0,0,0,0,0,0,0,4,0,8,1,1,1],
        [1,1,1,1,1,1,0,0,0,0,2,2,0,0,0,2,0,0,0,0,2,1,1,1],
        [1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1],
        [1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1]
    ],[ //erik 4
        [0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,2,0,9,2,9,8,8,2,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,1,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,1,0,0,2,0,0,0,1,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0]
    ],[ //erik 4
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2],
        [2,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,2,1],
        [1,0,0,8,8,9,8,0,0,0,0,0,0,0,0,0,0,0,8,9,0,0,1,1],
        [1,2,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,8,0,0,0,1,1],
        [1,1,0,0,0,0,0,0,4,2,0,0,0,0,0,0,0,8,9,0,0,0,1,1],
        [1,1,2,0,0,0,2,0,0,1,0,0,0,0,0,0,0,0,0,0,0,2,1,1],
        [1,1,1,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1],
        [1,1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,2,1,1,1],
        [1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1],
        [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    ],[   // jort1
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,4,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,2,0,0,0,0,0,4,0,0,8,8,0,0,0,0,0,0,0,0,0,0],
        [0,0,4,2,0,0,0,8,9,0,2,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,2,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,4,0,0,0,0,0,8,8,2,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,2,0,0,0,0,2,0,0,0,2,3,0,2,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    ],[   //haaaaard
        [0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,3,8,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,8,0,4,0,9,0,4,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,8,8,8,0,2,0,0,8,8,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,2,2,2,0,4,0,9,8,2,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,2,1,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    ]

];
let timer = 0;
let deaths = 0;
//game / newlevel
var scene = "game";
var bodLenghts = [2]; 
var headPos = {
    x: 14,
    y: 8
};
//display
var dheadPos = {
    x: 14,
    y: 8
};
var bod = {
    x1: 13,
    y1: 8,
    x2: 12,
    y2: 8,
    x3: 120,
    y3: 8,
    x4: 120,
    y4: 8,
    x5: 120,
    y5: 8,
    x6: 120,
    y6: 8,
    x7: 120,
    y7: 8,
    x8: 120,
    y8: 8,
    x9: 120,
    y9: 8,
    x10: 120,
    y10: 8
};
//display
var dbod = {
    x1: 13,
    y1: 8,
    x2: 12,
    y2: 8,
    x3: 110,
    y3: 8,
    x4: 110,
    y4: 8,
    x5: 110,
    y5: 8,
    x6: 110,
    y6: 8,
    x7: 120,
    y7: 8,
    x8: 120,
    y8: 8,
    x9: 120,
    y9: 8,
    x10: 120,
    y10: 8
};
var colors = [];
var lerpSpeed = 0.5;
var grounded;
var rCD = 0;
//Since Last Movement
var SLM = 0;
//times restarted
var TR = 0;
let dyoff = 0;
//death particles;
var dPs = [];
var dying = 0;
//particles per piece
//50 / 100 / 150
var ppp = 50;
//any particles bigger than 0r
var biggerthan0 = 0;
let werk = 0;
let totTime = false;
//going to next lvl
var goingToNext = false;
let movingOn = false;
let curF = 0;
let yee = 0;
let fallspeed = 5;
let pressedB;
var roundness;
let boolool = false;
var cloudnum = 3;

//level offset
let xLvlOff = 75;
let yLvlOff = 150;
//foreground decorations
var decor = [];
var clouds = [];


var s;

var keys = [];
var keyType = "none";
let keyCD = 0;
var snekcmo;

var VCR;
var aa;
function preload(){
    if(wifi){
      VCR = loadFont('https://cdn.glitch.com/d494aa67-611c-4b8e-affd-2f72bbc2fed5%2FVCR_OSD_MONO_1.001.ttf?1514314208999')
    } else {
        loadFont('assets/VCR_OSD_MONO_1.001.ttf');
    }
}


function setup(){
    createCanvas(1350, 650);
    s = 50;
    snekcmo = floor(random(1,4));
    snekCol(snekcmo);
    
    for(let i = 0; i < cloudnum; i++){
        let x0 = round(random(-width,width*2));
        let y0 = round(random(0,s*3));
        let ded = 0;
        if(round(random(0,1)) === 0){
            ded = random(-5,-2)*0.1;
        } else{
            ded = random(5,2)*0.1;
        }
        
        let r = random(s,s*2);
        
        clouds[i] = new Cloud(x0,y0,r,ded);
    }
    
}


function draw(){
        
    if(boolool){
            fill(0);
        textSize(10);
            text("level: "+level,width/2,10)
    }
    
    
    if(scene === "game"){
        bg();
        
        keyCD--;

        drawBackDec();
        
        drawL();

        if(dying < 7){
            drawSnek();
        }
        
        drawDecor();
        
        reset();

        keySetup();

        checkFallDeath();
        
        fallCheck();
        if(!grounded){
            keyCD = 1;
            yee++
            if(yee >= fallspeed){
                yee = 0;
                fall();
            } 
        }else {
            //keyCD = 0;
            keyCD--;
        }

        if(goingToNext){
            nextLevel();
        }

        drawDPs();
        fade(250,250,250, frameCount,curF+60, curF);
        
        timerSetup();
        
        
    }
    if(scene === "newlevel"){
        decor = [];
        cursor(ARROW);
        
        drawNLUI();
        
        fade(250,250,250, frameCount,curF+60, curF);
        fade(250,250,250, movingOn, 0, 60);
        noStroke();
        
        
        timerDisplay();
        
    }
    
    if(grid){
        textSize(20);
        fill(255,0,100)
        text((mouseX-xLvlOff) + ", " + (mouseY-yLvlOff), mouseX,mouseY);
    }
}


function timerSetup(){
    //domme timer
        push();
        textAlign(LEFT,TOP);
        if(keyType !== "none"){
            timer++;
            textSize(40);
            fill(0,200);
            let ee = (timer)/60;
            let pp = (round(ee*100))/100;
            
            if(boolool){
                text(pp,0,0);
                text(deaths,0,40);
            }
        }
        pop();
    
    
    
}

function timerDisplay(){
    //timer display
    push();
        textAlign(LEFT,TOP);
        let ee = (timer)/60;
        let pp = (round(ee*100))/100;
        if(boolool){
            textSize(40);
            fill(255,0,100)
            text(pp,0,0);
            text(deaths,0,40);
        }
        pop();
    
}

function snekCol(clrm){
    let clrmode = clrm;
    if(clrmode === 1){
        colors[0] = color(random(0,255), random(0,255), random(0,255));
        colors[1] = color(random(0,255), random(0,255), random(0,255));
        for(let i = 0; i < 11; i++){
            if(i % 2 === 0){
                colors[i] = colors[0];
            }else {
                colors[i] = colors[1];
            }
        }
    }
    
    if(clrmode === 2){
        for(let i = 0; i < 11; i++){
                colors[i] = color(random(255),random(255),random(255));
        }
    }
    
    if(clrmode === 3){
        let rick = round(random(20,235));
        let g = round(random(20,235));
        let b = round(random(20,235));
        
        let _rick = rick+round(random(-20,20));
        let _g = g+round(random(-20,20));
        let _b = b+round(random(-20,20));
        
        colors[0] = color(rick,g,b);
        colors[1] = color(_rick,_g,_b);
        for(let i = 0; i < 11; i++){
            if(i % 2 === 0){
                colors[i] = colors[0];
            }else {
                colors[i] = colors[1];
            }
        }
    }
    decor = [];
    resetL();
}

function bg(){
    background(115, 210, 251);
}

function drawNLUI(){
    background(250);
    
    fill(100,255,100);
    stroke(50,200,50);
    strokeWeight(15);
    ellipse(width/2,height/1.5,200);
    
    let x_ = width/2;
    let y_ = height/1.5;
    fill(250);
    strokeWeight(8);
    stroke(240);
    triangle(x_ -40, y_ - 50,  x_- 40, y_+50,  x_+50, y_);
    
    noStroke();
    fill(250);
    triangle(x_ -40-4, y_ - 50+8/2,  x_- 40-4, y_+50+6,  x_+50, y_+8/2);
    //+clicking
    if(dist(mouseX, mouseY, x_, y_) < 100+7.5){
        if(mouseIsPressed){
            if(!movingOn){
                movingOn = 1;
                pressedB = 2;
            }
        }
        cursor(HAND);
    }
    
    
    fill(100,255,100);
    stroke(50,200,50);
    strokeWeight(15);
    let b2x = width/3*2-20;
    let b2y = height/1.5-75/2;
    ellipse(b2x,b2y,150);
    
    fill(250);
    noStroke();
    angleMode(DEGREES);
    arc(b2x,b2y,90,90, 0,-90);
    fill(100,255,100);
    ellipse(b2x,b2y,60);
    
    fill(250,250,250);
    ellipse(b2x, b2y-37.5,15);
    
    
    push();
    translate(-2.5,1);
    
    fill(240);
    triangle(920, 370, 935, 395, 905 , 395);
    fill(250);
    triangle(920-2, 370+3, 905 , 395+0.25, 935-3, 395+0.25);
    pop();
    
    if(dist(mouseX, mouseY, b2x, b2y) < 75+7.5){
        if(mouseIsPressed){
            if(!movingOn){
                movingOn = 1;
                pressedB = 3;
            }
        }
        cursor(HAND);
    }
    
    
    fill(100,255,100);
    stroke(50,200,50);
    strokeWeight(15);
    let b3x = width/3+20;
    let b3y = height/1.5-75/2;
    ellipse(b3x,b3y,150);
    
    if(dist(mouseX, mouseY, b3x, b3y) < 75+7.5){
        if(mouseIsPressed){
            if(!movingOn){
                movingOn = 1;
                pressedB = 1;
            }
        }
        cursor(HAND);
    }
    
    if(keys[32] && !(movingOn > 0)){
        pressedB=2;
        movingOn=1;
    } else if (keys[82] && !(movingOn > 0)){
        pressedB=3;
        movingOn=1;
    }
    
    
    if(movingOn > 0){
        movingOn++;
    }
    
    if(movingOn > 60){
        if(pressedB === 2){
            scene = "game";
            level++;
            decor = [];
            resetL();
            movingOn = false;
            curF = frameCount;
        } else if(pressedB === 3){
            scene = "game";
            decor = [];
            resetL();
            movingOn = false;
            curF = frameCount;
        } else if(pressedB === 1){
            alert("coming soon!");
            movingOn = false;
        }
    }
}

function keySetup (){
    if(keyType === "none"){
        angleMode(RADIANS);
        keyCD = 0;
        
        fill(30,180);
        rect(0,0,width,height);
        
        let sss = 5
        strokeWeight(2*sss);
        stroke(200);
        line(width/2-sss,-10,width/2-sss,height+20);
        noStroke();
        
        push();
        translate(0,-100)
        makeKey(width/4,(height/2)-10*sin(0.1*frameCount),100+10*sin(0.1*frameCount),"W");
        makeKey(width/4,(height/2)+120+10*sin(0.1*frameCount),100+10*sin(0.1*frameCount),"S");
        makeKey(width/4+120+10*sin(0.1*frameCount),(height/2)+120+10*sin(0.1*frameCount),100+10*sin(0.1*frameCount),"D");
        makeKey(width/4-120-10*sin(0.1*frameCount),(height/2)+120+10*sin(0.1*frameCount),100+10*sin(0.1*frameCount),"A");
        pop();
        
        push();
        translate(width/2,-100)
        makeKey(width/4,(height/2)-10*sin(0.1*frameCount),100+10*sin(0.1*frameCount),"↑");
        makeKey(width/4,(height/2)+120+10*sin(0.1*frameCount),100+10*sin(0.1*frameCount),"↓");
        makeKey(width/4+120+10*sin(0.1*frameCount),(height/2)+120+10*sin(0.1*frameCount),100+10*sin(0.1*frameCount),"→");
        makeKey(width/4-120-10*sin(0.1*frameCount),(height/2)+120+10*sin(0.1*frameCount),100+10*sin(0.1*frameCount),"←");
        pop();
        
        if(mouseIsPressed && mouseX > width/2){
            keyType = "arrows";
            SLM = 0;
        } else if(mouseIsPressed && mouseX <= width/2){
            keyType = "wasd";
            SLM = 0;
        }
    }
}

function makeKey(x,y,s,txt){
    
    fill(198, 185, 155);
    stroke(50);
    strokeWeight(2);
    rect(x-0.5*s,y-0.5*s,s,s,s/10);
    
    textSize(s/1.5);
    textAlign(CENTER,CENTER);
    fill(20);
    text(txt,x,y)
}

function drawL(){
    push();
    translate(xLvlOff, yLvlOff);
    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            block(j*s, i*s, maps[level][i][j]);
        }
    }
    pop();
}

function block(x,y,type){
    if(type === 0){
//        fill(115, 210, 251);
//        noStroke();
//        rect(x , y , s , s);
    } else if(type === 1){
        noStroke();
        fill(115, 210, 251);
        //rect(x , y , s , s, roundness);
        //dirt corners
        if(maps[level][y/s][x/s+1] === 1 || maps[level][y/s][x/s+1] === 2){
            fill(161, 99, 43);
            rect(x + s/2 , y , s/2 , s);
        }
        if(maps[level][y/s][x/s-1] === 1 || maps[level][y/s][x/s-1] === 2){
            fill(161, 99, 43);
            rect(x , y , s/2 , s);
        }
        if(y/s === 0||(y/s> 0 && maps[level][y/s-1][x/s] === 1) || (y/s> 0 && maps[level][y/s-1][x/s] === 2)){
            fill(161, 99, 43);
            rect(x,y,s,s/2)
        }
        if( y/s !== maps[level].length-1){
        if( maps[level][y/s+1][x/s] === 1 || maps[level][y/s+1][x/s] === 2){
            fill(161, 99, 43);
            rect(x,y+s/2,s,s/2)
        }
        } else{
            rect(x,y+s/2,s,s/2)
        }
        
        
        noStroke();
        fill(161, 99, 43);
        rect(x , y , s , s,roundness);
    } else if(type === 2){
        noStroke();
        fill(115, 210, 251);
        //rect(x , y , s , s , roundness);
        //dirt corners
        if(maps[level][y/s][x/s+1] === 1 || maps[level][y/s][x/s+1] === 2){
            fill(161, 99, 43);
            rect(x + s/2 , y , s/2 , s);
        }
        if(maps[level][y/s][x/s-1] === 1 || maps[level][y/s][x/s-1] === 2){
            fill(161, 99, 43);
            rect(x , y , s/2 , s);
        }
        if(maps[level][y/s-1][x/s] === 1 || maps[level][y/s-1][x/s] === 2){
            fill(161, 99, 43);
            rect(x,y,s,s/2)
        }
        if( y/s !== maps[level].length-1){
        if( maps[level][y/s+1][x/s] === 1 || maps[level][y/s+1][x/s] === 2){
            fill(161, 99, 43);
            rect(x,y+s/2,s,s/2)
        }
        } else{
            rect(x,y+s/2,s,s/2)
        }
        
        
        noStroke();
        fill(161, 99, 43);
        rect(x , y , s , s,roundness);
        
        
        //grass corners
        fill(98, 255, 23);
        if(maps[level][y/s][x/s+1] === 1 || maps[level][y/s][x/s+1] === 2){
            rect(x + s/2 , y , s/2 , 1/3*s);
        }
        if(maps[level][y/s][x/s-1] === 1 || maps[level][y/s][x/s-1] === 2){
            rect(x , y , s/2 , 1/3*s);
        }
        
        fill(98, 255, 23);
        
        rect(x,y+0.5*(1/3*s),s,0.5*(1/3*s));
        
        rect(x,y,s,1/3*s,roundness);
        
    }else if(type === 3){
        
        let open = true;
        for(let i = 0; i < maps[level].length; i++){
            for(let j = 0; j < maps[level][i].length; j++){
                
                if(maps[level][i][j] >= 5 && maps[level][i][j] <= 7){
                    open = false;
                }
            }
        }
        
        if(open){
            push();
        
        textAlign(CENTER,CENTER);
        translate(x+s/2,y+s/2);
        rotate(0.01*frameCount);
        
        scale(0.95,0.95);
        let cirnum = 30;
        for(let i = 0; i < cirnum; i++){
            fill(26, 0, 99, i);
            ellipse(0,0,(i+1)*(s/cirnum),(i+1)*(s/cirnum));
        }
        
        let a = map(sin(0.01*frameCount), -1, 1, -20, 235);
        textSize(s*0.4);
        fill(240,a);
        text("⋆",-s/5,s/3);
        
        a = map(sin(0.01*(318+frameCount)), -1, 1, 0, 235);
        textSize(s*0.1);
        fill(250,a);
        text("✦",s/4,s/6);
        
        a = map(sin(0.01*(3287+frameCount)), -1, 1, 0, 235);
        textSize(s*0.1);
        fill(250,a);
        text("✢",-s/3,-s/4);
        
        a = map(sin(0.01*(9321+frameCount)), -1, 1, 0, 235);
        textSize(s*0.1);
        fill(250,a);
        text("✶",s/10,-s/7);
        
        a = map(sin(0.01*(93218+frameCount)), -1, 1, 0, 235);
        textSize(s/10);
        fill(250,a);
        text("❂",-s/6,s/8);
        
        pop();
            
        if(x/s === headPos.x && y/s === headPos.y){
            goingToNext = true;
        }
        
        
        if(dying > 0){
            goingToNext = false;
        }
            
        }else{
            
            textSize(15);
            fill(255,0,0);
            //text("closed",x,y+s/2);
            
            push();
            translate(x+s/2,y+s/2)
            let cirnum = 10;
            for(let i = 0; i < cirnum; i++){
                fill(26, 0, 99, i*4);
                ellipse(0,0,(i+1)*((s/2.2)/cirnum),(i+1)*((s/2.2)/cirnum));
            }
            
            
            pop();
        }
        
        
    } else if(type === 4){
        
    } else if(type === 5){
        let yoff = 5*sin(0.05*frameCount);
        dyoff = lerp(dyoff, yoff, 0.05);
        
        fill(255,120,20);
        ellipse(x+s/2,y +s/2 + dyoff,s*0.75,s*0.70);
        
        fill(100,255,0);
        ellipse(x+s/2,y+ 0.3*s + dyoff,s*0.3,s*0.2);
        
        fill('#5DE900');
        ellipse(x+s/2,y+ 0.25*s + dyoff,s*0.1,s*0.1);
        
        fill(255,100,0);
        ellipse(x+s/4,y +s/2.4 + dyoff,s*0.1 ,s*0.17);
        
        
        if(headPos.x === x/s && headPos.y === y/s){
            maps[level][headPos.y][headPos.x] = 4;
        }
        
    }else if(type === 6){
        let yoff = 5*sin(0.05*frameCount+17);
        dyoff = lerp(dyoff, yoff, 0.05);
        
        fill(255,255,20);
        ellipse(x+s/2,y +s/2 + dyoff,s*0.75,s*0.70);
        
        fill(100,255,0);
        ellipse(x+s/2,y+ 0.3*s + dyoff,s*0.3,s*0.2);
        
        fill('#5DE900');
        ellipse(x+s/2,y+ 0.25*s + dyoff,s*0.1,s*0.1);
        
        fill(255,240,10);
        ellipse(x+s/4,y +s/2.4 + dyoff,s*0.1 ,s*0.17);
        
        if(headPos.x === x/s && headPos.y === y/s){
            maps[level][headPos.y][headPos.x] = 4;
        }
        
        
    }else if(type === 7){
        
        
        if(headPos.x === x/s && headPos.y === y/s){
            maps[level][headPos.y][headPos.x] = 4;
        }
        
        let yoff = 5*sin(0.05*frameCount);
        dyoff = lerp(dyoff, yoff, 0.05);
        let ny = y+dyoff;
        
        
        strokeWeight(5);
        stroke(50,255,50);
        let sx = x+s/2;
        let sy = ny+s/5;
        line(x+s/4+s/25, ny+s/3*2 -(s/2.5)/2, sx, sy);
        
        line(x+s/4*2.5, ny+s/3*2 -(s/2)/2, sx, sy);
        
        noStroke();
        fill(255,0,100);
        ellipse(x+s/4, ny+s/3*2, s/2.5);
        ellipse(x+s/4*2.5, ny+s/3*2, s/2);
        
    }else if(type === 8){
        fill(200);
        triangle(x+s/4, y+s/4,   x+s/4+s/4, y+s/4,   x+s/4+s/4/2, y);
        triangle(x+s-s/4, y+s/4,   x+s/4+s/4, y+s/4,   x+s/4*2+s/4/2, y);
        
        triangle(x+s/4, y+s/4,   x+s/4, y+s/4*2,   x, y+s/4+s/4/2);
        triangle(x+s/4, y+s/4+s/4,   x+s/4, y+s/4*2+s/4,   x, y+s/4+s/4/2+s/4);
        
        triangle(x+s/4, y+s/4+s/4*2,   x+s/4+s/4, y+s/4+s/4*2,   x+s/4+s/4/2, y+s);
        triangle(x+s/4+s/4, y+s/4+s/4*2,   x+s/4+s/4+s/4, y+s/4+s/4*2,   x+s/4+s/4/2+s/4, y+s);
        
        triangle(x+s/4+s/2, y+s/4,   x+s/4+s/2, y+s/4*2,   x+s, y+s/4+s/4/2);
        triangle(x+s/4+s/2, y+s/4+s/4,   x+s/4+s/2, y+s/4*2+s/4,   x+s, y+s/4+s/4/2+s/4);
        
        fill(100);
        let ss = 4.5;
        rect(x+s/ss, y+s/ss, s/ss*(ss-2), s/ss*(ss-2), 7.5);
        
        if(maps[level][y/s][x/s+1] === 8 || maps[level][y/s][x/s+1] === 9){
            fill(200);
            triangle(x+s-s/4+s/4, y+s/4,   x+s/4+s/4+s/4, y+s/4,   x+s/4*2+s/4/2+s/4, y);
            
            fill(200);
            triangle(x+s-s/4+s/4, y+s/4+s/2,   x+s/4+s/4+s/4, y+s/4+s/2,   x+s/4*2+s/4/2+s/4, y+s);
            
            fill(100);
            rect(x+s/2, y+s/ss, s/2, s/ss*(ss-2));
        }
        if(maps[level][y/s][x/s-1] === 8 || maps[level][y/s][x/s-1] === 9){
            fill(200);
            triangle(x, y+s/4,   x+s/4, y+s/4,   x+s/4/2, y);
            
            fill(200);
            triangle(x, y+s/4+s/2,   x+s/4, y+s/4+s/2,   x+s/4/2, y+s);
            
            
            fill(100);
            rect(x, y+s/ss, s/2, s/ss*(ss-2));
        }
        
        if(y/s < maps[level].length -1){
            if(maps[level][y/s+1][x/s] === 8 || maps[level][y/s+1][x/s] === 9){
                fill(200);
                triangle(x+s/4, y+s/4+s/4*2,   x+s/4, y+s/4*2+s/4*2,   x, y+s/4+s/4/2+s/4*2);
                
                fill(200);
                triangle(x+s/4+s/2, y+s/4*3,   x+s/4+s/2, y+s/4+s/4*3,   x+s, y+s/4/2+s/4*3);
                
                fill(100);
                rect(x+s/ss, y+s/2,  s/ss*(ss-2), s/2);
            }
        }
        if(y/s > 0){
            if(maps[level][y/s-1][x/s] === 8 || maps[level][y/s-1][x/s] === 9){
                fill(200);
                triangle(x+s/4, y,   x+s/4, y+s/4,   x, y+s/4/2);
                
                fill(200);
                triangle(x+s/4+s/2, y,   x+s/4+s/2, y+s/4,   x+s, y+s/4/2);

                fill(100);
                rect(x+s/ss, y,  s/ss*(ss-2), s/2);
            }
        }
        
        
        if(x/s === headPos.x && y/s === headPos.y){
            die();
        } else if(x/s === bod.x1 && y/s === bod.y1){
            die();
        } else if(x/s === bod.x2 && y/s === bod.y2){
            die();
        } else if(bodLenghts[level] >= 3 && x/s === bod.x3 && y/s === bod.y3){
            die();
        } else if(bodLenghts[level] >= 4 && x/s === bod.x4 && y/s === bod.y4){
            die();
        } else if(bodLenghts[level] >= 5 && x/s === bod.x5 && y/s === bod.y5){
            die();
        } else if(bodLenghts[level] >= 6 && x/s === bod.x6 && y/s === bod.y6){
            die();
        } else if(bodLenghts[level] >= 7 && x/s === bod.x7 && y/s === bod.y7){
            die();
        } else if(bodLenghts[level] >= 8 && x/s === bod.x8 && y/s === bod.y8){
            die();
        } else if(bodLenghts[level] >= 9 && x/s === bod.x9 && y/s === bod.y9){
            die();
        } else if(bodLenghts[level] >= 10 && x/s === bod.x10 && y/s === bod.y10){
            die();
        }
        
    }else if(type === 9){
        fill(200);
        triangle(x+s/4, y+s/4,   x+s/4+s/4, y+s/4,   x+s/4+s/4/2, y);
        triangle(x+s-s/4, y+s/4,   x+s/4+s/4, y+s/4,   x+s/4*2+s/4/2, y);
        
        triangle(x+s/4, y+s/4,   x+s/4, y+s/4*2,   x, y+s/4+s/4/2);
        triangle(x+s/4, y+s/4+s/4,   x+s/4, y+s/4*2+s/4,   x, y+s/4+s/4/2+s/4);
        
        triangle(x+s/4, y+s/4+s/4*2,   x+s/4+s/4, y+s/4+s/4*2,   x+s/4+s/4/2, y+s);
        triangle(x+s/4+s/4, y+s/4+s/4*2,   x+s/4+s/4+s/4, y+s/4+s/4*2,   x+s/4+s/4/2+s/4, y+s);
        
        triangle(x+s/4+s/2, y+s/4,   x+s/4+s/2, y+s/4*2,   x+s, y+s/4+s/4/2);
        triangle(x+s/4+s/2, y+s/4+s/4,   x+s/4+s/2, y+s/4*2+s/4,   x+s, y+s/4+s/4/2+s/4);
        
        fill(100);
        let ss = 4.5;
        rect(x+s/ss, y+s/ss, s/ss*(ss-2), s/ss*(ss-2), 7.5);
        
        if(maps[level][y/s][x/s+1] === 8 || maps[level][y/s][x/s+1] === 9){
            fill(200);
            triangle(x+s-s/4+s/4, y+s/4,   x+s/4+s/4+s/4, y+s/4,   x+s/4*2+s/4/2+s/4, y);
            
            fill(200);
            triangle(x+s-s/4+s/4, y+s/4+s/2,   x+s/4+s/4+s/4, y+s/4+s/2,   x+s/4*2+s/4/2+s/4, y+s);
            
            fill(100);
            rect(x+s/2, y+s/ss, s/2, s/ss*(ss-2));
        }
        if(maps[level][y/s][x/s-1] === 8 || maps[level][y/s][x/s-1] === 9){
            fill(200);
            triangle(x, y+s/4,   x+s/4, y+s/4,   x+s/4/2, y);
            
            fill(200);
            triangle(x, y+s/4+s/2,   x+s/4, y+s/4+s/2,   x+s/4/2, y+s);
            
            
            fill(100);
            rect(x, y+s/ss, s/2, s/ss*(ss-2));
        }
        
        if(y/s < maps[level].length -1){
            if(maps[level][y/s+1][x/s] === 8 || maps[level][y/s+1][x/s] === 9){
                fill(200);
                triangle(x+s/4, y+s/4+s/4*2,   x+s/4, y+s/4*2+s/4*2,   x, y+s/4+s/4/2+s/4*2);
                
                fill(200);
                triangle(x+s/4+s/2, y+s/4*3,   x+s/4+s/2, y+s/4+s/4*3,   x+s, y+s/4/2+s/4*3);
                
                fill(100);
                rect(x+s/ss, y+s/2,  s/ss*(ss-2), s/2);
            }
        }
        if(y/s > 0){
            if(maps[level][y/s-1][x/s] === 8 || maps[level][y/s-1][x/s] === 9){
                fill(200);
                triangle(x+s/4, y,   x+s/4, y+s/4,   x, y+s/4/2);
                
                fill(200);
                triangle(x+s/4+s/2, y,   x+s/4+s/2, y+s/4,   x+s, y+s/4/2);

                fill(100);
                rect(x+s/ss, y,  s/ss*(ss-2), s/2);
            }
        }
        
        
        fill(150);
        ellipse(x+s/2, y+s/2 , s/3 , s/3);
        
        push();
        translate(x+s/2,y+s/2);
        let rot = map(sin(0.002*(frameCount+x*10*y)), -1, 1, 0, 360);
        angleMode(DEGREES);
        rotate(rot);
        
        fill(120);
        rect(-s/10/2, -s/3/2, s/10, s/3);
        angleMode(RADIANS);
        pop();
        
        if(x/s === headPos.x && y/s === headPos.y){
            die();
        } else if(x/s === bod.x1 && y/s === bod.y1){
            die();
        } else if(x/s === bod.x2 && y/s === bod.y2){
            die();
        } else if(bodLenghts[level] >= 3 && x/s === bod.x3 && y/s === bod.y3){
            die();
        } else if(bodLenghts[level] >= 4 && x/s === bod.x4 && y/s === bod.y4){
            die();
        } else if(bodLenghts[level] >= 5 && x/s === bod.x5 && y/s === bod.y5){
            die();
        } else if(bodLenghts[level] >= 6 && x/s === bod.x6 && y/s === bod.y6){
            die();
        } else if(bodLenghts[level] >= 7 && x/s === bod.x7 && y/s === bod.y7){
            die();
        } else if(bodLenghts[level] >= 8 && x/s === bod.x8 && y/s === bod.y8){
            die();
        } else if(bodLenghts[level] >= 9 && x/s === bod.x9 && y/s === bod.y9){
            die();
        } else if(bodLenghts[level] >= 10 && x/s === bod.x10 && y/s === bod.y10){
            die();
        }
        
    }else{
        fill(0);
        rect(x,y,s,s);
        fill(255,0,0);
        textAlign(CENTER);
        textSize(15);
        text("error",x+0.5*s,y+0.5*s);
    }
    
    if(grid){
        fill(200);
        let gwidth = 20;
        rect(x-(s/gwidth)/2,y,s/gwidth,s);
        rect(x,y-(s/gwidth)/2,s,s/gwidth);
        
        textSize(10);
        fill(100);
        text("x: " + x/s, x,y+s/5);
        text("y: " + y/s, x,y+s/5+s/5);
    }
    
}

function drawSnek(){
    dheadPos.x = lerp(dheadPos.x, headPos.x, lerpSpeed);
    dheadPos.y = lerp(dheadPos.y, headPos.y, lerpSpeed);
    
    dbod.x1 = lerp(dbod.x1, bod.x1, lerpSpeed);
    dbod.y1 = lerp(dbod.y1, bod.y1, lerpSpeed);
    
    dbod.x2 = lerp(dbod.x2, bod.x2, lerpSpeed);
    dbod.y2 = lerp(dbod.y2, bod.y2, lerpSpeed);
    
    if(bodLenghts[level] >= 3){
        dbod.x3 = lerp(dbod.x3, bod.x3, lerpSpeed);
        dbod.y3 = lerp(dbod.y3, bod.y3, lerpSpeed);  
    }
    
    if(bodLenghts[level] >= 4){
        dbod.x4 = lerp(dbod.x4, bod.x4, lerpSpeed);
        dbod.y4 = lerp(dbod.y4, bod.y4, lerpSpeed);  
    }
    
    if(bodLenghts[level] >= 5){
        dbod.x5 = lerp(dbod.x5, bod.x5, lerpSpeed);
        dbod.y5 = lerp(dbod.y5, bod.y5, lerpSpeed);  
    }
    
    if(bodLenghts[level] >= 6){
        dbod.x6 = lerp(dbod.x6, bod.x6, lerpSpeed);
        dbod.y6 = lerp(dbod.y6, bod.y6, lerpSpeed);  
    }
    
    
    if(bodLenghts[level] >= 7){
        dbod.x7 = lerp(dbod.x7, bod.x7, lerpSpeed);
        dbod.y7 = lerp(dbod.y7, bod.y7, lerpSpeed);  
    }
    
    if(bodLenghts[level] >= 8){
        dbod.x8 = lerp(dbod.x8, bod.x8, lerpSpeed);
        dbod.y8 = lerp(dbod.y8, bod.y8, lerpSpeed);  
    }
    
    if(bodLenghts[level] >= 9){
        dbod.x9 = lerp(dbod.x9, bod.x9, lerpSpeed);
        dbod.y9 = lerp(dbod.y9, bod.y9, lerpSpeed);  
    }
    
    if(bodLenghts[level] >= 10){
        dbod.x10 = lerp(dbod.x10, bod.x10, lerpSpeed);
        dbod.y10 = lerp(dbod.y10, bod.y10, lerpSpeed);  
    }
    
    push();
    translate(xLvlOff, yLvlOff);
    //bodys from big to small, helps with eating fruit
    noStroke();
    //bod 10
    if(bodLenghts[level] >= 10){
        fill(colors[10]);
        rect(dbod.x10*s, dbod.y10*s, s, s, roundness);

        if((bodLenghts[level] >= 11 && bod.x10-1 === bod.x11) || bod.x10-1 === bod.x9){
            rect(dbod.x10*s, dbod.y10*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 11 && bod.x10+1 === bod.x11) || bod.x10+1 === bod.x9){
            rect(dbod.x10*s+s/2, dbod.y10*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 11 && bod.y10+1 === bod.y11) || bod.y10+1 === bod.y9){
            rect(dbod.x10*s, dbod.y10*s+s/2, s, s/2, 0);
        }
        if((bodLenghts[level] >= 11 && bod.y10-1 === bod.y11) || bod.y10-1 === bod.y9){
            rect(dbod.x10*s, dbod.y10*s, s, s/2, 0);
        }
    }
    
    //bod 9
    if(bodLenghts[level] >= 9){
        fill(colors[9]);
        rect(dbod.x9*s, dbod.y9*s, s, s, roundness);

        if((bodLenghts[level] >= 10 && bod.x9-1 === bod.x10) || bod.x9-1 === bod.x8){
            rect(dbod.x9*s, dbod.y9*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 10 && bod.x9+1 === bod.x10) || bod.x9+1 === bod.x8){
            rect(dbod.x9*s+s/2, dbod.y9*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 10 && bod.y9+1 === bod.y10) || bod.y9+1 === bod.y8){
            rect(dbod.x9*s, dbod.y9*s+s/2, s, s/2, 0);
        }
        if((bodLenghts[level] >= 10 && bod.y9-1 === bod.y10) || bod.y9-1 === bod.y8){
            rect(dbod.x9*s, dbod.y9*s, s, s/2, 0);
        }
    }
    
    //bod 8
    if(bodLenghts[level] >= 8){
        fill(colors[8]);
        rect(dbod.x8*s, dbod.y8*s, s, s, roundness);

        if((bodLenghts[level] >= 9 && bod.x8-1 === bod.x9) || bod.x8-1 === bod.x7){
            rect(dbod.x8*s, dbod.y8*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 9 && bod.x8+1 === bod.x9) || bod.x8+1 === bod.x7){
            rect(dbod.x8*s+s/2, dbod.y8*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 9 && bod.y8+1 === bod.y9) || bod.y8+1 === bod.y7){
            rect(dbod.x8*s, dbod.y8*s+s/2, s, s/2, 0);
        }
        if((bodLenghts[level] >= 9 && bod.y8-1 === bod.y9) || bod.y8-1 === bod.y7){
            rect(dbod.x8*s, dbod.y8*s, s, s/2, 0);
        }
    }
    
    //bod 7
    if(bodLenghts[level] >= 7){
        fill(colors[7]);
        rect(dbod.x7*s, dbod.y7*s, s, s, roundness);

        if((bodLenghts[level] >= 8 && bod.x7-1 === bod.x8) || bod.x7-1 === bod.x6){
            rect(dbod.x7*s, dbod.y7*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 8 && bod.x7+1 === bod.x8) || bod.x7+1 === bod.x6){
            rect(dbod.x7*s+s/2, dbod.y7*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 8 && bod.y7+1 === bod.y8) || bod.y7+1 === bod.y6){
            rect(dbod.x7*s, dbod.y7*s+s/2, s, s/2, 0);
        }
        if((bodLenghts[level] >= 8 && bod.y7-1 === bod.y8) || bod.y7-1 === bod.y6){
            rect(dbod.x7*s, dbod.y7*s, s, s/2, 0);
        }
    }
    
    //bod 6
    if(bodLenghts[level] >= 6){
        fill(colors[6]);
        rect(dbod.x6*s, dbod.y6*s, s, s, roundness);

        if((bodLenghts[level] >= 7 && bod.x6-1 === bod.x7) || bod.x6-1 === bod.x5){
            rect(dbod.x6*s, dbod.y6*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 7 && bod.x6+1 === bod.x7) || bod.x6+1 === bod.x5){
            rect(dbod.x6*s+s/2, dbod.y6*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 7 && bod.y6+1 === bod.y7) || bod.y6+1 === bod.y5){
            rect(dbod.x6*s, dbod.y6*s+s/2, s, s/2, 0);
        }
        if((bodLenghts[level] >= 7 && bod.y6-1 === bod.y7) || bod.y6-1 === bod.y5){
            rect(dbod.x6*s, dbod.y6*s, s, s/2, 0);
        }
    }
    
    //bod 5
    if(bodLenghts[level] >= 5){
        fill(colors[5]);
        rect(dbod.x5*s, dbod.y5*s, s, s, roundness);

        if((bodLenghts[level] >= 6 && bod.x5-1 === bod.x6) || bod.x5-1 === bod.x4){
            rect(dbod.x5*s, dbod.y5*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 6 && bod.x5+1 === bod.x6) || bod.x5+1 === bod.x4){
            rect(dbod.x5*s+s/2, dbod.y5*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 6 && bod.y5+1 === bod.y6) || bod.y5+1 === bod.y4){
            rect(dbod.x5*s, dbod.y5*s+s/2, s, s/2, 0);
        }
        if((bodLenghts[level] >= 6 && bod.y5-1 === bod.y6) || bod.y5-1 === bod.y4){
            rect(dbod.x5*s, dbod.y5*s, s, s/2, 0);
        }
    }
    
    //bod 4
    if(bodLenghts[level] >= 4){
        fill(colors[4]);
        rect(dbod.x4*s, dbod.y4*s, s, s, roundness);

        if((bodLenghts[level] >= 5 && bod.x4-1 === bod.x5) || bod.x4-1 === bod.x3){
            rect(dbod.x4*s, dbod.y4*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 5 && bod.x4+1 === bod.x5) || bod.x4+1 === bod.x3){
            rect(dbod.x4*s+s/2, dbod.y4*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 5 && bod.y4+1 === bod.y5) || bod.y4+1 === bod.y3){
            rect(dbod.x4*s, dbod.y4*s+s/2, s, s/2, 0);
        }
        if((bodLenghts[level] >= 5 && bod.y4-1 === bod.y5) || bod.y4-1 === bod.y3){
            rect(dbod.x4*s, dbod.y4*s, s, s/2, 0);
        }
    }
    
    //bod 3
    if(bodLenghts[level] >= 3){
        fill(colors[3]);
        rect(dbod.x3*s, dbod.y3*s, s, s, roundness);

        if((bodLenghts[level] >= 4 && bod.x3-1 === bod.x4) || bod.x3-1 === bod.x2){
            rect(dbod.x3*s, dbod.y3*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 4 && bod.x3+1 === bod.x4) || bod.x3+1 === bod.x2){
            rect(dbod.x3*s+s/2, dbod.y3*s, s/2, s, 0);
        }
        if((bodLenghts[level] >= 4 && bod.y3+1 === bod.y4) || bod.y3+1 === bod.y2){
            rect(dbod.x3*s, dbod.y3*s+s/2, s, s/2, 0);
        }
        if((bodLenghts[level] >= 4 && bod.y3-1 === bod.y4) || bod.y3-1 === bod.y2){
            rect(dbod.x3*s, dbod.y3*s, s, s/2, 0);
        }
    }
    
    //bod 2
    fill(colors[2]);
    rect(dbod.x2*s, dbod.y2*s, s, s, roundness);
    
    if((bodLenghts[level] >= 3 && bod.x2-1 === bod.x3) || bod.x2-1 === bod.x1){
        rect(dbod.x2*s, dbod.y2*s, s/2, s, 0);
    }
    if((bodLenghts[level] >= 3 && bod.x2+1 === bod.x3) || bod.x2+1 === bod.x1){
        rect(dbod.x2*s+s/2, dbod.y2*s, s/2, s, 0);
    }
    if((bodLenghts[level] >= 3 && bod.y2+1 === bod.y3) || bod.y2+1 === bod.y1){
        rect(dbod.x2*s, dbod.y2*s+s/2, s, s/2, 0);
    }
    if((bodLenghts[level] >= 3 && bod.y2-1 === bod.y3) || bod.y2-1 === bod.y1){
        rect(dbod.x2*s, dbod.y2*s, s, s/2, 0);
    }
    //bod 1
    fill(colors[1]);
    rect(dbod.x1*s, dbod.y1*s, s, s, roundness);
    
    if(bod.x1-1 === bod.x2 || bod.x1-1 === headPos.x){
        rect(dbod.x1*s, dbod.y1*s, s/2, s, 0);
    }
    if(bod.x1+1 === bod.x2 || bod.x1+1 === headPos.x){
        rect(dbod.x1*s+s/2, dbod.y1*s, s/2, s, 0);
    }
    if(bod.y1+1 === bod.y2|| bod.y1+1 === headPos.y){
        rect(dbod.x1*s, dbod.y1*s+s/2, s, s/2, 0);
    }
    if(bod.y1-1 === bod.y2 || bod.y1-1 === headPos.y){
        rect(dbod.x1*s, dbod.y1*s, s, s/2, 0);
    }
    
    
    //head
    fill(colors[0]);
    rect(dheadPos.x*s, dheadPos.y*s, s, s, roundness);
    if(headPos.x-1 === bod.x1){
        rect(dheadPos.x*s, dheadPos.y*s, s/2, s, 0);
    }
    if(headPos.x+1 === bod.x1){
        rect(dheadPos.x*s+s/2, dheadPos.y*s, s/2, s, 0);
    }
    if(headPos.y+1 === bod.y1){
        rect(dheadPos.x*s, dheadPos.y*s+s/2, s, s/2, 0);
    }
    if(headPos.y-1 === bod.y1){
        rect(dheadPos.x*s, dheadPos.y*s, s, s/2, 0);
    }
    
    //eye
    
    let redd = map(rCD, 0, 90 , 0, 150);
    
    fill(255);
    ellipse(dheadPos.x*s+s/2,dheadPos.y*s+s/2,s/5*2);
    fill(0);
    ellipse(dheadPos.x*s+s/2,dheadPos.y*s+s/2,s/5);
    fill(255,0,0,redd);
    ellipse(dheadPos.x*s+s/2,dheadPos.y*s+s/2,s/5+s/50);
    //
    
    
    pop();
}

function drawBackDec(){
    
    for(let c = 0; c<clouds.length; c++){
        clouds[c].render();
    }
    
    push();
    
    translate(xLvlOff,yLvlOff);
    
    
    let dirtc = color(161,99,43);
    let bdirtc = color(94,57,47);
    let bluec = color(115, 210, 251);
    let grassc = color(98, 255, 23);
    
    if(level === 0){
        
        
        fill(94, 57, 47);
        
        rect(6*s,8*s+s/2,s,s/2);
        rect(11*s,3*s+s/2,s,s/2);
        rect(s*10-20,s*8,s*2+40,s*2)
        
        beginShape();
        curveVertex(250,450);
        curveVertex(300,450);
        curveVertex(325,475);
        curveVertex(350,500);
        curveVertex(350,550);
        curveVertex(375,500);
        curveVertex(375,425);
        curveVertex(300,450);
        endShape();
        
        beginShape();
        curveVertex(500,150);
        curveVertex(550,200);
        curveVertex(600,250);
        curveVertex(610,310);
        curveVertex(600,350);
        curveVertex(575,420);
        curveVertex(625,450);
        curveVertex(700,475);
        curveVertex(825,475);
        curveVertex(825,475);
        curveVertex(825,275);
        curveVertex(825,275);
        curveVertex(675,175);
        curveVertex(675,175);
        
        endShape();
        
        let fc = color(161,99,43);
        let bc = color(94,57,47);
        
        bgRound(14,5,s,2,bc,fc);
        bgRound(12,4,s,2,bc,fc);
        bgRound(15,6,s,2,bc,fc);
        bgRound(15,8,s,4,bc,fc);
        bgRound(13,8,s,3,bc,fc);
        bgRound(6,9,s,2,bc,fc);
        bgRound(11,9,s,2,bc,fc);
        
        fill(fc);
        rect(17*s,9*s,s,s);
        
        //vertical up
        fill(100);
        rect(s*11+s/7*3,s*9-10,s/7,s/2);
        //horizontal right
        fill(100);
        rect(s*11+s/2+10,s*9+s/7*3,s/2,s/7);
        //vertical down
        fill(100);
        rect(s*16+s/7*3,s*3+s/2+10,s/7,s/2);
        //horizontal left
        fill(100);
        rect(s*17,s*5+s/7*3,s/2,s/7);
    } else if(level === 1){
        bgRound(9,9,s,1,bluec,dirtc);
        bgRound(7,9,s,2,bluec,dirtc);
        fill(dirtc);
        rect(s*8,s*9.5,s,s*0.55);
    } else if(level === 2){
        
        fill(bdirtc)
        beginShape();
        vertex(200,175);
        vertex(200,475);
        vertex(-10,475);
        vertex(-10,125);
        vertex(125,150);
        vertex(150,175);
        endShape(CLOSE);
        
        fill(dirtc);
        rect(-s,-s,s,s*20);
        rect(0,2*s,s*0.5,s);
        rect(0,7*s,s*0.5,s);
        
        bgRound(0,3,s,1,bdirtc,dirtc);
        bgRound(0,6,s,3,bdirtc,dirtc);
        bgRound(1,8,s,3,bdirtc,dirtc);
        bgRound(2,8,s,4,bdirtc,dirtc);
        bgRound(3,7,s,4,bdirtc,dirtc);
        bgRound(1,3,s,2,bdirtc,dirtc);
        
        bgRound(15,10,s,1,bluec,dirtc);
        bgRound(3,3,s,4,dirtc,dirtc);
        bgRound(4,5,s,1,grassc,grassc);
    }
    
    pop();
    
}

function drawDecor(){
    for(let d = 0; d<decor.length; d++){
        decor[d].render();
    }
}

function bgRound(x,y,s,placenum,colB,colF){
    //1 2
    //3 4
    let co1 = colB;
    let co2 = colF;
    fill(co2);
    if(placenum === 1){
        rect(x*s,y*s,s/2,s/2);
    }else if(placenum === 2){
        rect(x*s+s/2,y*s,s/2,s/2);
    } else if(placenum === 3){
        rect(x*s,y*s+s/2,s/2,s/2);
    }else if(placenum === 4){
        rect(x*s+s/2,y*s+s/2,s/2,s/2);
    }
    
    fill(co1);
    if(placenum === 1){
        rect(x*s,y*s,s/2,s/2, roundness);
        rect(x*s+s/4,y*s,s/4,s/2);
        rect(x*s,y*s+s/4,s/2,s/4);
    }else if(placenum === 2){
        rect(x*s+s/2,y*s,s/2,s/2, roundness);
        rect(x*s+s/2,y*s,s/4,s/2);
        rect(x*s+s/2,y*s+s/4,s/2,s/4);
    } else if(placenum === 3){
        rect(x*s,y*s+s/2,s/2,s/2, roundness);
        rect(x*s+s/4,y*s+s/2,s/4,s/2);
        rect(x*s,y*s+s/2,s/2,s/4);
    }else if(placenum === 4){
        rect(x*s+s/2,y*s+s/2,s/2,s/2, roundness);
        rect(x*s+s/2,y*s+s/2,s/4,s/2);
        rect(x*s+s/2,y*s+s/2,s/2,s/4);
    }
     //   rect(x*s, y*s,s,s,roundness);
    
}

function move(dir){
    //head
    if(dir === "UP" && headPos.y > 0 && maps[level][headPos.y-1][headPos.x] !== 1 && maps[level][headPos.y-1][headPos.x] !== 2){
        if(!(headPos.y-1 === bod.y1 && headPos.x === bod.x1)  && !(headPos.y-1 === bod.y2 && headPos.x === bod.x2) && !(headPos.y-1 === bod.y3 && headPos.x === bod.x3) && !(headPos.y-1 === bod.y4 && headPos.x === bod.x4) && !(headPos.y-1 === bod.y5 && headPos.x === bod.x5) && !(headPos.y-1 === bod.y6 && headPos.x === bod.x6) && !(headPos.y-1 === bod.y6 && headPos.x === bod.x6) && !(headPos.y-1 === bod.y7 && headPos.x === bod.x7) && !(headPos.y-1 === bod.y8 && headPos.x === bod.x8) && !(headPos.y-1 === bod.y9 && headPos.x === bod.x9) && !(headPos.y-1 === bod.y10 && headPos.x === bod.x10) ){
            
        if(bodLenghts[level] >= 10){
            bod.x10 = bod.x9;
            bod.y10 = bod.y9;
        }
            
        if(bodLenghts[level] >= 9){
            bod.x9 = bod.x8;
            bod.y9 = bod.y8;
        }
            
        if(bodLenghts[level] >= 8){
            bod.x8 = bod.x7;
            bod.y8 = bod.y7;
        }
            
        if(bodLenghts[level] >= 7){
            bod.x7 = bod.x6;
            bod.y7 = bod.y6;
        }
            
        if(bodLenghts[level] >= 6){
            bod.x6 = bod.x5;
            bod.y6 = bod.y5;
        }
        
        if(bodLenghts[level] >= 5){
            bod.x5 = bod.x4;
            bod.y5 = bod.y4;
        }
            
        if(bodLenghts[level] >= 4){
            bod.x4 = bod.x3;
            bod.y4 = bod.y3;
        }
            
        if(bodLenghts[level] >= 3){
            bod.x3 = bod.x2;
            bod.y3 = bod.y2;
        }
        
        bod.x2 = bod.x1;
        bod.y2 = bod.y1;
        
        bod.x1 = headPos.x;
        bod.y1 = headPos.y;
        
        headPos.y--;
        }
    } 
    if(dir === "DOWN" && headPos.y < maps[level].length-1 && maps[level][headPos.y+1][headPos.x] !==1 && maps[level][headPos.y+1][headPos.x] !==2){
        if(!(headPos.y+1 === bod.y1 && headPos.x === bod.x1)  && !(headPos.y+1 === bod.y2 && headPos.x === bod.x2)  && !(bodLenghts[level] >= 3 && headPos.y+1 === bod.y3 && headPos.x === bod.x3)  && !(bodLenghts[level] >= 4 && headPos.y+1 === bod.y4 && headPos.x === bod.x4) && !(headPos.y+1 === bod.y5 && headPos.x === bod.x5) && !(headPos.y+1 === bod.y6 && headPos.x === bod.x6) && !(headPos.y+1 === bod.y7 && headPos.x === bod.x7) && !(headPos.y+1 === bod.y8 && headPos.x === bod.x8) && !(headPos.y+1 === bod.y9 && headPos.x === bod.x9) && !(headPos.y+1 === bod.y10 && headPos.x === bod.x10) ){
            
        if(bodLenghts[level] >= 10){
            bod.x10 = bod.x9;
            bod.y10 = bod.y9;
        }
            
        if(bodLenghts[level] >= 9){
            bod.x9 = bod.x8;
            bod.y9 = bod.y8;
        }
            
        if(bodLenghts[level] >= 8){
            bod.x8 = bod.x7;
            bod.y8 = bod.y7;
        }
            
        if(bodLenghts[level] >= 7){
            bod.x7 = bod.x6;
            bod.y7 = bod.y6;
        }
            
        if(bodLenghts[level] >= 6){
            bod.x6 = bod.x5;
            bod.y6 = bod.y5;
        }
        
        if(bodLenghts[level] >= 5){
            bod.x5 = bod.x4;
            bod.y5 = bod.y4;
        }
            
        if(bodLenghts[level] >= 4){
            bod.x4 = bod.x3;
            bod.y4 = bod.y3;
        }
            
        if(bodLenghts[level] >= 3){
            bod.x3 = bod.x2;
            bod.y3 = bod.y2;
        }
        
        bod.x2 = bod.x1;
        bod.y2 = bod.y1;
        
        bod.x1 = headPos.x;
        bod.y1 = headPos.y;
        
        headPos.y++;
        }
    } 
    if(dir === "RIGHT" && headPos.x < maps[level][headPos.y].length-1 && maps[level][headPos.y][headPos.x+1] !==1 && maps[level][headPos.y][headPos.x+1] !==2){
        if(!(headPos.y === bod.y1 && headPos.x+1 === bod.x1)  && !(headPos.y === bod.y2 && headPos.x+1 === bod.x2)  && !(headPos.y === bod.y3 && headPos.x+1 === bod.x3) && !(headPos.y === bod.y4 && headPos.x+1 === bod.x4) && !(headPos.y === bod.y5 && headPos.x+1 === bod.x5) && !(headPos.y === bod.y6 && headPos.x+1 === bod.x6) && !(headPos.y === bod.y7 && headPos.x+1 === bod.x7) && !(headPos.y === bod.y8 && headPos.x+1 === bod.x8) && !(headPos.y === bod.y9 && headPos.x+1 === bod.x9) && !(headPos.y === bod.y10 && headPos.x+1 === bod.x10) ){
            
        if(bodLenghts[level] >= 10){
            bod.x10 = bod.x9;
            bod.y10 = bod.y9;
        }
            
        if(bodLenghts[level] >= 9){
            bod.x9 = bod.x8;
            bod.y9 = bod.y8;
        }
            
        if(bodLenghts[level] >= 8){
            bod.x8 = bod.x7;
            bod.y8 = bod.y7;
        }
            
        if(bodLenghts[level] >= 7){
            bod.x7 = bod.x6;
            bod.y7 = bod.y6;
        }
            
        if(bodLenghts[level] >= 6){
            bod.x6 = bod.x5;
            bod.y6 = bod.y5;
        }
        
        if(bodLenghts[level] >= 5){
            bod.x5 = bod.x4;
            bod.y5 = bod.y4;
        }
            
        if(bodLenghts[level] >= 4){
            bod.x4 = bod.x3;
            bod.y4 = bod.y3;
        }
            
        if(bodLenghts[level] >= 3){
            bod.x3 = bod.x2;
            bod.y3 = bod.y2;
        }
        
        bod.x2 = bod.x1;
        bod.y2 = bod.y1;
        
        bod.x1 = headPos.x;
        bod.y1 = headPos.y;
        
        headPos.x++;
        }
    }
    if(dir === "LEFT" && headPos.x > 0 && maps[level][headPos.y][headPos.x-1] !==1 && maps[level][headPos.y][headPos.x-1] !==2){
        if(!(headPos.y === bod.y1 && headPos.x-1 === bod.x1)  && !(headPos.y === bod.y2 && headPos.x-1 === bod.x2) && !(headPos.y === bod.y3 && headPos.x-1 === bod.x3) && !(headPos.y === bod.y4 && headPos.x-1 === bod.x4) && !(headPos.y === bod.y5 && headPos.x-1 === bod.x5) && !(headPos.y === bod.y6 && headPos.x-1 === bod.x6) && !(headPos.y === bod.y7 && headPos.x-1 === bod.x7) && !(headPos.y === bod.y8 && headPos.x-1 === bod.x8) && !(headPos.y === bod.y9 && headPos.x-1 === bod.x9) && !(headPos.y === bod.y10 && headPos.x-1 === bod.x10) ){
            
        if(bodLenghts[level] >= 10){
            bod.x10 = bod.x9;
            bod.y10 = bod.y9;
        }
            
        if(bodLenghts[level] >= 9){
            bod.x9 = bod.x8;
            bod.y9 = bod.y8;
        }
            
        if(bodLenghts[level] >= 8){
            bod.x8 = bod.x7;
            bod.y8 = bod.y7;
        }
            
        if(bodLenghts[level] >= 7){
            bod.x7 = bod.x6;
            bod.y7 = bod.y6;
        }
            
        if(bodLenghts[level] >= 6){
            bod.x6 = bod.x5;
            bod.y6 = bod.y5;
        }
        
        if(bodLenghts[level] >= 5){
            bod.x5 = bod.x4;
            bod.y5 = bod.y4;
        }
            
        if(bodLenghts[level] >= 4){
            bod.x4 = bod.x3;
            bod.y4 = bod.y3;
        }
            
        if(bodLenghts[level] >= 3){
            bod.x3 = bod.x2;
            bod.y3 = bod.y2;
        }
        
        bod.x2 = bod.x1;
        bod.y2 = bod.y1;
        
        bod.x1 = headPos.x;
        bod.y1 = headPos.y;
        
        headPos.x--;
        }
    }
    
    grounded = false;
    
    
//    NEEDS MORE CHECKING
//    !!!!!!!!!!!!!!!!!!!
//    !!!!!!!!!!!!!!!!!!!
//    !!!!!!!!!!!!!!!!!!!
//    !!!!!!!!!!!!!!!!!!!
//    !!!!!!!!!!!!!!!!!!!
    // oh no it doesnt since only head moves downwards -- i think
    if(headPos.y !== maps[level].length - 1){

        fallCheck();
    }
}

function fallCheck(){
    if(dying === 0 && !goingToNext){
            grounded = false;
        if(maps[level][headPos.y+1][headPos.x] === 1 || maps[level][headPos.y+1][headPos.x] === 2 || (maps[level][headPos.y+1][headPos.x] >=5 && maps[level][headPos.y+1][headPos.x] <=7)){
            grounded = true;
        } else if(maps[level][bod.y1+1][bod.x1] === 1 || maps[level][bod.y1+1][bod.x1] === 2 || (maps[level][bod.y1+1][bod.x1] >=5 && maps[level][bod.y1+1][bod.x1] <=7)){
            grounded = true;
        } else if(maps[level][bod.y2+1][bod.x2] === 1 || maps[level][bod.y2+1][bod.x2] === 2 || (maps[level][bod.y2+1][bod.x2] >=5 && maps[level][bod.y2+1][bod.x2] <=7)){
            grounded = true;
        } else if(bodLenghts[level] >= 3 && (maps[level][bod.y3+1][bod.x3] === 1 || maps[level][bod.y3+1][bod.x3] === 2)  || (maps[level][bod.y3+1][bod.x3] >=5 && maps[level][bod.y3+1][bod.x3] <=7)){
            grounded = true;
        } else if(bodLenghts[level] >= 4 && (maps[level][bod.y4+1][bod.x4] === 1 || maps[level][bod.y4+1][bod.x4] === 2)  || (maps[level][bod.y4+1][bod.x4] >=5 && maps[level][bod.y4+1][bod.x4] <=7)){
            grounded = true;
        } else if(bodLenghts[level] >= 5 && (maps[level][bod.y5+1][bod.x5] === 1 || maps[level][bod.y5+1][bod.x5] === 2) || (maps[level][bod.y5+1][bod.x5] >=5 && maps[level][bod.y5+1][bod.x5] <=7)){
            grounded = true;
        } else if(bodLenghts[level] >= 6 && (maps[level][bod.y6+1][bod.x6] === 1 || maps[level][bod.y6+1][bod.x6] === 2) || (maps[level][bod.y6+1][bod.x6] >=5 && maps[level][bod.y6+1][bod.x6] <=7)){
            grounded = true;
        } else if(bodLenghts[level] >= 7 && (maps[level][bod.y7+1][bod.x7] === 1 || maps[level][bod.y7+1][bod.x7] === 2) || (maps[level][bod.y7+1][bod.x7] >=5 && maps[level][bod.y7+1][bod.x7] <=7)){
            grounded = true;
        } else if(bodLenghts[level] >= 8 && (maps[level][bod.y8+1][bod.x8] === 1 || maps[level][bod.y8+1][bod.x8] === 2) || (maps[level][bod.y8+1][bod.x8] >=5 && maps[level][bod.y8+1][bod.x8] <=7)){
            grounded = true;
        } else if(bodLenghts[level] >= 9 && (maps[level][bod.y9+1][bod.x9] === 1 || maps[level][bod.y9+1][bod.x9] === 2) || (maps[level][bod.y9+1][bod.x9] >=5 && maps[level][bod.y9+1][bod.x9] <=7)){
            grounded = true;
        } else if(bodLenghts[level] >= 10 && (maps[level][bod.y10+1][bod.x10] === 1 || maps[level][bod.y10+1][bod.x10] === 2) || (maps[level][bod.y10+1][bod.x10] >=5 && maps[level][bod.y10+1][bod.x10] <=7)){
            grounded = true;
        }
    }
}

function fall(){
    if(dying === 0 && !goingToNext){
        
        fallCheck();

        if(grounded === false){
            eat(headPos.x,headPos.y+1);

            keyCD = 3;
            headPos.y++;
            bod.y1++;
            bod.y2++;
            if(bodLenghts[level] >= 3){
                bod.y3++;
            }
            if(bodLenghts[level] >= 4){
                bod.y4++;
            }
            if(bodLenghts[level] >= 5){
                bod.y5++;
            }
            if(bodLenghts[level] >= 6){
                bod.y6++;
            }
            if(bodLenghts[level] >= 7){
                bod.y7++;
            }
            if(bodLenghts[level] >= 8){
                bod.y8++;
            }
            if(bodLenghts[level] >= 9){
                bod.y9++;
            }
            if(bodLenghts[level] >= 10){
                bod.y10++;
            }
        }
    }
}

function reset(){
    
    if(keys[82]){
        rCD++;
    } else{
        rCD = 0;
    }
    // 90 = 1.5 sec
    if(rCD > 90){
        if(rCD <= 91){
            TR++;
        }
        werk++;
        rCD = 0;
        SLM = 0;
    }
    if(werk > 0){
        werk++;
        die();
    }
    if(werk > 21){
        werk = 0;
    }
    
    //texthelp
    {
    //since last movement < 240 -- not pressed key for 4 seconds
    SLM++;
    if( (SLM > 240 && keyType !== "none" && TR<3) || (SLM > 900 && keyType !== "none") ){
        push();
        angleMode(RADIANS);
        textFont(VCR);
        textSize(40);
        let alph = map(sin(0.07*frameCount), -1, 1, 50, 255);
        fill(250, alph);
        text("Hold R to restart",75,95);
        pop();
    }
    noStroke();
    }
}

function resetL(){
    
    dying = 0;
    grounded = true;
    if(level === 0){
            //locs
            if (1 > 0 ){
            headPos.x = 9;
            headPos.y = 7;
            
            bod.x1 = 8;
            bod.y1 = 7;
            bod.x2 = 7;
            bod.y2 = 7;
            bod.x3 = 110;
            bod.y3 = 8;
            bod.x4 = 110;
            bod.y4 = 8;
            bod.x5 = 110;
            bod.y5 = 8;
            bod.x6 = 110;
            bod.y6 = 8;
            bod.x7 = 110;
            bod.y7 = 8;
            bod.x8 = 110;
            bod.y8 = 8;
            bod.x9 = 110;
            bod.y9 = 8;
            bod.x10 = 110;
            bod.y10 = 8;
                
                dheadPos.x = 9;
                dheadPos.y = 7;
            
            dbod.x1 = 8;
            dbod.y1 = 7;
            dbod.x2 = 7;
            dbod.y2 = 7;
            dbod.x3 = 110;
            dbod.y3 = 7;
            dbod.x4 = 110;
            dbod.y4 = 8;
            dbod.x5 = 110;
            dbod.y5 = 8;
            dbod.x6 = 110;
            dbod.y6 = 8;
            dbod.x7 = 110;
            dbod.y7 = 8;
            dbod.x8 = 110;
            dbod.y8 = 8;
            dbod.x9 = 110;
            dbod.y9 = 8;
            dbod.x10 = 110;
            dbod.y10 = 8;
                
            }

    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            if(maps[level][i][j] === 4){
                maps[level][i][j] = floor(random(5, 8));
            }
        }
    }
            
            bodLenghts[0] = 2;
            xLvlOff = 75;
            yLvlOff = 150;
            s = 50;
        if(decor.length === 0){
            decor.push(new Bush(14,2,s));
            decor.push(new Bush(11,7,s));
        }
        
        }else if(level === 1){
            
            
            //locs
            if (1 > 0 ){
            headPos.x = 10-1;
            headPos.y = 7;
            
            bod.x1 = 9-1;
            bod.y1 = 7;
            bod.x2 = 8-1;
            bod.y2 = 7;
            bod.x3 = 8-1;
            bod.y3 = 6;
            bod.x4 = 110;
            bod.y4 = 8;
            bod.x5 = 110;
            bod.y5 = 8;
            bod.x6 = 110;
            bod.y6 = 8;
            bod.x7 = 110;
            bod.y7 = 8;
            bod.x8 = 110;
            bod.y8 = 8;
            bod.x9 = 110;
            bod.y9 = 8;
            bod.x10 = 110;
            bod.y10 = 8;
                
                dheadPos.x = 10-1;
                dheadPos.y = 7;
            
            dbod.x1 = 9-1;
            dbod.y1 = 7;
            dbod.x2 = 8-1;
            dbod.y2 = 7;
            dbod.x3 = 8-1;
            dbod.y3 = 6;
            dbod.x4 = 110;
            dbod.y4 = 8;
            dbod.x5 = 110;
            dbod.y5 = 8;
            dbod.x6 = 110;
            dbod.y6 = 8;
            dbod.x7 = 110;
            dbod.y7 = 8;
            dbod.x8 = 110;
            dbod.y8 = 8;
            dbod.x9 = 110;
            dbod.y9 = 8;
            dbod.x10 = 110;
            dbod.y10 = 8;
                
            }

    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            if(maps[level][i][j] === 4){
                maps[level][i][j] = floor(random(5, 8));
            }
        }
    }
            
            bodLenghts[level] = 3;
            xLvlOff = 75;
            yLvlOff = 150;
            s = 50;
        if(decor.length === 0){
            decor.push(new Bush(17-1,4,s));
        }
        
        
            
            
            
        } else if(level === 2){
            //locs
            if (1 > 0 ){
            headPos.x = 12;
            headPos.y = 9;
            
            bod.x1 = 12;
            bod.y1 = 8;
            bod.x2 = 13;
            bod.y2 = 8;
            bod.x3 = 13;
            bod.y3 = 7;
            bod.x4 = 110;
            bod.y4 = 8;
            bod.x5 = 110;
            bod.y5 = 8;
            bod.x6 = 110;
            bod.y6 = 8;
            bod.x7 = 110;
            bod.y7 = 8;
            bod.x8 = 110;
            bod.y8 = 8;
            bod.x9 = 110;
            bod.y9 = 8;
            bod.x10 = 110;
            bod.y10 = 8;
                
                dheadPos.x = 12;
                dheadPos.y = 9;
            
            dbod.x1 = 12;
            dbod.y1 = 8;
            dbod.x2 = 13;
            dbod.y2 = 8;
            dbod.x3 = 13;
            dbod.y3 = 7;
            dbod.x4 = 110;
            dbod.y4 = 8;
            dbod.x5 = 110;
            dbod.y5 = 8;
            dbod.x6 = 110;
            dbod.y6 = 8;
            dbod.x7 = 110;
            dbod.y7 = 8;
            dbod.x8 = 110;
            dbod.y8 = 8;
            dbod.x9 = 110;
            dbod.y9 = 8;
            dbod.x10 = 110;
            dbod.y10 = 8;
                
            }

    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            if(maps[level][i][j] === 4){
                maps[level][i][j] = floor(random(5, 8));
            }
        }
    }
            
            bodLenghts[level] = 3;
            xLvlOff = 25;
            yLvlOff = 0;
            s = 50;
        }else if(level === 3){
            //locs
            if (1 > 0 ){
            headPos.x = 5;
            headPos.y = 6;
            
            bod.x1 = 5;
            bod.y1 = 7;
            bod.x2 = 4;
            bod.y2 = 7;
            bod.x3 = 4;
            bod.y3 = 6;
            bod.x4 = 110;
            bod.y4 = 8;
            bod.x5 = 110;
            bod.y5 = 8;
            bod.x6 = 110;
            bod.y6 = 8;
            bod.x7 = 110;
            bod.y7 = 8;
            bod.x8 = 110;
            bod.y8 = 8;
            bod.x9 = 110;
            bod.y9 = 8;
            bod.x10 = 110;
            bod.y10 = 8;
                
                dheadPos.x = 12;
                dheadPos.y = 9;
            
            dbod.x1 = 12;
            dbod.y1 = 8;
            dbod.x2 = 13;
            dbod.y2 = 8;
            dbod.x3 = 13;
            dbod.y3 = 7;
            dbod.x4 = 110;
            dbod.y4 = 8;
            dbod.x5 = 110;
            dbod.y5 = 8;
            dbod.x6 = 110;
            dbod.y6 = 8;
            dbod.x7 = 110;
            dbod.y7 = 8;
            dbod.x8 = 110;
            dbod.y8 = 8;
            dbod.x9 = 110;
            dbod.y9 = 8;
            dbod.x10 = 110;
            dbod.y10 = 8;
                
            }

    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            if(maps[level][i][j] === 4){
                maps[level][i][j] = floor(random(5, 8));
            }
        }
    }
            
            bodLenghts[level] = 3;
            xLvlOff = 75;
            yLvlOff = 150;
            s = 50;
        } else if(level === 4){
            //locs
            if (1 > 0 ){
            headPos.x = 13;
            headPos.y = 7;
            
            bod.x1 = 12;
            bod.y1 = 7;
            bod.x2 = 11;
            bod.y2 = 7;
            bod.x3 = 10;
            bod.y3 = 7;
            bod.x4 = 110;
            bod.y4 = 8;
            bod.x5 = 110;
            bod.y5 = 8;
            bod.x6 = 110;
            bod.y6 = 8;
            bod.x7 = 110;
            bod.y7 = 8;
            bod.x8 = 110;
            bod.y8 = 8;
            bod.x9 = 110;
            bod.y9 = 8;
            bod.x10 = 110;
            bod.y10 = 8;
                
                dheadPos.x = 14;
                dheadPos.y = 1;
            
            dbod.x1 = 13;
            dbod.y1 = 8;
            dbod.x2 = 12;
            dbod.y2 = 8;
            dbod.x3 = 110;
            dbod.y3 = 8;
            dbod.x4 = 110;
            dbod.y4 = 8;
            dbod.x5 = 110;
            dbod.y5 = 8;
            dbod.x6 = 110;
            dbod.y6 = 8;
            dbod.x7 = 110;
            dbod.y7 = 8;
            dbod.x8 = 110;
            dbod.y8 = 8;
            dbod.x9 = 110;
            dbod.y9 = 8;
            dbod.x10 = 110;
            dbod.y10 = 8;
                
            }

    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            if(maps[level][i][j] === 4){
                maps[level][i][j] = floor(random(5, 8));
            }
        }
    }
            
            bodLenghts[level] = 3;
            xLvlOff = 75;
            yLvlOff = 150;
            s = 50;
        } else if(level === 5){
            //locs
            if (1 > 0 ){
            headPos.x = 4;
            headPos.y = 4;
            
            bod.x1 = 4;
            bod.y1 = 5;
            bod.x2 = 4;
            bod.y2 = 6;
            bod.x3 = 4;
            bod.y3 = 7;
            bod.x4 = 4;
            bod.y4 = 8;
            bod.x5 = 110;
            bod.y5 = 8;
            bod.x6 = 110;
            bod.y6 = 8;
            bod.x7 = 110;
            bod.y7 = 8;
            bod.x8 = 110;
            bod.y8 = 8;
            bod.x9 = 110;
            bod.y9 = 8;
            bod.x10 = 110;
            bod.y10 = 8;
                
                dheadPos.x = 4;
                dheadPos.y = 4;
            
            dbod.x1 = 4;
            dbod.y1 = 5;
            dbod.x2 = 4;
            dbod.y2 = 6;
            dbod.x3 = 4;
            dbod.y3 = 7;
            dbod.x4 = 4;
            dbod.y4 = 8;
            dbod.x5 = 110;
            dbod.y5 = 8;
            dbod.x6 = 110;
            dbod.y6 = 8;
            dbod.x7 = 110;
            dbod.y7 = 8;
            dbod.x8 = 110;
            dbod.y8 = 8;
            dbod.x9 = 110;
            dbod.y9 = 8;
            dbod.x10 = 110;
            dbod.y10 = 8;
                
            }

    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            if(maps[level][i][j] === 4){
                maps[level][i][j] = floor(random(5, 8));
            }
        }
    }
            
            bodLenghts[level] = 4;
            xLvlOff = 75;
            yLvlOff = 150;
            s = 50;
        } else if(level === 6){
            //locs
            if (1 > 0 ){
            headPos.x = 4;
            headPos.y = 4;
            
            bod.x1 = 4;
            bod.y1 = 5;
            bod.x2 = 4;
            bod.y2 = 6;
            bod.x3 = 4;
            bod.y3 = 7;
            bod.x4 = 4;
            bod.y4 = 8;
            bod.x5 = 110;
            bod.y5 = 8;
            bod.x6 = 110;
            bod.y6 = 8;
            bod.x7 = 110;
            bod.y7 = 8;
            bod.x8 = 110;
            bod.y8 = 8;
            bod.x9 = 110;
            bod.y9 = 8;
            bod.x10 = 110;
            bod.y10 = 8;
                
                dheadPos.x = 4;
                dheadPos.y = 4;
            
            dbod.x1 = 4;
            dbod.y1 = 5;
            dbod.x2 = 4;
            dbod.y2 = 6;
            dbod.x3 = 4;
            dbod.y3 = 7;
            dbod.x4 = 4;
            dbod.y4 = 8;
            dbod.x5 = 110;
            dbod.y5 = 8;
            dbod.x6 = 110;
            dbod.y6 = 8;
            dbod.x7 = 110;
            dbod.y7 = 8;
            dbod.x8 = 110;
            dbod.y8 = 8;
            dbod.x9 = 110;
            dbod.y9 = 8;
            dbod.x10 = 110;
            dbod.y10 = 8;
                
            }

    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            if(maps[level][i][j] === 4){
                maps[level][i][j] = floor(random(5, 8));
            }
        }
    }
            
            bodLenghts[level] = 2;
            xLvlOff = 75;
            yLvlOff = 150;
            s = 50;
        } else if(level === 7){
            //locs
            if (1 > 0 ){
            headPos.x = 4;
            headPos.y = 5+4;
            
            bod.x1 = 4;
            bod.y1 = 6+4;
            bod.x2 = 4;
            bod.y2 = 7+4;
            bod.x3 = 110;
            bod.y3 = 8;
            bod.x4 = 110;
            bod.y4 = 8;
            bod.x5 = 110;
            bod.y5 = 8;
            bod.x6 = 110;
            bod.y6 = 8;
            bod.x7 = 110;
            bod.y7 = 8;
            bod.x8 = 110;
            bod.y8 = 8;
            bod.x9 = 110;
            bod.y9 = 8;
            bod.x10 = 110;
            bod.y10 = 8;
                
                dheadPos.x = 3;
                dheadPos.y = 5;
            
            dbod.x1 = 4;
            dbod.y1 = 5;
            dbod.x2 = 4;
            dbod.y2 = 6;
            dbod.x3 = 4;
            dbod.y3 = 7;
            dbod.x4 = 4;
            dbod.y4 = 8;
            dbod.x5 = 110;
            dbod.y5 = 8;
            dbod.x6 = 110;
            dbod.y6 = 8;
            dbod.x7 = 110;
            dbod.y7 = 8;
            dbod.x8 = 110;
            dbod.y8 = 8;
            dbod.x9 = 110;
            dbod.y9 = 8;
            dbod.x10 = 110;
            dbod.y10 = 8;
                
            }

    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            if(maps[level][i][j] === 4){
                maps[level][i][j] = floor(random(5, 8));
            }
        }
    }
            
            bodLenghts[level] = 2;
            xLvlOff = 75;
            yLvlOff = 100-200;
            s = 50;
        }else if(level === 8){
            //locs
            if (1 > 0 ){
            headPos.x = 6;
            headPos.y = 5;
            
            bod.x1 = 7;
            bod.y1 = 5;
            bod.x2 = 7;
            bod.y2 = 6;
            bod.x3 = 7;
            bod.y3 = 7;
            bod.x4 = 4;
            bod.y4 = 8;
            bod.x5 = 110;
            bod.y5 = 8;
            bod.x6 = 110;
            bod.y6 = 8;
            bod.x7 = 110;
            bod.y7 = 8;
            bod.x8 = 110;
            bod.y8 = 8;
            bod.x9 = 110;
            bod.y9 = 8;
            bod.x10 = 110;
            bod.y10 = 8;
                
                dheadPos.x = 6;
                dheadPos.y = 5;
            
            dbod.x1 = 7;
            dbod.y1 = 5;
            dbod.x2 = 7;
            dbod.y2 = 6;
            dbod.x3 = 4;
            dbod.y3 = 7;
            dbod.x4 = 4;
            dbod.y4 = 8;
            dbod.x5 = 110;
            dbod.y5 = 8;
            dbod.x6 = 110;
            dbod.y6 = 8;
            dbod.x7 = 110;
            dbod.y7 = 8;
            dbod.x8 = 110;
            dbod.y8 = 8;
            dbod.x9 = 110;
            dbod.y9 = 8;
            dbod.x10 = 110;
            dbod.y10 = 8;
                
            }

    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            if(maps[level][i][j] === 4){
                maps[level][i][j] = floor(random(5, 8));
            }
        }
    }
            
            bodLenghts[level] = 2;
            xLvlOff = 75;
            yLvlOff = 150;
            s = 50;
        }else if(level === 9){
            //locs
            if (1 > 0 ){
            headPos.x = 6;
            headPos.y = 5;
            
            bod.x1 = 7;
            bod.y1 = 5;
            bod.x2 = 7;
            bod.y2 = 6;
            bod.x3 = 110;
            bod.y3 = 8;
            bod.x4 = 110;
            bod.y4 = 8;
            bod.x5 = 110;
            bod.y5 = 8;
            bod.x6 = 110;
            bod.y6 = 8;
            bod.x7 = 110;
            bod.y7 = 8;
            bod.x8 = 110;
            bod.y8 = 8;
            bod.x9 = 110;
            bod.y9 = 8;
            bod.x10 = 110;
            bod.y10 = 8;
                
                dheadPos.x = 6;
                dheadPos.y = 5;
            
            dbod.x1 = 7;
            dbod.y1 = 5;
            dbod.x2 = 7;
            dbod.y2 = 6;
            dbod.x3 = 4;
            dbod.y3 = 7;
            dbod.x4 = 4;
            dbod.y4 = 8;
            dbod.x5 = 110;
            dbod.y5 = 8;
            dbod.x6 = 110;
            dbod.y6 = 8;
            dbod.x7 = 110;
            dbod.y7 = 8;
            dbod.x8 = 110;
            dbod.y8 = 8;
            dbod.x9 = 110;
            dbod.y9 = 8;
            dbod.x10 = 110;
            dbod.y10 = 8;
                
            }

    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            if(maps[level][i][j] === 4){
                maps[level][i][j] = floor(random(5, 8));
            }
        }
    }
            
            bodLenghts[level] = 2;
            xLvlOff = 75;
            yLvlOff = 150;
            s = 50;
        }if(level === 10){
            //locs
            if (1 > 0 ){
            headPos.x = 17;
            headPos.y = 8;
           
            bod.x1 = 16;
            bod.y1 = 8;
            bod.x2 = 15;
            bod.y2 = 8;
            bod.x3 = 110;
            bod.y3 = 8;
            bod.x4 = 110;
            bod.y4 = 8;
            bod.x5 = 110;
            bod.y5 = 8;
            bod.x6 = 110;
            bod.y6 = 8;
            bod.x7 = 110;
            bod.y7 = 8;
            bod.x8 = 110;
            bod.y8 = 8;
            bod.x9 = 110;
            bod.y9 = 8;
            bod.x10 = 110;
            bod.y10 = 8;
               
                dheadPos.x = 9;
                dheadPos.y = 7;
           
            dbod.x1 = 8;
            dbod.y1 = 7;
            dbod.x2 = 7;
            dbod.y2 = 7;
            dbod.x3 = 110;
            dbod.y3 = 7;
            dbod.x4 = 110;
            dbod.y4 = 8;
            dbod.x5 = 110;
            dbod.y5 = 8;
            dbod.x6 = 110;
            dbod.y6 = 8;
            dbod.x7 = 110;
            dbod.y7 = 8;
            dbod.x8 = 110;
            dbod.y8 = 8;
            dbod.x9 = 110;
            dbod.y9 = 8;
            dbod.x10 = 110;
            dbod.y10 = 8;

                

            }

    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            if(maps[level][i][j] === 4){
                maps[level][i][j] = floor(random(5, 8));
            }
        }
    }

           
            bodLenghts[level] = 2;
            xLvlOff = 75;
            yLvlOff = 150;
            s = 50;
        if(decor.length ===0){
            //decor.push(new Bush(16,2,s));
            decor.push(new Bush(5,3,s));

        }
       

        }else if(level === 11){
            //locs
            if (1 > 0 ){
            headPos.x = 12;
            headPos.y = 5;
            
            bod.x1 = 11;
            bod.y1 = 5;
            bod.x2 = 11;
            bod.y2 = 6;
            bod.x3 = 11;
            bod.y3 = 7;
            bod.x4 = 11;
            bod.y4 = 8;
            bod.x5 = 12;
            bod.y5 = 8;
            bod.x6 = 110;
            bod.y6 = 8;
            bod.x7 = 110;
            bod.y7 = 8;
            bod.x8 = 110;
            bod.y8 = 8;
            bod.x9 = 110;
            bod.y9 = 8;
            bod.x10 = 110;
            bod.y10 = 8;
                
                dheadPos.x = 14;
                dheadPos.y = 1;
            
            dbod.x1 = 13;
            dbod.y1 = 8;
            dbod.x2 = 12;
            dbod.y2 = 8;
            dbod.x3 = 110;
            dbod.y3 = 8;
            dbod.x4 = 110;
            dbod.y4 = 8;
            dbod.x5 = 110;
            dbod.y5 = 8;
            dbod.x6 = 110;
            dbod.y6 = 8;
            dbod.x7 = 110;
            dbod.y7 = 8;
            dbod.x8 = 110;
            dbod.y8 = 8;
            dbod.x9 = 110;
            dbod.y9 = 8;
            dbod.x10 = 110;
            dbod.y10 = 8;
                
            }

    for(let i = 0; i < maps[level].length; i++){
        for(let j = 0; j < maps[level][i].length; j++){
            if(maps[level][i][j] === 4){
                maps[level][i][j] = floor(random(5, 8));
            }
        }
    }
            
            bodLenghts[level] = 5;
            xLvlOff = 75;
            yLvlOff = 150;
            s = 50;
        }
    
    roundness = 0.24*s;
    
}

function eat(x,y){
    if((y >= 0) && (y < maps[level].length) && maps[level][y][x] >= 5 && maps[level][y][x] <= 7){
            bodLenghts[level]++;
            if(bodLenghts[level] === 3){
                bod.x3 = bod.x2;
                bod.y3 = bod.y2;
                dbod.x3 = dbod.x2;
                dbod.y3 = dbod.y2;
            }else if(bodLenghts[level] === 4){
                bod.x4 = bod.x3;
                bod.y4 = bod.y3;
                dbod.x4 = dbod.x3;
                dbod.y4 = dbod.y3;
            }else if(bodLenghts[level] === 5){
                bod.x5 = bod.x4;
                bod.y5 = bod.y4;
                dbod.x5 = dbod.x4;
                dbod.y5 = dbod.y4;
            }else if(bodLenghts[level] === 6){
                bod.x6 = bod.x5;
                bod.y6 = bod.y5;
                dbod.x6 = dbod.x5;
                dbod.y6 = dbod.y5;
            }else if(bodLenghts[level] === 7){
                bod.x7 = bod.x6;
                bod.y7 = bod.y6;
                dbod.x7 = dbod.x6;
                dbod.y7 = dbod.y6;
            }else if(bodLenghts[level] === 8){
                bod.x8 = bod.x7;
                bod.y8 = bod.y7;
                dbod.x8 = dbod.x7;
                dbod.y8 = dbod.y7;
            }else if(bodLenghts[level] === 9){
                bod.x9 = bod.x8;
                bod.y9 = bod.y8;
                dbod.x9 = dbod.x8;
                dbod.y9 = dbod.y8;
            }else if(bodLenghts[level] === 10){
                bod.x10 = bod.x9;
                bod.y10 = bod.y9;
                dbod.x10 = dbod.x9;
                dbod.y10 = dbod.y9;
            }
            
            keyCD = 3;
            fallCheck();
    }
}

function keyPressed(){
keys[keyCode] = true;
}
    
function keyReleased(){
    
    if(scene === "game"){
        if(frameCount > 5){
            noCursor();
        }

        if(keyCD < 1 && dying === 0){
            keyCD = 1;
            if(((keys[87] && keyType === "wasd") || (keys[38] && keyType === "arrows"))){
                eat(headPos.x,headPos.y-1);
                //newPos("UP");
                move("UP");
                SLM = 0;
            } else if(((keys[65] && keyType === "wasd") || (keys[37] && keyType === "arrows"))){
                eat(headPos.x-1,headPos.y);
                //newPos("LEFT");
                move("LEFT");
                SLM = 0;
            } else if(((keys[83] && keyType === "wasd") || (keys[40] && keyType === "arrows"))){
                eat(headPos.x,headPos.y+1);
                //newPos("DOWN");
                move("DOWN");
                SLM = 0;
            } else if(((keys[68] && keyType === "wasd") || (keys[39] && keyType === "arrows"))){
                eat(headPos.x+1,headPos.y);
                //newPos("RIGHT");
                move("RIGHT");
                SLM = 0;
            }
        }
    }
    
    keys[keyCode] = false;
    
}

function mouseMoved(){
    
    if(scene === "game"){
        if(frameCount > 5){
        cursor(ARROW);
        }
    }
}

function mouseReleased(){
    if(scene === "game"){
        if(boolool){
            boolool = false;
        } else {
            boolool = true;
        }
    }
}

function die(){
    dying++;
    
    if(dying === 1){
        biggerthan0 = 0;
        
        let vanaf = 0;
        for(let i = 0; i < ppp; i++){
            dPs[i] = new DeathPart(xLvlOff + headPos.x*s, xLvlOff + headPos.x*s+s, yLvlOff + headPos.y*s,  yLvlOff + headPos.y*s+s, s/5, s/9*10, colors[0]);
        }
        vanaf = dPs.length;
        for(let i = 0; i < ppp; i++){
            dPs[i+vanaf] = new DeathPart(xLvlOff + bod.x1*s, xLvlOff + bod.x1*s+s, yLvlOff + bod.y1*s,  yLvlOff + bod.y1*s+s, s/5, s/9*10, colors[1]);
        }
        vanaf = dPs.length;
        for(let i = 0; i < ppp; i++){
            dPs[i+vanaf] = new DeathPart(xLvlOff + bod.x2*s, xLvlOff + bod.x2*s+s, yLvlOff + bod.y2*s,  yLvlOff + bod.y2*s+s, s/5, s/9*10, colors[2]);
        }
        vanaf = dPs.length;
        if(bodLenghts[level] >= 3){
            for(let i = 0; i < ppp; i++){
                dPs[i+vanaf] = new DeathPart(xLvlOff + bod.x3*s, xLvlOff + bod.x3*s+s, yLvlOff + bod.y3*s,  yLvlOff + bod.y3*s+s, s/5, s/9*10, colors[3]);
            }
        }
        vanaf = dPs.length;
        if(bodLenghts[level] >= 4){
            for(let i = 0; i < ppp; i++){
                dPs[i+vanaf] = new DeathPart(xLvlOff + bod.x4*s, xLvlOff + bod.x4*s+s, yLvlOff + bod.y4*s,  yLvlOff + bod.y4*s+s, s/5, s/9*10, colors[4]);
            }
        }
        vanaf = dPs.length;
        if(bodLenghts[level] >= 5){
            for(let i = 0; i < ppp; i++){
                dPs[i+vanaf] = new DeathPart(xLvlOff + bod.x5*s, xLvlOff + bod.x5*s+s, yLvlOff + bod.y5*s,  yLvlOff + bod.y5*s+s, s/5, s/9*10, colors[5]);
            }
        }
        vanaf = dPs.length;
        if(bodLenghts[level] >= 6){
            for(let i = 0; i < ppp; i++){
                dPs[i+vanaf] = new DeathPart(xLvlOff + bod.x6*s, xLvlOff + bod.x6*s+s, yLvlOff + bod.y6*s,  yLvlOff + bod.y6*s+s, s/5, s/9*10, colors[6]);
            }
        }
        vanaf = dPs.length;
        if(bodLenghts[level] >= 7){
            for(let i = 0; i < ppp; i++){
                dPs[i+vanaf] = new DeathPart(xLvlOff + bod.x7*s, xLvlOff + bod.x7*s+s, yLvlOff + bod.y7*s,  yLvlOff + bod.y7*s+s, s/5, s/9*10, colors[7]);
            }
        }
        vanaf = dPs.length;
        if(bodLenghts[level] >= 8){
            for(let i = 0; i < ppp; i++){
                dPs[i+vanaf] = new DeathPart(xLvlOff + bod.x8*s, xLvlOff + bod.x8*s+s, yLvlOff + bod.y8*s,  yLvlOff + bod.y8*s+s, s/5, s/9*10, colors[8]);
            }
        }
        vanaf = dPs.length;
        if(bodLenghts[level] >= 9){
            for(let i = 0; i < ppp; i++){
                dPs[i+vanaf] = new DeathPart(xLvlOff + bod.x9*s, xLvlOff + bod.x9*s+s, yLvlOff + bod.y9*s,  yLvlOff + bod.y9*s+s, s/5, s/9*10, colors[9]);
            }
        }
        vanaf = dPs.length;
        if(bodLenghts[level] >= 10){
            for(let i = 0; i < ppp; i++){
                dPs[i+vanaf] = new DeathPart(xLvlOff + bod.x10*s, xLvlOff + bod.x10*s+s, yLvlOff + bod.y10*s,  yLvlOff + bod.y10*s+s, s/5, s/9*10, colors[10]);
            }
        }
        
        shuffle(dPs, true);
        
    }
    if(dying > 20){
        snekcmo = floor(random(1,4));
        snekCol(snekcmo);
        resetL();
        dying = 0;
        deaths++;
    }
}

function drawDPs(){
        let stillshow = 0;
        for(let i = 0; i < dPs.length; i++){
            biggerthan0 = 0;
            dPs[i].update();
            dPs[i].show();
            if(biggerthan0 === 0){
                stillshow++;
            }
        }
        
        if(stillshow === 0){
            dPs = [];
        }
    
}

function checkFallDeath(){
    let c = 0;
    let lvlhite = maps[level].length-1;

    // only needs === but > for carefullness;
    if(headPos.y >= lvlhite){
        c++;
    } else if (bod.y1 >= lvlhite){
        c++;
    } else if (bod.y2 >= lvlhite){
        c++;
    } else if (bod.y3 >= lvlhite){
        c++;
    } else if (bod.y4 >= lvlhite){
        c++;
    } else if (bod.y5 >= lvlhite){
        c++;
    } else if (bod.y6 >= lvlhite){
        c++;
    } else if (bod.y7 >= lvlhite){
        c++;
    } else if (bod.y8 >= lvlhite){
        c++;
    } else if (bod.y9 >= lvlhite){
        c++;
    } else if (bod.y10 >= lvlhite){
        c++;
    }

    if(c > 0){
        die();
    }
    
}

function fade(r,g,b, current,min, max){
    let alph = map(current, min , max , 0 , 255);
    let clr = color(r,g,b,alph);
    fill(clr);
    rect(-width,-height, width*3, height*3);
}

function nextLevel(){
    keyCD = 10;
    
    let l = bodLenghts[level];
    let cdd = 7;
    
    if(totTime === false){
        //+cdd-1 as to no start moving at onced
        totTime = l*cdd+cdd;
    }
    
    if(totTime % cdd === 0){
        if(bodLenghts[level] >= 10){
            bod.x10 = bod.x9;
            bod.y10 = bod.y9;
        }
            
        if(bodLenghts[level] >= 9){
            bod.x9 = bod.x8;
            bod.y9 = bod.y8;
        }
            
        if(bodLenghts[level] >= 8){
            bod.x8 = bod.x7;
            bod.y8 = bod.y7;
        }
            
        if(bodLenghts[level] >= 7){
            bod.x7 = bod.x6;
            bod.y7 = bod.y6;
        }
            
        if(bodLenghts[level] >= 6){
            bod.x6 = bod.x5;
            bod.y6 = bod.y5;
        }
        
        if(bodLenghts[level] >= 5){
            bod.x5 = bod.x4;
            bod.y5 = bod.y4;
        }
            
        if(bodLenghts[level] >= 4){
            bod.x4 = bod.x3;
            bod.y4 = bod.y3;
        }
            
        if(bodLenghts[level] >= 3){
            bod.x3 = bod.x2;
            bod.y3 = bod.y2;
        }
        
        bod.x2 = bod.x1;
        bod.y2 = bod.y1;
        
        bod.x1 = headPos.x;
        bod.y1 = headPos.y;
        
        headPos.x = 10000;
        headPos.y = 8;
    }
    
    totTime--;
    
    let endd = -60;
    
    if(totTime < endd){
        totTime = false;
        scene = "newlevel";
        curF = frameCount;
        cursor(ARROW);
        goingToNext = false;
        clouds= [];
        for(let i = 0; i < cloudnum; i++){
            let x0 = round(random(-width,width*2));
            let y0 = round(random(0,s*3));
            let ded = 0;
            if(round(random(0,1)) === 0){
                ded = random(-5,-2)*0.1;
            } else{
                ded = random(5,2)*0.1;
            }
            let r = random(s,s*2);
            clouds[i] = new Cloud(x0,y0,r,ded);
        }
    }
    fade(250,250,250,totTime, 0, endd);
}


class DeathPart {
    constructor(minx, maxx, miny, maxy, mins, maxs, col){
        this.x = round(random(minx, maxx));
        this.y = round(random(miny, maxy));
        this.s = round(random(mins, maxs));
        this.col = col;
        this.xv = 0;
        this.yv = 0;
    }
    
    update(){
        this.xv += random(-0.2, 0.2);
        this.yv += random(-0.2, 0.2);
        this.x += this.xv;
        this.y += this.yv;
        this.s *= random(0.98, 0.99);
        this.s -= 0.15;
        if(this.s < 0){
            this.s = 0;
            biggerthan0++;
        }
    }
    
    show(){
        let c = this.col || color(0);
        fill(c);
        ellipse(this.x,this.y,this.s,this.s);
    }
    
}

class Bush {
    constructor(x,y,s){
        this.x = x*s+xLvlOff;
        this.y = y*s+yLvlOff;
        this.s = s;
        this.c = color(98+50, 255, 23+50);
        this.r = random(0,360);
        this.rr = random(-s/10,s/10);
        this.bx = [];
        this.by = [];
        this.bs = [];
        this.ring = floor(random(2,5+1));
        for(let i = 0; i< this.ring; i++){
            let nunu = 7.5;
            this.bx[i] = round(random(s/nunu,s-s/nunu-s/nunu));
            this.by[i] = round(random(s/nunu,s-s/nunu));
            this.bs[i] = round(random(s/15,s/10));
        }
        this.rand = random(0,360);
    }
    
    render(){
        push();
        angleMode(DEGREES);
        fill(this.c);
        let s = this.s;
        translate(this.rr,0);
        
        translate(sin(0.4*frameCount+this.rand)*3,0);
        
        ellipse(this.x+s/2,this.y+s/2,s/2);
        rect(this.x+s/2-s/2/2,this.y+s/2,s/2,s/2+1);
        
        ellipse(this.x+s/4.2,this.y+s/3,s/3);
        ellipse(this.x+s/2.5,this.y+s/4.6,s/3.3,s/3.6);
        ellipse(this.x+s/3.4,this.y+s/1.8,s/2.7);
        ellipse(this.x+s/2.4,this.y+s/1.3,s/2.3);
        ellipse(this.x+s/3,this.y+s/1.5+s/20,s/3);
        ellipse(this.x+s/4,this.y+s/1.2+s/20,s/2.7,s/3.6);
        
        ellipse(this.x+s/1.5,this.y+s/3-s/20,s/3.5);
        ellipse(this.x+s/1.5,this.y+s/2,s/3);
        ellipse(this.x+s/1.4,this.y+s/1.5,s/3.5,s/3);
        ellipse(this.x+s/1.45+s/30,this.y+s/1.2+s/20,s/3.2,s/4);
        
        fill(230,50,50);
        for(let i = 0; i< this.ring; i++){
            ellipse(this.x+this.bx[i],this.y+this.by[i],this.bs[i]);
        }
        
        pop();
    }
}

class Cloud{
    constructor(x,y,s,speed){
        this.x = x;
        this.y = y;
        this.s = s;
        this.speed = speed;
    }
    render(){
        this.x+= this.speed;
        
        if(this.x<-width){
            this.x = width*2-10;
        } else if(this.x>width*2){
            this.x = -width+10;
        }
        
        push();
        let z = this.s;
        let k = this.x;
        let i = this.y;
        fill(255);
        stroke(0);
        strokeWeight(1);
        noStroke();
        rect(k,i,z,z/3);
        ellipse(k-z/12,i+z/8,z/3);
        ellipse(k-z/3,i+z/6,z/3);
        triangle(k+1,i,k+1,i+z/3, k-z/3,i+z/3);
        
        ellipse(k+z/8,i,z/4);
        ellipse(k+z/3,i-z/20,z/3);
        ellipse(k+z/3+z/3.5,i-z/12.5,z/3.5);
        ellipse(k+z-z/5,i-z/12,z/4.5);
        ellipse(k+z/1,i-z/25,z/4);
        
        triangle(k+z,i, k+z, i+z/3, k+z+z/3,i+z/3);
        ellipse(k+z+z/7, i+z/12, z/3.5);
        ellipse(k+z+z/3, i+z/4.8, z/4);
        
        
        pop();
    }
}

//:)
