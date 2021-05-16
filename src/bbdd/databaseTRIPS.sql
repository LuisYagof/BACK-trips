create database coursenine;

USE coursenine;

CREATE TABLE estudiantes(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50),
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
descripcion VARCHAR(850),
enlace VARCHAR(255),
docente INT,
precio INT,
duracion INT,
idioma INT,
categoria INT,
bolsaEmpleo BOOLEAN,
certificado BOOLEAN,
media FLOAT(3,2),
imagen VARCHAR(255),
fecha BIGINT,
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

INSERT INTO estudiantes(nombre, apellido, email, pass, secreto)
VALUES ("Pedro", "Castera", "pedro@hotmail.com", "password1", "qwertyn123+");
INSERT INTO estudiantes(nombre, apellido, email, pass, secreto)
VALUES ("Loli", "Start", "lolistart@hotmail.com", "password1", "qwertyn123+");
INSERT INTO estudiantes(nombre, apellido, email, pass, secreto)
VALUES ("Rosa", "Pecosa", "rosapecosa@gmail.com", "password1", "qwertyn123+");
INSERT INTO estudiantes(nombre, apellido, email, pass, secreto)
VALUES ("Carlos", "Fernández", "carlosfe@hotmail.com", "password1", "qwertyn123+");
INSERT INTO estudiantes(nombre, apellido, email, pass, secreto)
VALUES ("Jesús María", "de los Santos", "jesusmarisan@gmail.com", "password1", "qwertyn123+");
INSERT INTO estudiantes(nombre, apellido, email, pass, secreto)
VALUES ("Julia", "Dominguez", "julia@hotmail.com", "password1", "qwertyn123+");

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
VALUES ("Jose Luis López", "zellfhirot@hotmail.com", "password1", "qwerty123+", "Soy la máquina de los endpoints", "linkedin.com/zellfhirot");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Luis Fernández", "luisyagofdez@mail.com", "password1", "qwerty123+", "Desarrollador Full-Stack apasionado de la lógica computacional.", "linkedin.com/luisyagofdez");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Sol Jiménez", "soljimenez@gmail.com", "password1", "qwerty123+", "Creativa y resolutiva", "linkedin.com/soljimenez");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Silvia Hernández", "silviahernandez@gmail.com", "password1", "qwerty123+", "Soy la master del React", "linkedin.com/silviahernandez");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Fernando Herrera", "fherrera@gmail.com", "password1", "qwerty123+", "Tengo 10 años de experiencia como docente.", "linkedin.com/fernando-herrera");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("Alberto Esparza", "albertoesparza@gmail.com", "password1", "qwerty123+", "Mi vocación es el diseño inteligente.", "linkedin.com/alberto-esparza");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("The Bridge", "thebridge@tech.com", "password1", "qwerty123+", "Amante de plataformas digitales y apasionado de la tecnología.", "linkedin.com/eduardomelano");
INSERT INTO docentes(nombre, email, pass, secreto, descripcion, enlace) 
VALUES ("María Castañón", "mariacastanon@gmail.com", "password1", "qwerty123+", "Soy profesora universitaria y una gran defensora de la formación online.", "linkedin.com/maria_castanon");

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
INSERT INTO keywords(descripcion)
VALUES ("React Native");
INSERT INTO keywords(descripcion)
VALUES ("SQLite");
INSERT INTO keywords(descripcion)
VALUES ("Excel");
INSERT INTO keywords(descripcion)
VALUES ("Photoshop");
INSERT INTO keywords(descripcion)
VALUES ("R");
INSERT INTO keywords(descripcion)
VALUES ("CSS");
INSERT INTO keywords(descripcion)
VALUES ("HTML");
INSERT INTO keywords(descripcion)
VALUES ("PowerBI");
INSERT INTO keywords(descripcion)
VALUES ("Tableu");
INSERT INTO keywords(descripcion)
VALUES ("MLflow");
INSERT INTO keywords(descripcion)
VALUES ("Angular");
INSERT INTO keywords(descripcion)
VALUES ("Power Point");
INSERT INTO keywords(descripcion)
VALUES ("Pycharm");
INSERT INTO keywords(descripcion)
VALUES ("JQuery");
INSERT INTO keywords(descripcion)
VALUES ("Bootstrap");
INSERT INTO keywords(descripcion)
VALUES ("ABAP");
INSERT INTO keywords(descripcion)
VALUES ("Illustrator");
INSERT INTO keywords(descripcion)
VALUES ("Streamlit");
INSERT INTO keywords(descripcion)
VALUES ("Hana");
INSERT INTO keywords(descripcion)
VALUES ("Matlab");
INSERT INTO keywords(descripcion)
VALUES ("Orstat");
INSERT INTO keywords(descripcion)
VALUES ("Mongoose");
INSERT INTO keywords(descripcion)
VALUES ("Oracle");
INSERT INTO keywords(descripcion)
VALUES ("Tensorflow");
INSERT INTO keywords(descripcion)
VALUES ("C++");
INSERT INTO keywords(descripcion)
VALUES ("Matplotlib");
INSERT INTO keywords(descripcion)
VALUES ("Github");
INSERT INTO keywords(descripcion)
VALUES ("Java");
INSERT INTO keywords(descripcion)
VALUES ("MS Proyect");
INSERT INTO keywords(descripcion)
VALUES ("Miro");
INSERT INTO keywords(descripcion)
VALUES ("Scala");
INSERT INTO keywords(descripcion)
VALUES ("Ruby");
INSERT INTO keywords(descripcion)
VALUES ("Cobol");
INSERT INTO keywords(descripcion)
VALUES ("Kotlin");

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

INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha) 
VALUES ("React Native: Aplicaciones nativas para IOS y Android", "Bienvenido al curso de React: El Curso Completo, Práctico y desde Cero!En este curso aprenderás React desde lo mas básico y paso por paso hasta un nivel avanzado donde podrás crear sitios y aplicaciones web reales. Para el final del curso seras capaz de crear cualquier sitio y aplicacion utilizando React.", "https://www.udemy.com/course/react-desde-cero/ ", 1, 150, 13, 0, 1, true, false, 3.5, "https://img-a.udemycdn.com/course/240x135/3142596_259b_16.jpg?-p9s73fsg5JGyGlAoE4T0Hp0pUAoWOxSSu-tdtiQYNXH_lcPIhmWTw6X4GdmdfaT5k83j18T9psSnvqJGsgwGrCRPZXMLs50eI3LyFVBX9cGvZPN-F-zJ1_KDEaU2Gw", 1565990767000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha) 
VALUES ("JavaScript de cero a experto", "En este curso aprenderás a utilizar el lenguaje JavaScript desde las bases, veremos la sintaxis, los tipos de datos, como añadir lógica, la manipulación del DOM, como realizar peticiones a un servidor de todas las formas que existen en la actualidad, desde XMLHTTPRequest hasta async/await pasando por promesas y por fetch, las principales API's de HTML5 y todo según marcan los estándares.", " https://www.udemy.com/course/curso-de-javascript-2020/", 2, 176, 16, 0, 2, false, true, 2.8, "https://img-a.udemycdn.com/course/240x135/2680160_3375_2.jpg?4W1oO458sV9kr4WeBhOl6MxwMgPLAGRuQjkj_CN8sY2FDG073Acnpv-lXdpu-OmBX2XwSqjlWiP2DjoE_7F6de-EKKb7J-UcFnn38MkJL5xzPcAFlASBI7LOMRG9Pg ", 1567517728000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha) 
VALUES ("Node y APIRest", "Node.js  es un entorno en tiempo de ejecución multiplataforma, de código abierto, para la capa del servidor (pero no limitándose a ello) basado en el lenguaje de programación ECMAScript, asíncrono, con I/O de datos en una arquitectura orientada a eventos y basado en el motor V8 de Google. Este curso está enfocado a los desarrolladores con conocimientos de HTML, CSS y JavaScript.", "https://www.udemy.com/course/introduccion-a-nodejs-para-verdaderos-principiantes/", 3, 134, 18, 0, 1, true, true, 4.2, "https://img-a.udemycdn.com/course/240x135/2259838_33a7_2.jpg?SanWi9ySbswO1O-sAdhvUJjxbS42Lb1N-quwumK8b8SF-yoxI2IXylsWUAcxypMcv2RQt4WfS3avD6Cc_7L_GmXS79Wpbg5k-8ZRhkc02XdysaPWQBZ0Xf2bed6vsQ", 1589403695000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha) 
VALUES ("Administrador de Salesforce", "The Complete Salesforce Administrator Certification Course is for anyone interested in passing the Administrator Certification exam. This course is designed with the new Salesforce administrator in mind. I cover each section of the Administrator Study Guide in-depth, giving examples in the interface, as well as hands-on experience so you  can apply the concepts you are learning.", "https://www.udemy.com/course/salesforce-administrator/", 4, 180, 18, 0, 4, true, true, 3.6, "https://img-b.udemycdn.com/course/240x135/693700_d3eb_4.jpg?secure=ded7zsMlv9SB_Mj0cgmTtw%3D%3D%2C1620284759", 1620670539000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha) 
VALUES ("Experto en Sketch", "Sketch has revolutionized the world of mobile application design by providing the tools to transform yourself into a professional app designer with only a few hours of training. This course will teach you to use the Sketch to design dynamic, development-ready mobile app user interfaces that impress clients and engage users. ", "https://www.udemy.com/course/learnsketch3/", 5, 198, 12, 0, 5, false, false, 2.9, "https://img-a.udemycdn.com/course/240x135/371074_6c73_2.jpg?iuugyLkMdyddfGlaLoIaklLWaTWRXAsu5vnh7VHzPsVPoWZqxKNaf1YSiWFJryIPdUqd6BHJ8MjDaOoYHJCr3XGp2tQHsA2AS7Fuw4bA1ExRHyxUsj6PXEIjhPMP", 1590162025000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha) 
VALUES ("Python + SQLite", "Aprenderás sobre las estructuras de control en Python (condicionale, bucles). Aprenderás sobre el uso de diferentes tipos de operadores en Python (aritméticos, relacionales, lógicos). Aprenderás sobre el uso de colecciones en Python (listas, tuplas, conjuntos, diccionarios)", " https://www.udemy.com/course/aprenda-la-logica-de-la-programacion/", 6, 100, 14, 0, 6, false, false, 2.8, "https://img-b.udemycdn.com/course/240x135/445380_7bed_7.jpg?secure=PrE38c7bD6ZqJnfKuJvUWA%3D%3D%2C1620284654", 1581911018000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha) 
VALUES ("Excel para todos","El Curso Completo de Microsoft Excel, está pensado analíticamente para brindarle al estudiante todos los conocimientos necesarios para lograr ser un experto en esta poderosa plataforma. Empezaremos este gran viaje desde lo más básico para personas que estén iniciando su proceso y se les pueda facilitar su avance a niveles superiores, luego pasaremos al nivel intermedio que es una parte bastante importante.","https://www.udemy.com/course/excel-completo-desde-principiante-hasta-avanzado/", 7,150,23,0,4,False,True, 4.2, "https://img-a.udemycdn.com/course/240x135/1341936_2776.jpg?ro2n94C-Z-TQPAk8syYp9KWR146oPJ1EkVcVvsPuui_-vePkGXEGrE8isdibBfxREnPklJCueeNCANnsXtRbMMWKIYgGSZbJuovOAH0I-9lhnNthwQnfQpeHKoc", 1614998661000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES ("Adobe photoshop para novatos","Mi forma de enseñar consiste en explicar primero la teoría de las herramientas , para que luego el alumno pueda repetir los mismos pasos que se muestran en los videos y sea capaz de dominar el programa. Asimismo se plantean ejercicios al final de cada calse y un ejercicio final para aprender definitivamente a usar correctamente Photoshop." ,"https://www.udemy.com/course/photoshop-2020-desde-cero-hasta-el-infinito/", 8,160,24,0,5,False,False, 3.9, "https://img-a.udemycdn.com/course/240x135/3828142_d5c7_14.jpg?Sg4mZogd3vIRe-G9ad7GbIDxTiobe-DBWmrxIz7nuXThQ3otuMZsJ7gVb9y1Y3XFV_1hahFx9ExUUBODlsh30ZMX1lgg0IICPXPTmxe5Y2ab8xJODweRsN2Rkk4FN2w", 1556238680000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("R tus primeras 100 horas","R puedes ser bastante difícil de entender para la persona que recién comienza, pero con este curso te llevare paso a paso desde cero para que te sientas cómodo escribiendo código en R. Empezaremos por lo básico y aprenderás los bloques necesarios para entender como funciona R. He intentado simplificarlo todo para que entiendas lo básico y que te sirva para seguir aprendiendo y mejorando. Espero que con este curso te sea fácil y rápido empezar este reto.como el lenguaje de programación usado para el aprendizaje automático o machine learning.", "https://www.udemy.com/course/comienza-con-r-curso-de-r/", 9,170,25,0,6,True,True, 4.6, "https://img-a.udemycdn.com/course/240x135/1165924_c0dd_7.jpg?di_gtJDbKIeNF6jmSxyUs-clyzTb5JB9Po5_Ne47ha3VpPXINl_vU7Vne1ESPuojE7OQNygSRsoeHXt_N_7QQkxP3ELtt_f6bp56MHX4KNR9l3zq6I6J8fC9hNrvRQ", 1584227796000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("CSS de cero a 100", "Espero que este curso os ayude a continuar y mejorar vuestro conocimiento en el desarrollo web de forma correcta, conociendo TODA la teoría que hay detrás del BOX MODEL, FLEXBOX, GRID, POSITION, TRANSFORMACIONES, TRANSICIONES, ANIMACIONES y la mayoría de las opciones que tiene CSS que cada año son más y más!!"," https://www.udemy.com/course/css-edicion-2020/", 10,180,26,0,2,False,False, 4.2, "https://img-a.udemycdn.com/course/240x135/2808871_f526.jpg?R1AFCyvxe1fuHCZ0uuwjddPZ8VaXIAypAYA51ZVZtNj_b8KfBwxzbX33aVurspLWAlpePnqoUMCyJEGVutDM-FSOSCOS3JcaFpOi1fQgLpkO3bry3h7YdrzJiuk ", 1554028297000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("HTML nivel experto","HTML es uno de los lenguajes más importantes  en el momento de crear páginas web, aunque este lenguaje no es un lenguaje de programación si es un lenguaje de etiquetas, pero esto no significa que no se puedan hacer bastantes cosas, puesto que con HTML5 estructuramos la información de cualquier página web en internet.", "https://www.udemy.com/course/curso-html5-completo/", 6,27,1,0,1,False,False,4.1,"https://img-a.udemycdn.com/course/240x135/3462566_1a6b_2.jpg?nScnPcT0R4z1W6fHCH313WH32k_nicmvXT5_GrwAka_xF3HyyI4IbETHCLbsrRauTUl0FuOgoOAW5OdhEIza2_85viqxRT_u_U-rv_o1NcQLjaq5ZNe-Kqk0IzI5dw", 1579254529000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("SQL para principiantes","En este curso aprenderás desde cero todos los comando utilizados para convertirte en un experto del el lenguaje SQL. Trabajaras con bases de datos MySQL, pero estos comandos te servirán para otros tipos de bases de datos como SQLite o SQL Server.","https://www.udemy.com/course/comienza-con-sql/", 8,210,28,0,6,True,True, 3.5, "https://img-a.udemycdn.com/course/240x135/849858_ef8c_8.jpg?imI-YgIU5dnd3MxPfi3Lx1DgIBQN3FtOLskB2ZwOoPuU2qOVC50TCFPGgjATNUhEVdUAdc8VqsJ4YzHFjgHy3-vllfHAL8hmOjwV67ThwRCrvJN58rDq0gbKjnhJ", 1588317924000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Power BI","Microsoft Power BI es uno de los programas con tecnologías de Business Intelligence más robusto en el mercado, y al mismo tiempo es uno de los más baratos ¡incluso gratuito! Cualquiera puede iniciar a desarrollar reportes con visualizaciones interactivas gratis. Si eres dueño de un negocio, gerente de un departamento, o simplemente tienes interés en analizar y dar seguimiento a tus actividades y objetivos, entonces este curso es para ti.","https://www.udemy.com/course/power-bi-analisis-datos-business-intelligence/", 4,220,29,0,6,True,True, 2.2, "https://img-a.udemycdn.com/course/240x135/2178672_c203_3.jpg?Mkb9HZQ9IMNzl1nenCVAiHRfKhZmwhlpMxLqgyuJpd_zODIjl3GsakyB18I9-W_TbFldvuf6Gc1MELKdPf8GcOoaeSl21MIYH-AX0-X9rG06nuH8ForUUBhhXu9M6g", 1618492573000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Tableu moderno","En este curso aprenderás desde cero a usar Tableau Desktop para crear informes y cuadros de mando. Trabajarás con Tableau Public así que necesitas tener un ordenador con Windows o un Mac. Es un curso totalmente práctico y dinámico en el que empezarás desde cero con Tableau.","https://www.udemy.com/course/tableau-desktop/", 2,230,30,0,6,True,True, 4.1, "https://img-a.udemycdn.com/course/240x135/2592358_1726_9.jpg?TkK9TM0e1OD05-2iaTdR5tXxX94MyblA7szt1Uw5XSEH4Pqn1GirBVzZDmOQ872CDbmSxQ1q8S1gunEP6K9tuVaiAhcrO_krvvkkGBG-6_umIlcrZMFS47WWyYGJrg", 1615153726000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("MLflow desde cero","Python basics and Machine Learning model building with Scikit-learn will be covered in this course. You will also learn how to build and deploy a Neural Network using TensorFlow Keras and PyTorch. Google Cloud (GCP) free trial account is required to try out some of the labs designed for cloud environment.","https://www.udemy.com/course/machine-learning-deep-learning-model-deployment/ ", 5,240,32,0,6,False,False, 3.6, "https://img-a.udemycdn.com/course/240x135/3563973_2444.jpg?UMCF7U0Dgk7aO9x_p8dAhDX8A-69JOsjHgVLGBfgYq1gMD9UxgAwL-34g39JB6RDWLxY8wRePn3eoItqlV3P1gKDq66EJf_iDai2DSavJFr6Dcn-R0nu6s2g3mk", 1553516983000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Mongo nivel intermedio","MongoDB es la base de datos No SQL más populares y de más rápida adopción en el mundo. Es una base de datos de código abierto. La información la guarda en colecciones, no en tablas, como la hacen las bases de datos relacionales con SQL. Mongo guardará los datos en formato JSON, aunque en la implementación lo guarda en BSON (el formato JSON pero en binario).","https://www.udemy.com/course/aprende-mongodb-desde-cero/", 1,250,33,0,3,True,True, 3.3, "https://img-a.udemycdn.com/course/240x135/2494812_a922_2.jpg?CXuv-DMjpT70dTli2D9BI8IEtyWRe0FocHyFDOxPNJioylUga7hMefhpoKzPz8p1wpMhJKvnnOw-nFXfwmVyGKw3N34JtwlzXr38FAnDbSxZDS-8INitSbPnOUDu6A", 1578758917000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Angular para empezar","Este curso se enfoca en llevarte de la mano desde cero hasta poder crear aplicaciones de todo tipo, que van desde páginas web de una sola página (SPA - single page application) hasta conectarnos a una base de datos para realizar proceso de inserción, actualización, eliminación y selección de información. Este curso contiene todo lo que tu necesitas para poder crear aplicaciones con este framework tan potente y veloz.","https://www.udemy.com/course/angular-2-fernando-herrera/", 1,260,34,1,1,False,False, 3.2, "https://img-a.udemycdn.com/course/240x135/1075334_8b5f_4.jpg?uUWjk2LFMUVCEY9w3rIxLJtbBL035fHHr_aLeglssP5T0lwEpuwS-rjwSO_qUUsMwA16QpjwvhLyxERaPwraetLQ_16DGGh5GAbrNrsZmvYqe4bJIjMmonxxqAXa0w", 1561222094000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Power Point nivel avanzado","Power Point es una de las herramientas infaltables en el currículum de cualquier empleado, pero no solo te ayudaremos a que te puedas destacar en la oficina, también podrás crear imágenes increíbles para tus redes, páginas web y mucho más.","https://www.udemy.com/course/curso-de-power-point-desde-basico-hasta-avanzado/", 8,270,35,0,4,False,False, 4.8, "https://img-b.udemycdn.com/course/240x135/3865742_a6f5_2.jpg?secure=rX5Rc5sTaJCIyzckYMjlfQ%3D%3D%2C1620288292", 1618536231000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Pycharm para pricipiantes","Python is a beautiful and fast-growing language used to develop programs to efficiently analyze data, create eloquent software solutions for real-world problems, and design original web apps. PyCharm brings the robust and mature tools that you would expect from Visual Studio or Eclipse to Python development and provides you with a one-stop shop for all of your development tool needs.","https://www.udemy.com/course/pycharm-for-power-developer/", 3,280,36,0,6,True,True, 4.1, "https://img-b.udemycdn.com/course/240x135/1894384_0b8f_2.jpg?secure=1tifGh0fq-Wsc0GVmoCEAA%3D%3D%2C1620285329", 1579351277000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("JQuery nivel experto","jQuery es de las herramientas más importantes que todo desarrollador web debe aprender a usar. Por su optimización de código, por las ventajas que tiene al momento de animar el CSS, por las acciones preestablecidas y por la cantidad de Plugins que podemos conectar a esta librería de Javascript.","https://www.udemy.com/course/aprende-jquery-desde-cero/", 2,290,37,0,1,True,True, 2.6, "https://img-a.udemycdn.com/course/240x135/915556_6500_2.jpg?M3u0W6yrikozD5nbt41dOFeNAVY3-7GLq9I_FL6ZFu-4NfioA_PVTWPAuCzFPXQBTT5UzbCdYLKDJIvpTC32P6fks4GmZxMoSJYmBJxk1w5W58c3hjZ-uofSmN_G", 1563659818000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Bootstrap para todos","Bienvenido al curso de Bootstrap 4, el curso en el que aprenderás como diseñar sitios web con el framework de diseño web más utilizado e importante del mundo. En este curso aprenderás Bootstrap 4 paso por paso y desde lo más básico. Para el final del curso vas a ser un profesional de Bootstrap 4 y vas a ser capaz de crear sitios web avanzados. No es necesario que tengas conocimientos previos de Bootstrap, este curso empieza desde lo más básico hasta un nivel avanzado. Si tú ya tienes conocimientos de versiones anteriores no te preocupes, en este curso aprenderás todos los cambios y novedades de esta versión.","https://www.udemy.com/course/curso-bootstrap/", 2,300,38,0,1,False,False, 2.9, "https://img-a.udemycdn.com/course/240x135/1245130_efdb_9.jpg?eNdGrcUJsOpVvFRBJmPyuVb8elWyZ5rVQnL0vTDt8SHqKZpDPgl8P0KmaHE8nZmNi4vPhRfT1BeCbYAcrZwp7hKQFDgBLpjf22oZpp62QG72ZvINTZy9OGjQnuCumg", 1599941482000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Abap para hoy y mañana","Programa más rápido y con menos lineas, detecta errores al momento, evita distracciones innecesarias y obten toda la ayuda extra que un IDE moderno tiene para ofrecer ahora tambien a nosotros los programadore ABAP. En este curso intento compartir como instalar y empezar a programar en ABAP con eclipse, herramientas mas comunes, link, ventanas, perspectivas, comparación con la programación en el work bench dentro del SAP GUI para romper esa barrera de aprendizaje que ha bloqueado que cambies a ADT en ECLIPSE."," https://www.udemy.com/course/abap-development-tools-in-eclipse-version-en-espanol/", 7,310,39,0,3,True,True, 4.7, "https://img-a.udemycdn.com/course/240x135/2069837_8cff_2.jpg?AvMHoWr90B_SHEnG_qadA_7Tb71tx2j6U8O2Q-sESP2fcKyJi8Op2_Q-9EebfqwWj2ptpmsGioQSKL12vo9T84fMHE39AjgUAwYjp_8-k2NsZV8QxMs8t_uQCA-jAA", 1560732636000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Illustrator nivel avanzado","Si quieres aprender la práctica y el trabajo con Illustrator, encontrarás en este curso un completo recorrido por sus funciones y herramientas. Pero si ya conoces el programa, te resultará muy útil para conocer los aspectos avanzados o repasar funciones específicas. Cada lección está tratada de forma independiente, por lo que no será necesario realizarlas en orden. De esta manera, si necesitas realizar una consulta puntual, podrás acceder a la lección en la que se trata el tema. Illustrator es sin lugar a dudas, una de las aplicaciones de diseño gráfico más utilizada por aficionados y profesionales. El funcionamiento intuitivo de este programa, lo han convertido en la mejor elección para dibujo digital.","https://www.udemy.com/course/curso-de-illustrator-cc/", 6,320,40,1,5,False,False, 3.6, "https://img-b.udemycdn.com/course/240x135/224512_af6d_3.jpg?secure=warlZAoYThYC8PeIaPHvyQ%3D%3D%2C1620284589", 1567531697000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Streamlit","Streamlit curso básico. ¿Tiene dificultades para intentar crear aplicaciones web para sus proyectos de ciencia de datos? ¿Dedica más tiempo a crear una aplicación MVP simple con sus datos para mostrársela a sus clientes y a otras personas? Entonces déjame presentarte Streamlit, un marco de Python para crear aplicaciones web. Bienvenido al mejor recurso en línea para aprender a crear aplicaciones de ciencia de datos y aplicaciones web de aprendizaje automático con el impresionante Streamlit Framework y Python.","https://www.udemy.com/course/learn-streamlit-python/", 5,330,41,0,6,False,False, 4.1, "https://img-a.udemycdn.com/course/240x135/3615822_2cbd_2.jpg?NhlOwlAvP8j5Lt3aWXFbh0iU5VxaDbhMgeVCu-86xDsJKeXmxWL-gg_bxBFFnMPLdH_fyHZgNzmUIPFEcHZkJzxuS-S7FiIcAgu8crR-mxiohw2QmgnxNadaT2_QCg", 1593432053000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("SAP + Hana + Abap","El curso contiene un contenido completo que abarca todos los temas mas importantes para que te conviertas en un consultor SAP ABAP, esta diseñado muy detalladamente y estructurado para que de manera fácil puedas aprender los conocimientos necesarios para trabajar con el ERP mas grande del mundo como lo es SAP. Lo aprendido en este curso te abrirá muchas puertas para comenzar a buscar un trabajo en unos de los lenguajes de programación mejor pagados a nivel mundial y/o a mejorar tus conocimientos en ABAP de ser el caso. De la mano del instructor Freddy Valderrama te guiara en los videos paso a paso para que aprendas el diccionario de datos, el editor ABAP, lenguaje ABAP, modularización, debugger, biblioteca de funciones,  entre otros temas.","https://www.udemy.com/course/sap-abap-completo-en-espanol/", 4,340,42,0,3,True,True, 4.2, "https://img-a.udemycdn.com/course/240x135/1146812_52d4_2.jpg?Vzj9xCW2CNxxORGcNMUFYDK04HRasbpLE1aiy83neS7-4W5wrxI-ZMp19Gl6K7U6gq3eAOUcXXmenTUOZM5Y0BpalaMb3daKZq_AsA2FbPhrfebmS02wfloVFJfaBg", 1614119846000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Matlab 300 horas","MATLAB es muchas cosas: un lenguaje de programación, una interfaz, un conjunto de funciones, una caja de herramientas y una comunidad. A diferencia de muchos programas y lenguajes de programación, MATLAB es una herramienta completa. Desde la misma plataforma se pueden hacer tareas como escribir código, hacer operaciones, gráficos, incluso pequeñas apps. Actualmente, programar se ha convertido en una habilidad deseable para casi todas las disciplinas, y a diferencia de muchas alternativas (Python, Java, C#, entre otras), MATLAB incorpora todo lo necesario en una misma herramienta, que facilita crear algoritmos y soluciones funcionales para todos aquellos que no somos informáticos de profesión.","https://www.udemy.com/course/matlabdesdecero/", 1,350,43,1,6,False,False, 3.2, "https://img-a.udemycdn.com/course/240x135/2900486_996e_6.jpg?rGPCBFHJaOeR2cUEwvehMxmr6NYpRYnz2mUEVU9E79pigHOeTRMzLHDUXZWSw_jrO_SEy_wSxcHK8_qwxo_Cmp_N1qQqgTpC-cItmqRVFJha5xEQNppdLPzV0eQBww", 1589271094000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Orstat - Mejora tu nivel","Orstat curso básico. ¡Cálculos de ingeniería química simplificados! Este curso incluye explicaciones en video y texto de los fundamentos de la ingeniería química, e incluye más de 40 ejemplos resueltos con explicaciones fáciles de entender. La 'Introducción a la Ingeniería Química' está organizada en dos secciones principales: Ingeniería Química Cálculo
Y esto es lo que obtienes dentro de cada lección: Vídeos: Observe por encima del hombro cómo resuelvo problemas de ingeniería química de principio a fin. Empezamos desde el principio ...","https://www.udemy.com/course/chemical-engineering/", 6,360,44,0,6,False,False, 1.8, "https://img-b.udemycdn.com/course/240x135/1262526_8e83.jpg?secure=Z0ZL-9ipbYuNLnDJ7QJ7HA%3D%3D%2C1620284941", 1620230731000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Mongoose moderno","En este breve pero intenso curso programaremos una Lista de Tareas haciendo mucho incapie en el backend. Para ello vamos a construir una API RestFul con Node y Express, lo cual nos permitirá comunicar nuestro Frontend con el Backend para persistir las tareas creadas en la base de datos. Si sos un desarrollador frontend que quiere ampliar sus conocimientos sumando tecnologías de backend a tus servicios este curso te va a servir muchísimo, ya que a medida que vayas programando a la par conmigo aprenderás y aplicaras varios conceptos y técnicas que te permitieran mejorar desde pequeños a grandes sistemas web. Ademas si estas dando tus primeros pasos con tecnologías como Node, Express o Mongoose, te servirá para reforzar conocimientos y afinar la técnica para dominar este tipo de entornos.","https://www.udemy.com/course/programa-hoy-en-mongodb-con-mongoose/", 7,370,45,0,6,True,True, 2.9, "https://img-b.udemycdn.com/course/240x135/1966730_d9d1_2.jpg?secure=Y9yqtMWOvsq2gFCYXYrT3g%3D%3D%2C1620285356", 1604642068000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Oracle para todos","¡Bienvenido curso completo de PL/SQL! En este curso vas a aprender el PL/SQL de Oracle del mundo REAL, desde nivel principiante hasta avanzado. Todo lo que necesitas para poder afirmar que dominas PL/SQL se encuentra en este curso, te lo puedo asegurar ya que trabaje 7 años de mi vida exclusivamente con este lenguaje. He diseñado este curso para que aprendas PL/SQL de la manera en que se utiliza en aplicaciones empresariales del mundo REAL, evitando entrar en ejemplos sin sentido que solo sirven en un curso, y nunca más vuelves a utilizar...","https://www.udemy.com/course/oracle-plsql-de-cero-a-avanzado/", 2,380,46,1,1,True,True, 4.0, "https://img-a.udemycdn.com/course/240x135/1703424_b1ca.jpg?-Us0B97leftoFyRrv5RN4Rx_auhMaP7buddde8el0y0rSKczWqFIOWaDuyyqmY9nQpanJkQecfdhmV8cnvLY9W-tOSDaN4l6VoqvUwPe33j9e2CkmWTkOwm9kTE", 1601274009000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Tensorflow nivel bajo","¡Bienvenido al curso de Tensorflow 2.0! Se acaba de lanzar TensorFlow 2.0. El lanzamiento introduce muchas características que simplifican el modelo de desarrollo y los procesos de mantenimiento. Desde el punto de vista educativo, potencia el entendimiento de la gente simplificando en gran medida los conceptos complejos. Desde el punto de vista de la industria, los modelos son mucho más sencillos de entender, mantener y desarrollar. El Aprendizaje Profundo o Deep Learning es una de las áreas de mayor crecimiento de la Inteligencia Artificial. En los últimos años, se ha probado que los modelos de Deep Learning, incluso los más simples, pueden resolver tareas difíciles y complejas.","https://www.udemy.com/course/tensorflow2/", 5,390,47,0,6,False,False, 3.6, "https://img-a.udemycdn.com/course/240x135/2440222_929d_2.jpg?Xc85D2vyxfl8MvNkfWw7sbGzvHX8h1yvPLLz0k6gHvPVJPCe-v7rIeGhHOWC_d1kbB5sFaR3ZwzMSglDSk9M17YUqg1ZIlyg4DcnFSqAdtsx2S31xU7kkBUbcwHzOw", 1614318077000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("C++ para novatos","El curso se enfocará en aprender los conceptos básicos y avanzados de C++ con Programación Modular . Un curso totalmente enfocado a estudiantes universitarios o principantes que deseen aprender programación con C++. El modalidad de enseñanza del curso es totalmente teórico/práctico donde se explicará detalladamente cada uno de los temas y se desarrollarán programas a modo de práctica para poder reforzar los conocimientos adquiridos. El curso también cuenta con un taller para poder unificar todo lo aprendido hasta el momento, y se desarrollará paso a paso una agenda.","https://www.udemy.com/course/curso-de-cpp-basico-a-avanzado/",3,400,48,0,3,True,True, 4.1, "https://img-b.udemycdn.com/course/240x135/763172_d61c_4.jpg?secure=lgL4tisY2rJC82G-u-kSwA%3D%3D%2C1620284782", 1567323895000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Matplotlib desde cero","Este curso de visualización de datos en Python esta diseñado para aquellas personas que desean hacer gráficas en Python de forma rápida, eficiente y estéticamente presentables. El curso empieza desde las bases de Matplotlib y mediante ejemplos se va adentrando en gráficas mas sofisticadas para el análisis de datos. También aprenderás a importar datos a Python con ayuda del paquete Pandas, generaremos algunos datos aleatorios con la ayuda de Numpy y todas las notas de clase quedaran guardadas en Jupyter Notebook.","https://www.udemy.com/course/visualizacion-de-datos-en-python-matplotlib/", 5,410,40,1,6,False,True, 4.4, "https://img-b.udemycdn.com/course/240x135/2395038_6b23.jpg?secure=16khzOvL_UlPeyi0OcyH5g%3D%3D%2C1620285848", 1613646328000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Github para expertos","En este curso aprenderás a utilizar dos herramientas muy extendidas en los últimos años de gran ayuda para cualquier programador. Git es una herramienta con la que podrás controlar los cambios que se hacen en un proyecto de modo que puedas volver atrás en el historial si lo necesitas. Y luego aprenderás a exprimir al máximo GitHub, un sitio web que te permite almacenar en la nube tu código, compartirlo con los demás y sobre todo trabajar en equipo mediante las características que el sitio web te ofrece.","https://www.udemy.com/course/git-y-github-completo-desde-cero/ ", 8,420,41,1,2,False,False, 3.2, "https://img-a.udemycdn.com/course/240x135/940740_4db9_4.jpg?AQmtReCevwtAud2iMePs7U1kY9i1SuGbI1lrU_IR6MfruQ9H05hbXr6Ftp0JopnMhIoKwZtTO0xbIKD36cYU6nIMZaZtjj-WkafHeV-GQXzr05aoKx4XGl7W7aYl", 1584683991000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Java para todos","+80 horas de video, +5,400 estudiantes, +470 Clases, este es el curso perfecto para convertirte en un experto Java, Full Stack Java Developer. ¿Te falta tiempo para estudiar o dinero para invertir en tu capacitación Java o quieres conseguir empleo/trabajo como programador profesional Java? Con el curso de Club Java Master te convertirás en un especialista en la tecnología Java (Full Stack Java Developer). Estudiaremos temas desde la lógica de programación, los Fundamentos de Java, Programación Orientada a Objetos con Java, JDBC con Conexión a Bases de Datos, Servlets y JSP's, Struts Framework, Hibernate Framework, Spring Framework, Java Empresarial (Java EE), incluyendo EJB's, JPA, Web Services, Seguridad y más.","https://www.udemy.com/course/club-java-master-de-novato-a-experto-java-javaee-spring-hibernate-jpa/ ", 4,430,42,0,3,True,True, 3.8, "https://img-a.udemycdn.com/course/240x135/1478318_aadb_6.jpg?f09KvxOop_C7TLqpA6rR1gol7F1debiFH1RVYi3HFzaYwrrvbPYJadp1To4ke3vE-LK1toS6CMkw0PknnIx9sYfsO_eseUesF3VcH7aj3w1CLQEUX_SkDjS9547IWg", 1585186632000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("MS project","Por fin un curso que enseñan a administrar proyectos usando MS Project! La mayoría de cursos de Ms Project se centran en la herramienta, mientras que todos los cursos de administración de proyectos se centran en la teoría. Por eso, Projectical SAS, compañía colombiana de alcance global y REP del PMI, te trae este curso en el que aprenderás, de una manera práctica, amena y centrada en las buenas prácticas, la mejor manera de concebir, iniciar, planear, ejecutar, monitorear y controlar y, por último, cerrar un proyecto; pero, apoyándote en el poder de MS Project.","https://www.udemy.com/course/administra-proyectos-con-ms-project-de-cero-a-avanzado/", 6,440,43,0,4,True,False, 4.1, "https://img-a.udemycdn.com/course/240x135/1814586_ff86.jpg?9Lhk6sRtCxGsAUjGs0T-ORLXQMBkCd2w93s7qrViVFKE3SZmmQYXnxwYgO7mpZpQXuNbe2N-RhJHjlJSuZSDN1XzYjNypS8pRC3DWv3mCBBtLTWd8VVfMm92Puo", 1548597268000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Miro nivel intermedio","Miro es la pizarra digital más compleja y al mismo tiempo más versátil que existe actualmente en Internet. En este curso aprenderás los conceptos básicos de las posibilidades que te ofrece una tabla Miro. En nuestro curso aprenderás cómo crear tu propio Miro-Board y cómo puedes utilizarlo metódicamente en tus formatos online como talleres digitales, formaciones, reuniones de equipo y presentaciones. Le mostraremos las funciones básicas de la pizarra digital paso a paso y le inspiraremos con nuestras plantillas sobre cómo puede utilizar Miro usted mismo.","https://www.udemy.com/course/miro-grundlagenkurs/ ", 3,450,44,1,5,False,False, 2.3, "https://img-a.udemycdn.com/course/240x135/3779112_21ee_5.jpg?1yk9e0UTLOySpQFauGCMEhWyCYXrXZnuaVw2Kw9eRxpj2h6veCDpQxEXGiLW6fzeiXwWcWsGIMydXbn0bsTt-dkL6g9Im-hZtivk1Oyu9b8zGv_OZ9dAwpoPdaU2bg", 1590370619000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Scala desde cero","Hola, ¡¡¡Bienvenido al curso de Scala desde Cero!!! En este curso aprenderás como desarrollar programas y aplicaciones con uno de los lenguajes más utilizados en el mundo profesional y laboral. Scala es uno de los lenguajes de programación  más demandados en el perfil profesional que buscan las empresas en la actualidad. Es un lenguaje que combina tanto la Orientación a Objetos como la Programación Funcional, de forma concisa y sencilla. Esto lo ha convertido en un lenguaje que se utiliza en distintos entornos como Spark, Analítica de Datos, Big Data, programación distribuida, etc.... Durante este curso vas a aprender todos los conceptos y características de este lenguaje, conocerás las herramientas de desarrollo que puedes utilizar y estudiaremos todos los conceptos más importantes.","https://www.udemy.com/course/scala-desde-cero/", 8,460,45,1,3,True,True, 3.9, "https://img-a.udemycdn.com/course/240x135/3390362_999d.jpg?0YlN5wcAL5YC2yaXRR3eRbu_OOqgbEXkYZ8sW9J2e5dChsgfqb67uL3h8OzRoJGgxs3Z-kRw01m4vk-0MJVjuBnApHHT88kzagFeixXjlERwy4VXVCNf2fcHVpQg", 1584426144000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Ruby para novatos","Un curso cuidadosamente planeado de principio a fin, dirigido a todos aquellos que desean aprender a programar. En este curso aprendes desde cero a través de uno de los lenguajes más populares de la actualidad: el lenguaje Ruby. Sea que en el futuro deseas desarrollar sitios web avanzados, aplicaciones para escritorio, aplicaciones para dispositivos móviles o incluso planeas una carrera en el desarrollo de videojuegos este curso es ideal para ti. Aquí aprenderás las bases de la programación, con código real tal como lo utilizan los profesionales en la industria TI. Por otro lado si deseas aprender como hobby también es un curso ideal pues la curva de aprendizaje es ligera y todo se examina paso a paso. Ruby es un lenguaje de propósito general, esto quiere decir que lo puedes utilizar para diferentes tareas o propósitos.","https://www.udemy.com/course/aprende-a-programar-con-ruby-desde-cero-y-100-en-espanol/", 2,470,46,0,3,False,False, 3.3, "https://img-a.udemycdn.com/course/240x135/853352_5acb_4.jpg?BYKzh1qoLgH0W3s6Eg8D6x2_Lwf-X9xvXA5Cc_W0yWrB3e69zyrroPyw3ateQ1jU6U1-TZ_jcrqCu1xvi2_fTy7D2dFlMs-DIyQGmSP2nKeKkreOGD0_MG1v4y0z", 1594954993000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Cobol para profesionales","¿Sabías que según análisis de Compuware, actualmente se utiliza más de 220 mil millones de líneas de código COBOL a las que se suman anualmente 5,000 millones? ¿Deseas aprender COBOL de una manera fácil y guiada? ¡¡Bienvenido al Curso Lenguaje de Programación COBOL!! En este Curso aprenderás a programar, paso a paso, en este poderoso lenguaje de programación.
Todo programa COBOL se compone de 4 Divisiones, veremos al máximo detalle cada una de éstas. Realizaremos programas donde utilicemos: Archivos Secuenciales, Archivos Indexados, Tablas y sentencias de SQL, Reportes, Uso de Tablas internas, Uso del SORT, etc. Veremos todo una sección relativa a la Programación Estructurada y con esta técnica desarrollaremos nuestros programas Nos enfocaremos al COBOL que se usa en el Mainframe de IBM.","https://www.udemy.com/course/lenguaje-de-programacion-cobol/", 4,480,47,0,3,False,True, 1.2, "https://img-a.udemycdn.com/course/240x135/997140_c63f_6.jpg?GY2Ed6QGPx91SyM4fhZ3TEXO0vtx8JLgRBvdGlIY79_qGR5eaNYJMbxDo_V_L_Ga7m4n74sXWGGq-Kef8XJc-osgWDFyOxT5afD_fMRbCoh8W6RRsBCIV1ODMZr2", 1598820660000
);
INSERT INTO cursos(nombre,descripcion, enlace, docente, precio, duracion, idioma, categoria, bolsaEmpleo, certificado, media, imagen, fecha)
VALUES("Kotlin para todos","Kotlin ya se ha posicionado como el lenguaje de programación oficial para crear aplicaciones Android. ¿Está usted interesado en aprender este lenguaje?, si la respuesta es sí este curso es para iniciarse de la forma correcta. Google publicó en Google I/O 2017 que Kotlin será el lenguaje de programación oficial para la construcción de aplicaciones Android. Esto permite que Kotlin se convierta en el primer lenguaje de su clase para la plataforma de Android. El curso de programación en Kotlin tiene todo lo que necesita saber para convertirse en un desarrollador profesional de Kotlin, este curso te va permitir tener las bases para integrar tus conocimientos de Kotlin para desarrollar aplicaciones Android impresionantes y profesionales.","https://www.udemy.com/course/kotlin-desde-cero/", 1,490,48,1,3,True,True, 4.1, "https://img-b.udemycdn.com/course/240x135/1253980_5d15_2.jpg?secure=sk3MJ_FfeDZKW1u4thOOgg%3D%3D%2C1620284960", 1566452961000
);

INSERT INTO keywordsCursos(curso, keyword)
VALUES (1, 1);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (2, 2);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (3, 9);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (4, 8);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (5, 7);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (6, 3);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (6, 14);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (7, 15);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (8, 16);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (9, 17);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (10, 18);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (11, 19);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (12, 4);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (13, 20);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (14, 21);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (15, 22);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (16, 5);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (17, 23);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (18, 24);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (19, 25);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (20, 26);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (21, 27);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (22, 28);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (23, 29);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (24, 30);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (25, 28);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (25, 31);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (26, 32);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (27, 33);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (28, 34);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (29, 35);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (30, 36);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (31, 37);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (32, 38);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (33, 39);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (34, 40);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (35, 41);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (36, 42);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (37, 43);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (38, 44);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (39, 45);
INSERT INTO keywordsCursos(curso, keyword)
VALUES (40, 46);

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

INSERT INTO profesionesCursos(curso, profesion)
VALUES (1, 2);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (1, 3);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (2, 1);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (3, 1);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (3, 4);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (4, 20);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (4, 11);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (5, 9);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (5, 10);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (6, 4);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (6, 12);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (7, 13);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (7, 19);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (8, 8);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (8, 9);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (9, 12);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (9, 15);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (10, 2);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (10, 3);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (11, 3);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (11, 2);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (12, 13);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (12, 4);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (13, 14);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (13, 19);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (14, 2);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (15, 12);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (15, 15);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (16, 1);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (16, 4);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (17, 2);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (17, 3);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (18, 11);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (18, 20);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (19, 4);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (19, 13);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (20, 2);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (20, 3);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (21, 2);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (21, 3);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (22, 13);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (22, 19);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (23, 9);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (23, 10);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (24, 12);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (24, 14);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (25, 13);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (25, 19);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (26, 12);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (26, 15);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (27, 12);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (27, 15);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (28, 1);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (28, 4);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (29, 4);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (29, 14);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (29, 14);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (30, 13);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (30, 14);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (31, 2);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (31, 4);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (32, 12);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (32, 13);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (33, 1);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (33, 15);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (34, 4);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (34, 1);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (35, 11);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (35, 5);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (36, 7);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (36, 10);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (37, 1);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (37, 4);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (38, 4);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (38, 2);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (39, 4);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (39, 2);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (40, 2);
INSERT INTO profesionesCursos(curso, profesion)
VALUES (40, 3);

-- -----------------------------------------------------------QUERIES

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

