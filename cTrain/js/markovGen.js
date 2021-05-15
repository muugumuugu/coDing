//Data 4 Modelling
    //loadings
    var lines;
    function preload(){
        lines=loadStrings("../resources/main.txt");
    }
    //parsing
    var txt;
    var words;
//MarKov
    var order=6;// higher = more like model
    var Ngrams={};
    var leng4Gen=500;
//tokenization
    var tokens={};
    var keys=[];
//dom
    var root;
    var button;
    var generatedtxt;
    function createPadding(){
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
//---------------------------------------------------------

function setup(){
    //dom
        root=select('#code')
        root.html('');
        //
        button=createButton("GeneraTe");
        button.mousePressed(function(){gen(leng4Gen);});
        button.parent(root);
        button.attribute("onkeypress",`gen({leng4Gen});`)
        //
        generatedtxt=createDiv('');
        generatedtxt.parent(root);
        generatedtxt.attribute("class","grass")
        //
        createPadding();
    //parse input
        txt=lines.join("\n");
        //txt=txt.substring(0,100);//shortening it
        words=txt.split(/\W+/);
    //Tokenizing words
        for (i=0; i<words.length; i++){
            var word=words[i].toUpperCase();
            if (tokens[word]==undefined){tokens[word]=1;}
            else{tokens[word]++;}
        }
        //
        keys=Object.keys(tokens);
        keys.sort();//alphabetical ascending
        keys.sort(compare);
    //n grams for markov @ character level
        for (let k=0; k<=txt.length-order;k++){
            let gram=txt.substring(k,k+order);
            if (!Ngrams[gram]){Ngrams[gram]=[];}
            if ((k+3)<txt.length){Ngrams[gram].push(txt.charAt(k+order));}
            else{push("");}
            
        }
    //
}

//generate random txt beginning @ same first three characters as txt
function gen(genL){
    var curGram=txt.substring(0,order); // to begin with
    var res=curGram;
    //
    for (let i=0; i<genL; i++){
        var possNxtChars=Ngrams[curGram];
        if (!possNxtChars){break;}
        var nxtChar=random(possNxtChars);
        res+=nxtChar;
        curGram=curGram.substring(1,order)+nxtChar;
    }
    p=createP(res);
    p.attribute("class","sky");
    p.parent(generatedtxt);
    brk=createElement('br')
    brk.parent(generatedtxt);
}

//ordering for words by wordfreq in txt.
function compare(a,b){
    var ctA=tokens[a];
    var ctB=tokens[b];
    return ctB-ctA;//descending
}
