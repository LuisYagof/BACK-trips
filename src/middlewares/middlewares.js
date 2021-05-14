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
const nameIsValid = (name) => /^[a-zA-Z ,.'_-áéíóúñ]{4,36}$/.test(name)

function randomString() {
	return cryptoRS({ length: 10, type: 'base64' })
}

function createToken(email, ID, rol, nombre, secret, expiration) {
	return jwt.sign({ email: email, id: ID, rol: rol, nombre: nombre }, secret, { expiresIn: expiration })
}

function decodeToken(token) {
	return jwt.decode(token)
}

function verifyToken(token, secret) {
	return jwt.verify(token, secret)
}

function mailPassword(mail, token) {
	const transporter = nodemailer.createTransport({
		name: "CourseNine",
		host: "coursenineapp.com",
		port: 25,
		pool: true,
		secure: false,
		service: 'gmail',
		auth: {
			user: process.env.USER,
			pass: process.env.PASS
		},
		tls: {
			rejectUnauthorized: false
		}
	});

	let mailOptions = {
		from: 'coursenineapp@gmail.com',
		to: mail,
		subject: 'RECUPERA TU CONTRASEÑA',
		html: `
		<table border="0" cellpadding="0" cellspacing="0" width="600px" margin="20px auto" background-color="#5BA092" bgcolor="#5BA092">
			<tr height="200px">  
			<td bgcolor="" width="600px">
					<h1 style="color:#FDFDFD; text-align:center"> ¡Vaya! Parece que olvidaste tu contraseña </h1>
					<h3 style="color:#FDFDFD; text-align:center">
					Pulsa en 
							<a href="http://localhost:3000/actualizar?tok=${token}" style="color:#E3562A">éste enlace</a> 
							para recuperarla.
					</h3>
					</td>
			</tr>
			<tr bgcolor="#fff">
					<td style="text-align:center">
							<p style="color: #000">¡Gracias por confiar en Coursenine!</p>
					</td>
			</tr>
		</table>`
	};

	transporter.verify(function (error, success) {
		if (error) {
			console.log(error);
		} else {
			console.log("Server is ready to take our messages");
		}
	});

	transporter.sendMail(mailOptions, function (error, info) {
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
