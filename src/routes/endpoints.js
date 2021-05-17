// --------------------------PAQUETES E IMPORTACIONES

const express = require('express');
const cors = require('cors')
const axios = require('axios')

const { createToken, hash, randomString, decodeToken, emailIsValid,
	passIsValid, nameIsValid, mailPassword } = require("../middlewares/middlewares");

// const { linkedin } = require('../queries/linkedin')

const { newStudent, newTeacher, logUser, logout, verification, recoverAccount, recoverPass,
	newPass, updateUser, searchAll, keywords, getReviews, newReview, showFavs,
	newFav, deleteFav, newCourse, keysProfs } = require("../queries/SQLqueries")

// -------------------------------SERVIDOR Y PUERTOS

const server = express()
const listenPort = process.env.PORT || 8080;
server.use(cors())

// -----------------------------PARSEADOR DE EXPRESS

server.use(express.urlencoded({ extended: false }));
server.use(express.json());

// --------------------------------LEVANTAR SERVIDOR

server.listen(listenPort,
	() => console.log(`Server started listening on ${listenPort}`))

// ------------------------------------------------------------------SIGNUP

server.post('/newStudent', async (req, res) => {
	if (emailIsValid(req.body.email) && passIsValid(req.body.pass) && nameIsValid(req.body.nombre)) {
		try {
			let random = randomString()
			const SQLresponse = await newStudent(req.body.nombre, req.body.email, hash(req.body.pass), random)
			res.status(200).json({
				status: 200,
				ok: true,
				data: SQLresponse,
				msg: "Registrado correctamente.",
				token: await createToken(req.body.email, SQLresponse.insertId, "estudiantes", req.body.nombre, random, 172800),
				user: { rol: "estudiantes", email: req.body.email, nombre: req.body.nombre }
			})
		} catch (err) {
			if (err.errno)
				res.status(500).json({
					status: 500,
					ok: false,
					msg: "Error en base de datos.",
					data: err
				})
		}
	} else {
		res.status(406).json({
			status: 406,
			ok: false,
			msg: "Email, nombre o contraseña inválidos: La contraseña debe contener mínimo 8 caracteres, incluyendo una letra y un número. El nombre debe contener de 6 a 16 caracteres."
		})
	}
})

server.post('/newTeacher', async (req, res) => {
	if (emailIsValid(req.body.email) && passIsValid(req.body.pass) && nameIsValid(req.body.nombre)) {
		try {
			let random = randomString()
			const SQLresponse = await newTeacher(req.body.nombre, req.body.email, hash(req.body.pass), random)
			res.status(200).json({
				status: 200,
				ok: true,
				data: SQLresponse,
				msg: "Registrado correctamente.",
				token: await createToken(req.body.email, SQLresponse.insertId, "docentes", req.body.nombre, random, 172800),
				user: { rol: "docentes", email: req.body.email, nombre: req.body.nombre }
			})
		} catch (err) {
			if (err.errno)
				res.status(500).json({
					status: 500,
					ok: false,
					msg: "Error en base de datos.",
					data: err
				})
		}
	} else {
		res.status(406).json({
			status: 406,
			ok: false,
			msg: "Email, nombre o contraseña inválidos: La contraseña debe contener mínimo 8 caracteres, incluyendo una letra y un número. El nombre debe contener de 6 a 16 caracteres."
		})
	}
})

// -------------------------------------------------------------------LOGIN

server.post('/logUser/:rol', async (req, res) => {
	if (emailIsValid(req.body.email) && passIsValid(req.body.pass)) {
		try {
			const SQLresponse = await logUser(req.body.email, hash(req.body.pass), req.params.rol)
			res.status(200).json({
				status: 200,
				ok: true,
				data: SQLresponse,
				msg: "Logado correctamente.",
				token: await createToken(SQLresponse[0].email, SQLresponse[0].id, req.params.rol, SQLresponse[0].nombre, SQLresponse[0].secreto, 172800),
				user: { rol: req.params.rol, email: req.body.email, nombre: SQLresponse[0].nombre }
			})
		} catch (err) {
			if (err) {
				res.status(500).json({
					status: 500,
					ok: false,
					data: err,
					msg: "Email o contraseña incorrectos."
				})
			}
		}
	} else {
		res.status(406).json({
			status: 406,
			ok: false,
			msg: "Email inválido. La contraseña debe contener mínimo 8 caracteres, incluyendo una letra y un número"
		})
	}
})

// ------------------------------------------------------------------LOGOUT

server.put('/logout', async (req, res) => {
	try {
		let newSecret = randomString()
		let token = req.headers.authorization.split(" ")[1]
		const PAYLOAD = decodeToken(token)
		const SQLresponse = await logout(PAYLOAD, newSecret, PAYLOAD.rol)
		res.status(200).json({
			status: 200,
			ok: true,
			data: SQLresponse,
			msg: "Deslogado correctamente."
		})
	} catch (err) {
		if (err) {
			res.status(500).json({
				status: 500,
				ok: false,
				data: err,
				msg: "Ya has salido."
			})
		}
	}
})

// ------------------------------------------------------------------VERIFY TOKEN

server.get('/verification', async (req, res) => {
	let token = req.headers.authorization.split(" ")[1]
	try {
		const PAYLOAD = decodeToken(token)
		const SQLresponse = await verification(PAYLOAD, token)
		if (SQLresponse[0]) {
			res.status(200).json({
				status: 200,
				ok: true,
				msg: "Estás logado.",
				user: { rol: PAYLOAD.rol, email: PAYLOAD.email, nombre: PAYLOAD.nombre }
			})
		}
	} catch (err) {
		if (err) {
			res.status(500).json({
				status: 500,
				ok: false,
				msg: "No estás logado."
			})
		}
	}
})

// ---------------------------------------------------------------RECUPERAR

server.post('/recuperar/:rol', async (req, res) => {
	if (emailIsValid(req.body.email)) {
		try {
			let newSecret = randomString()
			const SQLresponse = await recoverAccount(req.body.email, newSecret, req.params.rol)
			if (SQLresponse.affectedRows > 0) {
				let token = await createToken(req.body.email, "", req.params.rol, "", newSecret, 1800)
				const NODEMAILresp = await mailPassword(req.body.email, token)
				res.status(200).json({
					status: 200,
					ok: true,
					data: SQLresponse,
					msg: "Mail enviado. Revisa tu bandeja de entrada.",
				})
			} else {
				res.status(400).json({
					status: 400,
					ok: false,
					data: SQLresponse,
					msg: "Mail incorrecto."
				})
			}
		} catch (err) {
			if (err) {
				res.status(500).json({
					status: 500,
					ok: false,
					data: err,
					msg: "Error en base de datos."
				})
			}
		}
	} else {
		res.status(406).json({
			status: 406,
			ok: false,
			msg: "Email inválido."
		})
	}
})

server.get('/reestablecer/:token', async (req, res) => {
	let token = req.params.token
	try {
		const PAYLOAD = decodeToken(token)
		const SQLresponse = await recoverPass(PAYLOAD, token)
		if (SQLresponse[0]) {
			res.status(200).json({
				status: 200,
				ok: true,
				msg: "Puedes introducir una nueva contraseña.",
				token: await createToken(PAYLOAD.email, SQLresponse[0].id, PAYLOAD.rol, SQLresponse[0].nombre, SQLresponse[0].secreto, 172800),
				user: { rol: PAYLOAD.rol, email: PAYLOAD.email, nombre: SQLresponse[0].nombre }
			})
		}
	} catch (err) {
		if (err) {
			res.status(500).json({
				status: 500,
				ok: false,
				msg: "Token caducado."
			})
		}
	}
})

server.put('/newPass/:rol', async (req, res) => {
	if (passIsValid(req.body.pass)) {
		try {
			const SQLresponse = await newPass(req.body.email, hash(req.body.pass), req.params.rol)
			if (SQLresponse.changedRows > 0) {
				res.status(200).json({
					status: 200,
					ok: true,
					data: SQLresponse,
					msg: "Contraseña modificada.",
					token: req.headers.authorization.split(" ")[1],
					user: { rol: req.params.rol, email: req.body.email, nombre: req.body.email }
				})
			} else {
				res.status(400).json({
					status: 400,
					ok: false,
					data: SQLresponse,
					msg: "Imposible cambiar contraseña."
				})
			}
		} catch (err) {
			res.status(500).json({
				status: 500,
				ok: false,
				msg: "Error de base de datos."
			})
		}
	} else {
		res.status(406).json({
			status: 406,
			ok: false,
			msg: "La contraseña debe contener mínimo 8 caracteres, incluyendo una letra y un número."
		})
	}
})

// ------------------------------------------------------------------UPDATE USER

server.put('/updateUser', async (req, res) => {
	if (passIsValid(req.body.pass) && nameIsValid(req.body.nombre) && emailIsValid(req.body.email)) {
		try {
			let newSecret = randomString()
			let token = req.headers.authorization.split(" ")[1]
			const PAYLOAD = decodeToken(token)
			const SQLresponse = await updateUser(req.body.nombre, req.body.email, hash(req.body.pass), newSecret, PAYLOAD)
			if (SQLresponse.changedRows > 0) {
				res.status(200).json({
					status: 200,
					ok: true,
					data: SQLresponse,
					msg: "Datos de usuario actualizados.",
					token: await createToken(req.body.email, PAYLOAD.id, PAYLOAD.rol, PAYLOAD.nombre, newSecret, 172800),
				})
			} else {
				res.status(400).json({
					status: 400,
					ok: false,
					data: SQLresponse,
					msg: "Error: datos no actualizados."
				})
			}
		} catch (err) {
			res.status(500).json({
				status: 500,
				ok: false,
				msg: "Error de base de datos."
			})
		}
	} else {
		res.status(406).json({
			status: 406,
			ok: false,
			msg: "Email, nombre o contraseña inválidos: La contraseña debe contener mínimo 8 caracteres, incluyendo una letra y un número. El nombre debe contener de 6 a 16 caracteres."
		})
	}
})

// ------------------------------------------------------------------SEARCH

server.get('/searchAll', async (req, res) => {
	try {
		const SQLresponse = await searchAll()
		if (SQLresponse) {
			res.status(200).json({
				status: 200,
				ok: true,
				msg: "Cursos y docentes.",
				data: SQLresponse
			})
		} else {
			res.status(400).json({
				status: 400,
				ok: false,
				data: "Error."
			})
		}
	} catch (err) {
		res.status(500).json({
			status: 500,
			ok: false,
			data: err
		})
	}
})

server.get('/dataAPI/:curso', async (req, res) => {
	try {
		const REVIEWS = await getReviews(req.params.curso)
		const SQLresponse = await keywords(req.params.curso)
		if (SQLresponse.keys[0] && SQLresponse.profs[0]) {
			const APIresponse = axios({
				method: 'get',
				url: `http://apidatatripu-env.eba-zb6ziaqv.eu-west-1.elasticbeanstalk.com/api/v1/courses/get_courses_simple`,
				headers: {
					'content-type': 'application/json'
				},
				data: {
					tags: SQLresponse.keys,
					professions: SQLresponse.profs
				}
			})
				.then((response) => {
					res.status(200).json({
						status: 200,
						ok: true,
						APIresponse: response.data,
						keywords: SQLresponse.keys,
						professions: SQLresponse.profs,
						reviews: REVIEWS.reviews,
						reviewNum: REVIEWS.reviewNum
					})
				})
		} else {
			res.status(400).json({
				status: 400,
				ok: false,
				msg: "No hay datos de empleo para este curso concreto."
			})
		}
	} catch (err) {
		res.status(500).json({
			status: 500,
			ok: false,
			data: err,
			msg: "Error en la base de datos."
		})
	}
})

// ------------------------------------------------------------------NEW REVIEW

server.post('/newReview/:curso', async (req, res) => {
	try {
		let token = req.headers.authorization.split(" ")[1]
		const PAYLOAD = decodeToken(token)
		const SQLresponse = await newReview(req.body, PAYLOAD, req.params.curso)
		if (SQLresponse.affectedRows > 0) {
			res.status(200).json({
				status: 200,
				ok: true,
				msg: "Opinión publicada correctamente.",
			})
		} else {
			res.status(400).json({
				status: 400,
				ok: false,
				msg: "Opinión previamente publicada.",
			})
		}
	} catch (err) {
		if (err.errno)
			res.status(500).json({
				status: 500,
				ok: false,
				data: err.sqlMessage,
				msg: "Error en base de datos."
			})
	}
})

// -----------------------------------------------------------------SHOWFAV

server.get('/showFavs', async (req, res) => {
	try {
		let token = req.headers.authorization.split(" ")[1]
		const PAYLOAD = decodeToken(token)
		const SQLresponse = await showFavs(PAYLOAD, token)
		if (SQLresponse) {
			res.status(200).json({
				status: 200,
				ok: true,
				data: SQLresponse.result,
				nombre: SQLresponse.nombre
			})
		} else {
			res.status(400).json({
				status: 400,
				ok: false,
				data: SQLresponse,
				msg: "Imposible recuperar favoritos."
			})
		}
	} catch (err) {
		res.status(403).json({
			status: 403,
			ok: false,
			data: err,
			msg: "Inicia sesión para ver tus favoritos",
		})
	}
})

// ------------------------------------------------------------------NEWFAV

server.post('/newFav/:curso', async (req, res) => {
	try {
		let token = req.headers.authorization.split(" ")[1]
		const PAYLOAD = decodeToken(token)
		const SQLresponse = await newFav(PAYLOAD, req.params.curso)
		if (SQLresponse.affectedRows > 0) {
			res.status(200).json({
				status: 200,
				ok: true,
				msg: "Favorito guardado correctamente.",
			})
		} else {
			res.status(400).json({
				status: 400,
				ok: false,
				msg: "Favorito previamente guardado.",
			})
		}
	} catch (err) {
		if (err.errno)
			res.status(500).json({
				status: 500,
				ok: false,
				data: err.sqlMessage,
				msg: "Error en base de datos."
			})
	}
})

// ----------------------------------------------------------------DELETEFAV

server.delete('/deleteFav/:curso', async (req, res) => {
	try {
		let token = req.headers.authorization.split(" ")[1]
		const PAYLOAD = decodeToken(token)
		const SQLresponse = await deleteFav(req.params.curso, PAYLOAD.id)
		if (SQLresponse.affectedRows > 0) {
			res.status(200).json({
				status: 200,
				ok: true,
				msg: "Favorito borrado correctamente.",
			})
		} else {
			res.status(400).json({
				status: 400,
				ok: false,
				data: SQLresponse,
				msg: "Imposible borrar."
			})
		}
	} catch (err) {
		if (err.errno)
			res.status(500).json({
				status: 500,
				ok: false,
				data: err.sqlMessage,
				msg: "Error en base de datos."
			})
	}
})

// ----------------------------------------------------------------NEW COURSE

server.post('/newCourse', async (req, res) => {
	try {
		let token = req.headers.authorization.split(" ")[1]
		const PAYLOAD = decodeToken(token)
		const SQLresponse = await newCourse(req.body, PAYLOAD.id)
		if (SQLresponse.affectedRows > 0) {
			res.status(200).json({
				status: 200,
				ok: true,
				msg: "Curso guardado correctamente.",
				id: SQLresponse.insertId
			})
		} else {
			res.status(400).json({
				status: 400,
				ok: false,
				msg: "El curso ya existe.",
			})
		}
	} catch (err) {
		if (err.errno)
			res.status(500).json({
				status: 500,
				ok: false,
				data: err.sqlMessage,
				msg: "Error en base de datos."
			})
	}
})


// ----------------------------------------------------------KEYS & PROFS

server.get('/keys-profs', async (req, res) => {
	try {
		const SQLresponse = await keysProfs()
		if (SQLresponse) {
			res.status(200).json({
				status: 200,
				ok: true,
				msg: "Todos los resultados.",
				keys: SQLresponse.keys,
				profs: SQLresponse.profs
			})
		} else {
			res.status(400).json({
				status: 400,
				ok: false,
				data: "Error."
			})
		}
	} catch (err) {
		res.status(500).json({
			status: 500,
			ok: false,
			data: err
		})
	}
})