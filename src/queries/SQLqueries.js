const DB = require("../bbdd/db")
const { verifyToken } = require("../middlewares/middlewares")

// -----------------------------------------------------------SIGNUP

function newStudent(nombre, apellido, email, pass, secret) {
    return new Promise((resolve, reject) => {
        DB.query(`INSERT INTO estudiantes (nombre, apellido, email, pass, secreto) VALUES ( "${nombre}", "${apellido}", "${email}", "${pass}", "${secret}");`, (err, result) => {
            if (err)
                return reject(err);
            resolve(result);
        });
    });
}

function newTeacher(nombre, email, pass, secret, descripcion, enlace, foto) {
    return new Promise((resolve, reject) => {
        DB.query(`INSERT INTO docentes (nombre, email, pass, secreto, descripcion, enlace, foto) VALUES ( "${nombre}", "${email}", "${pass}", "${secret}", "${descripcion}", "${enlace}", "${foto}");`, (err, result) => {
            if (err)
                return reject(err);
            resolve(result);
        });
    });
}

// -----------------------------------------------------------LOGIN

function logUser(email, pass, rol) {
    return new Promise((resolve, reject) => {
        DB.query(`SELECT * FROM ${rol} WHERE email = "${email}" AND pass = "${pass}";`, (err, result) => {
            if (err)
                return reject(err);
            resolve(result);
        });
    });
}

// -----------------------------------------------------------LOGOUT

function logout(payload, newSecret, rol) {
    return new Promise((resolve, reject) => {
        DB.query(`UPDATE ${rol} SET secreto = "${newSecret}" WHERE email = "${payload.email}";`, (err, result) => {
            if (err)
                return reject(err);
            resolve(result);
        });
    });
}

// -----------------------------------------------------------PASSWORD

function recoverAccount(email, newSecret, rol) {
    return new Promise((resolve, reject) => {
        DB.query(`UPDATE ${rol} SET secreto = "${newSecret}" WHERE email = "${email}"`, (err, result) => {
            if (err)
                return reject(err);
            resolve(result);
        });
    });
}

function recoverPass(payload, token) {
    return new Promise((resolve, reject) => {
        DB.query(`SELECT secreto, id, nombre FROM ${payload.rol} WHERE email = "${payload.email}";`, (err, result) => {
            if (err)
                return reject(err);
            try {
                if (verifyToken(token, result[0].secreto)) {
                    resolve(result);
                }
            } catch (err) {
                return reject(err)
            }
        })
    })
}

function newPass(email, pass, rol) {
    return new Promise((resolve, reject) => {
        DB.query(`UPDATE ${rol} SET pass = "${pass}" WHERE email = "${email}";`, (err, result) => {
            if (err)
                return reject(err);
            resolve(result);
        });
    });
}

// -----------------------------------------------------------SEARCH ALL

function searchAll() {
    return new Promise((resolve, reject) => {
        DB.query(`SELECT * FROM cursos ORDER BY media DESC;`, (err, result) => {
            if (err)
                return reject(err);
            resolve(result);
        });
    });
}

// -----------------------------------------------------------SEARCH KEYS

function keywords(curso) {
    return new Promise((resolve, reject) => {
        DB.query(
            `SELECT descripcion FROM keywords
            INNER JOIN keywordsCursos
            ON keywords.id = keywordsCursos.keyword
            WHERE curso = ${curso};`,
            (err, result) => {
                if (err)
                    return reject(err);
                resolve(result);
            });
    });
}

// ---------------------------EXPORTS

module.exports = {
    newStudent,
    newTeacher,
    logUser,
    logout,
    recoverAccount,
    recoverPass,
    newPass,
    searchAll,
    keywords
};