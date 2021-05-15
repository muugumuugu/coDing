//grammer elements
    var story={
        "start":["$init $plot  $end"],
        "init":["It was a $adj rainy $time."],
        "adj":["dark","sleepy","quite"],
        "protagNs":["bloopy","mooshy","mogi","lomo"],
        "protagSt":["dragon","unicorn","rainbow-bunny"],
        "protags":["$protagNs the $protagSt "],
        "plot":[ "$protags went for a long $vehicle ride."],
        "vehicle":["bicycle","train"],
        "time":["night","evening","morning","afternoon"],
        "end":["They then came back to have cozy $time ahead."],
    }
    // production rules //old syntax :between <>  syntax for replace me
    var rgramm;
    var json;
//dom
    //native
        var root;
        function createPadding(){
            let trail1=createElement('br');
            let trail2=createElement('br');
            let trail3=createElement('br');
            let trail4=createElement('span','');
            trail4.html('<br>&nbsp;<br><br><br><br> &nbsp;&nbsp;<br><br><br><br><br><br> &nbsp;&nbsp;<br><br><br><br><br> &nbsp;&nbsp;<br><br><br> &nbsp;&nbsp;<br><br><br><br><br> &nbsp;&nbsp; ' );
            trail1.parent(root);
            trail2.parent(root);
            trail3.parent(root);
            trail4.attribute("class","invis");
            trail4.parent(root);
        }
        var footer;
    // to make
    var button;
    var storyArea;
    var natgeostills;
    var haikuOut;

function preload(){
    json=loadJSON('../resources/haiku.json');
}

function setup(){
noCanvas;
//dom shit
    root=select('#code')
    root.html('');
    //
    footer=select('#footer');
    storyB=createButton("Tell Story");
    storyB.parent(root);
    storyB.style("width:auto;");
    storyB.mousePressed(tellstory);
    haikuB=createButton("Spit out Haiku");
    haikuB.parent(root);
    haikuB.style("width:auto;");
    haikuB.mousePressed(haiku);
    natgeoB=createButton("NAtGeo snaps as tXt");
    natgeoB.parent(root);
    natgeoB.style("width:auto;");
    natgeoB.mousePressed(natgeoshots);
    brk=createElement('br');
    brk.parent(root);
    brkk=createElement('br');
    brkk.parent(root);
    //
    storyArea=createDiv('<h2>cozy day went lyk dis:</h2>');
    storyArea.parent(root);
    storyArea.attribute('class','grass')
    haikuOut=createDiv('<h2>Haiku bots Masterpiece:</h2>');
    haikuOut.parent(root);
    haikuOut.attribute('class','grass');
    natgeostills=createDiv('<h2>Nat Geo Snaps:</h2>');
    natgeostills.parent(root);
    natgeostills.attribute('class','grass')
    createPadding();
}

function haiku(){
    //rgramm=new RiTa.RiGrammar();
   // rgramm.loadFrom('../resources/haikuGrammer.json',haikuGrammarLoaded);//
    rgramm= new RiTa.RiGrammar.fromJSON(JSON.stringify(json,2,null));
    haikuGrammarLoaded();
}
function haikuGrammarLoaded(){
    console.log('loaded haiku grammar');
    display(haikuOut);
}


function natgeoshots(){
    rgramm=new RiTa.RiGrammar();
    rgramm.addRule('start','The $N  $V',1);
    rgramm.addRule('N', 'cat[8]|kitty[8]|unicorn[5]|kiwi[10]|ostrich[10]|emu[10]');
    rgramm.addRule('V','runs[10] | buries head in sand[10]| saunters[8]|curls up[8] | makes noise[10]');
    console.log('created NatGeo snapshot Grammar');
    //
    display(natgeostills);
}

function tellstory(){
    rgramm= new RiTa.RiGrammar(story);
    console.log("passed in cozy times story json object as grammer");
    //
    display(storyArea);
}

function display(ele){
    var res=rgramm.expand();
    p=createP(res.split("%").join("<br>"));
    p.attribute("class","sky");
    p.parent(ele);
}
