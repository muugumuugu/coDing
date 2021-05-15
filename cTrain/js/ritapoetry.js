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
    var meter;
    var rhyme;
    //
//RITA lexicon; // only in older version :(
// var lexicon= new RiLexicon();



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
    lblIn.parent(root);
    lblIn.attribute('class','solaris');
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
    meter= createDiv("<h2>same meter n grammer</h2>");
    meter.attribute("class","meter");
    meter.parent(root);
    rhyme= createDiv("<h2>same rhyme meter n grammer</h2>");
    rhyme.attribute("class","rhyme");
    rhyme.parent(root);
    submit.mousePressed(addText);
    input.changed(addText);
    clearB.mousePressed(function(){
        output.html('<h2>input</h2>');
        meter.html('<h2>same meter n grammer</h2>')
        rhyme.html("<h2>same rhyme meter n grammer</h2>");
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
    var r=input.value();//new RiString(input.value());
   // console.log(r.analyze()._features);
    let syl=RiTa.analyze(r).syllables.split(' ');//r.analyze()_features.syllables.split(" ");
    makemeter(r,syl);
    makerhyme(r,syl);
    input.value('');
}

function makemeter(rs,syl){
    let pos=RiTa.pos(rs);//rs.pos();
    let words=rs.split(' ');//rs.words();
    let changed="";
    for (i=0; i<words.length;i++){
        let sylct=syl[i].split("/").length;
        let newWord;
        try{
        newWord=RiTa.randomWord({numSyllables:sylct,pos:pos[i]});}//lexicon.randomWord(pos[i],sylct);
        catch(e){newWord="";}
        if (newWord==""){
            newWord=words[i];
        }
        changed+=(newWord+" ");
    }
    p=createP(changed+"<br>");
    p.parent(meter);
}

function makerhyme(rs,syl){
    let pos=RiTa.pos(rs);//rs.pos();
    let words=rs.split(' ');//rs.words();
    let changed="";
    for (i=0; i<words.length;i++){
        let sylct=syl[i].split("/").length;
        let newWord;
        try{
        newWord=RiTa.rhymes(words[i],{numSyllables:sylct,pos:pos[i]});}//lexicon.rhymes(words[i],{syllables:sylct});
        catch(e){newWord=[];}
        let ind=floor(random(newWord.length));
        if (ind==0){
            newWord[ind]=words[i];
        }
        changed+=(newWord[ind]+" ");
    }
    p=createP(changed+"<br>");
    p.parent(rhyme);
}

function EXPORT(){
    console.log("EXPORTING");
    const a = document.createElement("a");
    var poemIn=output.html().replace(/\<\/p\>/g,"\n").replace(/\<p\>/g,'').replace(/\<br\>/g,'').replace(/\<h2\>[a-z|\s]+\<\/h2\>/,'');
    var metered=rhyme.html().replace(/\<\/p\>/g,"\n").replace(/\<p\>/g,'').replace(/\<br\>/g,'').replace(/\<h2\>[a-z|\s]+\<\/h2\>/,'')
    var rhymed=meter.html().replace(/\<\/p\>/g,"\n").replace(/\<p\>/g,'').replace(/\<br\>/g,'').replace(/\<h2\>[a-z|\s]+\<\/h2\>/,'')
    var postit={"input":poemIn,"rhythmic":metered, "rhyming":rhymed};
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