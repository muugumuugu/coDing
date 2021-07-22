IntDict counts;

void setup(){
  size(600,600);
  counts= new IntDict();
  //can use loadStrings
  String  txt = "Chromatin is a complex of DNA, protein and RNA found in eukaryotic cells.Its primary function is packaging long DNA molecules into more compact, denser structures. This prevents the strands from becoming tangled and also plays important roles in reinforcing the DNA during cell division, preventing DNA damage, and regulating gene expression and DNA replication. During mitosis and meiosis, chromatin facilitates proper segregation of the chromosomes in anaphase; the characteristic shapes of chromosomes visible during this stage are the result of DNA being coiled into highly condensed chromatin.The primary protein components of chromatin are histones, which bind to DNA and function as' +' anchors'+' around which the strands are wound. In general, there are three levels of chromatin organization:    DNA wraps around histone proteins, forming nucleosomes and the so-called beads on a string structure (euchromatin).  Multiple histones wrap into a 30-nanometer fibre consisting of nucleosome arrays in their most compact form (heterochromatin).  Higher-level DNA supercoiling of the 30-nm fiber produces the metaphase chromosome (during mitosis and meiosis).Many organisms, however, do not follow this organization scheme. For example, spermatozoa and avian red blood cells have more tightly packed chromatin than most eukaryotic cells, and trypanosomatid protozoa do not condense their chromatin into visible chromosomes at all. Prokaryotic cells have entirely different structures for organizing their DNA (the prokaryotic chromosome equivalent is called a genophore and is localized within the nucleoid region).The overall structure of the chromatin network further depends on the stage of the cell cycle. During interphase, the chromatin is structurally loose to allow access to RNA and DNA polymerases that transcribe and replicate the DNA. The local structure of chromatin during interphase depends on the specific genes present in the DNA. Regions of DNA containing genes which are actively transcribed' +' ('turned on') are less tightly compacted and closely associated with RNA polymerases in a structure known as euchromatin, while regions containing inactive genes ('turned off') are generally more condensed and associated with structural proteins in heterochromatin.[3] Epigenetic modification of the structural proteins in chromatin via methylation and acetylation also alters local chromatin structure and therefore gene expression. The structure of chromatin networks is currently poorly understood and remains an active area of research in molecular biology.";
  String[] words=splitTokens(txt,"\n ,.?:;'[]`!@#$%^&*()-=+\"");
  //
  for (int i=0;i<words.length;i++){
    String word=words[i].toLowerCase();
    if (counts.hasKey(word)){counts.increment(word);}
    else{counts.set(word,1);}
  }
  
  String[] keys=counts.keyArray();
  for (String k: keys){
    int ct=counts.get(k);
    float x=random(width);
    float y=random(height);
    textSize(ct*8);
    text(k,x,y);
  }
  
}
