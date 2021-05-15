//dom
    var root;
    //
    var txtField;
    var fieldOUT;
    var button;
    var exportB;
//rhymeapi=`https://rhymebrain.com/talk?function=getRhymes&word={Word}&maxResults=1`
//JSON data
    var rhymelog=[];
    var inpPoem="";
    var postit={};

function setup() {
    noCanvas();
    root=select('#code');
        txtField=createElement("textarea");
        txtField.id("txtfield");
        txtField.attribute('class','orchid');
        lbl = createElement("label"," >> Enter txt here&nbsp;");
        lbl.attribute("for","txtfield");
        lbl.attribute('class','dark');
        txtField.parent(root);
        lbl.parent(root);
        var brk =createElement("br");
        brk.parent(root);
        button=createButton("SUBMIT");
        button.id("submit");
        button.parent(root);
        exportB=createButton("EXPORT");
        exportB.id("export");
        exportB.parent(root);
        fieldOUT=createP("");
        fieldOUT.attribute('class','sky');
        fieldOUT.parent(root);
    //
    button.mousePressed(submit);
    button.attribute("onkeypress","submit();");
    exportB.mousePressed(EXPORT);
    exportB.attribute("onkeypress","EXPORT();");
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

function submit() {
  if (!inpPoem==""){
    d=new Date();
    idd=nf(d.getHours(),2,0)+"-"+nf(d.getMinutes(),2,0)+"-"+nf(d.getSeconds(),2,0);
    //
    postit[idd]={"inpPoem":inpPoem,"rhymeLog":rhymelog};
    console.log(postit);
  }
  //
  inpPoem=txtField.value();
  lines=inpPoem.split("\n");
  //
  outp=[];
  ctr=0;
  //
  r=/\w+/;
  for (i=0;i<lines.length;i++){
    let line=lines[i].split(/\b\*?\b/);
    newline="";
    for (j=0;j<line.length;j++){
        if (!r.test(line[j])){
            newline+="<span class='nonwrd'>"+line[j]+"</span>";}
        else{
            newline+="<span class='wrd' id='wrd" +str(ctr) +"' onclick=" +"'clickedwrd(" + str(ctr) +");'>"+line[j]+"</span>";
            ctr++;
        }
    
    }
    outp.push(newline);
  }
  //
  fieldOUT.html(outp.join("<br>"));
  //
  txtField.value('');
  rhymelog=[];
  //
  var nxt=document.getElementById('txtfield')
  nxt.focus();
}

async function clickedwrd(ctr){
    let idd='wrd'+ctr;
    ele=document.getElementById(idd);
    let wrd=ele.textContent
    const rhyme=`https://rhymebrain.com/talk?function=getRhymes&word=${wrd}`;//&maxResults=1`;
    const fetched=await fetch(rhyme, {method: "GET"});
    const json= await fetched.json();
    ele.innerHTML=json[floor(random(json.length/33))].word;
    newPoem=fieldOUT.html().replace(/\<\/*?span.*?\>/g,'').replace(/\<br\>/g,"\n");
    rhymelog.push(newPoem);
}

function EXPORT(){
  if (!inpPoem==""){
      d=new Date();
      idd=nf(d.getHours(),2,0)+"-"+nf(d.getMinutes(),2,0)+"-"+nf(d.getSeconds(),2,0);
      //
      postit[idd]={"inpPoem":inpPoem,"rhymeLog":rhymelog};
    }
  console.log("EXPORTING");
  const a = document.createElement("a");
  a.href = URL.createObjectURL(new Blob([JSON.stringify(postit, null, 2)], {
      type: "text/plain"
    }));

  var fname="rhymebot";
  a.setAttribute("download",fname+".json");
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
  //
  inpPoem='';
  txtField.value('');
  rhymelog=[];
  //
  var nxt=document.getElementById('txtfield')
  nxt.focus();
  fieldOUT.html('');
  console.log('EXPORTED!');
  }