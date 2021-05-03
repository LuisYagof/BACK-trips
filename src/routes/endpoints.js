// --------------------------PAQUETES E IMPORTACIONES

const express = require('express');
const cors = require('cors')

const { createToken, hash, randomString, decodeToken, emailIsValid,
    passIsValid, nameIsValid, mailPassword } = require("../middlewares/middlewares");

const { newStudent, newTeacher, logUser, logout, recoverAccount, recoverPass,
    newPass, searchAll, keywords, newReview, showFavs } = require("../queries/SQLqueries")

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
            const SQLresponse = await newStudent(req.body.nombre, req.body.apellido, req.body.email, hash(req.body.pass), random)
            res.status(200).json({
                status: 200,
                ok: true,
                data: SQLresponse,
                msg: "Registrado correctamente",
                url: '/',
                token: await createToken(req.body.email, SQLresponse.insertId, "estudiantes", random, 172800)
            })
        } catch (err) {
            if (err.errno)
                res.status(500).json({
                    status: 500,
                    ok: false,
                    msg: "Error en base de datos",
                    data: err
                })
        }
    } else {
        res.status(406).json({
            status: 406,
            ok: false,
            msg: "Email, nombre o contraseña inválidos: La contraseña debe contener mínimo 8 caracteres, incluyendo una letra y un número. El nombre debe contener de 6 a 16 letras o números, sin caracteres especiales"
        })
    }
})

server.post('/newTeacher', async (req, res) => {
    if (emailIsValid(req.body.email) && passIsValid(req.body.pass)) {
        try {
            let random = randomString()
            const SQLresponse = await newTeacher(req.body.nombre, req.body.email, hash(req.body.pass), random, req.body.descripcion, req.body.enlace, req.body.foto)
            res.status(200).json({
                status: 200,
                ok: true,
                data: SQLresponse,
                msg: "Registrado correctamente",
                url: '/',
                token: await createToken(req.body.email, SQLresponse.insertId, "docentes", random, 172800)
            })
        } catch (err) {
            if (err.errno)
                res.status(500).json({
                    status: 500,
                    ok: false,
                    msg: "Error en base de datos",
                    data: err
                })
        }
    } else {
        res.status(406).json({
            status: 406,
            ok: false,
            msg: "Email, nombre o contraseña inválidos: La contraseña debe contener mínimo 8 caracteres, incluyendo una letra y un número. El nombre debe contener de 6 a 16 letras o números, sin caracteres especiales"
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
                msg: "Logado correctamente",
                url: '/',
                token: await createToken(SQLresponse[0].email, SQLresponse[0].id, req.params.rol, SQLresponse[0].secreto, 172800)
            })
        } catch (err) {
            if (err) {
                res.status(500).json({
                    status: 500,
                    ok: false,
                    data: err,
                    msg: "Email o contraseña incorrectos"
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

server.put('/logout/:rol', async (req, res) => {
    try {
        let newSecret = randomString()
        let token = req.headers.authorization.split(" ")[1]
        const PAYLOAD = decodeToken(token)
        const SQLresponse = await logout(PAYLOAD, newSecret, req.params.rol)
        res.status(200).json({
            status: 200,
            ok: false,
            data: SQLresponse,
            msg: "Deslogado correctamente",
            url: '/'
        })
    } catch (err) {
        if (err) {
            res.status(500).json({
                status: 500,
                ok: false,
                url: '/',
                data: err,
                msg: "Ya has salido"
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
                let token = await createToken(req.body.email, "", req.params.rol, newSecret, 1800)
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
                    msg: "Mail incorrecto"
                })
            }
        } catch (err) {
            if (err) {
                res.status(500).json({
                    status: 500,
                    ok: false,
                    data: err,
                    msg: "Error en base de datos"
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
                msg: "Puedes introducir una nueva contraseña",
                userMail: PAYLOAD.email,
                rol: PAYLOAD.rol,
                token: await createToken(PAYLOAD.email, SQLresponse[0].id, PAYLOAD.rol, SQLresponse[0].secreto, 172800)
            })
        }
    } catch (err) {
        console.log(err);
        if (err) {
            res.status(500).json({
                status: 500,
                ok: false,
                msg: "Token caducado",
                url: '/recuperar'
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
                    message: "Contraseña modificada",
                    token: req.headers.authorization.split(" ")[1],
                    url: '/'
                })
            } else {
                res.status(400).json({
                    status: 400,
                    ok: false,
                    data: SQLresponse,
                    msg: "Imposible cambiar contraseña"
                })
            }
        } catch (err) {
            res.status(500).json({
                status: 500,
                ok: false,
                msg: "Error de base de datos"
            })
        }
    } else {
        res.status(406).json({
            status: 406,
            ok: false,
            msg: "La contraseña debe contener mínimo 8 caracteres, incluyendo una letra y un número"
        })
    }
})

// ------------------------------------------------------------------SEARCH

server.get('/searchAll', async (req, res) => {
    try {
        const SQLresponse = await searchAll()
        if (SQLresponse[0]) {
            res.status(200).json({
                status: 200,
                ok: true,
                msg: "Aquí todos los cursos ordenados",
                data: SQLresponse
            })
        } else {
            res.status(400).json({
                status: 400,
                ok: false,
                data: "Error"
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

server.get('/keywords/:curso', async (req, res) => {
    try {
        const SQLresponse = await keywords(req.params.curso)
        if (SQLresponse[0]) {
            res.status(200).json({
                status: 200,
                ok: true,
                msg: "Aquí las keywords",
                etiquetas: SQLresponse.map(el => Object.values(el)[0])

            })
        } else {
            res.status(400).json({
                status: 400,
                ok: false,
                data: "Error base de datos"
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
                msg: "Review guardada correctamente",
            })
        } else {
            res.status(400).json({
                status: 400,
                ok: false,
                msg: "Review previamente guardada",
            })
        }
    } catch (err) {
        if (err.errno)
            res.status(500).json({
                status: 500,
                ok: false,
                data: err.sqlMessage,
                msg: "Error en base de datos"
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
                msg: "Imposible recuperar favoritos"
            })
        }
    } catch (err) {
        res.status(403).json({
            status: 403,
            ok: false,
            data: err,

        // ESTO VA A SER DISTINTO --> SOLO LOGADO SE VA A ACCEDER A ESTE ENDPOINT
            msg: "Inicia sesión para ver tus favoritos",
            url: '/login'
        })
    }
})