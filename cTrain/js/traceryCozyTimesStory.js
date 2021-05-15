    var story={
        "main":["#start# #[protag:#protags#]plot# #end#"],
        "start":["It was a #adj# rainy #time#."],
        "adj":["dark","sleepy","quite"],
        "protagNs":["bloopy","mooshy","mogi","lomo"],
        "protagSt":["dragon","unicorn","rainbow-bunny"],
        "protags":["#protagNs.capitalize# the #protagSt# "],
        "plot":[ "#protag#went for a long #vehicle# ride."],
        "vehicle":["bicycle","train"],
        "time":["night","evening","morning","afternoon"],
        "end":["They then came back to have cozy #time.s# ahead."],
    }// production rules //between ## >> replace me
    var grammer;
//dom
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
    //
    var button;
    var storyArea;

function setup(){
    noCanvas;
    //dom shit
        root=select('#code')
        root.html('');
        //
        footer=select('#footer');
        footer.html("rules:&nbsp; <br>" + JSON.stringify(story,2,null).split(/\"\]\,/).join(('\"\]\,<br>'))+"<br>&nbsp;");
        //
        button=createButton("Tell Story");
        button.parent(root);
        button.mousePressed(tellstory);
        brk=createElement('br');
        brk.parent(root);
        //
        storyArea=createDiv('<h2> cozy times:</h2>');
        storyArea.parent(root);
        storyArea.attribute('class','grass')
        createPadding();
    //story making
        grammer=tracery.createGrammar(story);//use a spellbook or similar structured source works beaut.
        seed='#main#';
}

function tellstory(){
    var result=grammer.flatten(seed);//end result of of xpansion of seed(non-terminal) by production rules. 
    p=createP(result);
    p.attribute("class","sky");
    p.parent(storyArea);
}
