// This file is required by the index.html file and will
// be executed in the renderer process for that window.
// No Node.js APIs are available in this process because
// `nodeIntegration` is turned off. Use `preload.js` to
// selectively enable features needed in the rendering
// process.
const remote = require('electron').remote;

var insertRecordBtn = document.getElementById('insertRecord');
insertRecordBtn.addEventListener('click', (e) => {
    e.preventDefault();
    insertRecord();
});

var updateRecordBtn = document.getElementById('updateRecord');
updateRecordBtn.addEventListener('click', (e) => {
    e.preventDefault();
    updateRecord();
});

var deleteRecordBtn = document.getElementById('deleteRecord');
deleteRecordBtn.addEventListener('click', (e) => {
    e.preventDefault();
    deleteRecord();
});


document.getElementById("close-btn").addEventListener("click", function (e) {
    closeDB();

    var window = remote.getCurrentWindow();
    window.close();
}); 


function writeLog(outText) {
    writeUILog(outText);
    writeDBLog(outText);
}

function writeUILog(outText) {
    var outTextArea = document.getElementById('output');
    outTextArea.textContent += "\n";
    outTextArea.textContent += outText;
}