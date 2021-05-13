const DB = require("../bbdd/db")
const { verifyToken } = require("../middlewares/middlewares")

// -----------------------------------------------------------SIGNUP

function newStudent(nombre, email, pass, secret) {
    return new Promise((resolve, reject) => {
        DB.query(`INSERT INTO estudiantes (nombre, email, pass, secreto) VALUES ( "${nombre}", "${email}", "${pass}", "${secret}");`, (err, result) => {
            if (err)
                return reject(err);
            resolve(result);
        });
    });
}

function newTeacher(nombre, email, pass, secret) {
    return new Promise((resolve, reject) => {
        DB.query(`INSERT INTO docentes (nombre, email, pass, secreto) VALUES ( "${nombre}", "${email}", "${pass}", "${secret}");`, (err, result) => {
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

// -----------------------------------------------------------UPDATE USER

function updateUser(nombre, email, pass, secreto, payload) {
    return new Promise((resolve, reject) => {
        DB.query(`UPDATE ${payload.rol} SET nombre = "${nombre}", email = "${email}", pass = "${pass}", secreto = "${secreto}" WHERE id = "${payload.id}";`, (err, result) => {
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
            DB.query(`SELECT nombre, id FROM docentes;`, (e, r) => {
                if (e)
                    return reject(e);
                const data = {
                    cursos: result,
                    docentes: r
                }
                resolve(data);
            })
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
                DB.query(
                    `SELECT descripcion FROM profesiones
                    INNER JOIN profesionesCursos
                    ON profesiones.id = profesionesCursos.profesion
                    WHERE curso = ${curso};`,
                    (e, res) => {
                        if (e)
                            return reject(e);
                        let data = {
                            keys: result.map(e => Object.values(e)[0]),
                            profs: res.map(e => Object.values(e)[0])
                        }
                        resolve(data);
                    })

            });
    });
}

// -----------------------------------------------------------NEW REVIEW


function newReview(body, payload, curso) {
    return new Promise((resolve, reject) => {
        DB.query(`INSERT IGNORE INTO reviews (estudiante, curso, descripcion, valoracion) VALUES ("${payload.id}", "${curso}", "${body.descripcion}", "${body.valoracion}");`, (err, result) => {
            if (err)
                return reject(err)
            if (result.affectedRows > 0) {
                DB.query(`
                SELECT AVG (valoracion)
                FROM reviews
                WHERE curso = ${curso};`, (e, r) => {
                    if (e)
                        throw (e)
                    DB.query(
                        `UPDATE cursos SET media = '${Object.values(r[0])[0]}' where id = ${curso};`,
                        (er, res) => {
                            if (er)
                                throw (er)
                            resolve(res);
                        })
                })
            } else {
                resolve(result)
            }

        })
    }
    )
}

// -----------------------------------------------------------GET REVIEWS AND COUNTER

function getReviews(curso) {
    return new Promise((resolve, reject) => {
        DB.query(`SELECT * FROM reviews WHERE curso = "${curso}";`, (err, result) => {
            if (err)
                return reject(err);
            DB.query(`SELECT COUNT(id) FROM reviews WHERE curso = "${curso}";`, (e, r) => {
                if (e)
                    return reject(e);
                let data = {
                    reviews: result,
                    reviewNum: Object.values(r[0])[0]
                }
                resolve(data);
            });
        })
    });
}

// -----------------------------------------------------------GET ALL COURSE REVIEWS

function getCourseReviews(curso) {
    return new Promise((resolve, reject) => {
        DB.query(`SELECT * FROM reviews WHERE curso = "${curso}";`, (err, result) => {
            if (err)
                return reject(err);
            let data = result
            resolve(data);
        })
    });
}

// -----------------------------------------------------------FAVS

function showFavs(payload, token) {
    return new Promise((resolve, reject) => {
        DB.query(`SELECT secreto, id, nombre FROM estudiantes WHERE email = "${payload.email}";`, (e, r) => {
            try {
                verifyToken(token, r[0].secreto)
                DB.query(
                    `SELECT * FROM cursos
                    INNER JOIN favoritos
                    ON cursos.id = favoritos.curso
                    WHERE estudiante = ${r[0].id};`,
                    (err, result) => {
                        if (err)
                            return reject(err);
                        let total = { result: result, nombre: r[0].nombre }
                        resolve(total);
                    });
            } catch (err) {
                return reject(err)
            }
        })
    })
}


function newFav(payload, curso) {
    return new Promise((resolve, reject) => {
        DB.query(`INSERT IGNORE INTO favoritos (curso, estudiante) VALUES ("${curso}", "${payload.id}");`, (err, result) => {
            if (err)
                return reject(err);
            resolve(result);
        });
    });
}

function deleteFav(idCurso, idUser) {
    return new Promise((resolve, reject) => {
        DB.query(`DELETE FROM favoritos WHERE curso = "${idCurso}" AND estudiante = "${idUser}";`, (err, result) => {
            if (err)
                return reject(err);
            resolve(result);
        });
    });
}

// -----------------------------------------------------------NEW COURSE

function newCourse(body, docenteId) {
    return new Promise((resolve, reject) => {
        DB.query(`INSERT INTO cursos (nombre, descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) VALUES ( "${body.nombre}", "${body.descripcion}", "${body.enlace}", "${docenteId}", "${body.precio}", "${body.duracion}", "${body.idioma}", "${body.categoria}", "${body.bolsaEmpleo}", "${body.certificado}", 0, "${body.imagen}");`, (err, result) => {
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
    updateUser,
    searchAll,
    keywords,
    newReview,
    getReviews,
    getCourseReviews,
    showFavs,
    newFav,
    deleteFav,
    newCourse
};