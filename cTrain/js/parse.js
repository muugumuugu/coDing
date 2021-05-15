//dom
var root;
//
var input;
//
var syl;
var arr=[];

function setup(){
    noCanvas();
    root=select('#code');
    input=createInput("");//The quick brown fox jumped over the lazy dog.");
    input.id("userIn");
    input.style("width:400px;")
    input.attribute('class','sunny');
    input.parent(root);
    var lblIn=createElement('label'," >>Enter txt Here");
    lblIn.attribute('for',"userIn");
    lblIn.parent(root);
    lblIn.attribute('class','solaris');
    exportB=createButton("EXPORT");
    exportB.attribute('class','solaris');
    input.changed(addText);
    exportB.mousePressed(EXPORT);
// 
}

function addText(){
if (input.value()==""){return;}
arr=[];
syl=int(input.value().trim());
console.log(syl);
    for (i=0; i<500; i++){
        let newWord=RiTa.randomWord({numSyllables:syl , minLength:1 , maxLength:15});
        arr.push(newWord);
    }
createP(arr);
EXPORT();
}

function EXPORT(){
txt={data:arr};
const a = document.createElement("a");
a.href = URL.createObjectURL(new Blob([JSON.stringify(txt,2,null)], {
    type: "text/plain"
  }));

var fname=syl;
a.setAttribute("download",fname+".json");
document.body.appendChild(a);
a.click();
document.body.removeChild(a);
console.log('EXPORTED!');
}