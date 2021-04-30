const DB = require("../bbdd/db")
// const { verifyToken } = require("../middlewares/middlewares")

function newStudent (nombre, apellido, email, pass, secret) {
  return new Promise((resolve, reject) =>{
      DB.query(`INSERT INTO estudiantes (nombre, apellido, email, pass, secreto) VALUES ( "${nombre}", "${apellido}", "${email}", "${pass}", "${secret}");`, (err, result) => {
          if (err)
              return reject(err);
          resolve(result);
      });
  });
}

function newTeacher (nombre, email, pass, secret, descripcion, enlace, foto) {
  return new Promise((resolve, reject) =>{
      DB.query(`INSERT INTO docentes (nombre, email, pass, secreto, descripcion, enlace, foto) VALUES ( "${nombre}", "${email}", "${pass}", "${secret}", "${descripcion}", "${enlace}", "${foto}");`, (err, result) => {
          if (err)
              return reject(err);
          resolve(result);
      });
  });
}


// ---------------------------EXPORTS

module.exports = {
  newStudent,
  newTeacher
};