const mysql = require('mysql');

const DB = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'route123',
  database : 'appcourses'
});

module.exports = DB