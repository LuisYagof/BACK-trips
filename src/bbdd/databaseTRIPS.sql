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

ALTER TABLE favoritos ADD UNIQUE INDEX(curso, estudiante);

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
keyword INT,
FOREIGN KEY (curso) REFERENCES cursos(id),
FOREIGN KEY (keyword) REFERENCES keywords(id)
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
VALUES ("Pedro", "Carbón", "pedrocarbon@hotmail.com", "password1", "qwertyn123+");
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
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Fernando Herrera", "fherrera@gmail.com", "password1", "qwerty123+", "Tengo 10 años de experiencia como docente.", "linkedin.com/fernando-herrera");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Alberto Esparza", "albertoesparza@gmail.com", "password1", "qwerty123+", "Mi vocación es el diseño inteligente.", "linkedin.com/alberto-esparza");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Eduardo Melano", "eduardomelano@gmail.com", "password1", "qwerty123+", "Amante de plataformas digitales y apasionado de la tecnología.", "linkedin.com/eduardomelano");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("María Javiérez", "mariajavierez@gmail.com", "password1", "qwerty123+", "Soy profesora universitaria y una gran defensora de la formación online.", "linkedin.com/maria_javierez");

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

-- INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado) 
-- VALUES ("React Native: Aplicaciones nativas para IOS y Android", "Aprende React Native desde cero. Usa React Native para construir aplicaciones iOS y Android y profundiza en React Native", "linkcurso1.com", 1, 150, 13, 0, 1, true, false 
-- );
-- INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado) 
-- VALUES ("JavaScript de cero a experto", "Aprende el lenguaje de programación web más popular paso a paso Con Proyectos, inc. Electron React MongoDB Node Express","linkcurso2.com", 2, 176, 16, 0, 2, false, true
-- );
-- INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado) 
-- VALUES ("Node y APIRest", "Rest, despliegues, Heroku, Mongo, Git, GitHub, Sockets, archivos, JWT y mucho más para ser un experto en Node", "linkcurso3.com", 3, 134, 18, 0, 1, true, true
-- );
-- INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado) 
-- VALUES ("Administrador de Salesforce", "Comienza tu Carrera Profesional como Administrador de Salesforce", "linkcurso4.com", 4, 180, 18, 0, 4, true, true
-- );
-- INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado) 
-- VALUES ("Experto en Sketch", "Aprende a usar la herramienta más popular y profesional para diseño de interfaz", "linkcurso5.com", 5, 198, 12, 0, 5, false, false
-- );
-- INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado) 
-- VALUES ("Python + SQLite", "Aprende a programar con clases y objetos, a usar ficheros y bases de datos SQLite, interfaces gráficas y más con Python!", "linkcurso6.com", 6, 100, 14, 0, 6, false, false
-- );

-- ----------------------------------CURSOS MOCKEADOS JOSE - MEDIO ARREGLADOS

INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("React Native: Aplicaciones nativas para IOS y Android", "Aprende React Native desde cero. Usa React Native para construir aplicaciones iOS y Android y profundiza en React Native", "https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 1, 150, 13, 0, 1, true, false, 3.5, "https://escuela.it/storage/course_images_thumbnail/4x0N45XCJQqqgsNUj8RON0JvDOydd5FJNye7ug3Z.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("JavaScript de cero a experto", "Aprende el lenguaje de programación web más popular paso a paso Con Proyectos, inc. Electron React MongoDB Node Express", "https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 2, 176, 16, 0, 2, false, true, 2.8, "https://escuela.it/storage/course_images_thumbnail/SBw0PyAgXtsuIcRGjMJTQ5RqcYRUDR6seO8pinkh.jpeg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("Node y APIRest", "Rest, despliegues, Heroku, Mongo, Git, GitHub, Sockets, archivos, JWT y mucho más para ser un experto en Node", "https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 3, 134, 18, 0, 1, true, true, 4.2, "https://escuela.it/storage/course_images_thumbnail/thumbnail-imagen-curso-angularjs-31.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("Administrador de Salesforce", "Comienza tu Carrera Profesional como Administrador de Salesforce", "https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 4, 180, 18, 0, 4, true, true, 3.6, "https://escuela.it/storage/course_images_thumbnail/thumbnail-imagen-curso-angularjs-31.jpg" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("Experto en Sketch", "Aprende a usar la herramienta más popular y profesional para diseño de interfaz", "https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 5, 198, 12, 0, 5, false, false, 2.9, "https://escuela.it/storage/course_images_thumbnail/SBw0PyAgXtsuIcRGjMJTQ5RqcYRUDR6seO8pinkh.jpeg"  
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("Python + SQLite", "Aprende a programar con clases y objetos, a usar ficheros y bases de datos SQLite, interfaces gráficas y más con Python!", "https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 6, 100, 14, 0, 6, false, false, 2.8, "https://escuela.it/storage/course_images_thumbnail/4x0N45XCJQqqgsNUj8RON0JvDOydd5FJNye7ug3Z.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("Excel para todos","Excel: curso básico para principiantes","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 7,150,23,0,4,False,True, 4.2, "https://escuela.it/storage/course_images_thumbnail/XKDwoV6ssV15ioMZ0w1d6KlRwale2p4YGeJnsFRQ.jpeg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES ("Adobe photoshop para novatos","Master Diseño Digital con Adobe Photoshop CC 2019" ,"https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 8,160,24,0,5,False,False, 3.9, "https://escuela.it/storage/course_images_thumbnail/SBw0PyAgXtsuIcRGjMJTQ5RqcYRUDR6seO8pinkh.jpeg"  
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("R tus primeras 100 horas","Curso avanzado de Series Temporales con R", "https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 9,170,25,0,6,True,True, 4.6, "https://escuela.it/storage/course_images_thumbnail/thumbnail-imagen-curso-angularjs-31.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("CSS de cero a 100", "Aprende Desarrollo Web con este curso 100% práctico, paso a paso y sin conocimientos previos, INCLUYE PROYECTO FINAL","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 10,180,26,0,2,False,False, 4.2, "https://escuela.it/storage/course_images_thumbnail/curso-express-nodejs-mini-65.jpg" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("HTML nivel experto","Crear Una Página Web Desde Cero con HTML", "https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 6,27,1,0,1,False,False,4.1,"https://escuela.it/storage/course_images_thumbnail/4x0N45XCJQqqgsNUj8RON0JvDOydd5FJNye7ug3Z.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("SQL para principiantes","SQL curso básico con MySQL, usar ficheros y bases de datos","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 8,210,28,0,6,True,True, 3.5, "https://escuela.it/storage/course_images_thumbnail/XKDwoV6ssV15ioMZ0w1d6KlRwale2p4YGeJnsFRQ.jpeg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Power BI","Curso Power BI – Análisis de Datos y Business Intelligence","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 4,220,29,0,6,True,True, 2.2, "https://escuela.it/storage/course_images_thumbnail/thumbnail-imagen-curso-angularjs-31.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Tableu moderno","Tableu curso básico. Aprende a usar la herramienta más popular ","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 2,230,30,0,6,True,True, 4.1, "https://escuela.it/storage/course_images_thumbnail/SBw0PyAgXtsuIcRGjMJTQ5RqcYRUDR6seO8pinkh.jpeg"  
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("MLflow desde cero","MLflow curso básico","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 5,240,32,0,6,False,False, 3.6, "https://escuela.it/storage/course_images_thumbnail/4x0N45XCJQqqgsNUj8RON0JvDOydd5FJNye7ug3Z.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Mongo nivel intermedio","Desarrollo web con MongoDB","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 1,250,33,0,3,True,True, 3.3, "https://escuela.it/storage/course_images_thumbnail/curso-express-nodejs-mini-65.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Angular para empezar","Angular: De cero a experto","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 1,260,34,1,1,False,False, 3.2, "https://escuela.it/storage/course_images_thumbnail/SBw0PyAgXtsuIcRGjMJTQ5RqcYRUDR6seO8pinkh.jpeg" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Power Point nivel avanzado","Powerpoint curso avanzado para realizar mejores presentaciones","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 8,270,35,0,4,False,False, 4.8, "https://escuela.it/storage/course_images_thumbnail/thumbnail-imagen-curso-angularjs-31.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Pycharm para pricipiantes","Pycharm curso básico","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 3,280,36,0,6,True,True, 4.1, "https://escuela.it/storage/course_images_thumbnail/4x0N45XCJQqqgsNUj8RON0JvDOydd5FJNye7ug3Z.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("JQuery nivel experto","JQuery avanzado, usar ficheros y bases de datos","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 2,290,37,0,1,True,True, 2.6, "https://escuela.it/storage/course_images_thumbnail/XKDwoV6ssV15ioMZ0w1d6KlRwale2p4YGeJnsFRQ.jpeg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Bootstrap para todos","Bootstrap 4: El Curso Completo, Práctico y Desde Cero","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 2,300,38,0,1,False,False, 2.9, "https://escuela.it/storage/course_images_thumbnail/SBw0PyAgXtsuIcRGjMJTQ5RqcYRUDR6seO8pinkh.jpeg"  
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Eclipse para hoy y mañana","Eclipse curso básico","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 7,310,39,0,3,True,True, 4.7, "https://escuela.it/storage/course_images_thumbnail/curso-express-nodejs-mini-65.jpg" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Illustrator nivel avanzado","Illustrator curso básico, aprende a usar la herramienta más popular ","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 6,320,40,1,5,False,False, 3.6, "https://escuela.it/storage/course_images_thumbnail/XKDwoV6ssV15ioMZ0w1d6KlRwale2p4YGeJnsFRQ.jpeg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Streamlit","Streamlit curso básico","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 5,330,41,0,6,False,False, 4.1, "https://escuela.it/storage/course_images_thumbnail/thumbnail-imagen-curso-angularjs-31.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("SAP + Hana + Abap","Curso Completo Consultor SAP MM desde Cero","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 4,340,42,0,3,True,True, 4.2, "https://escuela.it/storage/course_images_thumbnail/SBw0PyAgXtsuIcRGjMJTQ5RqcYRUDR6seO8pinkh.jpeg" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Matlab 300 horas","Aprende Matlab Completo: De Básico a Avanzado","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 1,350,43,1,6,False,False, 3.2, "https://escuela.it/storage/course_images_thumbnail/4x0N45XCJQqqgsNUj8RON0JvDOydd5FJNye7ug3Z.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Orstat - Mejora tu nivel","Orstat curso básico","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 6,360,44,0,6,False,False, 1.8, "https://escuela.it/storage/course_images_thumbnail/thumbnail-imagen-curso-angularjs-31.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Statgraphics moderno","Statgraphics curso básico","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 7,370,45,0,6,True,True, 2.9, "https://escuela.it/storage/course_images_thumbnail/curso-express-nodejs-mini-65.jpg" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Oracle para todos","Aprende a usar el lenguaje SQL, utilizado por Oracle 18c, 12c y 11g y orientado a preparar la certificación 1Z0-071","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 2,380,46,1,1,True,True, 4.0, "https://escuela.it/storage/course_images_thumbnail/XKDwoV6ssV15ioMZ0w1d6KlRwale2p4YGeJnsFRQ.jpeg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Tensorflow nivel bajo","Deep Learning con Tensorflow para Machine Learning e IA","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 5,390,47,0,6,False,False, 3.6, "https://escuela.it/storage/course_images_thumbnail/XKDwoV6ssV15ioMZ0w1d6KlRwale2p4YGeJnsFRQ.jpeg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("C++ para novatos","Curso de C++: Básico a Avanzado","linkcurso28.com",3,400,48,0,3,True,True, 4.1, "https://img-b.udemycdn.com/course/240x135/763172_d61c_4.jpg?secure=lgL4tisY2rJC82G-u-kSwA%3D%3D%2C1620284782"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Matplotlib desde cero","Análisis de Datos y Gráficos con Python: Panda y Matplotlib.","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 5,410,40,1,6,False,True, 4.4, "https://escuela.it/storage/course_images_thumbnail/4x0N45XCJQqqgsNUj8RON0JvDOydd5FJNye7ug3Z.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Github para expertos","GIT + GitHub: Todo un sistema de control de versiones de cero","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 8,420,41,1,2,False,False, 3.2, "https://escuela.it/storage/course_images_thumbnail/XKDwoV6ssV15ioMZ0w1d6KlRwale2p4YGeJnsFRQ.jpeg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Java para todos","En este curso aprenderás desde las bases de Java hacia temas más avanzados del lenguaje","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 4,430,42,0,3,True,True, 3.8, "https://escuela.it/storage/course_images_thumbnail/curso-express-nodejs-mini-65.jpg" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("MS project","La guía más rápida, sencilla y completa para lograr usar con éxito MS Project 2010 para administrar tus proyectos","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 6,440,43,0,4,True,False, 4.1, "https://escuela.it/storage/course_images_thumbnail/XKDwoV6ssV15ioMZ0w1d6KlRwale2p4YGeJnsFRQ.jpeg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Miro nivel intermedio","Miro curso básico","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 3,450,44,1,5,False,False, 2.3, "https://escuela.it/storage/course_images_thumbnail/thumbnail-imagen-curso-angularjs-31.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Scala desde cero","Aprende a desarrollar programas con el lenguaje Scala desde cero hasta conceptos avanzados","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 8,460,45,1,3,True,True, 3.9, "https://escuela.it/storage/course_images_thumbnail/SBw0PyAgXtsuIcRGjMJTQ5RqcYRUDR6seO8pinkh.jpeg"  
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Ruby para novatos","Aprende a programar con Ruby (desde cero y 100% en español)","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 2,470,46,0,3,False,False, 3.3, "https://escuela.it/storage/course_images_thumbnail/XKDwoV6ssV15ioMZ0w1d6KlRwale2p4YGeJnsFRQ.jpeg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Cobol para profesionales","Se ha recopilado todo lo necesario para que empieces a programar en COBOL lo más pronto posible.","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 4,480,47,0,3,False,True, 1.2, "https://escuela.it/storage/course_images_thumbnail/4x0N45XCJQqqgsNUj8RON0JvDOydd5FJNye7ug3Z.jpg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Kotlin para todos","Curso de Android 11 con Kotlin: Intensivo y práctico 2021","https://escuela.it/cursos/back-edge-desarrollo-web-al-limite-nodejs-es6-npm-mongodb", 1,490,48,1,3,True,True, 4.1, "https://escuela.it/storage/course_images_thumbnail/curso-express-nodejs-mini-65.jpg" 
);

INSERT INTO keywordsCursos(curso, keyword)
VALUES (1, 1);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (2, 2);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (2, 1);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (2, 5);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (3, 5);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (3, 9);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (4, 8);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (5, 7);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (6, 3);
INSERT INTO keywordsCursos(curso, keyword)
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

INSERT INTO favoritos(curso, estudiante)
VALUES (1, 1);
INSERT INTO favoritos(curso, estudiante)
VALUES (1, 2);
INSERT INTO favoritos(curso, estudiante)
VALUES (2, 3);
INSERT INTO favoritos(curso, estudiante)
VALUES (3, 4);
INSERT INTO favoritos(curso, estudiante)
VALUES (4, 6);
INSERT INTO favoritos(curso, estudiante)
VALUES (5, 5);
INSERT INTO favoritos(curso, estudiante)
VALUES (6, 6);
-- INSERT INTO favoritos(curso, estudiante)
-- VALUES (1, 7);
-- INSERT INTO favoritos(curso, estudiante)
-- VALUES (3, 7);

-- SACAR CURSOS POR CATEGORÍA ORDENADOS POR PUNTUACIÓN 
select * from cursos where categoria = 5 order by media;

-- INSERTAR REVIEW
insert into reviews (estudiante, curso, descripcion, valoracion) values (2, 4, "Regular", 3);

-- CALCULAR MEDIA DE REVIEWS
SELECT AVG(valoracion)
FROM reviews
WHERE curso = 4;

-- ACTUALIZAR LA MEDIA ARITMÉTICA EN TABLA CURSOS
update cursos set media = 4 where id = 4;

-- SACAR MATCHES DE CATEGORÍAS DE UN CURSO CONCRETO 
select keyword from keywordsCursos where curso = 4;

-- SACAR LAS KEYWORDS DE UN CURSO
SELECT descripcion
FROM keywords
INNER JOIN keywordsCursos
ON keywords.id = keywordsCursos.keyword
where curso = 2;

