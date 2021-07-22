
var blog;//json file
let blob;// loaded object



//=============================================================
function preload(){
    blog=loadJSON("blog.json");
}
//=============================================================
function setup(){
    noCanvas();
    blob=blog.blog;
    for (let i=0;i<blob.length ; i++){
        let taglst=blob[i]["tags"];
        let content=blob[i]["content"];
        //
		//
        let title=blob[i]["title"];
        let tagStr="";
        for (let j=0; j<taglst.length;j++){
            tagStr+=(taglst[j]+'<br>');
        }
        //--------------------------------------
        let root= document.createElement('div');
        let titleEl=document.createElement('h3');
        let contentEl= document.createElement('div');
        let cleanEl=document.createElement('div');
        let tagstream=document.createElement('I');
        //----------------------------------
        let brk1=document.createElement('br');
        let brk2=document.createElement('hr');
        titleEl.innerHTML= title;
        contentEl.innerHTML=parsehtml(content)
        tagstream.innerHTML=tagStr;
            var s = new Sanitize("RESTRICTRED");
    var cleaned_html = s.clean_node(contentEl);
    cleanEl.appendChild(cleaned_html)
        root.append(titleEl,cleanEl,brk2,tagstream,brk1);
        document.body.append(root);

    }
    console.log("DONE");
}
