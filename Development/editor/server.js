var express = require('express');
var http = require('http').Server(app)
var app = express();

app.get('/',function(req,res){
    res.sendFile("src/"+"index.html",{root: __dirname})

})
var server = app.listen(5000, () => {
    console.log('server is running on port', server.address().port);
   });
app.use(express.static(__dirname+"/src/index.html"));

