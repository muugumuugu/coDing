//Data 4 Modelling
    //loadings
    var insults;
    function preload(){
        insults=loadStrings("../resources/insults.txt");
    }
//MarKov
    var order=3;// higher = more like model
    var Ngrams={};
    var leng4Gen=500;
//tokenization
    var txt;
    var initials=[];
//dom
    var root;
    var button;
    var generatedtxt;
    var genlength;
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
        button.mousePressed(function(){gen();});
        button.parent(root);
        button.attribute("onkeypress","gen();");
        brk1="";
        //
        genlength=createSlider(5,5000,100);
        genlength.parent(root);
        genlength.id('genlen');
        let lbl=createElement('label' ,' &gt;&gt;Max number of Characters: 100');
        lbl.attribute('for','genlen')
        lbl.parent(root);
        lbl.attribute('class','solaris');
        genlength.changed(function(){leng4Gen=genlength.value(); lbl.html(' &gt;&gt;Max number of Characters: '+ leng4Gen)});
        //
        generatedtxt=createDiv('');
        generatedtxt.parent(root);
        generatedtxt.attribute("class","grass")
        //
        createPadding();
    //Make a Model from the Data
        for (let j=0; j<insults.length;j++){
            txt= insults[j];
            //n grams for markov @ character level
            for (let k=0; k<=txt.length-order;k++){
                let gram=txt.substring(k,k+order);
                if(k==0){initials.push(gram);}
                if (!Ngrams[gram]){Ngrams[gram]=[];}
                if ((k+3)<txt.length){Ngrams[gram].push(txt.charAt(k+order));}
                else{Ngrams[gram].push(" ");}
                
            }
        }
    //
}

//generate random txt beginning @ same first three characters as txt
function gen(){
    var curGram=random(initials) ;
    var res=curGram;
    //
    for (let i=0; i<leng4Gen; i++){
        var possNxtChars=Ngrams[curGram];
        if (!possNxtChars){break;}
        else{
            var nxtChar=random(possNxtChars);
            res+=nxtChar;
            curGram=curGram.substring(1,order)+nxtChar;
        }
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
