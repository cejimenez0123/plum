var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "fam",
  password: "macbook20",
database: "name"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});