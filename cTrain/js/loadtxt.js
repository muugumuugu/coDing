//dom
    var txt;
    var root;
    var defaultarea;
    var button;

// Default File Locn , loading using P5
function loadFile(){
    console.log("LOADING...")
    loadStrings("../resources/main.txt", fileLoaded);
}
function fileLoaded(data){
    console.log("LOADED!");
    txt=data;
    defaultarea.value(txt.join("\n"));
}
//

//P5 loading selected file, works 4 only .txt types 
function fileSelected(file){
    string=file.data;
    p5area.value(file.data);
}
//
function setup(){
    noCanvas();
    root=select('#code');
    //
    defaultarea=select('#defOut')
    //
    button=select('#loadP5Def');
    button.mousePressed(loadFile);
    //
    lblP5B=createElement('label','&gt;&gt; Load selected File using P5&nbsp;');
    lblP5B.attribute('class','dark');
    lblP5B.attribute('for','p5Selector');
    lblP5B.parent(root);
    //
    brk=createElement('br');
    brk.parent(root);
    brk0=createElement('br');
    brk0.parent(root);
    //
    inp=createFileInput(fileSelected);
    inp.parent(root);
    inp.id('p5Selector')
    //
    brk1=createElement('br');
    brk1.parent(root);
    brk2=createElement('br');
    brk2.parent(root);
    //
    lblP5=createElement('label','Loaded txt from selected file of P5 loader:&nbsp;');
    lblP5.attribute('class','dark');
    lblP5.attribute('for','p5Out');
    lblP5.parent(root);
    //
    brk3=createElement('br');
    brk3.parent(root);
    brk4=createElement('br');
    brk4.parent(root);
    //
    p5area=createElement('textarea','');
    p5area.attribute('class','lake');
    p5area.id('p5Out');
    p5area.parent(root);
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