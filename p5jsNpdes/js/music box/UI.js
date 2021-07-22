//last letter is not included - there are only 15 notes at the moment
const abc = [0, 'a-', 'b-', 'c-', 'd-', 'e-', 'f-', 'g-', 'h-', 'i-', 'j-', 'k-', 'l-', 'm-', 'n-', 'o-', 'p-'];

const abc_1 = ['a-', 'b-', 'c-', 'd-', 'e-', 'f-', 'g-', 'h-', 'i-', 'j-', 'k-', 'l-', 'm-', 'n-', 'o-', 'p-'];

const noteJSON = {};
let NN = abc.length - 2;
let NN1 = abc_1.length - 1;



function createInput(name, size, val = "", display = 'none') {



  let UIpanel = document.getElementById("notebook");

  let el = document.createElement("input");
  el.setAttribute("size", size);
  el.id = name;
  el.style = `display:${display};font-size:20px`;
  el.disabled = true;
  UIpanel.appendChild(el);

  el.value = val;


}

function createP(val = "", id, c = 1) {

  let UIpanel = document.getElementById("matrix" + c);
  let p = document.createElement("p");
  p.id = id;



  p.innerHTML = val;
  UIpanel.appendChild(p);

}

function createPIndex(val = "", id, c = 1) {

  let UIpanel = document.getElementById("matrix" + c);
  let p = document.createElement("p");
  p.id = id;

  p.style = "font-weight:900;font-size:30px;margin-top:-63px;margin-left:45%;color:white;z-index:-1;";
  p.className = "matrixIndexNum";
  p.innerHTML = val;
  UIpanel.appendChild(p);

}



function createContainer(name, val = "") {



  let UIpanel = document.getElementById("UI");

  let el = document.createElement("div");
  el.className = "container";
  el.id = name;

  UIpanel.appendChild(el);


}
function createButton(name, val = "", c) {



  let UIpanel = document.getElementById("matrix" + c);

  let el = document.createElement("button");
  el.style = "border:none;filter:grayscale(100%);opacity:0.5;"
  el.className = "noteKey";
  el.id = name;
  el.setAttribute("onclick", `addNote(${val},this.id)`);

  el.innerHTML = `🔷`

  UIpanel.appendChild(el);

  el.value = val;

}
function createWSAD(name, id, val1, val2, val3) {



  let UIpanel = document.getElementById("matrix" + val3);

  let el = document.createElement("button");

  el.className = "wsadButton";
  el.id = id;
  el.setAttribute("onclick", `shiftNotes(${val1},${val2},${val3})`);

  el.innerHTML = name;

  UIpanel.appendChild(el);



}
// function createUp(name, id, matrix, next_matrix) {




//   let UIpanel = document.getElementById("matrix" + matrix);

//   let el = document.createElement("button");

//   el.className = "upDwnButton";
//   el.id = id;

//   el.setAttribute("onclick", `doubleMatrixUP(${matrix},${next_matrix})`);
//   el.innerHTML = name;

//   UIpanel.appendChild(el);



// }

function createSwap(name, id, matrix, next_matrix) {

  let UIpanel = document.getElementById("matrix" + matrix);
  let el = document.createElement("button");
  el.className = "swapButton";
  el.id = id;
  el.setAttribute("onclick", `swapMatrix(${matrix},${next_matrix})`);
  el.innerHTML = name;
  UIpanel.appendChild(el);

}

// function createDwn(name, id, matrix, next_matrix) {



//   let UIpanel = document.getElementById("matrix" + matrix);

//   let el = document.createElement("button");
//   el.className = "upDwnButton";
//   el.id = id;
//   el.setAttribute("onclick", `doubleMatrixDwn(${matrix},${next_matrix})`);


//   el.innerHTML = name;

//   UIpanel.appendChild(el);



// }

function swapMatrix(matrix, next_matrix) {

  let tempA = [];
  let tempB = [];

  let len = NN * NN;
  for (let j = 1; j <= len; j += 1) {
    for (let i = 1; i <= len; i += 1) {

      let A = document.getElementById(matrix + abc[i] + j);
      let B = document.getElementById(next_matrix + abc[i] + j);

      if (A && A.style.opacity === '1') {
        A.style = 'border:none;filter:grayscale(100%);opacity:0.5';
        tempA.push({ id: next_matrix + abc[i] + j, innHtml: A.innerHTML });
        A.innerHTML = "🔷";


      } if (B && B.style.opacity === '1') {
        B.style = 'border:none;filter:grayscale(100%);opacity:0.5';
        tempB.push({ id: matrix + abc[i] + j, innHtml: B.innerHTML });
        B.innerHTML = "🔷";
      }

    }


  }


  setTimeout(() => {
    for (let t = 0; t <= len; t += 1) {

      if (tempA[t] && tempA[t].id && document.getElementById(tempA[t].id)) {
        document.getElementById(tempA[t].id).style = 'border:none;filter:grayscale(0%);opacity:1';
        document.getElementById(tempA[t].id).innerHTML = tempA[t].innHtml;
      }
      if (tempB[t] && tempB[t].id && document.getElementById(tempB[t].id)) {
        document.getElementById(tempB[t].id).style = 'border:none;filter:grayscale(0%);opacity:1';
        document.getElementById(tempB[t].id).innerHTML = tempB[t].innHtml;
      }

    }
  }, 50);
}

function doubleMatrixUP() {
  for(let x = 0; x<=boxInit;x+=1){
     for (let j = 0; j <= NN; j += 1) {
      for (let i = 0; i <= NN; i += 1) {
        
        let keyNote =  document.getElementById(x + abc_1[i] + j);
        let keyNoteX =  document.getElementById(x + abc_1[i+1] + j);
        if(keyNote && keyNoteX && keyNoteX.style.opacity==="1"){
          keyNote.style = 'border:none;filter:grayscale(0%);opacity:1';
          keyNote.innerHTML = keyNoteX.innerHTML;
          keyNoteX.style = 'border:none;filter:grayscale(100%);opacity:0.5';
          keyNoteX.innerHTML = "🔷";
          }
        }
     }
  }
}

function doubleMatrixDwn() {
  for(let x = 0; x<=boxInit;x+=1){
     for (let j = 0; j <= NN; j += 1) {
      for (let i = 0; i <= NN; i += 1) {
        
        let keyNote =  document.getElementById(x + abc_1[i] + j);
        let keyNoteX =  document.getElementById(x + abc_1[i+1] + j);
        if(keyNote && keyNoteX && keyNoteX.style.opacity==="1"){
          keyNote.style = 'border:none;filter:grayscale(0%);opacity:1';
          keyNote.innerHTML = keyNoteX.innerHTML;
          keyNoteX.style = 'border:none;filter:grayscale(100%);opacity:0.5';
          keyNoteX.innerHTML = "🔷";
          }
        }
     }
  }

}

// createP('', 'separ',1);
let boxInit = 1;
function createMusicBox() {

  let x = boxInit;
  createContainer('matrix' + x);
  for (let j = 1; j <= NN; j += 1) {
    noteJSON[j] = [];
    for (let i = 1; i <= NN; i += 1) {
      createButton(x + abc[j] + i, i, x)
    }
    createP('', 'p' + x + j, x)
  }

  createP('', 'pA' + x, x);
  createSwap('⇅', 'swap' + x + "_" + (x + 1), x, (x + 1));
  createWSAD('◀', 'arA' + x, 2, 0, x);
  createWSAD('▲', 'arW' + x, 0, 2, x);
  createWSAD('▶', 'arD' + x, 2, 1, x);
  createWSAD('▼', 'arS' + x, 1, 2, x);



  createP('', 'pUD', x);
  // createDwn('▼', 'Dwn' + x + "_" + (x + 1), x, (x + 1));
  // createP(x, 'pI' + x, x);
  createPIndex(x, 'pI' + x, x);
  boxInit += 1;
}

function deleteMusicBox() {

  let UIpanel = document.getElementById("UI");
  boxInit -= 1;
  boxInit = Math.max(boxInit, 1)
  let x = boxInit;
  let child;
  let kids = [];
  child = document.getElementById("matrix" + x);
  UIpanel.removeChild(child);


}



createMusicBox();

function showOtherPlayOpt() {
  if (document.getElementById("preload").style.display === "none") {
    document.getElementById("preload").style.display = "inline-block";
    document.getElementById("previewMusic").style.display = "inline-block";
    document.getElementById("play").style.display = "inline-block";
    document.getElementById("stop").style.display = "inline-block";
    document.getElementById("showOtherOpt").style.display = "inline-block";
    document.getElementById("exitRadio").style.display = "none";
    radioON = false;
  } else {
    document.getElementById("preload").style.display = "none";
    document.getElementById("previewMusic").style.display = "none";
    document.getElementById("previewMusicPlay").style.display = "none";
    document.getElementById("previewMusicStop").style.display = "none";
    document.getElementById("exitRadio").style.display = "none";
  }
}




function UI_Sound(val = 0){
  const sounds = [document.getElementById("switchSound1"),
                  document.getElementById("switchSound2"),
                  document.getElementById("switchSound3"),
                  document.getElementById("switchSound4"),
                  document.getElementById("switchSound5"),
                   document.getElementById("windUp")
                  ]; 
  const volumeVal = document.getElementById("volumeSlider").value;
  sounds[val].currentTime = 0;
  sounds[val].volume = (volumeVal / 100);
  sounds[val].play();

}


function scrollToEl(val) {
  let views = ['lottie', 'scrollToBottom',"scrollToTop",
  
document.getElementById("pI"+(boxInit-2)) ?  "pI"+(boxInit-2) : "scrollToBottom",
  
   document.getElementById("pI"+(boxInit-2)) ?  "pI"+(boxInit-2) : "scrollToBottom" ];

  let el = document.getElementById(views[val]);
  el.scrollIntoView();


}
function scrollToElXY(val) {

  let views = ['lottie', 'scrollToBottom', "stop", "holdDoc"];

  let el = document.getElementById(views[val]);
  let rect = el.getBoundingClientRect();

  window.scrollTo(0, rect.top - 400);

}
