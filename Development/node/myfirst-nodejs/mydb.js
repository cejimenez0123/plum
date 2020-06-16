var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   var dbo = db.db("mydb");
//   dbo.createCollection("customers", function(err, res) {
//     if (err) throw err;
//     console.log("Collection created!");
//     db.close();
//   });
// });
// MongoClient.connect(MONGO_URL, {
//     useUnifiedTopology: true}).then(()=>{
//      console.log(`connection to database established`)
//  }).catch(err=>{
//      console.log(`db error ${err.message}`);
//      process.exit(-1)
//  })



MongoClient.connect(url,{useUnifiedTopology:true}, function(err, db) {
    var dbo = db.db("mydb")
    if (err) throw err;
    dbo.collection("customers").find({}).toArray( function(err,res) {
      if (err) throw err;
        console.log(res)
      db.close();
    })})

//  MongoClient.connect(url,
//     {useUnifiedTopology: true}, function(err, db) {
//     if (err) throw err;
//     var dbo = db.db("mydb");
//     var myobj = { name: "Bake Inc", address: "Highway 37" };
//     dbo.collection("customers").insertOne(myobj, function(err, res) {
//       if (err) throw err;
//       console.log("1 document inserted");
//       db.close();
//     });
//   });