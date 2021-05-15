let input = document.getElementById('loadInd');
let textarea = document.getElementById('indOutput');

input.addEventListener('change', () => {
    let files = input.files;
    if (files.length == 0) return;
    var file = files[0];
    let reader = new FileReader();
    reader.onload = (e) => {
        var file = e.target.result;
        //const lines = file.split(/\r\n|\n/);
        textarea.value = file;//lines.join('\n');
    };
    reader.onerror = (e) => alert(e.target.error.name);
    reader.readAsText(file);
    });