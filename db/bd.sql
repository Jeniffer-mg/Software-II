﻿
DROP DATABASE IF EXISTS db_proyect;

CREATE DATABASE db_proyect DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;

CREATE TABLE FACULTAD 
(ID INT(2), 
NOMBRE VARCHAR(60) NOT NULL,
PRIMARY KEY (ID));

CREATE TABLE INSTITUCION_NACIONAL
(ID INT(2) AUTO_INCREMENT, 
NOMBRE VARCHAR(60) NOT NULL,
PRIMARY KEY (ID));

CREATE TABLE NACIONALIDAD
(ID INT(3), 
NOMBRE VARCHAR(30) NOT NULL, 
PRIMARY KEY (ID));

CREATE TABLE CATEGORIA_INVESTIGADOR
(ID INT(2) AUTO_INCREMENT,
NOMBRE VARCHAR(50) NOT NULL, 
PRIMARY KEY (ID));

CREATE TABLE ADMINISTRADOR
(ID INT(2) AUTO_INCREMENT,
CORREO VARCHAR(50) NOT NULL,
CONTRASENIA VARCHAR(16) NOT NULL, 
PRIMARY KEY (ID));

CREATE TABLE CIUDAD
(ID INT(2) AUTO_INCREMENT,
NOMBRE VARCHAR(50) NOT NULL,
PRIMARY KEY (ID));

CREATE TABLE CATEGORIA_GRUPO
(ID INT(2) AUTO_INCREMENT, 
NOMBRE VARCHAR(50) NOT NULL,
PRIMARY KEY (ID));

CREATE TABLE AREA_CONOCIMIENTO
(ID INT(2) AUTO_INCREMENT, 
NOMBRE VARCHAR(30) NOT NULL,
PRIMARY KEY (ID));    

CREATE TABLE CUARTIL_CLASE_PRODUCTO
(ID INT(2) AUTO_INCREMENT,
NOMBRE VARCHAR(30) NOT NULL, 
PORCENTAJE INT(2) NOT NULL,
PRIMARY KEY (ID));

CREATE TABLE VENTANA
(ID INT(2) AUTO_INCREMENT,
ANIOS_VIGENCIA INT(2) NOT NULL,
PRIMARY KEY (ID));

CREATE TABLE CLASE_PRODUCTO 
(ID INT(2)AUTO_INCREMENT,
NOMBRE VARCHAR(92) NOT NULL,
DESCRIPCION VARCHAR(100) NOT NULL,
ID_CUARTIL_CLASE_PRODUCTO INT(2) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID_CUARTIL_CLASE_PRODUCTO) REFERENCES CUARTIL_CLASE_PRODUCTO(ID));

CREATE TABLE TIPO_PRODUCTO
(ID INT(2) AUTO_INCREMENT,
NOMBRE VARCHAR(90) NOT NULL,
DESCRIPCION VARCHAR(100) NOT NULL, 
PRIMARY KEY (ID));

CREATE TABLE PROGRAMA_ACADEMICO
(ID INT(2),
NOMBRE VARCHAR(45) NOT NULL,
ID_FACULTAD INT(2) NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY (ID_FACULTAD) REFERENCES FACULTAD(ID));

CREATE TABLE REQUISITO_CAT_INVESTIGADOR
(ID INT(2) AUTO_INCREMENT,
NIVEL_FORMACION VARCHAR(150) NOT NULL,
PRODUCCION_MINIMA VARCHAR (80) NOT NULL,
PRODUCTOS_FORMACION VARCHAR(100) NOT NULL,
VIGENCIA INT(2) NOT NULL,
CANT_INSTITUCIONES INT(2) NOT NULL,
ID_CATEGORIA_INVESTIGADOR INT(2) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID_CATEGORIA_INVESTIGADOR) REFERENCES CATEGORIA_INVESTIGADOR(ID));

CREATE TABLE SUBTIPO_PRODUCTO
(ID INT(2) AUTO_INCREMENT,
NOMBRE VARCHAR(60) NOT NULL,
DESCRIPCION VARCHAR(100),
PESO FLOAT (2) NOT NULL,
ID_TIPO_PRODUCTO INT(2) NOT NULL,
ID_VENTANA INT(2) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID_TIPO_PRODUCTO) REFERENCES TIPO_PRODUCTO(ID),
FOREIGN KEY (ID_VENTANA) REFERENCES VENTANA(ID));

CREATE TABLE CATEGORIA_PRODUCTO
(ID INT(2) AUTO_INCREMENT, 
NOMBRE VARCHAR(30) NOT NULL,
DESCRIPCION VARCHAR(100) NOT NULL,
ABREVIATURA VARCHAR(15),
ANIO INT(4),
ID_CLASE_PRODUCTO INT(2) NOT NULL,
ID_SUBTIPO_PRODUCTO INT(2) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID_CLASE_PRODUCTO) REFERENCES CLASE_PRODUCTO(ID),
FOREIGN KEY (ID_SUBTIPO_PRODUCTO) REFERENCES SUBTIPO_PRODUCTO(ID));

CREATE TABLE REQUISITO_CAT_GRUPO
(ID INT(2) AUTO_INCREMENT,
ANIOS_GRUPO INT(2) NOT NULL,
IND_TOPA_B VARCHAR(60) NOT NULL,
IND_AP VARCHAR(20) NOT NULL,
IND_FR_AB VARCHAR(40) NOT NULL,
IND_COHEN VARCHAR(20),
IND_GRUPO VARCHAR(30) NOT NULL,
PERFIL_INVESTIGADOR VARCHAR(60),
ID_CATEGORIA_GRUPO INT(2) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID_CATEGORIA_GRUPO) REFERENCES CATEGORIA_GRUPO(ID));

CREATE TABLE SUB_AREA_CONOCIMIENTO
(ID INT(2) AUTO_INCREMENT,
NOMBRE VARCHAR(30) NOT NULL,
ID_AREA_CONOCIMIENTO INT(2) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID_AREA_CONOCIMIENTO) REFERENCES AREA_CONOCIMIENTO(ID));

CREATE TABLE INVESTIGADOR
(ID INT(4) AUTO_INCREMENT,
CODIGO INT(8) NOT NULL,
NOMBRE VARCHAR(30) NOT NULL,
FECHA_INICIO DATE NOT NULL,
FECHA_NACIMIENTO DATE NOT NULL,
NIVEL_FORMACION VARCHAR(30) NOT NULL,
HORAS_DEDICADAS TIME NOT NULL,
EDAD INT(2) NOT NULL,
CORREO VARCHAR(50) NOT NULL,
CONTRASENIA VARCHAR(16) NOT NULL,
ID_PROGRAMA_ACADEMICO INT(2) NOT NULL,
ID_NACIONALIDAD INT(3) NOT NULL,
ID_ADMINISTRADOR INT(2) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID_PROGRAMA_ACADEMICO) REFERENCES PROGRAMA_ACADEMICO(ID),
FOREIGN KEY (ID_NACIONALIDAD) REFERENCES NACIONALIDAD(ID),
FOREIGN KEY (ID_ADMINISTRADOR) REFERENCES ADMINISTRADOR(ID));

CREATE TABLE GRUPO
(ID INT(3) AUTO_INCREMENT,
NOMBRE VARCHAR(30) NOT NULL,
FECHA_INSCRIPCION DATE NOT NULL,
FECHA_CERTIFICACION DATE NOT NULL,
ID_PROGRAMA_ACADEMICO INT(2) NOT NULL,
ID_INVESTIGADOR INT(4) NOT NULL,
ID_SUB_AREA_CONOCIMIENTO INT(2) NOT NULL,
ID_CIUDAD INT(2) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID_PROGRAMA_ACADEMICO) REFERENCES PROGRAMA_ACADEMICO(ID),
FOREIGN KEY (ID_INVESTIGADOR) REFERENCES INVESTIGADOR(ID),
FOREIGN KEY (ID_SUB_AREA_CONOCIMIENTO) REFERENCES SUB_AREA_CONOCIMIENTO(ID),
FOREIGN KEY (ID_CIUDAD) REFERENCES CIUDAD(ID));

CREATE TABLE REQUISITO_INVESTIGADOR
(ID INT(2) AUTO_INCREMENT,
ID_INVESTIGADOR INT(4) NOT NULL,
ID_REQUISITO_INVESTIGADOR INT(2) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID_INVESTIGADOR) REFERENCES INVESTIGADOR(ID),
FOREIGN KEY (ID_REQUISITO_INVESTIGADOR) REFERENCES REQUISITO_CAT_INVESTIGADOR(ID));

CREATE TABLE INSTITUCION_INVESTIGADOR
(ID INT(2) AUTO_INCREMENT,
ID_INVESTIGADOR INT(4) NOT NULL,
ID_INSTITUCION INT(2) NOT NULL,
PRIMARY KEY (ID), 
FOREIGN KEY (ID_INVESTIGADOR) REFERENCES INVESTIGADOR(ID),
FOREIGN KEY (ID_INSTITUCION) REFERENCES INSTITUCION_NACIONAL(ID));

CREATE TABLE GRUPO_REQUISITO 
(ID INT(2) AUTO_INCREMENT,
ID_REQUISITO_CATEGORIA_GRUPO INT(2) NOT NULL,
ID_GRUPO INT(3) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID_REQUISITO_CATEGORIA_GRUPO) REFERENCES REQUISITO_CAT_GRUPO(ID),
FOREIGN KEY (ID_GRUPO) REFERENCES GRUPO(ID));

CREATE TABLE PRODUCCION
(ID INT(2) NOT NULL,
ID_CATEGORIA_PRODUCTO INT(2) NOT NULL,
ID_VENTANA INT(2) NOT NULL,
ID_INVESTIGADOR INT(4) NOT NULL,
ID_GRUPO INT(3) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ID_CATEGORIA_PRODUCTO) REFERENCES CATEGORIA_PRODUCTO(ID),
FOREIGN KEY (ID_VENTANA) REFERENCES VENTANA(ID),
FOREIGN KEY (ID_INVESTIGADOR) REFERENCES INVESTIGADOR(ID),
FOREIGN KEY (ID_GRUPO) REFERENCES GRUPO(ID));

/*Insertar datos*/ 

INSERT INTO `FACULTAD` (`ID`, `NOMBRE`) 
VALUES ('5', 'Facultad de Ciencias e Ingeniería'), 
('2', 'Facultad de Arquitectura, Diseño y Urbanismo'),
('3', 'Facultad de Ciencias Humanas y Educativas'), 
('4', 'Facultad de Ciencias de la Salud'), 
('1', 'Facultad de Ciencias Jurídicas y Sociales'), 
('6', 'Facultad de Ciencias Administrativas  y Contables ');

INSERT INTO `institucion_nacional` (`ID`, `NOMBRE`)
VALUES ('89', 'Centros'), 
('90', 'Empresas'), 
('91', 'Entidades de gobierno'), 
('92', 'IES');

INSERT INTO `nacionalidad` (`ID`, `NOMBRE`)
VALUES ('169', 'Colombiana'), 
('063', 'Argentina'), 
('105', 'Brasileña'), 
('097', 'Bolivariana'), 
('069', 'Australiana');

INSERT INTO `categoria_investigador` (`ID`, `NOMBRE`)
VALUES ('55', 'Emérito'), 
('56', 'Sénior'), 
('57', 'Asociado'), 
('58', 'Junior');

INSERT INTO `CIUDAD` (`ID`, `NOMBRE`) VALUES (NULL, 'Tunja'), 
(NULL, 'Duitama'), (NULL, 'Sogamoso'), (NULL, 'Bogotá'), (NULL, 'Yopal');

INSERT INTO `categoria_grupo` (`ID`, `NOMBRE`) 
VALUES (NULL, 'A1'), 
(NULL, 'A'), 
(NULL, 'B'), 
(NULL, 'C');

INSERT INTO `area_conocimiento` (`ID`, `NOMBRE`) 
VALUES (NULL, 'Ciencias Naturales'), 
(NULL, 'Ingeniería y Tecnología'), 
(NULL, 'Ciencias Médicas y de la Salud'), 
(NULL, 'Ciencias Agricolas'), 
(NULL, 'Ciencias Sociales'), 
(NULL, 'Humanidades');

INSERT INTO `cuartil_clase_producto` (`ID`, `NOMBRE`, `PORCENTAJE`) 
VALUES (NULL, 'Cuartil 4', '76'), 
(NULL, 'Cuartil 3', '12'), (NULL, 'Cuartil 2', '26'), 
(NULL, 'Cuartil 1', '29');

INSERT INTO `ventana` (`ID`, `ANIOS_VIGENCIA`) 
VALUES (NULL, '5'), 
(NULL, '7'), 
(NULL, '10');

INSERT INTO `TIPO_PRODUCTO` (`ID`, `NOMBRE`, `DESCRIPCION`) 
VALUES (NULL, 'Productos resultados de actividades de generación de nuevo conocimiento', ''), 
(NULL, 'Productos resultados de actividades de desarrollo tecnológico e innovación', ''),
(NULL, 'Productos resultados de actividades de apropiación social del conocimiento', ''),
(NULL, 'Productos de actividades relacionadas con la formación de recurso humano para CTEI', '');

INSERT INTO `subtipo_producto` (`ID`, `NOMBRE`, `DESCRIPCION`, `PESO`, `ID_TIPO_PRODUCTO`, `ID_VENTANA`) 
VALUES (NULL, 'Artículo de investigación A1', NULL, '10', '1', '2'), 
(NULL, 'Artículo de investigación A2', NULL, '6', '1', '2'), 
(NULL, 'Diseño industrial A', NULL, '8', '2', '1'), 
(NULL, 'Participación ciudadana en proyectos de CTI', NULL, '10', '3', '1');

INSERT INTO `programa_academico` (`ID`, `NOMBRE`, `ID_FACULTAD`) 
VALUES ('52', 'Ingeniería de Sistemas', '5'), 
('56', 'Ingeniería Mecatrónica', '5'), 
('58', 'Ingeniería Sanitaria', '5'), 
('15', 'Derecho y Ciencias Políticas', '1'), 
('12', 'Comunicación Social', '1'), 
('22', 'Diseño Gráfico', '2'), 
('25', 'Arquitectura', '2'), 
('28', 'Diseño de Modas', '2'), 
('32', 'Psicología', '3'), 
('35', 'Licenciatura en Pedagogía Infantil', '3'), 
('42', 'Medicina', '4'), 
('45', 'Fisioterapia', '4'), 
('48', 'Enfermería', '4'), 
('65', 'Administración de Negocios Internacionales', '6'), 
('68', 'Contaduría Pública', '6');

INSERT INTO `sub_area_conocimiento` (`ID`, `NOMBRE`, `ID_AREA_CONOCIMIENTO`) 
VALUES (NULL, 'Matemática', '1'), 
(NULL, 'Ciencias Físicas', '1'), 
(NULL, 'Computación y Ciencias de la Información', '1'), 
(NULL, 'Ciencias Químicas', '1'),
(NULL, 'Ciencias de la Tierra y Medioambientales', '1'), 
(NULL, 'Ciencias Biológicas', '1'), 
(NULL, 'Otras Ciencias Naturales', '1'),
(NULL, 'Ingeniería Civil', '2'), 
(NULL, 'Ingeniería Mecánica', '2'), 
(NULL, 'Ingenierías Eléctrica, Electrónica e Informática', '2'), 
(NULL, 'Ingeniería Química', '2'), 
(NULL, 'Ingeniería de los Materiales', '2'), 
(NULL, 'Ingeniería Médica', '2'), 
(NULL, 'Ingeniería Ambiental', '2'), 
(NULL, 'Biotecnología Ambiental', '2'), 
(NULL, 'Ambiental', '2'), 
(NULL, 'Biotecnología Industrial', '2'), 
(NULL, 'Nanotecnología', '2'), 
(NULL, 'Otras Ingenierías y Tecnologías', '2'),
(NULL, 'Medicina Básica', '3'), 
(NULL, 'Medicina Clínica', '3'),
(NULL, 'Ciencias de la Salud', '3'), 
(NULL, 'Biotecnología en Salud', '3'), 
(NULL, 'Otras Ciencias Médicas', '3'), 
(NULL, 'Ciencias Veterinarias', '4'),
(NULL, 'Agricultura Silvicultura y Pesca', '4'), 
(NULL, 'Ciencias Animales y Lechería', '4'), 
(NULL, 'Biotecnología Agrícola', '4'), 
(NULL, 'Otras Ciencias Agrícolas', '4'), 
(NULL, 'Psicología', '5'),
(NULL, 'Economía y negocios', '5'),
(NULL, 'Ciencias de la Educación', '5'), 
(NULL, 'Sociología', '5'), 
(NULL, 'Derecho', '5'), 
(NULL, 'Ciencias Políticas', '5'), 
(NULL, 'Geografía Social y Económica', '5'), 
(NULL, 'Periodismo y comunicaciones', '5'), 
(NULL, 'Otras Ciencias Sociales', '5'), 
(NULL, 'Arte', '6'), 
(NULL, 'Idiomas y Literatura', '6'),
(NULL, 'Historia y Arqueología', '6'), 
(NULL, 'Otras Humanidades', '6'), 
(NULL, 'Otras Historias', '6');

INSERT INTO `requisito_cat_grupo` (`ID`, `ANIOS_GRUPO`, `IND_TOPA_B`, `IND_AP`, `IND_FR_AB`, `IND_COHEN`, `IND_GRUPO`, `PERFIL_INVESTIGADOR`, `ID_CATEGORIA_GRUPO`) 
VALUES (NULL, '5', 'Ind.top en el cuartil 1', 'Mayor cero', 'FrA mayor a cero', 'Mayor a cero', 'Sénior o Asociado', 'Mayor o igual a cuartil 1', '1'), 
(NULL, '5', 'Ind.top mayor o igual a cero o Ind.A mayor o igual a cero', 'Mayor a cero ', 'FrA mayor a cero', 'Mayor a cero', 'Mayor o igual cuartil 2', 'Sénior o Asociado', '2'), 
(NULL, '3', 'Ind.top mayor o igual a cero o Ind.A mayor o igual a cero', 'Mayor a cero', 'FrA mayor a cero o FrB mayor o igual a cuartil 2', 'Mayor a cero', 'Mayor o igual cuartil 3', 'Sénior o Asociado o Junior o Doctor', '3'), 
(NULL, '2', 'Ind.top mayor o igual a cero o Ind.A mayor o igual a cero', 'Mayor a cero', 'FrA mayor a cero o FrB mayor o igual a cero', NULL, 'Mayor a cero', NULL, '4');



