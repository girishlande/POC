const sqlite = require('sqlite3').verbose();
var db = new sqlite.Database('mydb.db');
db.serialize(function () {
    writeLog('connected to mydb.db SQlite database');
    db.each("SELECT rowid AS id, info FROM logInfo", function (err, row) {
        writeUILog(row.info);
    });
});
db.run("CREATE TABLE if not exists logInfo (info TEXT)");

function closeDB() {
    db.close();
}

function getRandom() {
    return Math.round(Math.random() * 100);
}
function insertRecord() {
    writeLog('Inserting record:' + getRandom());
}

function deleteRecord() {
    writeLog('Deleting record:' + getRandom());
}

function updateRecord() {
    writeLog('Updating record:' + getRandom());
}


function writeDBLog(logText) {
    var stmt = db.prepare("INSERT INTO logInfo VALUES (?)");
    stmt.run(logText);
    stmt.finalize();
}