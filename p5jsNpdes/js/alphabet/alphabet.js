p5.disableFriendlyErrors = true;
"use strict";

// アルファベットの上に点を配置しますね
// マスゲームにしたいんだけどね。イージングかけたいんだよね。それで完成だねえ。

let data = [];
let poses = [];

let properFrameCount = 0;

const alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

const prefix = "https://inaridarkfox4231.github.io/jsons/";

function preload(){
  for(let i = 0; i < 26; i++){
    const card = alphabets[i];
    const filename = prefix + card + "_posdata.json";
    data.push(loadJSON(filename));
  }
}

function setup(){
  createCanvas(400, 400);
  colorMode(HSB, 100);
  //noLoop();
  noStroke();
  // 先にposesに正方形のパターンを放り込んでおく（デフォルト）
  preparation();
  for(let i = 0; i < 26; i++){
    let posArray = [];
    for(let index = 0; index < 400; index++){
      const properIndex = floor(index * data[i].size / 400);
      const pos = data[i].text_posdata[properIndex];
      const x = pos.x * 4 + random(4);
      const y = pos.y * 4 + random(4);
      posArray.push({x, y});
    }
    poses.push(shuffle(posArray));
  }
  poses.push(poses[0]); // poses[27] = poses[0]とすることでこの後の記述を簡略化する。
}

function draw(){
  background(30);
  const posArray = calcCurrentPosArray(3);
  let hue = floor(((properFrameCount % 3240) / 3240) * 100);
  fill(hue, 100, 100);
  for(const pos of posArray){
    circle(pos.x, pos.y, 4);
  }
  fill(hue, 100, 100, 30);
  for(const pos of posArray){
    circle(pos.x, pos.y, 8);
  }
  properFrameCount++;
}

// posArray[0]とposArray[1]とposArray[2]と・・補間。その前に、正方形状に並べておきたいので。そこから？？

function preparation(){
  let posArray = [];
  for(let i = 0; i < 20; i++){
    for(let k = 0; k < 20; k++){
      const x = 105 + i * 10;
      const y = 105 + k * 10;
      posArray.push({x, y});
    }
  }
  poses.push(posArray);
}

// で、今から0～26とつなげるんですが・・どうするんだ、これ。
// 1秒表示、1秒で移動、1秒表示、を切り替えながらって感じね。

function calcCurrentPosArray(easingType = 0){
  // fcを120で割ってfloor取って27で割って余りを取ってkindを得る。
  // さらにfcを120で割った余りが60未満の場合はposes[kind]をそのまま使う。
  // 60以上の場合、poses[kind]とposes[kind + 1]で補間した値を使う。
  const kind = floor(properFrameCount / 120) % 27;
  const r = properFrameCount % 120;
  if(r < 60){
    return poses[kind];
  }else{
    const easingFunction = window["e" + easingType];
    let prg = (r % 60) / 60;
    prg = easingFunction(prg);
    let result = [];
    for(let index = 0; index < 400; index++){
      const x = map(prg, 0, 1, poses[kind][index].x, poses[kind + 1][index].x);
      const y = map(prg, 0, 1, poses[kind][index].y, poses[kind + 1][index].y);
      result.push({x, y});
    }
    return result;
  }
  return [];
}


// ここに好きな関数を入れれば好きなイージングの実験ができます、お試しあれ。
function e0(x){ return x; }
function e1(x){ return (50 / 23) * (-2 * pow(x, 3) + 3 * pow(x, 2) - 0.54 * x); } // バックインアウト
function e2(x){ return x + 0.1 * sin(8 * PI * x); } // ぐらぐら
function e3(x){ return -12 * pow(x, 3) + 18 * pow(x, 2) - 5 * x; } // 大きいバックインアウト
function e4(x){ return (x / 8) + (7 / 8) * pow(x, 4); } // ゆっくりぎゅーーーん
function e5(x){ return (7 / 8) + (x / 8) - (7 / 8) * pow(1 - x, 4); } // ぎゅーーんゆっくり
function e6(x){ return 0.5 * (1 - cos(PI * x)); } // ゆっくりぎゅーんゆっくり
function e7(x){ return log(x + 1) / log(2);  } // 対数的
function e8(x){ return pow(x, 6); } // 鋭く！
function e9(x){ return x * (3 * x - 2); } // おおきくバックからぎゅーん
function e10(x){ return 1 - Math.sqrt(1 - (x * x)); } // ゆっくりからの・・・・・・ぎゅんっっ
/*
p5.disableFriendlyErrors = true;
"use strict";

let data_A;
let poses_A = [];

let data = [];
let poses = [];

const prefix = "https://inaridarkfox4231.github.io/jsons/";

function preload(){
  data_A = loadJSON(prefix + "Z_posdata.json");
  data.push(loadJSON(prefix + "A_posdata.json"));
}

function setup(){
  createCanvas(400, 400);
  noLoop();
  noStroke();
  for(let index = 0; index < 400; index++){
    const properIndex = floor(index * data_A.size / 400);
    poses_A.push(data_A.text_posdata[properIndex]);
  }
  let posArray = [];
  for(let index = 0; index < 400; index++){
    const pIndex = floor(index * data[0].size / 400);
    posArray.push(data[0].text_posdata[pIndex]);
  }
  poses.push(posArray);
}

function draw(){
  background(220);
  fill(0, 0, 255);
  for(const pos of poses_A){
    const x = pos.x * 4 + random(4);
    const y = pos.y * 4 + random(4);
    circle(x, y, 4);
  }
}
*/
