//dom
var root;
//
var inpKey;
//
var submit;
var clearB;
var exportB;
//
var keyOut;
var valueOut;

//

function setup(){
    noCanvas();
    root=select('#code');
    //
        inpKey=createInput("name");//The quick brown fox jumped over the lazy dog.");
        inpKey.id("keyIn");
        inpKey.attribute('class','sunny');
        inpKey.parent(root);
        var lblkeyin=createElement('label'," >>Enter Key&nbsp;&nbsp; Here");
        lblkeyin.attribute('for',"keyIn");
        lblkeyin.attribute('class','solaris');
        lblkeyin.parent(root);
        var brk1=createElement('br');
        brk1.parent(root);
        inpVal=createInput("mogi");//The quick brown fox jumped over the lazy dog.");
        inpVal.id("valIn");
        inpVal.attribute('class',"sunny");
        inpVal.parent(root);
        var lblvalin=createElement('label'," >>Enter Value Here");
        lblvalin.attribute('for',"valIn");
        lblvalin.attribute('class','solaris');
        lblvalin.parent(root);
        var brk2=createElement('br');
        brk2.parent(root);
    //
        submit=createButton("SUBMIT");
        submit.attribute('class','solaris');
        clearB=createButton("CLEAR");
        clearB.attribute('class','solaris');;
        exportB=createButton("EXPORT");
        exportB.attribute('class','solaris');
        submit.parent(root);
        clearB.parent(root);
        exportB.parent(root);
    //
    var brkkk=createElement('br');
    brkkk.parent(root);
    //
        keyOut= createDiv("<h2>Keys</h2>");
        keyOut.attribute("class","keyOut");
        keyOut.parent(root);
        valueOut= createDiv("<h2>Values</h2>");
        valueOut.attribute("class","valueOut");
        valueOut.parent(root);
    //
    inpKey.changed(function(){
        let nxt=document.getElementById("valIn")
        nxt.focus();
        inpVal.value('');
    });
    inpVal.changed(addText)
    submit.mousePressed(addText);
    clearB.mousePressed(function(){
        keyOut.html('<h2>Keys</h2>');
        valueOut.html('<h2>Values</h2>')
        inpKey.value('');
        inpVal.value('');
    });
    exportB.mousePressed(EXPORT);
    //
    let trail1=createElement('br');
    let trail2=createElement('br');
    let trail3=createElement('br');
    let trail4=createElement('span','');
    trail4.html('<br><br> &nbsp;&nbsp; ' );
    trail1.parent(root);
    trail2.parent(root);
    trail3.parent(root);
    trail4.attribute("class","invis");
    trail4.parent(root);
}

function addText(){
    if (inpKey.value()==""){return;}
    var k=createP(inpKey.value()+"<br>");
    k.parent(keyOut);
    var v=createP(inpVal.value()+"<br>");
    v.parent(valueOut);
    inpVal.value('');
    inpKey.value('');
    let nxt=document.getElementById("keyIn")
    nxt.focus();
}


function EXPORT(){
    console.log("EXPORTING");
    const a = document.createElement("a");
    var poemIn=keyOut.html().replace(/\<\/p\>/g,"\n").replace(/\<p\>/g,'').replace(/\<br\>/g,'').replace(/\<h2\>[a-z|\s]+\<\/h2\>/,'');
    var valueOuted=rhyme.html().replace(/\<\/p\>/g,"\n").replace(/\<p\>/g,'').replace(/\<br\>/g,'').replace(/\<h2\>[a-z|\s]+\<\/h2\>/,'')
    var rhymed=valueOut.html().replace(/\<\/p\>/g,"\n").replace(/\<p\>/g,'').replace(/\<br\>/g,'').replace(/\<h2\>[a-z|\s]+\<\/h2\>/,'')
    var postit={"inpKey":poemIn,"rhythmic":valueOuted, "rhyming":rhymed};
    a.href = URL.createObjectURL(new Blob([JSON.stringify(postit, null, 2)], {
        type: "text/plain"
    }));

    var fname="ritaPoetry";
    a.setAttribute("download",fname+".json");
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    console.log('EXPORTED!');
}