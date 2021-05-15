//dom
    var root;
    //
    var input;
    //
    var submit;
    var clearB;
    var exportB;
    //
    var output;
    var oppose;
    var pluralpast;
//
var nlpp= window.nlp_compromise;



function setup(){
noCanvas();
root=select('#code');
input=createInput("I am dog");//The quick brown fox jumped over the lazy dog.");
input.id("userIn");
input.style("width:400px;")
input.attribute('class','sunny');
input.parent(root);
var lblIn=createElement('label'," >>Enter txt Here");
lblIn.attribute('for',"userIn");
lblIn.attribute('class','solaris');
lblIn.parent(root);
var brk=createElement('br');
brk.parent(root);
submit=createButton("SUBMIT");
submit.attribute('class','solaris');
clearB=createButton("CLEAR");
clearB.attribute('class','solaris');
exportB=createButton("EXPORT");
exportB.attribute('class','solaris');
submit.parent(root);
clearB.parent(root);
exportB.parent(root);
var brkkk=createElement('br');
brkkk.parent(root);
output= createDiv("<h2>input</h2>");
output.attribute("class","outlog");
output.parent(root);
oppose= createDiv("<h2>reversified</h2>");
oppose.attribute("class","oppose");
oppose.parent(root);
pluralpast= createDiv("<h2>pluralize and back in time</h2>");
pluralpast.attribute("class","pluralpast");
pluralpast.parent(root);
submit.mousePressed(addText);
input.changed(addText);
clearB.mousePressed(function(){
    output.html('<h2>input</h2>');
    oppose.html('<h2>reversified</h2>')
    pluralpast.html("<h2>pluralize and back in time</h2>");
    input.value('');
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
    if (input.value()==""){return;}
    var p=createP(input.value()+"<br>");
    p.parent(output);
    var r=input.value();
    makeoppose(nlpp.statement(r));
    makePP(nlpp.sentence(r));
    input.value('');
}

function makeoppose(nlpS){
    let neg=nlpS.negate().text();
    p=createP(neg+"<br>");
    p.parent(oppose);
}

function makePP(nlpS){
    let words=nlpS.terms;
    let changed="";
    for (i=0; i<words.length;i++){
        let wrd;
        var pos=words[i].pos;
        if (pos.Noun && !(pos.Person) && !(pos.Pronoun)){
            wrd=nlpp.noun(words[i].text).pluralize();
        }
        else if (pos.Verb){
            wrd=nlpp.verb(words[i].text).conjugate().past;
        }
        else{
            wrd=words[i].text;
        }
        changed+=wrd;
        changed+=" ";
    }
    p=createP(changed+"<br>");
    p.parent(pluralpast);
}

function EXPORT(){
    console.log("EXPORTING");
    const a = document.createElement("a");
    var poemIn=output.html().replace(/\<\/p\>/g,"\n").replace(/\<p\>/g,'').replace(/\<br\>/g,'').replace(/\<h2\>[a-z|\s]+\<\/h2\>/,'');
    var opposeed=pluralpast.html().replace(/\<\/p\>/g,"\n").replace(/\<p\>/g,'').replace(/\<br\>/g,'').replace(/\<h2\>[a-z|\s]+\<\/h2\>/,'')
    var pluralpastd=oppose.html().replace(/\<\/p\>/g,"\n").replace(/\<p\>/g,'').replace(/\<br\>/g,'').replace(/\<h2\>[a-z|\s]+\<\/h2\>/,'')
    var postit={"input":poemIn,"negated":opposeed, "crowdedpast":pluralpastd};
    a.href = URL.createObjectURL(new Blob([JSON.stringify(postit, null, 2)], {
        type: "text/plain"
    }));

    var fname="nlpdemo";
    a.setAttribute("download",fname+".json");
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    console.log('EXPORTED!');
}