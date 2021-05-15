var inputEl;//inputBox
var txtField;//txtArea
var output;//show typing response
var fieldOUT;//
var logel;// collect updating inputs
var button;//
var root;

function setup() {
    noCanvas();
    root=select('#code');
    // creating a input instead of creating in and selecting it from html because woohoo runtime dynamics
    lbl=createElement('label',"&nbsp;Input Box:");
    lbl.attribute('for',"inp");
    lbl.attribute('class','dark')
    lbl.parent(root);
    var spn=createElement('span',"&nbsp;");
    spn.parent(root);
    spn.attribute('class',"invis");
    inputEl = createInput(""); // can push default text.
    inputEl.attribute("placeholder","type here...");
    inputEl.mousePressed(function(){inputEl.value("")});//clear txt
    inputEl.changed(newText); // after enter all text
    inputEl.input(newTyping); // as i type
    inputEl.parent(root);
    inputEl.id('inp');
    output = select('#INPout');
    txtField = select('#txtfield');
    logel = select('#logging');
    fieldOUT = select('#fieldout');
    button= select('#submit');// for multiline txtarea.
    //
    button.mousePressed(submit);
    let trail1=createElement('br');
    let trail2=createElement('br');
    let trail3=createElement('br');
    let trail4=createElement('span','');
    trail4.html('<br><br> &nbsp; &nbsp; ' );
    trail1.parent(root);
    trail2.parent(root);
    trail3.parent(root);
    trail4.attribute("class","invis");
    trail4.parent(root);
}

function newText() {
var line=createElement('I',inputEl.value()+'<br>');
line.parent(logel);
inputEl.value("");
}

function newTyping() {
output.html(inputEl.value());
}

function submit() {
fieldOUT.html(txtField.value().split("\n").join("<br>"));
nxt=document.getElementById('txtfield');
nxt.focus();
}