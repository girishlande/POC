This project will demo how to use Database sqlite3 with electron. 
Steps are followed from following help document. 
https://www.aljaiban.com/post/setting-up-electron-with-sqlite-on-windows

follow these commands. 

git clone https://github.com/electron/electron-quick-start               

cd electron-quick-start    

npm install

npm start

this should run your electron application 

npm install sqlite

npm start

copy following code at the beginning of main.js

// --------------------------------------------------------------
const sqlite = require('sqlite3').verbose();
function connectMemoryDB() {
    let db = new sqlite.Database(':memory:', (err) => {
        if (err) {
            return console.error(err.message);
        }
        console.log('connected to the in-memory SQlite database');
    });
}
// --------------------------------------------------------------

Try to run application and you will get error 

This is because SQLite is a native Node module and it has not been built for Electron targeting the platform I am using. To build this follow

npm install --save-dev electron-rebuild

# Every time you run "npm install", run this:
./node_modules/.bin/electron-rebuild

# On Windows if you have trouble, try:
.\node_modules\.bin\electron-rebuild.cmd


Now it should build and run your application and you should be able to connect
to the database 

