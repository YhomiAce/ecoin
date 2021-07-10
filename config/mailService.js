const nodemailer = require("nodemailer");
const parameters = require("./params");

exports.sendMailService = async({email, output}) =>{
    let transporter = nodemailer.createTransport({
        host: parameters.EMAIL_HOST,
        port: parameters.EMAIL_PORT,
        secure: true, // true for 465, false for other ports
        auth: {
          user: parameters.EMAIL_USERNAME, // generated ethereal user
          pass: parameters.EMAIL_PASSWORD, // generated ethereal password
        },
    });

      // send mail with defined transport object
    let mailOptions = {
        from: ` "TOBBY EPAY COIN" <${parameters.EMAIL_USERNAME}>`, // sender address
        to: `${email}`, // list of receivers
        subject: "[Epay] Please activate your account", // Subject line
        text: "Epay", // plain text body
        html: output, // html body
    };
    transporter.sendMail(mailOptions, (err, info)=>{
        if (err) {
            req.flash("error", "Error sending mail");
            res.redirect("back");
        }
    })
}