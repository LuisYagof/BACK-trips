// --------------------------PAQUETES E IMPORTACIONES

const express = require('express');
const cors = require('cors')

// const {  } = require("../queries/queries")

const { createToken, hash, randomString, decodeToken, emailIsValid,
    passIsValid, nameIsValid, mailPassword } = require("../middlewares/middlewares");

const { newStudent, newTeacher } = require("../queries/SQLqueries")

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
            const SQLresponse = await newStudent (req.body.nombre, req.body.apellido, req.body.email, hash(req.body.pass), random)
            res.status(200).json({
                status: 200,
                ok: true,
                data: SQLresponse,
                msg: "Registrado correctamente",
                url: '/',
                token: await createToken(req.body.email, SQLresponse.insertId, random, 172800)
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
            const SQLresponse = await newTeacher (req.body.nombre, req.body.email, hash(req.body.pass), random, req.body.descripcion, req.body.enlace, req.body.foto )
            res.status(200).json({
                status: 200,
                ok: true,
                data: SQLresponse,
                msg: "Registrado correctamente",
                url: '/',
                token: await createToken(req.body.email, SQLresponse.insertId, random, 172800)
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
