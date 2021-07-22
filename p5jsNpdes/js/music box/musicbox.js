


let notes = [];
let audio = [];
let modeBol = false;
const saveBkp = [];

const sounds = [];
for (let howl = 1; howl <= 15; howl += 1) {
  sounds[howl - 1] = new Howl({
    src: [`notes/${howl}.mp3`]
  });

}


let tempNote = '🔷';

let holdBol = ['🔷', '⭐', `🔶1.0`, '🎲', '🔔'];
let holdIndex = 0;
function holdNote() {

  holdIndex += 1;
  if (holdIndex > 3) {
    holdIndex = 0
  }
  //locking the box being clicked
  if (holdIndex === 3) {
    document.getElementById("lottie").disabled = false;
  } else if (holdIndex === 0) {
    document.getElementById("lottie").disabled = true;
  }
  tempNote = holdBol[holdIndex];
  document.getElementById("holdDoc").innerHTML = holdBol[holdIndex];
}


function addNote(n, id) {

  let noteBool = document.getElementById(id).style.opacity;
  if (noteBool === '0.5') {
    document.getElementById(id).style = "border:none;filter:grayscale(0%);opacity:1";
    let volumeVal = document.getElementById("volumeSlider").value;
    let previewNote = id.split('-')[1] - 1;
    let howlerSpeed = parseFloat((document.getElementById("howlerSpeedSlider").value / 100).toFixed(1));
    document.getElementById(id).innerHTML = tempNote;
    if (tempNote === '⭐') {
      let pitchNote = document.getElementById(id.split('-')[1].split('.')[0]);
      if (pitchNote) {
        pitchNote.mozPreservesPitch = false;
        pitchNote.playbackRate = 0.4;
        pitchNote.currentTime = 0;
        pitchNote.volume = (volumeVal / 100);
        const playPromise = pitchNote.play();
        if (playPromise !== null) {
          playPromise.catch(() => { if (pitchNote) { pitchNote.play() } })
        }

      }

    } else if (tempNote === '🔷') {
      Howler.volume(volumeVal / 100);
      sounds[previewNote].rate(1);
      sounds[previewNote].play();

    } else if (tempNote != '🔷' && tempNote != '⭐' && !isNaN(tempNote.split("🔶")[1])) {
      document.getElementById(id).innerHTML = `🔶${howlerSpeed.toFixed(1)}`;
      Howler.volume(volumeVal / 100);
      sounds[previewNote].rate(howlerSpeed);
      sounds[previewNote].play();
    }
  } else if (noteBool === '1') {
    document.getElementById(id).style = "border:none;filter:grayscale(100%);opacity:0.5";
    document.getElementById(id).innerHTML = "🔷";
  }

}

function incNoteCap() {
  resetNotes();
  deleteAll();
  NN = abc.length - 2;
  NN1 = abc_1.length - 1;
  for (let i = 1; i <= NN; i += 1) {
    document.getElementById(`${(i)}`).src = "notes/" + i + ".mp3";
  }

  resetNotes();
  deleteAll();
  createMusicBox();

}

let mode = ['all the blocks', 'one block at a time'];

function previewMode() {
  let num;
  modeBol = !modeBol;
  if (modeBol) {
    num = 0;
  } else if (!modeBol) {
    num = 1;

  }
  document.getElementById("previewMode").innerHTML = mode[num];

}

function generateMusic() {

  notes = [];
  const saveInp = document.getElementById('Save_Input')
  saveInp.value = "";

  //  ♩ ♪ ♫ ♬ ♩ ♪ ♫ ♬ ♩ ♪ ♫ ♬
  displayDelay(+document.getElementById("delayVal").innerHTML);
  document.getElementById("Tempo_Input").value = +document.getElementById("delayVal").innerHTML;
  tempo = document.getElementById("Tempo_Input").value;
  let pedal = '';

  for (let x = 1; x <= boxInit; x += 1) {
    for (let i = 1; i <= NN; i += 1) {
      for (let j = 1; j <= NN; j += 1) {
        let keyNote = document.getElementById((x) + abc[i] + j);
        if (keyNote && keyNote.style.opacity === '1') {
          if (keyNote.innerHTML === '⭐') {
            pedal = ".";
          } else if (keyNote.innerHTML.split("🔶").length > 1) {
            pedal = "*" + keyNote.innerHTML.split("🔶")[1];
          }
          noteJSON[j].push(keyNote.id + pedal);
          saveInp.value += keyNote.id + pedal + ",";
          pedal = '';
        } else {
          noteJSON[j].push(" ");
        }

      }

    }
  }

}
let matrixArr = [];

function playSound(i) {

  let playNote;

  if (!modeBol) {
    if (i % NN === 0 && document.getElementById("matrix" + ((i / NN) + 1))) {
      let index = ((i / NN) + 1);


      if (matrixArr[matrixArr.length - 1]) {
        matrixArr[matrixArr.length - 1].style = "display:none";
      }
      document.getElementById("matrix" + index).style = "display:block";

      matrixArr = [document.getElementById("matrix" + index)];
    }

  }


  tempo = document.getElementById("Tempo_Input").value;
  let volumeVal = document.getElementById("volumeSlider").value;
  Howler.volume(volumeVal / 100);

  for (let n = 1; n <= NN1; n += 1) {
    notes[n] = noteJSON[n];
    playNote = noteJSON[n][i].split('-')[1];

    audio[n] = document.getElementById(`${parseInt(playNote)}`);
    let currentNote = parseInt(playNote) - 1;
    let noteHold = false;
    let noteHoldVal = false;

    let noteH;
    if (sounds[currentNote]) {


      if (playNote[playNote.length - 1] === ".") {
        audio[n].currentTime = 0;
        audio[n].volume = (volumeVal / 100);
        audio[n].mozPreservesPitch = false;
        audio[n].playbackRate = 0.4;

        if (audio[n]) {
          const playPromise = audio[n].play();
          if (playPromise !== null) {
            playPromise.catch(() => { if (audio[n]) { audio[n].play() } })
          }




          noteHold = true;
          noteHoldVal = false;
        }

      } else if (notes[n] && document.getElementById(notes[n][i].split("*")[0]).innerHTML.split("🔶")[1] != undefined) {

        let noteSpeed = parseFloat(document.getElementById(notes[n][i].split("*")[0]).innerHTML.split("🔶")[1]);


        if (sounds[currentNote]) {
          //   sounds[currentNote].mozPreservesPitch = true;

          sounds[currentNote].rate(noteSpeed);
          sounds[currentNote].play();
          noteHold = false;
          noteHoldVal = true;

        }

      } else if (noteHoldVal === false) {
        noteHold = false;
        noteHoldVal = false;
        sounds[currentNote].rate(1);
        sounds[currentNote].play();
      }

    }

    if (notes[n] && document.getElementById(notes[n][i]) && !noteHold && !noteHoldVal) {
      document.getElementById(notes[n][i]).style = "border:solid;border-width:0px;filter:hue-rotate(225deg);border-color: rgb(120, 220,  230);background-color: rgb(120, 220,  230);opacity:1;transform: translateY(4px);box-shadow: 0 5px rgb(120, 220,  230);";


      setTimeout(() => {
        if (notes[n] && document.getElementById(notes[n][i])) {
          document.getElementById(notes[n][i]).style = "border:none;filter:grayscale(0%);opacity:1";

        }

      }, tempo / 2)

    } else if (notes[n] && noteHold && !noteHoldVal) {

      if (notes[n][i]) {


        noteH = notes[n][i].substring(0, notes[n][i].length - 1);
        if (document.getElementById(noteH)) {
          document.getElementById(noteH).style = "border:solid;border-width:0px;filter:hue-rotate(225deg);border-color: rgb(120, 220,  230);background-color: rgb(120, 220,  230);opacity:1;transform: translateY(4px);box-shadow: 0 5px rgb(120, 220,  230);";
        }
      }


      setTimeout(() => {
        if (notes[n] && document.getElementById(noteH)) {
          document.getElementById(noteH).style = "border:none;filter:grayscale(0%);opacity:1";

        }

      }, tempo / 2)

    }
    else if (notes[n] && !noteHold && noteHoldVal) {

      if (notes[n][i]) {


        noteH = notes[n][i].split("*")[0];

        if (document.getElementById(noteH)) {
          document.getElementById(noteH).style = "border:solid;border-width:0px;filter:hue-rotate(225deg);border-color: rgb(120, 220,  230);background-color: rgb(120, 220,  230);opacity:1;transform: translateY(4px);box-shadow: 0 5px rgb(120, 220,  230);";
        }
      }


      setTimeout(() => {
        if (notes[n] && document.getElementById(noteH)) {
          document.getElementById(noteH).style = "border:none;filter:grayscale(0%);opacity:1";

        }

      }, tempo / 2)

    }


  }
}


function displayMatrix(ind) {

  if (!modeBol) {
    let display = ['none', 'block']
    if (boxInit > 2) {
      for (let m = 1; m <= boxInit - 1; m += 1) {
        document.getElementById("matrix" + m).style = 'display:' + display[ind];
      }
    }
  } else {
    for (let m = 1; m <= boxInit - 1; m += 1) {
      document.getElementById("matrix" + m).style = 'display:block'
    }
  }
}
function save_InputBkp() {
  saveBkp[0] = (document.getElementById("Save_Input").value);
}




let iter = 0;
let noteInt;
let tempo;
function playNotes() {


  scrollToEl(1)

  noteInt = 0;
  tempo = document.getElementById("Tempo_Input").value;
  document.getElementById("play").disabled = true;
  document.getElementById("preload").disabled = true;


  let abv = abc_1;
  const noteJSLen = noteJSON[1].length - 1;

  setTimeout(() => {

    noteInt = setInterval(() => {
      playSound(iter);
      if (iter === noteJSLen) {
        clearInterval(noteInt);
        resetNotes();
        notes = [];

        idle();
        setTimeout(() => {
          displayMatrix(1);

          saveBkp.length = 1;
          matrixArr = [];
          noteInt = 0;

        }, 600)

      }
      iter += 1;

    }, parseInt(tempo));


    document.getElementById("play").disabled = false;
    document.getElementById("preload").disabled = false;
  }, 2800);


}




function loadKeys() {

  let data = document.getElementById('Save_Input').value.split(",");
  for (let x = 1; x <= boxInit; x += 1) {
    for (let i = 0; i <= data.length - 2; i += 1) {
      let keyNote = document.getElementById(data[i]);
      if (data[i][data[i].length - 1] === ".") {
        data[i] = data[i].substring(0, data[i].length - 1);
        keyNote = document.getElementById(data[i].split(".")[0]);
        setTimeout(() => {
          if (keyNote) {
            tempNote = '⭐';
            keyNote.style = 'border:none;filter:grayscale(0%);opacity:1';
            keyNote.innerHTML = tempNote;
            tempNote = '🔷';
          }
        }, 500);
      } else if (data[i].split("*")[1] !== undefined) {
        keyNote = document.getElementById(data[i].split("*")[0]);
        setTimeout(() => {
          if (keyNote) {
            tempNote = `🔶${data[i].split("*")[1]}`;
            keyNote.style = 'border:none;filter:grayscale(0%);opacity:1;';
            keyNote.innerHTML = tempNote;
            tempNote = '🔷';
          }
        }, 500);
      } else {
        if (keyNote) {
          keyNote.style = 'border:none;filter:grayscale(0%);opacity:1';
          keyNote.innerHTML = '🔷';
        }
      }
    }
  }
}

let substance = [];

let numSubstance = 0;
function addMix() {
  let letter;
  let saveData = document.getElementById('Save_Input').value;
  let input = saveData.split(",");
  for (let i = 0, len = input.length - 1; i <= len; i += 1) {
    if (input[i].split("-")[1]) {
      letter = input[i].split("-")[0];
      input[i] = parseInt(letter) + numSubstance + letter[letter.length - 1] + "-" + input[i].split("-")[1];
    }
  }
  input = input.filter(Boolean)
  substance.push(input);
  numSubstance = parseInt(input[input.length - 1]);
  document.getElementById('Save_Input').value = "";
  resetNotes();
  deleteAll();
}
function merge() {
  document.getElementById('Save_Input').value = substance[0] + ",";
  for (let i = 1, len = substance.length; i <= len; i += 1) {
    if (substance[i]) {
      document.getElementById('Save_Input').value += substance[i] + ",";
    }
  }
  document.getElementById('Save_Input').value;
  numSubstance = 0;
  substance = [];
  resetNotes();
  loadPiece();
}
function clearKeys() {
  const saveData = document.getElementById('Save_Input').value.split(",");
  for (let i = 0; i <= saveData.length - 1; i += 1) {
    let keyNote = document.getElementById(saveData[i]);
    if (keyNote && keyNote.style.opacity === '1') {
      keyNote.style = 'border:none;filter:grayscale(100%);opacity:0.5';
    }
  }
  document.getElementById('Save_Input').value = "";
}


function resetNotes() {
  clearInterval(noteInt);
  iter = 0;
  notes = [];
  for (let j = 1; j <= NN; j += 1) {
    noteJSON[j] = [];
  }
}

//1l-6,1m-6,1n-6,1o-6,2a-6,2b-6,2c-6,2d-6,
//2a-6,2b-6,
function shiftNotes(ws, ad, index) {
  let wsad = [[-1, +1, 0], [-1, +1, 0]];
  let dirWS = wsad[0][+ws];
  let dirAD = wsad[1][+ad];


  let inputVal = index;
  let keyNoteX, keyNote;
  if (dirAD === -1 || dirWS === -1) {
    for (let j = 1; j <= NN; j += 1) {
      for (let i = 0; i <= NN; i += 1) {

        keyNote = document.getElementById(inputVal + abc_1[i + dirWS] + (j + dirAD));
        keyNoteX = document.getElementById(inputVal + abc_1[i] + j);
        matrix = 0;

        if (keyNoteX && keyNoteX.style.opacity === '1' && keyNote) {
          keyNoteX.style = 'border:none;filter:grayscale(100%);opacity:0.5';
          keyNote.style = 'border:none;filter:grayscale(0%);opacity:1';
          keyNote.innerHTML = keyNoteX.innerHTML;
          keyNoteX.innerHTML = "🔷";

        } 
        

      }

    }


  } else if (dirAD === 1 || dirWS === 1) {

    for (let j = NN; j >= 1; j -= 1) {
      for (let i = NN; i >= 0; i -= 1) {

        keyNote = document.getElementById(inputVal + abc_1[i + dirWS] + (j + dirAD));
        keyNoteX = document.getElementById(inputVal + abc_1[i] + j);
        matrix = 0;
        if (keyNoteX && keyNoteX.style.opacity === '1' && keyNote) {

          keyNoteX.style = 'border:none;filter:grayscale(100%);opacity:0.5';
          keyNote.style = 'border:none;filter:grayscale(0%);opacity:1';
          keyNote.innerHTML = keyNoteX.innerHTML;
          keyNoteX.innerHTML = "🔷";

        } 
        
        
      }


    }
  }
}






function copyMatrix() {
  let inputVal = +document.getElementById("copy_input").value || 1;

  for (let j = 1; j <= NN; j += 1) {
    for (let i = 1; i <= NN; i += 1) {

      let keyNote = document.getElementById(inputVal + abc[i] + j);

      if (keyNote && keyNote.style.opacity === '1') {
        setTimeout(() => {
          document.getElementById((boxInit - 1) + abc[i] + j).style = 'border:none;filter:grayscale(0%);opacity:1';
          document.getElementById((boxInit - 1) + abc[i] + j).innerHTML = keyNote.innerHTML;
        }, 500);
      }

    }


  }

}



function randomNotes() {

  function gaussRandom() {
    var u = 0, v = 0;
    while (u === 0) u = Math.random();
    while (v === 0) v = Math.random();
    let num = Math.sqrt(-2.0 * Math.log(u)) * Math.cos(2.0 * Math.PI * v);
    num = num / 10.0 + 0.5;
    if (num > 1 || num < 0) return gaussRandom();
    return num;
  }

  let variate = Math.floor(Math.random() * 15) + 10;

  clearKeys();

  let len = NN * boxInit;
  let rdmNotes = [];
  for (let r = 0; r <= len; r += 1) {
    rdmNotes[r] = Math.floor(gaussRandom() * variate);

  }
  let rdmSilence = randomInt(0, rdmNotes.length);

  for (let sil = 0; sil <= rdmSilence; sil += 1) {
    rdmNotes[randomInt(0, rdmNotes.length - 1)] = 0;
    rdmNotes[randomInt(0, rdmNotes.length - 1)] = 0;
    rdmNotes[randomInt(0, rdmNotes.length - 1)] = 0;
  }

  for (let x = 1; x <= boxInit; x += 1) {
    for (let j = 1; j <= rdmNotes.length; j += 1) {
      let keyNote = document.getElementById(x + abc[randomInt(1, NN)] + rdmNotes[j]);
      if (keyNote) {
        keyNote.style = 'border:none;filter:grayscale(0%);opacity:1';
        document.getElementById("Save_Input").value += keyNote.id + ',';
      }
    }
  }
}


function displayDelay(val) {
  if (!isNaN(val)) {
    document.getElementById("delayVal").innerHTML = val;
  } else {
    document.getElementById("delayVal").innerHTML = 350;
  }
}

function displayHoldVal(val) {

  if (document.getElementById("holdDoc").innerHTML.split('🔶')[1] != undefined) {
    document.getElementById("holdDoc").innerHTML = `🔶${(val / 100).toFixed(1)}`;
  }


}

function randomInt(low, high) {
  return Math.floor(Math.random() * (high - low) + low);
}




function demo(record, len, type) {

  let musicLib =
  {

    Indian_Anthem: { music: " 1a-1,1e-1.,1b-2,1c-3,1e-3.,1d-5,1a-8,1e-8.,1c-9,1e-10,1g-10,1i-10,1k-10,1m-10,1o-10,2b-1,2f-1.,2c-2,2l-2,2n-2.,2d-3,2f-3.,2m-3,2n-4.,2e-5,2k-5,2j-7,2n-7.,2f-8.,2j-9,2b-10,2f-10,2h-10,2l-10,2n-11,3c-1,3g-1.,3d-2,3m-2,3o-2.,3e-3,3g-3.,3n-3,3o-4.,3f-5,3l-5,3k-7,3o-7.,3g-8.,3k-9,3o-9,3c-10,3g-10,3i-10,4d-1,4h-1,4l-1.,4e-2,4i-2,4f-3,4j-3,4l-3.,4g-5,4k-5,4l-5.,4d-7,4h-8,4l-8.,4b-9,4f-9,4l-10.,4l-12.,4l-15.,5e-1,5e-3,5m-3,5i-5,5m-5,5a-8,5i-8,5e-12,5i-12,5k-12,5o-12,6n-2,6f-5,6j-5,6n-6,6b-7,6b-10,6n-11,6b-12,6d-12,6f-12,6j-12,6l-12,7c-1,7g-1,7o-2,7g-4,7k-4,7o-4,7c-5,7k-6,7g-11,7k-11,7m-11,7o-11,7c-12,7a-13,8l-1,8h-2,8m-2,8n-3,8h-5,8o-5,8d-6,8h-7,8d-9,8h-9,8f-10,8l-10,8d-11,8j-11,9a-1.,9i-1,9m-1.,9j-2,9a-3.,9k-3,9m-3.,9l-5,9a-8.,9m-8.,9i-10,9m-10,9o-10,10j-2,10k-5,10m-5,10n-5.,10l-7,10n-7.,10h-9,10n-9.,10b-10,10f-10,10j-12,10l-12,10n-12,11d-1,11k-1,11o-1.,11l-2,11m-3,11o-3.,11c-4,11e-4,11g-4.,11f-5,11n-5,11g-6.,11g-8.,11o-8.,11k-10,11o-10,11c-11,11g-11,11i-11,11h-12,11g-13,12l-1,12d-2,12h-2.,12m-2,12n-3,12e-5,12g-5,12h-5.,12o-5,12f-7,12h-7.,12l-7,12d-9,12h-9,12j-9,12n-9,12b-10,13a-1,13e-1.,13m-1,13b-2,13c-3,13e-3.,13d-5,13m-5,13a-8,13e-8.,13m-10,13o-10,14n-2,14n-5,14n-9,14b-10,14d-10,14f-10,14j-10,14l-11,15c-1,15o-1,15c-4,15o-5,15a-10,15o-10,15c-11,16h-3,16h-5,16n-10,16b-11,16l-11,16d-12,16f-12,16h-12,17e-1,17a-2,17a-5,17e-5,17a-9,17e-10,17c-11,18j-2,18b-3,18f-5,18n-5,18n-7,18f-8,18j-9,18l-9,18n-9,18b-10,18f-10,19c-1,19g-1,19k-1.,19d-2,19h-2,19e-3,19i-3,19k-3.,19f-5,19j-5,19c-7,19g-8,19k-8.,19a-9,19e-9,20d-1,20h-1.,20e-2,20f-3,20h-3.,20l-3,20g-5,20m-5,20o-5,20n-7,20h-8.,20d-12,20f-12,20h-12,20j-12,20l-12,21e-1,21i-1.,21m-1.,21f-2,21g-3,21i-3.,21m-4.,21a-5.,21h-5,21m-6.,21a-7.,21i-8.,21a-10.,21m-11,21a-12,21c-12,21e-12,21i-12,21k-12,21o-13,22b-1.,22f-1,22n-1,22o-2,22b-3.,22g-4,22i-4,22j-4.,22b-5.,22h-6,22j-6.,22j-8.,22n-10,22f-11,22j-11,22l-11,22b-12,23c-1.,23k-1.,23g-2.,23a-3,23c-3.,23k-3.,23b-5,23g-5.,23g-7.,23c-8.,23k-8.,23g-9,23c-10,23e-10,23k-10.,23f-11,23i-11,24h-1.,24h-3.,24h-5.,24h-8.,24d-9,24f-9,24h-10.,24d-12,24f-12,24h-12.,24d-14,24f-14,24h-15.,25i-2.,25i-5.,25i-7.,25g-8,25e-9,25i-9.,25g-10,25e-12,25i-12.,25g-13,25e-14,25i-14.,26j-1.,26j-4.,26j-6.,26f-8,26h-8,26j-8.,26f-10,26h-10,26j-11.,26f-12,26h-12,26j-13.,26j-15.,27k-1,27o-2,27l-3,27m-5,27k-8,27m-8,27o-9,28d-1,28h-1.,28l-1.,28e-2,28f-3,28h-3.,28l-4.,28a-5,28g-5,28l-6.,28b-7,28l-8.,28b-9,28h-9,28d-10,28f-10,28j-10,28l-11.,28l-13.,28l-15.,", delay: 150 },
    tune: { music: '1a-1,1b-1,1c-1,1d-1,1e-1,1f-1,1g-1,1h-1,1i-1,1j-1,1k-1,1l-1,1m-1,1n-1,1o-1,1a-2,1b-2,1c-2,1d-2,1e-2,1f-2,1g-2,1h-2,1i-2,1j-2,1k-2,1l-2,1m-2,1n-2,1o-2,1a-3,1b-3,1c-3,1d-3,1e-3,1f-3,1g-3,1h-3,1i-3,1j-3,1k-3,1l-3,1m-3,1n-3,1o-3,1a-4,1b-4,1c-4,1d-4,1e-4,1f-4,1g-4,1h-4,1i-4,1j-4,1k-4,1l-4,1m-4,1n-4,1o-4,1a-5,1b-5,1c-5,1d-5,1e-5,1f-5,1g-5,1h-5,1i-5,1j-5,1k-5,1l-5,1m-5,1n-5,1o-5,1a-6,1b-6,1c-6,1d-6,1e-6,1f-6,1g-6,1h-6,1i-6,1j-6,1k-6,1l-6,1m-6,1n-6,1o-6,1a-7,1b-7,1c-7,1d-7,1e-7,1f-7,1g-7,1h-7,1i-7,1j-7,1k-7,1l-7,1m-7,1n-7,1o-7,1a-8,1b-8,1c-8,1d-8,1e-8,1f-8,1g-8,1h-8,1i-8,1j-8,1k-8,1l-8,1m-8,1n-8,1o-8,1a-9,1b-9,1c-9,1d-9,1e-9,1f-9,1g-9,1h-9,1i-9,1j-9,1k-9,1l-9,1m-9,1n-9,1o-9,1a-10,1b-10,1c-10,1d-10,1e-10,1f-10,1g-10,1h-10,1i-10,1j-10,1k-10,1l-10,1m-10,1n-10,1o-10,1a-11,1b-11,1c-11,1d-11,1e-11,1f-11,1g-11,1h-11,1i-11,1j-11,1k-11,1l-11,1m-11,1n-11,1o-11,1a-12,1b-12,1c-12,1d-12,1e-12,1f-12,1g-12,1h-12,1i-12,1j-12,1k-12,1l-12,1m-12,1n-12,1o-12,1a-13,1b-13,1c-13,1d-13,1e-13,1f-13,1g-13,1h-13,1i-13,1j-13,1k-13,1l-13,1m-13,1n-13,1o-13,1a-14,1b-14,1c-14,1d-14,1e-14,1f-14,1g-14,1h-14,1i-14,1j-14,1k-14,1l-14,1m-14,1n-14,1o-14,1a-15,1b-15,1c-15,1d-15,1e-15,1f-15,1g-15,1h-15,1i-15,1j-15,1k-15,1l-15,1m-15,1n-15,1o-15,', delay: 80 },
    tune2: { music: '1a-1,1b-2,1c-3,1d-4,1e-5,1f-6,1g-7,1h-8,1i-9,1j-10,1k-11,1l-12,1m-13,1n-14,1o-15,', delay: 80 },
    THE_FIRST_SONG: { music: '1a-2,1c-2,1a-5,1c-5,1e-7,1g-7,1m-7,1i-8,1k-8,1e-9,1g-9,1m-9,1i-10,1k-10,2j-2,2l-2,2n-2,2f-5,2h-5,2n-5,2b-6,2d-6,2j-6,2l-6,2f-7,2h-7,2b-8,2d-8,3o-2,3k-5,3m-5,3g-6,3i-6,3o-6,3c-7,3e-7,3k-7,3m-7,3g-8,3i-8,3c-9,3e-9,4l-5,4n-5,4h-6,4j-6,4d-7,4f-7,4l-7,4n-7,4h-8,4j-8,4d-9,4f-9,5a-2,5e-2,5g-2,5e-5,5g-5,5a-6,5i-7,5k-7,5m-8,5o-8,5i-9,5k-9,5m-10,5o-10,6n-2,6j-5,6l-5,6f-6,6h-6,6n-6,6b-7,6j-7,6l-7,6f-8,6h-8,6b-9,7a-2,7c-2,7c-5,7a-6,', delay: 300 },
    London_bridges_falling_up: { music: '1i-2,1a-7,1e-7,1i-7,1m-7,1g-8,1k-8,1a-9,1e-9,1m-9,1d-10,2b-2,2j-2,2b-6,2f-6,2d-7,2j-7,2n-7,2f-8,2l-8,2n-9,3k-2,3m-3,3k-5,3o-5,3m-6,3c-7,3g-7,3k-7,3o-7,3i-8,3m-8,3c-9,3g-9,3o-9,3f-10,4d-2,4l-2,4n-3,4h-5,4l-5,4n-5,4d-6,4h-7,4l-7,4h-9,', delay: 200 },
    Ode_of_Joy: { music: '1o-2,1c-5,1m-5,1o-6,1a-7,1c-7,1i-7,1m-7,1e-8,1k-8,1g-9,1i-9,2f-2,2m-2,2b-5,2d-5,2f-6,2m-6,2n-6,2b-7,2d-7,2h-7,2j-7,2o-8,2h-9,2j-9,3c-5,3e-5,3b-6,3a-7,3c-7,3e-7,3i-7,3k-7,3o-7,3g-8,3m-8,3i-9,3k-9,4d-2,4d-5,4f-5,4o-5,4b-6,4h-6,4l-6,4j-7,4o-7,5g-2,5m-2,5a-5,5k-5,5o-5,5e-6,5g-6,5m-6,5a-7,5i-7,5o-7,5i-9,6f-2,6b-5,6d-5,6h-5,6j-5,6n-5,6f-6,6l-6,6b-7,6h-7,6j-7,6a-8,6i-8,7c-2,7g-5,7i-5,7a-6,7f-6,7e-7,7g-7,7i-7,7m-7,7o-7,7d-8,7k-8,7m-9,7o-9,8f-2,8h-5,8j-5,8f-6,8l-6,8d-7,8h-7,8j-7,8b-8,9a-5,9b-5,', delay: 300 },
    Star_Wars: { music: '1e-1.,1b-5,1c-5,1d-5,1e-5.,1m-6,1e-8.,1i-8.,1m-8,1o-9,1i-10.,1n-10,1m-11,1i-12.,2g-6,2e-8,2g-8,2n-8,2i-9,2a-10.,2e-10,2h-10,2j-10.,2n-10,2g-11,2a-12.,2e-12,2j-12.,2n-12,2a-15.,2j-15.,3k-3.,3d-5.,3h-5,3j-5,3k-5.,3a-7,3k-8.,3o-8.,3a-9,3d-9.,3b-10,3o-10.,3a-11,3c-11,3o-12.,4d-6,4m-7,4d-8,4k-8,4f-9,4m-9,4o-9,4e-10,4g-10.,4k-10,4n-10,4d-11,4m-11,4g-12.,4k-12,4g-15.,5j-5.,5n-5,5g-7,5e-8,5g-9,5j-9.,5a-10.,5e-10,5h-10,5g-11,5i-11,5a-12.,5e-12,5a-15.,6b-1.,6b-4.,6a-5,6b-6,6f-6,6g-6,6k-6,6g-8,6j-8,6k-8,6i-9,6l-9,6n-9,6h-10,6m-10,6g-11,7g-1.,7b-2,7g-4.,7b-5,7d-5,7f-5,7a-6,7g-6,7k-6,7l-6,7b-7,7l-8,7o-8,7n-9,7m-10,7l-11,8l-1.,8l-4.,8d-5.,8h-5,8j-5,8l-6,8a-7,8c-9,8d-9.,8a-12,9f-4,9i-4,9a-6,9b-6,9f-6,9i-6,9k-6,9l-7,9b-8,9e-8,9f-8,9d-9,9g-9,9i-9,9c-10,9h-10,9b-11,9m-12,9o-12,10a-8,10c-8,10e-8,10g-8,10i-8,10n-8,10l-9,10a-11,10c-11,10e-11,10i-11,10g-12,10o-12.,10e-13,10c-14,10a-15,11j-3.,11d-4,11f-4,11h-5,11i-5,11j-5.,11j-8.,11n-8.,11d-9,11f-9,11n-10.,11n-12.,12c-6,12l-6,12c-8,12j-8,12l-8,12e-9,12n-9,12d-10,12f-10.,12j-10,12m-10,12o-10.,12c-11,12l-11,12f-12.,12j-12,12o-12.,12f-15.,12o-15.,13i-5.,13m-5,13o-5,13f-7,13d-8,13f-9,13i-9.,13d-10,13g-10,13f-11,13h-11,13d-12,14a-3.,14a-5.,14i-6,14a-8.,14e-8.,14i-8,14k-9,14e-10.,14j-10,14l-10.,14i-11,14e-12.,14l-12.,14l-15.,15o-5.,15c-6,15l-7,15a-8,15c-8,15j-8,15e-9,15l-9,15o-9.,15a-10,15d-10,15f-10.,15j-10,15m-10,15c-11,15l-11,15n-11,15a-12,15f-12.,15j-12,15f-15.,16d-5,16n-5,16l-6,16h-8,16f-10.,16d-12,16f-12.,16f-15.,17j-1,17e-2,17c-3,17a-4,17g-5,17j-8,17g-10,17h-10,17i-10,17j-10,17g-12,17h-12,17i-12,17j-12,17g-15,17h-15,17i-15,17j-15,', delay: 250 },
    Jurrassic_Park: { music: '1a-1,1e-1,1i-1,1m-1,1a-3,1e-3,1i-4,1m-4,1a-5,1e-5,1i-6,1m-6,1h-7,1a-8,1g-8,1i-8,1o-8,1m-11,2b-1,2j-1,2n-1,2f-2,2b-3,2j-4,2n-4,2b-5,2f-5,2j-6,2n-6,2a-7,2b-8,2e-9,2f-9,2i-11,2j-11,3a-1,3i-1,3c-2,3k-2,3o-2,3a-3,3i-3,3a-5,3c-5,3g-5,3i-5,3k-5,3o-5,3f-7,3b-8,3j-8,3c-9,3k-9,3a-10,3i-10,4b-1,4d-1,4h-1,4l-2,4b-3,4h-3,4d-4,4b-5,4h-5,4l-5,4d-6,4c-8,4k-9,4l-9,4g-10,4h-10,4d-11,4b-12,5e-1,5i-1,5m-1,5c-2,5e-3,5g-3,5m-3,5n-3,5i-4,5k-4,5c-5,5e-5,5g-5,5m-5,5o-5,5i-6,5k-6,5g-8,5k-9,5i-11,5g-12,5o-12,5d-14,5l-14,5c-15,5e-15,5k-15,5m-15,6f-1,6h-1,6j-3,6l-3,6b-4,6d-4,6n-4,6f-5,6h-5,6j-5,6l-5,6b-6,6d-6,6n-6,6a-8,6d-8,6l-8,6b-11,6n-11,6j-12,6e-14,6f-14,6d-15,6g-15,7g-1,7i-1,7k-1,7o-1,7c-2,7e-2,7m-2,7g-3,7i-3,7o-3,7k-4,7c-5,7e-5,7g-5,7i-5,7m-5,7o-5,7k-6,7i-8,7o-8,7m-9,7k-11,7c-12,7f-14,7e-15,7g-15,8d-1,8h-1,8d-3,8h-3,8d-5,8h-5,8d-8,8h-8,8d-10,8h-10,8d-12,8h-12,8d-15,8h-15,9a-1,9c-1,9i-1,9n-1,9e-2,9g-2,9k-3,9m-4,9o-4,9a-5,9c-5,9j-5,9l-5,9e-6,9g-6,9b-8,9e-9,9c-12,9l-12,9f-13,9m-13,9h-14,9k-14,9i-15,10h-1,10j-1,10l-1,10a-2,10n-2,10d-3,10f-3,10j-3,10l-3,10b-4,10h-4,10d-5,10j-5,10l-5,10n-5,10h-6,10f-7,10k-8,10l-9,10f-10,10g-10,10m-10,10n-10,10e-12,10h-13,10d-14,10c-15,10i-15,11c-1,11g-1,11k-1,11o-1,11a-2,11g-3,11k-3,11o-3,11a-5,11c-5,11g-5,11k-5,11o-5,11c-8,11g-8,11k-8,11o-8,11a-9,11g-10,11k-10,11o-10,11g-12,11k-12,11o-12,11g-15,11k-15,11o-15,', delay: 332 },
    Unknown: { music: '1h-1,1i-2,1k-3,1a-4,1c-4,1g-4,1j-4,1m-4,1l-5,1b-6,1d-6,1f-6,1n-6,1e-8,1o-8.,2i-1,2j-2,2l-3,2b-4,2d-4,2h-4,2k-4,2n-4,2m-5,2c-6,2e-6,2g-6,2f-8,3j-1,3k-2,3m-3,3c-4,3e-4,3i-4,3l-4,3o-4,3n-5,3d-6,3f-6,3h-6,3g-8,4k-1,4l-2,4n-3,4d-4,4f-4,4j-4,4m-4,4o-5,4a-6,4e-6,4g-6,4i-6,4b-8,4h-8,5a-4.,5m-12,5o-12,5i-13,5k-13,5n-13,5g-14,5e-15,5h-15,6d-8,6f-9,6o-9,6b-10,6j-10,6n-10,6a-11,6h-12,6l-12,7a-8,7d-8.,7b-9,7c-10,7l-13,7n-13,7j-14,7h-15,7k-15,8g-8,8i-9,8e-10,8m-10,8d-11,8a-12,8c-12,8k-12,8o-12,8b-13,9k-4,9m-4,9l-6,9n-6,9d-8,9g-8.,9o-8,9c-9,9e-9,9b-10,9f-10,10c-1,10d-2,10f-3,10b-4,10e-4,10h-4,10l-4,10n-4,10g-5,10a-6,10i-6,10m-6,10o-6,10j-8,11d-1,11e-2,11g-3,11c-4,11f-4,11h-4.,11m-4,11o-4,11b-6,11n-6,11a-8,12e-1,12f-2,12h-3,12d-4,12g-4,12j-4,12n-4,12i-5,12a-6,12c-6,12k-6,12o-6,12b-8,12l-8,13f-1,13g-2,13i-3,13a-4,13e-4,13h-4,13k-4.,13j-5,13b-6,13d-6,13c-8,', delay: 150 },

    Jakeb: { music: '1a-1,1e-1,1i-1,1m-1,1c-3,1g-3,1k-3,1o-3,1a-4,1c-4,1e-4,1g-4,1i-4,1k-4,1m-4,1o-4,1a-8,1b-8,1n-8,1l-9,1o-9,1j-10,1h-11,1e-12,1c-15,2b-1,2f-1,2j-1,2n-1,2d-3,2h-3,2l-3,2b-4,2d-4,2f-4,2h-4,2j-4,2l-4,2n-4,2b-7,2c-7,2o-8,2m-9,2a-10,2k-10,2i-11,2f-12,2d-15,3c-1,3g-1,3k-1,3o-1,3a-3,3e-3,3i-3,3m-3,3a-4,3c-4,3e-4,3g-4,3i-4,3k-4,3m-4,3o-4,3c-6,3d-6,3a-9,3n-9,3b-10,3l-10,3j-11,3g-12,3e-15,4d-1,4h-1,4l-1,4b-3,4f-3,4j-3,4n-3,4b-4,4d-4,4f-4,4h-4,4j-4,4l-4,4n-4,4d-5,4e-5,4a-8,4b-9,4o-9,4c-10,4m-10,4k-11,4h-12,4f-15,5a-1,5e-1,5c-3,5a-4,5c-4,5e-4,5b-8,5c-9,5d-10,', delay: 120 },


  }



  // tune:,

  resetNotes();
  incNoteCap();
  document.getElementById('delayVal').innerHTML = musicLib[record].delay;
  document.getElementById('Save_Input').value = musicLib[record].music;
  document.getElementById('Tempo_Input').value = musicLib[record].delay;
  let num = len - boxInit;
  for (let s = 0; s <= num; s += 1) {
    createMusicBox();
  }

  loadKeys();
}

function addPlus() {
  let input = document.getElementById("numBlocksInput");
  let num = parseInt(input.value) || 0;


  for (let s = 0; s <= num - 1; s += 1) {
    createMusicBox();
  }

}

function deleteAll() {
  if (boxInit > 1) {
    for (let i = 1; i <= boxInit; i += 1) {
      deleteMusicBox();
    }
    if (boxInit > 1) {
      deleteAll()
    }
  }
  window.scrollTo(0, 0);
}

function tuneUp(ind) {
  deleteAll();
  let tunes = ['tune', 'tune2'];
  let volume = document.getElementById("volumeSlider");
  volume.value = 5;
  setTimeout(() => {
    demo(tunes[ind], 1);
    loadAnimation();
    document.getElementById("loading").style = "display:none";
    generateMusic();
    playNotes();
    setTimeout(() => {
      resetNotes();
      document.getElementById('Tempo_Input').value = 350;
      document.getElementById('delayVal').innerHTML = 350;
      if (ind < 1) {
        tuneUp(1);
        volume.value = 20;
        setTimeout(() => {
          document.getElementById("Save_Input").value = saveBkp;
          loadPiece();
        }, 6000);

      }

    }, 4200);
  }, 200);
}



let fastPreviewEnd;
function tunePreload() {

  document.getElementById('delayVal').innerHTML = document.getElementById('delayVal').innerHTML / 2;



  generateMusic();
  setTimeout(() => {
    playNotes();
  }, 1000);

  // loadAnimation();
  let preloadTime = boxInit * (document.getElementById('Tempo_Input').value) * 25 + 2000;

  fastPreviewEnd = setTimeout(() => {

    // loadPiece();
    resetNotes();
    loadPiece();
    idle();
    scrollToElXY(0);
    clearInterval(noteInt);
    document.getElementById("preload").disabled = false;
    document.getElementById('delayVal').innerHTML = document.getElementById('delayVal').innerHTML * 2;

  }, preloadTime);
  document.getElementById("preload").disabled = true;

}


window.onload = function () {
  for (let i = 1; i <= 15; i += 1) {
    document.getElementById(i).preload;
    document.getElementById(i).load();
  }
}


function loadPiece() {

  let data = document.getElementById('Save_Input').value;
  data = data.trim();

  let piece =
    { music: data }

  let marr = piece.music.trim().split(",");
  let len;
  if (marr[marr.length - 2]) {
    len = parseInt(marr[marr.length - 2].split("-")[0]);
  }

  clearKeys();
  incNoteCap();

  document.getElementById('delayVal').innerHTML = document.getElementById('delayVal').innerHTML;
  document.getElementById('Save_Input').value = piece.music;
  let num = len - boxInit;
  for (let s = 0; s <= num; s += 1) {
    createMusicBox();
  }
  loadKeys();
}


function playRadioSound(i) {
  let playNote;
  tempo = document.getElementById("Tempo_Input").value;
  let volumeVal = document.getElementById("volumeSlider").value;
  Howler.volume(volumeVal / 100);

  for (let n = 1; n <= NN1; n += 1) {
    notes[n] = noteJSON[n].filter(Boolean);
    playNote = notes[n][i];

    audio[n] = document.getElementById(`${parseInt(playNote)}`);
    let currentNote = parseInt(playNote) - 1;
    if (sounds[currentNote]) {
      if (playNote[playNote.length - 1] === ".") {
        audio[n].currentTime = 0;
        audio[n].volume = (volumeVal / 100);
        audio[n].mozPreservesPitch = false;
        audio[n].playbackRate = 0.4;
        if (audio[n]) {
          const playPromise = audio[n].play();
          if (playPromise !== null) {
            playPromise.catch(() => { if (audio[n]) { audio[n].play() } })
          }
          noteHold = true;
        }
      } else {
        if (sounds[currentNote]) {
          sounds[currentNote].play();
        }
      }
    }
  }
}



let cashedNotes = false;
function playRadioNotes() {
  document.getElementById("previewMusicPlay").disabled = true;
  window.scrollTo(0, 0);
  noteInt = 0;
  tempo = document.getElementById("Tempo_Input").value;
  document.getElementById("play").disabled = true;
  document.getElementById("preload").disabled = true;
  const noteJSLen = noteJSON[1].length - 1;
  if (!cashedNotes) {
    for (let n = 1; n <= NN1; n += 1) {
      noteJSON[n] = noteJSON[n].map(x => x.split("-")[1]).map(x => !x ? " " : x);
    }
  }
  setTimeout(() => {
    noteInt = setInterval(() => {
      playRadioSound(iter);
      if (iter === noteJSLen) {
        clearInterval(noteInt);
        idle();
        cashedNotes = true;
        document.getElementById("previewMusicPlay").disabled = false;
        setTimeout(() => {
          saveBkp.length = 1;
          matrixArr = [];
          noteInt = 0;
        }, 600)
      }
      iter += 1;
    }, parseInt(tempo));
    document.getElementById("play").disabled = false;
    document.getElementById("preload").disabled = false;
  }, 100);
}

function stopPlaying() {
  clearTimeout(fastPreviewEnd);
  clearInterval(noteInt);
  resetNotes();
  idle();
  loadPiece();
  scrollToElXY(3);
  document.getElementById("Tempo_Input").value = document.getElementById("delayVal").innerHTML;
}


function stopPlayingRadio() {
  clearTimeout(fastPreviewEnd);
  clearInterval(noteInt);
  iter = 0;
  idle();
  cashedNotes = true;
  document.getElementById("previewMusicPlay").disabled = false;
  window.scrollTo(0, 0);

  document.getElementById("Tempo_Input").value = document.getElementById("delayVal").innerHTML;
}


function generateRadioMusic() {
  document.getElementById("previewMusicPlay").style.display = "inline-block";
  document.getElementById("previewMusicStop").style.display = "inline-block";
  document.getElementById("preload").style.display = "none";
  document.getElementById("play").style.display = "none";
  document.getElementById("stop").style.display = "none";
  document.getElementById("showOtherOpt").style.display = "none";
  document.getElementById("scrollToBottom").style.display = "none";
  document.getElementById("scrollToTop").style.display = "none";
  document.getElementById("exitRadio").style.display = "inline-block";

  cashedNotes = false;
  generateMusic();
  window.scrollTo(0, 0);
}


function resetHowlerSpeedSlider() {
  document.getElementById("howlerSpeedSlider").value = 100;
}


function revealUI() {
  document.getElementById("scrollToBottom").style.display = "block";
  document.getElementById("scrollToTop").style.display = "block";
}