const mysql = require('mysql');

const DB = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'root',
  database : 'appcourses'
});

module.exports = DB