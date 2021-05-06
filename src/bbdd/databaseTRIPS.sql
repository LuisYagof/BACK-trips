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
VALUES ("React Native: Aplicaciones nativas para IOS y Android", "Aprende React Native desde cero. Usa React Native para construir aplicaciones iOS y Android y profundiza en React Native", "https://www.udemy.com/course/react-desde-cero/ ", 1, 150, 13, 0, 1, true, false, 3.5, "https://img-a.udemycdn.com/course/240x135/3142596_259b_16.jpg?-p9s73fsg5JGyGlAoE4T0Hp0pUAoWOxSSu-tdtiQYNXH_lcPIhmWTw6X4GdmdfaT5k83j18T9psSnvqJGsgwGrCRPZXMLs50eI3LyFVBX9cGvZPN-F-zJ1_KDEaU2Gw"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("JavaScript de cero a experto", "Aprende el lenguaje de programación web más popular paso a paso Con Proyectos, inc. Electron React MongoDB Node Express", " https://www.udemy.com/course/curso-de-javascript-2020/", 2, 176, 16, 0, 2, false, true, 2.8, "https://img-a.udemycdn.com/course/240x135/2680160_3375_2.jpg?4W1oO458sV9kr4WeBhOl6MxwMgPLAGRuQjkj_CN8sY2FDG073Acnpv-lXdpu-OmBX2XwSqjlWiP2DjoE_7F6de-EKKb7J-UcFnn38MkJL5xzPcAFlASBI7LOMRG9Pg "
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("Node y APIRest", "Rest, despliegues, Heroku, Mongo, Git, GitHub, Sockets, archivos, JWT y mucho más para ser un experto en Node", "https://www.udemy.com/course/introduccion-a-nodejs-para-verdaderos-principiantes/", 3, 134, 18, 0, 1, true, true, 4.2, "https://img-a.udemycdn.com/course/240x135/2259838_33a7_2.jpg?SanWi9ySbswO1O-sAdhvUJjxbS42Lb1N-quwumK8b8SF-yoxI2IXylsWUAcxypMcv2RQt4WfS3avD6Cc_7L_GmXS79Wpbg5k-8ZRhkc02XdysaPWQBZ0Xf2bed6vsQ"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("Administrador de Salesforce", "Comienza tu Carrera Profesional como Administrador de Salesforce", "https://www.udemy.com/course/salesforce-administrator/", 4, 180, 18, 0, 4, true, true, 3.6, "https://img-b.udemycdn.com/course/240x135/693700_d3eb_4.jpg?secure=ded7zsMlv9SB_Mj0cgmTtw%3D%3D%2C1620284759" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("Experto en Sketch", "Aprende a usar la herramienta más popular y profesional para diseño de interfaz", "https://www.udemy.com/course/learnsketch3/", 5, 198, 12, 0, 5, false, false, 2.9, "https://img-a.udemycdn.com/course/240x135/371074_6c73_2.jpg?iuugyLkMdyddfGlaLoIaklLWaTWRXAsu5vnh7VHzPsVPoWZqxKNaf1YSiWFJryIPdUqd6BHJ8MjDaOoYHJCr3XGp2tQHsA2AS7Fuw4bA1ExRHyxUsj6PXEIjhPMP"  
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("Python + SQLite", "Aprende a programar con clases y objetos, a usar ficheros y bases de datos SQLite, interfaces gráficas y más con Python!", " https://www.udemy.com/course/aprenda-la-logica-de-la-programacion/", 6, 100, 14, 0, 6, false, false, 2.8, "https://img-b.udemycdn.com/course/240x135/445380_7bed_7.jpg?secure=PrE38c7bD6ZqJnfKuJvUWA%3D%3D%2C1620284654"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen) 
VALUES ("Excel para todos","Excel: curso básico para principiantes","https://www.udemy.com/course/excel-completo-desde-principiante-hasta-avanzado/", 7,150,23,0,4,False,True, 4.2, "https://img-a.udemycdn.com/course/240x135/1341936_2776.jpg?ro2n94C-Z-TQPAk8syYp9KWR146oPJ1EkVcVvsPuui_-vePkGXEGrE8isdibBfxREnPklJCueeNCANnsXtRbMMWKIYgGSZbJuovOAH0I-9lhnNthwQnfQpeHKoc"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES ("Adobe photoshop para novatos","Master Diseño Digital con Adobe Photoshop CC 2019" ,"https://www.udemy.com/course/photoshop-2020-desde-cero-hasta-el-infinito/", 8,160,24,0,5,False,False, 3.9, "https://img-a.udemycdn.com/course/240x135/3828142_d5c7_14.jpg?Sg4mZogd3vIRe-G9ad7GbIDxTiobe-DBWmrxIz7nuXThQ3otuMZsJ7gVb9y1Y3XFV_1hahFx9ExUUBODlsh30ZMX1lgg0IICPXPTmxe5Y2ab8xJODweRsN2Rkk4FN2w"  
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("R tus primeras 100 horas","Curso avanzado de Series Temporales con R", "https://www.udemy.com/course/comienza-con-r-curso-de-r/", 9,170,25,0,6,True,True, 4.6, "https://img-a.udemycdn.com/course/240x135/1165924_c0dd_7.jpg?di_gtJDbKIeNF6jmSxyUs-clyzTb5JB9Po5_Ne47ha3VpPXINl_vU7Vne1ESPuojE7OQNygSRsoeHXt_N_7QQkxP3ELtt_f6bp56MHX4KNR9l3zq6I6J8fC9hNrvRQ"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("CSS de cero a 100", "Aprende Desarrollo Web con este curso 100% práctico, paso a paso y sin conocimientos previos, INCLUYE PROYECTO FINAL"," https://www.udemy.com/course/css-edicion-2020/", 10,180,26,0,2,False,False, 4.2, "https://img-a.udemycdn.com/course/240x135/2808871_f526.jpg?R1AFCyvxe1fuHCZ0uuwjddPZ8VaXIAypAYA51ZVZtNj_b8KfBwxzbX33aVurspLWAlpePnqoUMCyJEGVutDM-FSOSCOS3JcaFpOi1fQgLpkO3bry3h7YdrzJiuk " 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("HTML nivel experto","Crear Una Página Web Desde Cero con HTML", "https://www.udemy.com/course/curso-html5-completo/", 6,27,1,0,1,False,False,4.1,"https://img-a.udemycdn.com/course/240x135/3462566_1a6b_2.jpg?nScnPcT0R4z1W6fHCH313WH32k_nicmvXT5_GrwAka_xF3HyyI4IbETHCLbsrRauTUl0FuOgoOAW5OdhEIza2_85viqxRT_u_U-rv_o1NcQLjaq5ZNe-Kqk0IzI5dw"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("SQL para principiantes","SQL curso básico con MySQL, usar ficheros y bases de datos","https://www.udemy.com/course/comienza-con-sql/", 8,210,28,0,6,True,True, 3.5, "https://img-a.udemycdn.com/course/240x135/849858_ef8c_8.jpg?imI-YgIU5dnd3MxPfi3Lx1DgIBQN3FtOLskB2ZwOoPuU2qOVC50TCFPGgjATNUhEVdUAdc8VqsJ4YzHFjgHy3-vllfHAL8hmOjwV67ThwRCrvJN58rDq0gbKjnhJ"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Power BI","Curso Power BI – Análisis de Datos y Business Intelligence","https://www.udemy.com/course/power-bi-analisis-datos-business-intelligence/", 4,220,29,0,6,True,True, 2.2, "https://img-a.udemycdn.com/course/240x135/2178672_c203_3.jpg?Mkb9HZQ9IMNzl1nenCVAiHRfKhZmwhlpMxLqgyuJpd_zODIjl3GsakyB18I9-W_TbFldvuf6Gc1MELKdPf8GcOoaeSl21MIYH-AX0-X9rG06nuH8ForUUBhhXu9M6g"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Tableu moderno","Tableu curso básico. Aprende a usar la herramienta más popular ","https://www.udemy.com/course/tableau-desktop/", 2,230,30,0,6,True,True, 4.1, "https://img-a.udemycdn.com/course/240x135/2592358_1726_9.jpg?TkK9TM0e1OD05-2iaTdR5tXxX94MyblA7szt1Uw5XSEH4Pqn1GirBVzZDmOQ872CDbmSxQ1q8S1gunEP6K9tuVaiAhcrO_krvvkkGBG-6_umIlcrZMFS47WWyYGJrg"  
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("MLflow desde cero","MLflow curso básico","https://www.udemy.com/course/machine-learning-deep-learning-model-deployment/ ", 5,240,32,0,6,False,False, 3.6, "https://img-a.udemycdn.com/course/240x135/3563973_2444.jpg?UMCF7U0Dgk7aO9x_p8dAhDX8A-69JOsjHgVLGBfgYq1gMD9UxgAwL-34g39JB6RDWLxY8wRePn3eoItqlV3P1gKDq66EJf_iDai2DSavJFr6Dcn-R0nu6s2g3mk"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Mongo nivel intermedio","Desarrollo web con MongoDB","https://www.udemy.com/course/aprende-mongodb-desde-cero/", 1,250,33,0,3,True,True, 3.3, "https://img-a.udemycdn.com/course/240x135/2494812_a922_2.jpg?CXuv-DMjpT70dTli2D9BI8IEtyWRe0FocHyFDOxPNJioylUga7hMefhpoKzPz8p1wpMhJKvnnOw-nFXfwmVyGKw3N34JtwlzXr38FAnDbSxZDS-8INitSbPnOUDu6A"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Angular para empezar","Angular: De cero a experto","https://www.udemy.com/course/angular-2-fernando-herrera/", 1,260,34,1,1,False,False, 3.2, "https://img-a.udemycdn.com/course/240x135/1075334_8b5f_4.jpg?uUWjk2LFMUVCEY9w3rIxLJtbBL035fHHr_aLeglssP5T0lwEpuwS-rjwSO_qUUsMwA16QpjwvhLyxERaPwraetLQ_16DGGh5GAbrNrsZmvYqe4bJIjMmonxxqAXa0w" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Power Point nivel avanzado","Powerpoint curso avanzado para realizar mejores presentaciones","https://www.udemy.com/course/curso-de-power-point-desde-basico-hasta-avanzado/", 8,270,35,0,4,False,False, 4.8, "https://img-b.udemycdn.com/course/240x135/3865742_a6f5_2.jpg?secure=rX5Rc5sTaJCIyzckYMjlfQ%3D%3D%2C1620288292"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Pycharm para pricipiantes","Pycharm curso básico","https://www.udemy.com/course/pycharm-for-power-developer/", 3,280,36,0,6,True,True, 4.1, "https://img-b.udemycdn.com/course/240x135/1894384_0b8f_2.jpg?secure=1tifGh0fq-Wsc0GVmoCEAA%3D%3D%2C1620285329"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("JQuery nivel experto","JQuery avanzado, usar ficheros y bases de datos","https://www.udemy.com/course/aprende-jquery-desde-cero/", 2,290,37,0,1,True,True, 2.6, "https://img-a.udemycdn.com/course/240x135/915556_6500_2.jpg?M3u0W6yrikozD5nbt41dOFeNAVY3-7GLq9I_FL6ZFu-4NfioA_PVTWPAuCzFPXQBTT5UzbCdYLKDJIvpTC32P6fks4GmZxMoSJYmBJxk1w5W58c3hjZ-uofSmN_G"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Bootstrap para todos","Bootstrap 4: El Curso Completo, Práctico y Desde Cero","https://www.udemy.com/course/curso-bootstrap/", 2,300,38,0,1,False,False, 2.9, "https://img-a.udemycdn.com/course/240x135/1245130_efdb_9.jpg?eNdGrcUJsOpVvFRBJmPyuVb8elWyZ5rVQnL0vTDt8SHqKZpDPgl8P0KmaHE8nZmNi4vPhRfT1BeCbYAcrZwp7hKQFDgBLpjf22oZpp62QG72ZvINTZy9OGjQnuCumg"  
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Abap para hoy y mañana","Abap curso básico"," https://www.udemy.com/course/abap-development-tools-in-eclipse-version-en-espanol/", 7,310,39,0,3,True,True, 4.7, "https://img-a.udemycdn.com/course/240x135/2069837_8cff_2.jpg?AvMHoWr90B_SHEnG_qadA_7Tb71tx2j6U8O2Q-sESP2fcKyJi8Op2_Q-9EebfqwWj2ptpmsGioQSKL12vo9T84fMHE39AjgUAwYjp_8-k2NsZV8QxMs8t_uQCA-jAA" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Illustrator nivel avanzado","Illustrator curso básico, aprende a usar la herramienta más popular ","https://www.udemy.com/course/curso-de-illustrator-cc/", 6,320,40,1,5,False,False, 3.6, "
https://img-b.udemycdn.com/course/240x135/224512_af6d_3.jpg?secure=warlZAoYThYC8PeIaPHvyQ%3D%3D%2C1620284589"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Streamlit","Streamlit curso básico","https://www.udemy.com/course/learn-streamlit-python/", 5,330,41,0,6,False,False, 4.1, "https://img-a.udemycdn.com/course/240x135/3615822_2cbd_2.jpg?NhlOwlAvP8j5Lt3aWXFbh0iU5VxaDbhMgeVCu-86xDsJKeXmxWL-gg_bxBFFnMPLdH_fyHZgNzmUIPFEcHZkJzxuS-S7FiIcAgu8crR-mxiohw2QmgnxNadaT2_QCg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("SAP + Hana + Abap","Curso Completo Consultor SAP MM desde Cero","https://www.udemy.com/course/sap-abap-completo-en-espanol/", 4,340,42,0,3,True,True, 4.2, "https://img-a.udemycdn.com/course/240x135/1146812_52d4_2.jpg?Vzj9xCW2CNxxORGcNMUFYDK04HRasbpLE1aiy83neS7-4W5wrxI-ZMp19Gl6K7U6gq3eAOUcXXmenTUOZM5Y0BpalaMb3daKZq_AsA2FbPhrfebmS02wfloVFJfaBg" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Matlab 300 horas","Aprende Matlab Completo: De Básico a Avanzado","https://www.udemy.com/course/matlabdesdecero/", 1,350,43,1,6,False,False, 3.2, "https://img-a.udemycdn.com/course/240x135/2900486_996e_6.jpg?rGPCBFHJaOeR2cUEwvehMxmr6NYpRYnz2mUEVU9E79pigHOeTRMzLHDUXZWSw_jrO_SEy_wSxcHK8_qwxo_Cmp_N1qQqgTpC-cItmqRVFJha5xEQNppdLPzV0eQBww"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Orstat - Mejora tu nivel","Orstat curso básico","https://www.udemy.com/course/chemical-engineering/", 6,360,44,0,6,False,False, 1.8, "https://img-b.udemycdn.com/course/240x135/1262526_8e83.jpg?secure=Z0ZL-9ipbYuNLnDJ7QJ7HA%3D%3D%2C1620284941"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Mongoose moderno","Mongoose curso básico","https://www.udemy.com/course/programa-hoy-en-mongodb-con-mongoose/", 7,370,45,0,6,True,True, 2.9, "https://img-b.udemycdn.com/course/240x135/1966730_d9d1_2.jpg?secure=Y9yqtMWOvsq2gFCYXYrT3g%3D%3D%2C1620285356" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Oracle para todos","Aprende a usar el lenguaje SQL, utilizado por Oracle 18c, 12c y 11g y orientado a preparar la certificación 1Z0-071","https://www.udemy.com/course/oracle-plsql-de-cero-a-avanzado/", 2,380,46,1,1,True,True, 4.0, "https://img-a.udemycdn.com/course/240x135/1703424_b1ca.jpg?-Us0B97leftoFyRrv5RN4Rx_auhMaP7buddde8el0y0rSKczWqFIOWaDuyyqmY9nQpanJkQecfdhmV8cnvLY9W-tOSDaN4l6VoqvUwPe33j9e2CkmWTkOwm9kTE"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Tensorflow nivel bajo","Deep Learning con Tensorflow para Machine Learning e IA","https://www.udemy.com/course/tensorflow2/", 5,390,47,0,6,False,False, 3.6, "https://img-a.udemycdn.com/course/240x135/2440222_929d_2.jpg?Xc85D2vyxfl8MvNkfWw7sbGzvHX8h1yvPLLz0k6gHvPVJPCe-v7rIeGhHOWC_d1kbB5sFaR3ZwzMSglDSk9M17YUqg1ZIlyg4DcnFSqAdtsx2S31xU7kkBUbcwHzOw"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("C++ para novatos","Curso de C++: Básico a Avanzado","https://www.udemy.com/course/curso-de-cpp-basico-a-avanzado/",3,400,48,0,3,True,True, 4.1, "https://img-b.udemycdn.com/course/240x135/763172_d61c_4.jpg?secure=lgL4tisY2rJC82G-u-kSwA%3D%3D%2C1620284782"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Matplotlib desde cero","Análisis de Datos y Gráficos con Python: Panda y Matplotlib.","https://www.udemy.com/course/visualizacion-de-datos-en-python-matplotlib/", 5,410,40,1,6,False,True, 4.4, "https://img-b.udemycdn.com/course/240x135/2395038_6b23.jpg?secure=16khzOvL_UlPeyi0OcyH5g%3D%3D%2C1620285848"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Github para expertos","GIT + GitHub: Todo un sistema de control de versiones de cero","https://www.udemy.com/course/git-y-github-completo-desde-cero/ ", 8,420,41,1,2,False,False, 3.2, "https://img-a.udemycdn.com/course/240x135/940740_4db9_4.jpg?AQmtReCevwtAud2iMePs7U1kY9i1SuGbI1lrU_IR6MfruQ9H05hbXr6Ftp0JopnMhIoKwZtTO0xbIKD36cYU6nIMZaZtjj-WkafHeV-GQXzr05aoKx4XGl7W7aYl"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Java para todos","En este curso aprenderás desde las bases de Java hacia temas más avanzados del lenguaje","https://www.udemy.com/course/club-java-master-de-novato-a-experto-java-javaee-spring-hibernate-jpa/ ", 4,430,42,0,3,True,True, 3.8, "https://img-a.udemycdn.com/course/240x135/1478318_aadb_6.jpg?f09KvxOop_C7TLqpA6rR1gol7F1debiFH1RVYi3HFzaYwrrvbPYJadp1To4ke3vE-LK1toS6CMkw0PknnIx9sYfsO_eseUesF3VcH7aj3w1CLQEUX_SkDjS9547IWg" 
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("MS project","La guía más rápida, sencilla y completa para lograr usar con éxito MS Project 2010 para administrar tus proyectos","https://www.udemy.com/course/administra-proyectos-con-ms-project-de-cero-a-avanzado/", 6,440,43,0,4,True,False, 4.1, "https://img-a.udemycdn.com/course/240x135/1814586_ff86.jpg?9Lhk6sRtCxGsAUjGs0T-ORLXQMBkCd2w93s7qrViVFKE3SZmmQYXnxwYgO7mpZpQXuNbe2N-RhJHjlJSuZSDN1XzYjNypS8pRC3DWv3mCBBtLTWd8VVfMm92Puo"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Miro nivel intermedio","Miro curso básico","https://www.udemy.com/course/miro-grundlagenkurs/ ", 3,450,44,1,5,False,False, 2.3, "https://img-a.udemycdn.com/course/240x135/3779112_21ee_5.jpg?1yk9e0UTLOySpQFauGCMEhWyCYXrXZnuaVw2Kw9eRxpj2h6veCDpQxEXGiLW6fzeiXwWcWsGIMydXbn0bsTt-dkL6g9Im-hZtivk1Oyu9b8zGv_OZ9dAwpoPdaU2bg"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Scala desde cero","Aprende a desarrollar programas con el lenguaje Scala desde cero hasta conceptos avanzados","https://www.udemy.com/course/scala-desde-cero/", 8,460,45,1,3,True,True, 3.9, "https://img-a.udemycdn.com/course/240x135/3390362_999d.jpg?0YlN5wcAL5YC2yaXRR3eRbu_OOqgbEXkYZ8sW9J2e5dChsgfqb67uL3h8OzRoJGgxs3Z-kRw01m4vk-0MJVjuBnApHHT88kzagFeixXjlERwy4VXVCNf2fcHVpQg"  
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Ruby para novatos","Aprende a programar con Ruby (desde cero y 100% en español)","https://www.udemy.com/course/aprende-a-programar-con-ruby-desde-cero-y-100-en-espanol/", 2,470,46,0,3,False,False, 3.3, "https://img-a.udemycdn.com/course/240x135/853352_5acb_4.jpg?BYKzh1qoLgH0W3s6Eg8D6x2_Lwf-X9xvXA5Cc_W0yWrB3e69zyrroPyw3ateQ1jU6U1-TZ_jcrqCu1xvi2_fTy7D2dFlMs-DIyQGmSP2nKeKkreOGD0_MG1v4y0z"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Cobol para profesionales","Se ha recopilado todo lo necesario para que empieces a programar en COBOL lo más pronto posible.","https://www.udemy.com/course/lenguaje-de-programacion-cobol/", 4,480,47,0,3,False,True, 1.2, "https://img-a.udemycdn.com/course/240x135/997140_c63f_6.jpg?GY2Ed6QGPx91SyM4fhZ3TEXO0vtx8JLgRBvdGlIY79_qGR5eaNYJMbxDo_V_L_Ga7m4n74sXWGGq-Kef8XJc-osgWDFyOxT5afD_fMRbCoh8W6RRsBCIV1ODMZr2"
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen)
VALUES("Kotlin para todos","Curso de Android 11 con Kotlin: Intensivo y práctico 2021","https://www.udemy.com/course/kotlin-desde-cero/", 1,490,48,1,3,True,True, 4.1, "https://img-b.udemycdn.com/course/240x135/1253980_5d15_2.jpg?secure=sk3MJ_FfeDZKW1u4thOOgg%3D%3D%2C1620284960" 
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

