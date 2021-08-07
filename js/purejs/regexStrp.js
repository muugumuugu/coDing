var anchors = document.querySelectorAll("A");

for ( var i=0; i < anchors.length; i++ ) {
    var span = document.createElement("SPAN");
    if ( anchors[i].className ) {
        span.className = anchors[i].className;
    }

    if ( anchors[i].id ) {
        span.id = anchors[i].id;
    }

    span.innerHTML = anchors[i].innerHTML;

    anchors[i].parentNode.replaceChild(span, anchors[i]);
}



///


var parent = getElementById('parentid');
var child = document.getElementById('imagex');
parent.removeChild(child);

///
/****************************************************************************/
// Remove Or Strip All HTML Tags In Content Using Regex
/****************************************************************************/
const originalString = "<h1>Hey <i>that's<u> <i>something</i>&lt;/h1>";
const strippedString = originalString.replace(/<\s*h4[^>]*>(.*?)<\s*/\s*h4>/gi, "");
console.log(strippedString);
