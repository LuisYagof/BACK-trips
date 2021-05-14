const mysql = require('mysql');

// const DB = mysql.createConnection({
//   host     : 'localhost',
//   user     : 'root',
//   password : 'root',
//   database : 'coursenine'
// });

const DB = mysql.createConnection({
  host     : 'database-1.cgms0uqi3vl9.eu-west-1.rds.amazonaws.com',
  user     : 'admin',
  password : 'Trip2021',
  database : 'coursenine'
});

module.exports = DB