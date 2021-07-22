var blog;
let blob;
let saveblob;
let postlst=[];
let saveposts;
//=============================================================
function preload(){
    blog=loadJSON("blog.json");
}
//=============================================================
function setup(){
    noCanvas();
    blob=blog.posts;
    for (let i=0;i<blob.length ; i++){
        if (blob[i].type=="regular"){
            let postjson;
            let taglst;
            let post=blob[i]["regular-body"];
            if(typeof(blob[i]['tags']) == 'undefined'){
                taglst=["No tags", "aww shucks"];
            }else{
                taglst=blob[i]["tags"]
            }
            let tagStr="";
            let titleExt=blob[i]["regular-title"];+'<br';
            let root= document.createElement('div');
            let titleEl=document.createElement('h3');
            let contentEl= document.createElement('div');
            let tagstream=document.createElement('I');
            titleEl.innerHTML= titleExt;
            contentEl.innerHTML=post;
            let brk1=document.createElement('br');
            let brk2=document.createElement('hr');
            for (let j=0; j<taglst.length;j++){
                tagStr+=(taglst[j]+'<br>');
            }
            tagstream.innerHTML=tagStr;
            root.append(titleEl,contentEl,brk2,tagstream,brk1);
            document.body.append(root);
            postjson={title: titleExt, content:post, tags: taglst}
            append(postlst,postjson) // saving to minified json
        }
        if (blob[i].type=="answer"){
            let taglst;
            let q=blob[i]["question"];
            let a=blob[i]["answer"];
            if(typeof(blob[i]['tags']) == 'undefined'){
                taglst=["No tags", "aww shucks"];
            }else{
                taglst=blob[i]["tags"]
            }
            let tagStr="";
            let titleExt=blob[i]["regular-title"];
            let root= document.createElement('div');
            let titleEl=document.createElement('h3');
            let contentEl= document.createElement('div');
            let tagstream=document.createElement('I');
            titleEl.innerHTML= titleExt+'<br>';
            let post=q+a;
            contentEl.innerHTML=q +a;
            let brk1=document.createElement('br');
            let brk2=document.createElement('hr');
            for (let j=0; j<taglst.length;j++){
                tagStr+=(taglst[j]+'<br>');
            }
            postjson={title: titleExt, content:post, tags: taglst}
            tagstream.innerHTML=tagStr;
            root.append(titleEl,contentEl,brk2,tagstream,brk1);
            document.body.append(root);
            append(postlst,postjson) // saving to minified json
        }
    }
    saveposts={blog: postlst};
    let button=createButton("save");
    button.mouseClicked(export2txt);
    console.log("DONE");
}
//===================================================================
function export2txt() {
    const a = document.createElement("a");
    a.href = URL.createObjectURL(new Blob([JSON.stringify(saveposts, null, 2)], {
      type: "text/plain"
    }));
    a.setAttribute("download", "data.txt");
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
  }
//=====================================================================
