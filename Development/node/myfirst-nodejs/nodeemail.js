var nodemailer = require('nodemailer');
var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: 'christianjimenez0123@gmail.com',
      pass: 'Marmalade1'
    }
  });
  
  var mailOptions = {
    from: 'christianjimenez0123@gmail.com',
    to: 'cejim100@syr.eud',
    subject: 'Sending Email using Node.js',
    text: 'That was easy!'
  };
  
  transporter.sendMail(mailOptions, function(error, info){
    if (error) {
      console.log(error);
    } else {
      console.log('Email sent: ' + info.response);
    }
  });