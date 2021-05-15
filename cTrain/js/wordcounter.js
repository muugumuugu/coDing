var txt;
var tokens={};
var keys=[];
//
var root;

function preload(){
    txt=loadStrings("../resources/main.txt");
}

function setup(){
    root=select('#code')
    root.html('');
    root.html('<b style="background-color:#FFFF00;">&nbsp;word:count</b><br>')
    //
    var allwords=txt.join("\n");
    var words=allwords.split(/\W+/);
    for (i=0; i<words.length; i++){
        var word=words[i].toUpperCase();
        if (tokens[word]==undefined){
            tokens[word]=1;
            //keys.push(word);
        }
        else{
            tokens[word]++;
        }
    }
    //
    keys=Object.keys(tokens);
    dict=JSON.stringify(tokens, null, 2)
   // let p=createP(dict);
   // p.parent(root);
   // brk=createElement('hr');
  //  brk.parent(root);
    //
    keys.sort();//alphabetical ascending
    keys.sort(compare);
   // wrdlist=""
   //let d=createP("");
   //d.parent(root);
  // d.attribute('class','tokenz');
    for (j=0; j<keys.length;j++){
        let key=keys[j];
        let ct=tokens[key];
        let d=createP(key +':' + ct );
        d.parent(root);
        d.attribute('class','tokenz');
        //wrdlist+= (key +':' + ct +'<br></br>');
    }
   // d.html(wrdlist);
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


function compare(a,b){
    var ctA=tokens[a];
    var ctB=tokens[b];
    return ctB-ctA;//descending
}