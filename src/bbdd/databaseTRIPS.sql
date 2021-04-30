create database appcourses;

USE appcourses;

CREATE TABLE estudiantes(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
pass VARCHAR(50) NOT NULL,
secreto VARCHAR(50) NOT NULL
);

CREATE TABLE docentes(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
pass VARCHAR(50)NOT NULL,
secreto VARCHAR(50) NOT NULL,
descripcion VARCHAR(255),
enlace VARCHAR(255),
foto VARCHAR(200)
);

CREATE TABLE categorias(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
descripcion VARCHAR(50)
);

CREATE TABLE cursos(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(255) NOT NULL,
descripcion VARCHAR(255),
enlace VARCHAR(255),
docente INT,
precio INT,
duracion INT,
idioma INT,
categoria INT,
bolsaEmpleo BOOLEAN,
certificado BOOLEAN,
media INT,
FOREIGN KEY (docente) REFERENCES docentes(id),
FOREIGN KEY (categoria) REFERENCES categorias(id)
);

CREATE TABLE favoritos(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
curso INT,
estudiante INT,
FOREIGN KEY (estudiante) REFERENCES estudiantes(id),
FOREIGN KEY (curso) REFERENCES cursos(id)
);

CREATE TABLE profesiones(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
descripcion VARCHAR(255)
);

CREATE TABLE profesionesCursos(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
curso INT,
profesion INT,
FOREIGN KEY (curso) REFERENCES cursos(id),
FOREIGN KEY (profesion) REFERENCES profesiones(id)
);

CREATE TABLE keywords(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
descripcion VARCHAR(20)
);

CREATE TABLE keywordsCursos(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
curso INT,
keywords INT,
FOREIGN KEY (curso) REFERENCES cursos(id),
FOREIGN KEY (keywords) REFERENCES keywords(id)
);

-- CREATE TABLE links(
-- id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
-- enlace VARCHAR(255),
-- docente INT,
-- FOREIGN KEY (docente) REFERENCES docentes(id)
-- );

CREATE TABLE reviews(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
estudiante INT,
curso INT,
descripcion VARCHAR(255),
valoracion INT,
FOREIGN KEY (estudiante) REFERENCES estudiantes(id),
FOREIGN KEY (curso) REFERENCES cursos(id)
);

ALTER TABLE reviews ADD UNIQUE INDEX(estudiante, curso);
-- QUIZÁS HAYA QUE AGREGAR MÁS UNIQUE INDEX A OTRAS TABLAS (revisar)

INSERT INTO estudiantes(nombre, apellido, email, pass, secreto)
VALUES ("Pedro", "Carbón", "pedrocabron@hotmail.com", "password1", "qwertyn123+");
INSERT INTO estudiantes(nombre, apellido, email, pass, secreto)
VALUES ("Loli", "Start", "lolistart@hotmail.com", "password1", "qwertyn123+");
INSERT INTO estudiantes(nombre, apellido, email, pass, secreto)
VALUES ("Rosa", "Pecosa", "rosapecosa@gmail.com", "password1", "qwertyn123+");
INSERT INTO estudiantes(nombre, apellido, email, pass, secreto)
VALUES ("Carlos", "Fernández", "carlosfe@hotmail.com", "password1", "qwertyn123+");
INSERT INTO estudiantes(nombre, apellido, email, pass, secreto)
VALUES ("Jesús María", "de los Santos", "jesusmarisan@gmail.com", "password1", "qwertyn123+");
INSERT INTO estudiantes(nombre, apellido, email, pass, secreto)
VALUES ("Lluvia", "Dorada", "lluviado@hotmail.com", "password1", "qwertyn123+");

INSERT INTO categorias(descripcion)
VALUES ("Desarrollo Web");
INSERT INTO categorias(descripcion)
VALUES ("FrontEnd");
INSERT INTO categorias(descripcion)
VALUES ("BackEnd");
INSERT INTO categorias(descripcion)
VALUES ("Marketing Digital");
INSERT INTO categorias(descripcion)
VALUES ("UX/UI");
INSERT INTO categorias(descripcion)
VALUES ("Data Science");

INSERT INTO keywords(descripcion)
VALUES ("React");
INSERT INTO keywords(descripcion)
VALUES ("JavaScript");
INSERT INTO keywords(descripcion)
VALUES ("Python");
INSERT INTO keywords(descripcion)
VALUES ("SQL");
INSERT INTO keywords(descripcion)
VALUES ("MongoDB");
INSERT INTO keywords(descripcion)
VALUES ("Figma");
INSERT INTO keywords(descripcion)
VALUES ("Sketch");
INSERT INTO keywords(descripcion)
VALUES ("Salesforce");
INSERT INTO keywords(descripcion)
VALUES ("NodeJS");
INSERT INTO keywords(descripcion)
VALUES ("Google Analytics");
INSERT INTO keywords(descripcion)
VALUES ("Google Ads");
INSERT INTO keywords(descripcion)
VALUES ("Facebook Ads");

INSERT INTO profesiones(descripcion)
VALUES ("Full Stack Developer");
INSERT INTO profesiones(descripcion)
VALUES ("Desarrollador Web");
INSERT INTO profesiones(descripcion)
VALUES ("Frontend Developer");
INSERT INTO profesiones(descripcion)
VALUES ("Backend Developer");
INSERT INTO profesiones(descripcion)
VALUES ("Test Engineer");
INSERT INTO profesiones(descripcion)
VALUES ("Cloud Architect");
INSERT INTO profesiones(descripcion)
VALUES ("UX Designer");
INSERT INTO profesiones(descripcion)
VALUES ("Web Designer");
INSERT INTO profesiones(descripcion)
VALUES ("UI Designer");
INSERT INTO profesiones(descripcion)
VALUES ("UX UI Designer");
INSERT INTO profesiones(descripcion)
VALUES ("Product Designer");
INSERT INTO profesiones(descripcion)
VALUES ("Data Scientist");
INSERT INTO profesiones(descripcion)
VALUES ("Data Analyst");
INSERT INTO profesiones(descripcion)
VALUES ("Data Engineer");
INSERT INTO profesiones(descripcion)
VALUES ("Big Data Analyst");
INSERT INTO profesiones(descripcion)
VALUES ("Cyber Security Analyst");
INSERT INTO profesiones(descripcion)
VALUES ("Cyber Security Engineer");
INSERT INTO profesiones(descripcion)
VALUES ("Cyber Security Consultant");
INSERT INTO profesiones(descripcion)
VALUES ("Digital Marketing Analyst");
INSERT INTO profesiones(descripcion)
VALUES ("Digital Marketing Specialist");
INSERT INTO profesiones(descripcion)
VALUES ("SEO Specialist");

INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Fernando Alfaro", "alfarogr@hotmail.com", "password1", "qwerty123+", "Soy un experto en queries", "linkedin.com/alfarogr");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Roberto Borroso", "rborroso@hotmail.com", "password1", "qwerty123+", "Soy diseñador y front-end developer", "linkedin.com/roborroso");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Jose Luis", "zellfhirot@hotmail.com", "password1", "qwerty123+", "Soy la máquina de los endpoints", "linkedin.com/zellfhirot");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Luis Fernandez", "luisyagofdez@gmail.com", "password1", "qwerty123+", "React Nativo y bro de todo el mundo", "linkedin.com/luisyagofdez");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Sol Jimenez", "soljimenez@gmail.com", "password1", "qwerty123+", "Creativa y resolutiva", "linkedin.com/soljimenez");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Silvia Hernández", "silviahernandez@gmail.com", "password1", "qwerty123+", "Soy la master del React", "linkedin.com/silviahernandez");

INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado) 
VALUES ("React Native: Aplicaciones nativas para IOS y Android", "Aprende React Native desde cero. Usa React Native para construir aplicaciones iOS y Android y profundiza en React Native", "linkcurso1.com", 1, 150, 13, 0, 1, true, false 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado) 
VALUES ("JavaScript de cero a experto", "Aprende el lenguaje de programación web más popular paso a paso Con Proyectos, inc. Electron React MongoDB Node Express","linkcurso2.com", 2, 176, 16, 0, 2, false, true
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado) 
VALUES ("Node y APIRest", "Rest, despliegues, Heroku, Mongo, Git, GitHub, Sockets, archivos, JWT y mucho más para ser un experto en Node", "linkcurso3.com", 3, 134, 18, 0, 1, true, true
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado) 
VALUES ("Administrador de Salesforce", "Comienza tu Carrera Profesional como Administrador de Salesforce", "linkcurso4.com", 4, 180, 18, 0, 4, true, true
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado) 
VALUES ("Experto en Sketch", "Aprende a usar la herramienta más popular y profesional para diseño de interfaz", "linkcurso5.com", 5, 198, 12, 0, 5, false, false
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado) 
VALUES ("Python + SQLite", "Aprende a programar con clases y objetos, a usar ficheros y bases de datos SQLite, interfaces gráficas y más con Python!", "linkcurso6.com", 6, 100, 14, 0, 6, false, false
);

INSERT INTO keywordsCursos(curso, keywords)
VALUES (1, 1);
INSERT INTO keywordsCursos(curso, keywords)
VALUES (2, 2);
INSERT INTO keywordsCursos(curso, keywords)
VALUES (2, 1);
INSERT INTO keywordsCursos(curso, keywords)
VALUES (2, 5);
INSERT INTO keywordsCursos(curso, keywords)
VALUES (3, 5);
INSERT INTO keywordsCursos(curso, keywords)
VALUES (3, 9);
INSERT INTO keywordsCursos(curso, keywords)
VALUES (4, 8);
INSERT INTO keywordsCursos(curso, keywords)
VALUES (5, 7);
INSERT INTO keywordsCursos(curso, keywords)
VALUES (6, 3);
INSERT INTO keywordsCursos(curso, keywords)
VALUES (6, 4);

INSERT INTO reviews(estudiante, curso, descripcion, valoracion)
VALUES (1, 2, "Curso buenísimo", 5);
INSERT INTO reviews(estudiante, curso, descripcion, valoracion)
VALUES (1, 3, "Curso magnífico", 5);
INSERT INTO reviews(estudiante, curso, descripcion, valoracion)
VALUES (2, 5, "Desactualizado", 3);
INSERT INTO reviews(estudiante, curso, descripcion, valoracion)
VALUES (3, 6, "Curso rebueno", 5);
INSERT INTO reviews(estudiante, curso, descripcion, valoracion)
VALUES (5, 6, "Me gustó. Un poco corto", 4);
INSERT INTO reviews(estudiante, curso, descripcion, valoracion)
VALUES (4, 1, "Curso bueno", 4);
INSERT INTO reviews(estudiante, curso, descripcion, valoracion)
VALUES (4, 3, "Regular", 2);
INSERT INTO reviews(estudiante, curso, descripcion, valoracion)
VALUES (6, 4, "Genial",5);
INSERT INTO reviews(estudiante, curso, descripcion, valoracion)
VALUES (3, 1, "Muy bueno", 4);
INSERT INTO reviews(estudiante, curso, descripcion, valoracion)
VALUES (1, 4, "Interesante", 4);
INSERT INTO reviews(estudiante, curso, descripcion, valoracion)
VALUES (6, 2, "Corto", 3);

INSERT INTO profesiones(descripcion) VALUES ("Full Stack Developer");
INSERT INTO profesiones(descripcion) VALUES ("Fullstack Developer");
INSERT INTO profesiones(descripcion) VALUES ("Senior Full Stack Developer");
INSERT INTO profesiones(descripcion) VALUES ("Junior Full Stack Developer");
INSERT INTO profesiones(descripcion) VALUES ("Desarrollador Fullstack");
INSERT INTO profesiones(descripcion) VALUES ("Desarrollador Web");
INSERT INTO profesiones(descripcion) VALUES ("Frontend Developer");
INSERT INTO profesiones(descripcion) VALUES ("desarrollador backend");
INSERT INTO profesiones(descripcion) VALUES ("Backend Developer");
INSERT INTO profesiones(descripcion) VALUES ("UX Designer");
INSERT INTO profesiones(descripcion) VALUES ("Web Designer");
INSERT INTO profesiones(descripcion) VALUES ("UI Designer");
INSERT INTO profesiones(descripcion) VALUES ("UX UI Designer");
INSERT INTO profesiones(descripcion) VALUES ("junior web developer");
INSERT INTO profesiones(descripcion) VALUES ("senior web developer");
INSERT INTO profesiones(descripcion) VALUES ("Data Scientist");
INSERT INTO profesiones(descripcion) VALUES ("Data Analyst");
INSERT INTO profesiones(descripcion) VALUES ("Data Engineer");
INSERT INTO profesiones(descripcion) VALUES ("Big Data Analyst");
INSERT INTO profesiones(descripcion) VALUES ("Cyber Security Analyst");
INSERT INTO profesiones(descripcion) VALUES ("Cyber Security Engineer");