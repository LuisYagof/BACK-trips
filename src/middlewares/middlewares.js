const md5 = require('md5')
const jwt = require('jsonwebtoken');
const cryptoRS = require('crypto-random-string')
const ENV = require('dotenv').config({ path: './src/config/.env' });
const nodemailer = require('nodemailer');

function hash(string) {
    return md5(string)
}

const emailIsValid = (email) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
const passIsValid = (pass) => /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/.test(pass)
const nameIsValid = (name) => /^[a-zA-Z0-9]{4,16}$/.test(name)

function randomString(){
    return cryptoRS({length: 10, type: 'base64'})
}

function createToken(email, ID, secret, expiration){
    return jwt.sign({email: email, id: ID}, secret, {expiresIn: expiration})
}

function decodeToken(token){
    return jwt.decode(token)
}

function verifyToken(token, secret){
    return jwt.verify(token, secret)
}

function mailPassword(mail, token){
    const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: process.env.USER,
            pass: process.env.PASS
        }
    });
      
    let message = `Puedes actualizar tu contraseña clicando en este enlace: http://localhost:4000/password?tok=${token}.`;
      
    let mailOptions = {
    from: 'x@gmail.com',
    to: mail,
    subject: 'RECUPERA TU CONTRASEÑA',
    text: message
    };

    transporter.verify(function(error, success) {
        if (error) {
        console.log(error);
        } else {
        console.log("Server is ready to take our messages");
        }
    });
      
    transporter.sendMail(mailOptions, function(error, info){
        if (error) {
            return error;
        } else {
            return 'Email enviado: ' + info.response;
        }
    });
}

module.exports = {
    hash, randomString, emailIsValid, passIsValid, nameIsValid,
    createToken, decodeToken, verifyToken, mailPassword
}
