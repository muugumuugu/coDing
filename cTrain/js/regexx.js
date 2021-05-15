//global vars
    //dom elements
    var root;
    var txtField;
    var submit;//button
    var output;
    var matchB;//button
    var matches;
    var txt2talk;//button
    var talk;
    //-------------
    var r;//regexpression
//

//
function setup(){
    noCanvas();
    root=select('#code');
    r=/\b([a-z]+)-([a-z]+)\b/g;//flags go after the slashes. like /regex/g (g =global)
    let foot=select("#footer");
    foot.html("<b>regex:</b> <i>"+ str(r)+"</i>");
    //
    txtField=createElement('textarea',"enter text here");
    txtField.parent(root);
    txtField.id('inp');
    txtField.attribute("onfocus", "txtField.value('');");
    var lbl=createElement('label',"  >> multiline txtarea");
    lbl.parent(root);
    lbl.attribute('for', '#inp');
    lbl.attribute('class', 'regex');
    var brk0=createElement('br');
    brk0.parent(root);
    var brk00=createElement('br');
    brk00.parent(root);
    //
    submit=createElement('button',"submit");
    submit.parent(root);
    submit.mousePressed(submittxt);
    submit.attribute("onkeypress","submittxt();");
    submit.attribute('class', 'regex');
    var brk1=createElement('br');
    brk1.parent(root);
    var brk2=createElement('br');
    brk2.parent(root);
    output=createP("");
    output.parent(root);
    var brk3=createElement('br');
    brk3.parent(root);
    //
    matchB=createElement('button',"match");
    matchB.parent(root)
    matchB.mousePressed(regit);
    matchB.attribute("onkeypress","regit();");
    matchB.id("matcher")
    matchB.attribute('class', 'regex');
    var lbl1=createElement('label'," >> matching non cap word pairs");
    lbl1.parent(root);
    lbl1.attribute('for', '#matcher');
    lbl1.attribute('class', 'regex');
    //
    var brkk=createElement('br');
    var brkkk=createElement('br');
    brkk.parent(root);
    brkkk.parent(root);
    //
    matches=createDiv("");
    matches.parent(root);
    //
    txt2talk=createElement("button","talk")
    txt2talk.mousePressed(talktxt);
    txt2talk.attribute("onkeypress","talktxt();");
    txt2talk.id("talker");
    txt2talk.attribute('class', 'regex');
    txt2talk.parent(root);
    var lbl2=createElement('label'," >> convert to dbl dbl mirror talk");
    lbl2.parent(root);
    lbl2.attribute('for', '#talker');
    lbl2.attribute('class', 'regex');
    var brkkkk=createElement('br');
    brkkkk.parent(root);
    var brkkkkk=createElement('br');
    brkkkkk.parent(root);
    talk=createDiv("");
    talk.parent(root);
    //
    let trail1=createElement('br');
    let trail2=createElement('br');
    let trail3=createElement('br');
    let trail4=createElement('span','');
    trail4.html('<br><br> &nbsp;&nbsp;' );
    trail1.parent(root);
    trail2.parent(root);
    trail3.parent(root);
    trail4.attribute("class","invis");
    trail4.parent(root);
}
//

//log input
    function submittxt(){
        txtField.value(txtField.value()+"\n")
        output.html(output.html()+txtField.value().split('\n').join('<br>'));
        txtField.value('');
        nxt=document.getElementById('inp');
        nxt.focus();
    }
//

//find matchs
    function regit(){
        s=output.html().split('<br>').join('\n');
        var div=createDiv(s.match(r)+'<br>');
        div.attribute('class',"regarray");
        var res=r.exec(s);
        while (res!=null){
            var collect=createElement('i',res.join(', '));
            var brkk=createElement('br');
            collect.parent(div);
            brkk.parent(div);
            res=r.exec(s);
        } 
        var brk=createElement('br');
        div.parent(matches);
        brk.parent(matches);
       // console.log(r.test(s));
    }
//
//to talk
    function talktxt(){
        s=output.html().split('<br>').join('\n');
        var div=createDiv('');
        div.attribute('class',"talk");
        var res=s.replace(r,replacer).split("\n").join("<br>").slice(0,-4);
        var collect=createElement('i',"");
        collect.html(res)
        var brkk=createElement('br');
        collect.parent(div);
        brkk.parent(div); 
        var brk=createElement('br');
        div.parent(talk);
        brk.parent(talk);
       // console.log(r.test(s));
    }
        //------------------
    function replacer(matchstr){
        //console.log(matchstr);//find result
        grps=Object.values(arguments);
        grps=grps.slice(0,arguments.length-2);
        return(grps[1].toUpperCase()+grps[1].toLowerCase() +grps[2].toLowerCase()+grps[2].toUpperCase());//replace argument
    }
//