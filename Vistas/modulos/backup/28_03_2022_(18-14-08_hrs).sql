SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS db_proyecto_prosecar;

USE db_proyecto_prosecar;

DROP TABLE IF EXISTS tbl_alergias;

CREATE TABLE `tbl_alergias` (
  `CODIGO_ALERGIAS` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `CREADO_POR` varchar(20) NOT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date NOT NULL,
  PRIMARY KEY (`CODIGO_ALERGIAS`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_alergias VALUES("1","Alergia al polen","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_alergias VALUES("2","Alergia al humo","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_alergias VALUES("3","Alergia al polvo","","","0000-00-00","","0000-00-00");



DROP TABLE IF EXISTS tbl_area;

CREATE TABLE `tbl_area` (
  `CODIGO_AREA` int(5) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(150) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `CREADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_area VALUES("1","ACADEMICA","","2022-03-17","ADMIN","0000-00-00","");
INSERT INTO tbl_area VALUES("2","MEDICA","","2022-03-17","ADMIN","0000-00-00","");
INSERT INTO tbl_area VALUES("3","PSICOLOGICA","","2022-03-17","ADMIN","0000-00-00","");
INSERT INTO tbl_area VALUES("4","ESPIRITUAL","","2022-03-17","ADMIN","0000-00-00","");



DROP TABLE IF EXISTS tbl_bitacora_sistema;

CREATE TABLE `tbl_bitacora_sistema` (
  `CODIGO_BITACORA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_USUARIO` int(5) DEFAULT NULL,
  `CODIGO_OBJETO` int(5) DEFAULT NULL,
  `FECHA` datetime DEFAULT NULL,
  `ACCION` varchar(100) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_BITACORA`)
) ENGINE=InnoDB AUTO_INCREMENT=811 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_bitacora_sistema VALUES("1","1","1","2022-03-12 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("2","1","1","2022-03-12 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("3","2","1","2022-03-12 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("4","2","22","2022-03-12 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("5","2","22","2022-03-12 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("6","2","22","2022-03-12 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("7","2","22","2022-03-12 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("8","2","22","2022-03-12 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("9","2","22","2022-03-12 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("10","2","22","2022-03-12 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("11","2","1","2022-03-12 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("12","2","1","2022-03-12 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("13","2","1","2022-03-12 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("14","1","1","2022-03-12 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("15","1","1","2022-03-12 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("16","2","1","2022-03-12 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("17","2","1","2022-03-12 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("18","1","1","2022-03-12 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("19","1","14","2022-03-12 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("20","1","1","2022-03-12 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("21","1","1","2022-03-12 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("22","1","14","2022-03-12 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("23","1","14","2022-03-12 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("24","1","14","2022-03-12 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("25","1","13","2022-03-13 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("26","1","13","2022-03-13 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("27","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("28","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("29","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("30","1","1","2022-03-13 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("31","2","1","2022-03-13 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("32","2","1","2022-03-13 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("33","1","1","2022-03-13 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("34","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("35","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("36","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("37","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("38","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("39","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("40","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("41","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("42","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("43","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("44","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("45","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("46","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("47","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("48","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("49","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("50","1","13","2022-03-13 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("51","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("52","1","13","2022-03-13 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("53","1","14","2022-03-13 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("54","1","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("55","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("56","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("57","1","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("58","1","20","2022-03-14 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("59","1","20","2022-03-14 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("60","1","20","2022-03-14 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("61","1","20","2022-03-14 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("62","1","20","2022-03-14 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("63","1","20","2022-03-14 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("64","1","20","2022-03-14 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("65","1","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("66","1","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("67","43","1","2022-03-14 00:00:00","Intento de login fallido","El usuario bloqueado intento ingresar al sistema");
INSERT INTO tbl_bitacora_sistema VALUES("68","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("69","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("70","1","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("71","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("72","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("73","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("74","1","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("75","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("76","1","6","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("77","1","6","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("78","1","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("79","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("80","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("81","2","20","2022-03-14 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("82","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("83","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("84","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("85","1","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("86","1","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("87","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("88","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("89","1","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("90","1","7","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("91","1","7","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("92","1","7","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("93","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("94","1","1","2022-03-17 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("95","2","1","2022-03-17 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("96","2","22","2022-03-17 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("97","2","1","2022-03-17 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("98","1","1","2022-03-17 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("99","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("100","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("101","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("102","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("103","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("104","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("105","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("106","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("107","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("108","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("109","1","14","2022-03-17 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("110","1","7","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("111","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("112","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("113","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("114","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("115","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("116","1","13","2022-03-17 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("117","1","13","2022-03-17 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("118","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("119","1","2","2022-03-17 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("120","1","14","2022-03-17 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("121","1","7","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("122","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("123","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("124","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("125","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("126","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("127","1","1","2022-03-17 00:00:00","Modificacion","Se edito un estudiante ");
INSERT INTO tbl_bitacora_sistema VALUES("128","1","1","2022-03-17 00:00:00","Modificacion","Se edito un estudiante ");
INSERT INTO tbl_bitacora_sistema VALUES("129","1","1","2022-03-17 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("130","1","7","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("131","1","7","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("132","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("133","1","20","2022-03-17 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("134","1","7","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("135","1","7","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("136","1","7","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("137","1","6","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("138","1","1","2022-03-18 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("139","2","1","2022-03-18 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("140","2","22","2022-03-18 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("141","2","22","2022-03-18 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("142","2","19","2022-03-18 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("143","2","22","2022-03-18 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("144","2","1","2022-03-18 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("145","1","1","2022-03-18 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("146","1","14","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("147","1","14","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("148","1","14","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("149","1","14","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("150","1","14","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("151","1","1","2022-03-18 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("152","44","1","2022-03-18 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("153","44","1","2022-03-18 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("154","1","1","2022-03-18 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("155","1","13","2022-03-18 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("156","1","13","2022-03-18 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("157","1","17","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("158","1","17","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("159","1","12","2022-03-18 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("160","1","7","2022-03-18 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("161","1","6","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("162","1","6","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("163","1","12","2022-03-18 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("164","1","12","2022-03-18 00:00:00","Se ingreso un tipo persona","Se vizualiza el tipo de persona");
INSERT INTO tbl_bitacora_sistema VALUES("165","1","12","2022-03-18 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("166","1","6","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("167","1","6","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("168","1","1","2022-03-18 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("169","43","1","2022-03-18 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("170","43","1","2022-03-18 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("171","1","1","2022-03-18 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("172","1","20","2022-03-18 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("173","1","20","2022-03-18 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("174","1","20","2022-03-18 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("175","1","20","2022-03-18 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("176","1","7","2022-03-18 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("177","1","7","2022-03-18 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("178","1","7","2022-03-18 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("179","1","7","2022-03-18 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("180","1","7","2022-03-18 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("181","1","7","2022-03-18 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("182","1","20","2022-03-18 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("183","1","7","2022-03-18 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("184","1","20","2022-03-18 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("185","1","20","2022-03-18 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("186","1","20","2022-03-18 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("187","1","17","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("188","1","13","2022-03-18 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("189","1","20","2022-03-18 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("190","1","20","2022-03-18 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("191","1","20","2022-03-18 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("192","1","13","2022-03-18 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("193","1","1","2022-03-18 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("194","43","1","2022-03-18 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("195","43","1","2022-03-18 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("196","44","1","2022-03-18 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("197","44","1","2022-03-18 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("198","1","1","2022-03-18 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("199","1","13","2022-03-18 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("200","1","7","2022-03-18 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("201","1","12","2022-03-18 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("202","1","13","2022-03-18 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("203","1","14","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("204","1","14","2022-03-18 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("205","1","1","2022-03-19 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("206","2","1","2022-03-19 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("207","2","1","2022-03-19 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("208","2","14","2022-03-19 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("209","2","13","2022-03-19 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("210","2","1","2022-03-19 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("211","2","1","2022-03-19 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("212","2","1","2022-03-20 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("213","41","1","2022-03-20 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("214","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("215","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("216","41","14","2022-03-20 00:00:00","actualizo","Se actualizo una persona ");
INSERT INTO tbl_bitacora_sistema VALUES("217","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("218","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("219","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("220","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("221","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("222","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("223","41","13","2022-03-20 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("224","41","13","2022-03-20 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("225","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("226","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("227","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("228","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("229","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("230","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("231","41","25","2022-03-20 00:00:00","Modificacion","Se edito una  Especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("232","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("233","41","25","2022-03-20 00:00:00","Modificacion","Se edito una  Especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("234","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("235","41","25","2022-03-20 00:00:00","Modificacion","Se edito una  Especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("236","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("237","41","25","2022-03-20 00:00:00","Modificacion","Se edito una  Especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("238","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("239","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("240","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("241","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("242","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("243","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("244","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("245","41","7","2022-03-20 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("246","41","7","2022-03-20 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("247","41","7","2022-03-20 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("248","41","7","2022-03-20 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("249","41","7","2022-03-20 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("250","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("251","41","25","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("252","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("253","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("254","41","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("255","41","1","2022-03-20 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("256","2","1","2022-03-20 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("257","2","1","2022-03-20 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("258","2","22","2022-03-20 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("259","2","19","2022-03-20 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("260","2","1","2022-03-20 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("261","1","1","2022-03-20 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("262","1","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("263","1","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("264","1","7","2022-03-20 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("265","1","7","2022-03-20 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("266","1","7","2022-03-20 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("267","1","7","2022-03-20 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("268","1","1","2022-03-20 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("269","41","1","2022-03-20 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("270","41","1","2022-03-20 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("271","1","1","2022-03-20 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("272","1","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("273","1","13","2022-03-20 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("274","1","14","2022-03-20 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("275","1","1","2022-03-20 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("276","2","1","2022-03-20 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("277","2","1","2022-03-20 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("278","2","1","2022-03-20 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("279","2","1","2022-03-20 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("280","2","1","2022-03-20 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("281","2","1","2022-03-20 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("282","2","1","2022-03-20 00:00:00","Usuario bloqueado","Se ingreso el numero de intentos validos");
INSERT INTO tbl_bitacora_sistema VALUES("283","2","1","2022-03-20 00:00:00","Usuario bloqueado","Se ingreso el numero de intentos validos");
INSERT INTO tbl_bitacora_sistema VALUES("284","41","1","2022-03-21 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("285","41","13","2022-03-21 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("286","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("287","41","13","2022-03-21 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("288","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("289","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("290","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("291","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("292","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("293","41","1","2022-03-21 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("294","1","1","2022-03-21 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("295","1","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("296","1","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("297","1","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("298","1","1","2022-03-21 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("299","41","1","2022-03-21 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("300","41","1","2022-03-21 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("301","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("302","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("303","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("304","41","13","2022-03-21 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("305","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("306","41","13","2022-03-21 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("307","41","13","2022-03-21 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("308","41","7","2022-03-21 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("309","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("310","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("311","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("312","41","13","2022-03-21 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("313","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("314","41","2","2022-03-21 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("315","41","3","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("316","41","13","2022-03-21 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("317","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("318","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("319","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("320","41","7","2022-03-21 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("321","41","20","2022-03-21 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("322","41","13","2022-03-21 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("323","41","7","2022-03-21 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("324","41","13","2022-03-21 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("325","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("326","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("327","41","13","2022-03-21 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("328","41","7","2022-03-21 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("329","41","20","2022-03-21 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("330","41","20","2022-03-21 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("331","41","20","2022-03-21 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("332","41","20","2022-03-21 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("333","41","20","2022-03-21 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("334","41","20","2022-03-21 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("335","41","20","2022-03-21 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("336","41","17","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("337","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("338","41","13","2022-03-21 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("339","41","20","2022-03-21 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("340","41","7","2022-03-21 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("341","41","13","2022-03-21 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("342","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("343","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("344","41","14","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("345","41","25","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("346","41","3","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("347","41","4","2022-03-21 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("348","41","2","2022-03-21 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("349","41","6","2022-03-21 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("350","41","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("351","41","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("352","41","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("353","41","13","2022-03-22 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("354","41","2","2022-03-22 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("355","41","14","2022-03-22 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("356","41","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("357","41","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("358","41","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("359","41","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("360","41","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("361","41","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("362","41","1","2022-03-22 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("363","43","1","2022-03-22 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("364","43","1","2022-03-22 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("365","1","1","2022-03-22 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("366","1","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("367","1","13","2022-03-22 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("368","1","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("369","1","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("370","1","20","2022-03-22 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("371","1","20","2022-03-22 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("372","1","20","2022-03-22 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("373","1","20","2022-03-22 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("374","1","20","2022-03-22 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("375","1","3","2022-03-22 00:00:00","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("376","1","3","2022-03-22 00:00:00","Insertar parámetro","Agregó/insertó un nuevo parámetro");
INSERT INTO tbl_bitacora_sistema VALUES("377","1","3","2022-03-22 00:00:00","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("378","1","3","2022-03-22 00:00:00","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("379","1","2","2022-03-22 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("380","1","4","2022-03-22 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("381","1","6","2022-03-22 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("382","1","13","2022-03-22 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("383","1","20","2022-03-22 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("384","1","20","2022-03-22 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("385","1","20","2022-03-22 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("386","1","20","2022-03-22 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("387","1","7","2022-03-22 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("388","1","2","2022-03-22 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("389","1","4","2022-03-22 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("390","1","3","2022-03-22 00:00:00","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("391","1","1","2022-03-23 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("392","2","1","2022-03-23 00:00:00","Intento de login fallido","El usuario bloqueado intento ingresar al sistema");
INSERT INTO tbl_bitacora_sistema VALUES("393","2","1","2022-03-23 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("394","2","22","2022-03-23 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("395","2","2","2022-03-23 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("396","2","19","2022-03-23 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("397","2","22","2022-03-23 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("398","2","2","2022-03-23 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("399","2","1","2022-03-23 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("400","44","1","2022-03-23 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("401","44","1","2022-03-23 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("402","2","1","2022-03-23 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("403","2","2","2022-03-23 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("404","44","1","2022-03-23 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("405","44","1","2022-03-23 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("406","44","17","2022-03-23 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("407","44","17","2022-03-23 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("408","44","17","2022-03-23 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("409","44","17","2022-03-23 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("410","44","17","2022-03-23 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("411","44","17","2022-03-23 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("412","44","1","2022-03-23 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("413","1","1","2022-03-23 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("414","44","1","2022-03-23 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("415","2","1","2022-03-23 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("416","2","2","2022-03-23 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("417","2","2","2022-03-23 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("418","2","1","2022-03-23 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("419","1","1","2022-03-23 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("420","1","7","2022-03-23 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("421","1","20","2022-03-23 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("422","1","20","2022-03-23 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("423","1","20","2022-03-23 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("424","1","20","2022-03-23 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("425","1","20","2022-03-23 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("426","1","20","2022-03-24 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("427","1","4","2022-03-24 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("428","1","14","2022-03-26 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("429","1","14","2022-03-26 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("430","1","14","2022-03-26 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("431","1","1","2022-03-26 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("432","2","1","2022-03-26 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("433","2","22","2022-03-26 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("434","2","2","2022-03-26 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("435","2","1","2022-03-26 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("436","1","1","2022-03-26 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("437","1","1","2022-03-26 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("438","41","1","2022-03-26 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("439","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("440","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("441","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("442","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("443","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("444","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("445","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("446","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("447","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("448","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("449","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("450","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("451","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("452","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("453","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("454","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("455","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("456","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("457","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("458","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("459","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("460","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("461","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("462","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("463","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("464","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("465","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("466","41","12","2022-03-26 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("467","0","12","2022-03-26 00:00:00","Se ingreso un tipo persona","Se vizualiza el tipo de persona");
INSERT INTO tbl_bitacora_sistema VALUES("468","41","12","2022-03-26 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("469","0","19","2022-03-26 00:00:00","Modificacion","Se edito la modalidad");
INSERT INTO tbl_bitacora_sistema VALUES("470","41","19","2022-03-26 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("471","41","7","2022-03-26 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("472","41","12","2022-03-26 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("473","0","19","2022-03-26 00:00:00","Modificacion","Se edito la modalidad");
INSERT INTO tbl_bitacora_sistema VALUES("474","41","19","2022-03-26 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("475","41","12","2022-03-26 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("476","41","7","2022-03-26 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("477","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("478","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("479","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("480","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("481","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("482","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("483","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("484","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("485","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("486","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("487","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("488","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("489","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("490","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("491","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("492","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("493","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("494","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("495","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("496","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("497","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("498","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("499","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("500","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("501","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("502","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("503","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("504","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("505","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("506","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("507","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("508","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("509","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("510","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("511","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("512","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("513","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("514","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("515","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("516","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("517","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("518","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("519","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("520","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("521","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("522","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("523","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("524","0","2","2022-03-26 00:00:00","Modificacion","Se edito un familiar ");
INSERT INTO tbl_bitacora_sistema VALUES("525","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("526","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("527","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("528","0","2","2022-03-26 00:00:00","Modificacion","Se edito un familiar ");
INSERT INTO tbl_bitacora_sistema VALUES("529","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("530","0","2","2022-03-26 00:00:00","Modificacion","Se edito un familiar ");
INSERT INTO tbl_bitacora_sistema VALUES("531","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("532","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("533","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("534","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("535","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("536","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("537","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("538","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("539","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("540","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("541","0","2","2022-03-26 00:00:00","Modificacion","Se edito un familiar ");
INSERT INTO tbl_bitacora_sistema VALUES("542","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("543","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("544","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("545","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("546","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("547","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("548","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("549","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("550","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("551","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("552","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("553","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("554","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("555","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("556","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("557","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("558","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("559","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("560","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("561","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("562","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("563","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("564","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("565","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("566","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("567","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("568","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("569","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("570","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("571","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("572","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("573","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("574","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("575","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("576","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("577","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("578","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("579","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("580","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("581","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("582","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("583","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("584","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("585","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("586","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("587","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("588","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("589","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("590","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("591","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("592","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("593","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("594","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("595","0","2","2022-03-26 00:00:00","Modificacion","Se edito un familiar ");
INSERT INTO tbl_bitacora_sistema VALUES("596","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("597","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("598","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("599","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("600","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("601","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("602","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("603","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("604","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("605","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("606","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("607","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("608","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("609","41","7","2022-03-26 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("610","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("611","41","7","2022-03-26 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("612","41","7","2022-03-26 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("613","41","4","2022-03-26 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("614","41","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("615","41","1","2022-03-26 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("616","44","1","2022-03-26 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("617","44","1","2022-03-26 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("618","1","1","2022-03-26 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("619","1","1","2022-03-26 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("620","44","1","2022-03-26 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("621","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("622","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("623","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("624","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("625","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("626","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("627","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("628","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("629","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("630","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("631","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("632","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("633","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("634","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("635","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("636","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("637","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("638","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("639","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("640","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("641","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("642","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("643","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("644","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("645","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("646","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("647","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("648","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("649","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("650","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("651","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("652","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("653","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("654","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("655","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("656","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("657","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("658","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("659","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("660","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("661","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("662","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("663","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("664","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("665","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("666","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("667","44","20","2022-03-26 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("668","44","1","2022-03-27 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("669","1","1","2022-03-27 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("670","1","6","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("671","1","6","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("672","1","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("673","1","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("674","1","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("675","1","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("676","1","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("677","1","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("678","1","1","2022-03-27 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("679","41","1","2022-03-27 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("680","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("681","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("682","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("683","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("684","41","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("685","41","32","2022-03-27 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("686","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("687","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("688","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("689","41","32","2022-03-27 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("690","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("691","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("692","41","2","2022-03-27 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("693","41","4","2022-03-27 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("694","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("695","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("696","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("697","41","32","2022-03-27 00:00:00","Actualizacion","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("698","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("699","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("700","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("701","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("702","41","1","2022-03-27 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("703","41","1","2022-03-27 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("704","41","1","2022-03-27 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("705","41","1","2022-03-27 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("706","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("707","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("708","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("709","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("710","41","32","2022-03-27 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("711","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("712","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("713","41","32","2022-03-27 00:00:00","Actualizacion","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("714","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("715","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("716","41","32","2022-03-27 00:00:00","Actualizacion","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("717","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("718","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("719","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("720","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("721","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("722","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("723","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("724","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("725","41","4","2022-03-27 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("726","41","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("727","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("728","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("729","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("730","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("731","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("732","41","32","2022-03-27 00:00:00","ELIMINACION","Se elimino una CITA ");
INSERT INTO tbl_bitacora_sistema VALUES("733","41","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("734","41","1","2022-03-27 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("735","44","1","2022-03-27 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("736","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("737","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("738","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("739","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("740","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("741","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("742","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("743","1","1","2022-03-27 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("744","1","4","2022-03-27 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("745","1","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("746","1","4","2022-03-27 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("747","1","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("748","1","7","2022-03-27 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("749","1","7","2022-03-27 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("750","1","1","2022-03-27 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("751","44","1","2022-03-27 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("752","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("753","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("754","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("755","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("756","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("757","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("758","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("759","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("760","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("761","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("762","44","1","2022-03-27 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("763","44","1","2022-03-27 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("764","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("765","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("766","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("767","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("768","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("769","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("770","44","1","2022-03-27 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("771","1","1","2022-03-27 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("772","1","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("773","1","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("774","1","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("775","1","32","2022-03-27 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("776","1","1","2022-03-27 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("777","44","1","2022-03-27 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("778","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("779","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("780","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("781","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("782","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("783","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("784","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("785","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("786","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("787","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("788","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("789","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("790","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("791","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("792","44","20","2022-03-27 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("793","1","1","2022-03-28 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("794","1","7","2022-03-28 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("795","1","32","2022-03-28 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("796","1","4","2022-03-28 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("797","1","20","2022-03-28 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("798","1","4","2022-03-28 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("799","1","1","2022-03-28 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("800","44","1","2022-03-29 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("801","44","20","2022-03-29 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("802","44","20","2022-03-29 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("803","44","20","2022-03-29 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("804","41","1","2022-03-29 00:00:00","Usuario bloqueado","Se ingreso el numero de intentos validos");
INSERT INTO tbl_bitacora_sistema VALUES("805","1","1","2022-03-29 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("806","1","32","2022-03-29 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("807","1","32","2022-03-29 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("808","1","4","2022-03-29 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("809","1","20","2022-03-29 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("810","1","32","2022-03-29 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");



DROP TABLE IF EXISTS tbl_calificaciones;

CREATE TABLE `tbl_calificaciones` (
  `CODIGO_CALIFICACIONES` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_MATRICULA` int(5) DEFAULT NULL,
  `CALIFICACION` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CALIFICACIONES`),
  KEY `FK_COD_MATRCU` (`CODIGO_MATRICULA`),
  CONSTRAINT `FK_COD_MATRCU` FOREIGN KEY (`CODIGO_MATRICULA`) REFERENCES `tbl_matricula_academica` (`CODIGO_MATRICULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_carga_academica;

CREATE TABLE `tbl_carga_academica` (
  `CODIGO_CARGA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_TUTORIA` int(5) DEFAULT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_MODALIDAD` int(5) DEFAULT NULL,
  `SECCION` varchar(10) DEFAULT NULL,
  `HORA` time DEFAULT NULL,
  `HORA_FINAL` date NOT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_FINAL` date DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CARGA`),
  KEY `PK_COD_PE` (`CODIGO_PERSONA`),
  KEY `PK_COD_MOD` (`CODIGO_MODALIDAD`),
  KEY `PK_COD_TUTO` (`CODIGO_TUTORIA`),
  CONSTRAINT `PK_COD_MOD` FOREIGN KEY (`CODIGO_MODALIDAD`) REFERENCES `tbl_modalidad` (`CODIGO_MODALIDA`),
  CONSTRAINT `PK_COD_PE` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `PK_COD_TUTO` FOREIGN KEY (`CODIGO_TUTORIA`) REFERENCES `tbl_tutoria` (`CODIGO_TUTORIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_consulta_medica;

CREATE TABLE `tbl_consulta_medica` (
  `CODIGO_CONSULTA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PRECLINICA` int(5) DEFAULT NULL,
  `CODIGO_CITA` int(5) DEFAULT NULL,
  `DIAGNOSTICO_INGRESO` varchar(100) DEFAULT NULL,
  `DIAGNOSTICO_EGRESO` varchar(100) DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) NOT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONSULTA`),
  KEY `FK_COD_PREC` (`CODIGO_PRECLINICA`),
  KEY `FK_COD_CIT` (`CODIGO_CITA`),
  CONSTRAINT `FK_COD_CIT` FOREIGN KEY (`CODIGO_CITA`) REFERENCES `tbl_inscripcion_cita` (`CODIGO_CITA`),
  CONSTRAINT `FK_COD_PREC` FOREIGN KEY (`CODIGO_PRECLINICA`) REFERENCES `tbl_preclinica` (`CODIGO_PRECLINICA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_consulta_medica VALUES("1","1","1","Esta enfermo","Dolores Musculares","LUISMIGUEL","2022-03-27","","");



DROP TABLE IF EXISTS tbl_contenido_socioeconomico;

CREATE TABLE `tbl_contenido_socioeconomico` (
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_TIPOSOCIO` int(5) NOT NULL,
  `NOMBRE_TIPO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_TIPOSOCIO` (`CODIGO_TIPOSOCIO`),
  CONSTRAINT `FK_COD_TIPOSOCIO` FOREIGN KEY (`CODIGO_TIPOSOCIO`) REFERENCES `tbl_tipo_socioeconomico` (`CODIGO_TIPOSOCIO`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_contenido_socioeconomico VALUES("1","1","Computadora");
INSERT INTO tbl_contenido_socioeconomico VALUES("2","1","Celular");
INSERT INTO tbl_contenido_socioeconomico VALUES("3","1","Tablet");
INSERT INTO tbl_contenido_socioeconomico VALUES("4","1","Celular, tablet");
INSERT INTO tbl_contenido_socioeconomico VALUES("7","1","Computadora, tablet");
INSERT INTO tbl_contenido_socioeconomico VALUES("8","1","Computadora, celular");
INSERT INTO tbl_contenido_socioeconomico VALUES("9","1","Computadora, celular, tablet");
INSERT INTO tbl_contenido_socioeconomico VALUES("10","1","Ninguno");
INSERT INTO tbl_contenido_socioeconomico VALUES("11","2","Internet Residencial");
INSERT INTO tbl_contenido_socioeconomico VALUES("12","2","Datos moviles");
INSERT INTO tbl_contenido_socioeconomico VALUES("13","2","Ambos");
INSERT INTO tbl_contenido_socioeconomico VALUES("14","3","Padre");
INSERT INTO tbl_contenido_socioeconomico VALUES("15","3","Madre");
INSERT INTO tbl_contenido_socioeconomico VALUES("16","3","Ambos");
INSERT INTO tbl_contenido_socioeconomico VALUES("17","3","Remesas");
INSERT INTO tbl_contenido_socioeconomico VALUES("18","2","Ninguno");
INSERT INTO tbl_contenido_socioeconomico VALUES("19","4","Energía Eléctrica");
INSERT INTO tbl_contenido_socioeconomico VALUES("20","4","Agua Potable");
INSERT INTO tbl_contenido_socioeconomico VALUES("21","4","Alcantarillado");



DROP TABLE IF EXISTS tbl_correo_electronico;

CREATE TABLE `tbl_correo_electronico` (
  `correo_persona` varchar(50) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  PRIMARY KEY (`correo_persona`),
  KEY `FK_CORREO` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_CORREO` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_correo_electronico VALUES("proyecto_prosecar@hotmail.com","1");
INSERT INTO tbl_correo_electronico VALUES("pedro@gmail.com","2");
INSERT INTO tbl_correo_electronico VALUES("AlexanderSarmiento@gmail.com","34");
INSERT INTO tbl_correo_electronico VALUES("rosamaria123@gmail.com","35");
INSERT INTO tbl_correo_electronico VALUES("gdiaza@unah.hn","36");
INSERT INTO tbl_correo_electronico VALUES("aacaballero@unah.hn","37");
INSERT INTO tbl_correo_electronico VALUES("aacaballero@una.hn","38");
INSERT INTO tbl_correo_electronico VALUES("ld@gmail.com","39");
INSERT INTO tbl_correo_electronico VALUES("arnoldpballero@gmail.com","40");
INSERT INTO tbl_correo_electronico VALUES("aaca090lero@unah.hn","41");
INSERT INTO tbl_correo_electronico VALUES("josueherrera@gmail.com","43");



DROP TABLE IF EXISTS tbl_especialidad;

CREATE TABLE `tbl_especialidad` (
  `CODIGO_ESPECIALIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(40) NOT NULL,
  `CODIGO_AREA` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(35) NOT NULL,
  `FECHA_CREACION` date NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) NOT NULL,
  `FECHA_MODIFICACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESPECIALIDAD`),
  KEY `TBL_ESP_FK` (`CODIGO_AREA`),
  CONSTRAINT `TBL_ESP_FK` FOREIGN KEY (`CODIGO_AREA`) REFERENCES `tbl_area` (`CODIGO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_especialidad VALUES("1","PEDIATRA","2","AREA DE ATENCION A NIÑOS MENORES","2022-03-17","ADMIN","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("2","MEDICINA GENERAL","2","AREA DE ATENCION A CUALQUIER EDAD","2022-03-17","ADMIN","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("3","PSICOLOGIA_SOCIAL","3","AREA DE ATENCION A NIÑOS","2022-03-17","ADMIN","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("4","PSICOLOGIA COGNITIVA","3","Analiza el funcionamiento de la mem","2022-03-17","ADMIN","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("5","PSICOLOGIA","0","AREA DE PSICOLOGIA","0000-00-00","","0000-00-00","");



DROP TABLE IF EXISTS tbl_estado;

CREATE TABLE `tbl_estado` (
  `CODIGO_ESTADO` int(5) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(15) NOT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_estado VALUES("1","NUEVO","Este usuario esta ACTIVO");
INSERT INTO tbl_estado VALUES("2","ACTIVO","este usuario esta nuevo");
INSERT INTO tbl_estado VALUES("3","INACTIVO","este ususario esta inactivo");
INSERT INTO tbl_estado VALUES("4","BLOQUEADO","Esta usuario esta en estado de bloqueo");
INSERT INTO tbl_estado VALUES("5","PENDIENTE","Este usuario esta pendiente de cambiar la contrase");
INSERT INTO tbl_estado VALUES("6","INDEFINIDO","Este usuario esta deshabiltado ");
INSERT INTO tbl_estado VALUES("13","","");



DROP TABLE IF EXISTS tbl_estudiante;

CREATE TABLE `tbl_estudiante` (
  `CODIGO_ESTUDIANTE` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `GRADO_ACTUAL` int(5) DEFAULT NULL,
  `REPITENTE` varchar(5) NOT NULL,
  `INDICE_ACADEMICO` int(5) NOT NULL,
  `MATE_BAJO_RENDI` varchar(100) DEFAULT NULL,
  `PASATIEMPOS` varchar(100) DEFAULT NULL,
  `DISTRACTORES_ESCOLARES` varchar(100) DEFAULT NULL,
  `METAS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE`),
  KEY `FK_COD_EST` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_COD_EST` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_estudiante VALUES("17","42","8","NO","90","MATEMATICAS","WATCHING TV","SPEN TIME IN SOCIAL MEDIA","GO AT UNIVERSITITY");
INSERT INTO tbl_estudiante VALUES("18","39","9","NO","85","MATEMATICAS","VER TELEVISION TODO EL DIA","REDES SOCIALES","TRABAJAR EN UN HOSPITAL");



DROP TABLE IF EXISTS tbl_estudiante_socioeconomico;

CREATE TABLE `tbl_estudiante_socioeconomico` (
  `CODIGO_ESTUDIANTE_SOCIOECONOMICO` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(5) NOT NULL,
  `CODIGO_ESTUDIANTE` int(5) NOT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE_SOCIOECONOMICO`),
  KEY `FK_CONTSOCIO` (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_ES` (`CODIGO_ESTUDIANTE`),
  CONSTRAINT `FK_COD_ES` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `tbl_estudiante` (`CODIGO_ESTUDIANTE`),
  CONSTRAINT `FK_CONTSOCIO` FOREIGN KEY (`CODIGO_CONTENIDO_SOCIOECONOMICO`) REFERENCES `tbl_contenido_socioeconomico` (`CODIGO_CONTENIDO_SOCIOECONOMICO`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_estudiante_socioeconomico VALUES("10","2","17");
INSERT INTO tbl_estudiante_socioeconomico VALUES("11","13","17");
INSERT INTO tbl_estudiante_socioeconomico VALUES("12","17","17");
INSERT INTO tbl_estudiante_socioeconomico VALUES("13","21","17");
INSERT INTO tbl_estudiante_socioeconomico VALUES("14","4","18");
INSERT INTO tbl_estudiante_socioeconomico VALUES("15","13","18");
INSERT INTO tbl_estudiante_socioeconomico VALUES("16","14","18");
INSERT INTO tbl_estudiante_socioeconomico VALUES("17","21","18");



DROP TABLE IF EXISTS tbl_examenes_medicos;

CREATE TABLE `tbl_examenes_medicos` (
  `CODIGO_EXAMEN_MEDICO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXAMEN_MEDICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_examenes_pacientes;

CREATE TABLE `tbl_examenes_pacientes` (
  `CODIGO_EXAMEN_PACIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONSULTA` int(5) DEFAULT NULL,
  `CODIGO_EXAMEN_MEDICO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXAMEN_PACIENTE`),
  KEY `FK_COD_CONSULTA` (`CODIGO_CONSULTA`),
  KEY `FK_COD_EXAMEN_MEDICO` (`CODIGO_EXAMEN_MEDICO`),
  CONSTRAINT `FK_COD_CONSULTA` FOREIGN KEY (`CODIGO_CONSULTA`) REFERENCES `tbl_consulta_medica` (`CODIGO_CONSULTA`),
  CONSTRAINT `FK_COD_EXAMEN_MEDICO` FOREIGN KEY (`CODIGO_EXAMEN_MEDICO`) REFERENCES `tbl_examenes_medicos` (`CODIGO_EXAMEN_MEDICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_expediente_medico;

CREATE TABLE `tbl_expediente_medico` (
  `CODIGO_EXPEDIENTE` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_TIPO_SANGRE` int(5) DEFAULT NULL,
  `ANTECEDENTES_PADRE` varchar(500) DEFAULT NULL,
  `ANTECEDENTES_MADRE` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXPEDIENTE`),
  KEY `COD_PERSO_FK` (`CODIGO_PERSONA`),
  KEY `COD_SANGRE_FK` (`CODIGO_TIPO_SANGRE`),
  CONSTRAINT `COD_PERSO_FK` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `COD_SANGRE_FK` FOREIGN KEY (`CODIGO_TIPO_SANGRE`) REFERENCES `tbl_tipo_sangre` (`CODIGO_TIPO_SANGRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_familiar;

CREATE TABLE `tbl_familiar` (
  `CODIGO_FAMILIAR` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `ESTADO_CIVIL` varchar(10) DEFAULT NULL,
  `NIVEL_EDUCATIVO` varchar(15) NOT NULL,
  `INGRESOS_DE_FAMILIAR` int(10) DEFAULT NULL,
  `NOMBRE_IGLESIA` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_FAMILIAR`),
  KEY `FAM_PK` (`CODIGO_PERSONA`),
  CONSTRAINT `FAM_PK` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_familiar VALUES("3","44","Soltero","primaria","2000","sagrado corazon");



DROP TABLE IF EXISTS tbl_inscripcion_cita;

CREATE TABLE `tbl_inscripcion_cita` (
  `CODIGO_CITA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_ESPECIALISTA` int(5) DEFAULT NULL,
  `FECHA_CITA` date DEFAULT NULL,
  `HORARIO` time DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `CREADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CITA`),
  KEY `FK_CODIGO_PERSONAS` (`CODIGO_PERSONA`),
  KEY `FK_CODIGO_ESPECIALISTA` (`CODIGO_ESPECIALISTA`),
  CONSTRAINT `FK_CODIGO_ESPECIALISTA` FOREIGN KEY (`CODIGO_ESPECIALISTA`) REFERENCES `tbl_persona_especialidad` (`CODIGO_PERSONA_ESPECIALIDAD`),
  CONSTRAINT `FK_CODIGO_PERSONAS` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_inscripcion_cita VALUES("1","2","1","0000-00-00","00:20:22","0000-00-00","2022-03-27","0000-00-00","");
INSERT INTO tbl_inscripcion_cita VALUES("2","34","1","2022-03-26","10:30:00","0000-00-00","2022-03-27","0000-00-00","LUISILLO");



DROP TABLE IF EXISTS tbl_matricula_academica;

CREATE TABLE `tbl_matricula_academica` (
  `CODIGO_MATRICULA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_CARGA` int(5) DEFAULT NULL,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `FECHA_MATRICULA` date NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MATRICULA`),
  KEY `FK_COD_ESTU` (`CODIGO_ESTUDIANTE`),
  KEY `FK_COD_CARGA` (`CODIGO_CARGA`),
  CONSTRAINT `FK_COD_CARGA` FOREIGN KEY (`CODIGO_CARGA`) REFERENCES `tbl_carga_academica` (`CODIGO_CARGA`),
  CONSTRAINT `FK_COD_ESTU` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `tbl_estudiante` (`CODIGO_ESTUDIANTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_medicamento;

CREATE TABLE `tbl_medicamento` (
  `CODIGO_MEDICAMENTO` varchar(10) NOT NULL,
  `NOMBRE_MEDICAMENTO` varchar(50) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MEDICAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_medicamento VALUES("1A","Acetaminofen","Para el dolor","LUISMIGUEL","2022-03-27","","");
INSERT INTO tbl_medicamento VALUES("2A","Loratadina","para el dolor","","","","");



DROP TABLE IF EXISTS tbl_modalidad;

CREATE TABLE `tbl_modalidad` (
  `CODIGO_MODALIDA` int(5) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(20) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MODALIDA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_ms_hist_contraseña;

CREATE TABLE `tbl_ms_hist_contraseña` (
  `CODIGO_HIST_CONTRASEÑA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_USUARIO` int(5) NOT NULL,
  `CONTRASEÑA` varchar(30) NOT NULL,
  `CREADO_POR_USUARIO` int(5) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` int(5) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_HIST_CONTRASEÑA`),
  KEY `FK_COD_USU_HISCON` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_ms_hist_contraseña VALUES("1","2","Pedro12*","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("2","2","Pedro123*","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("3","41","Rosas12*","41","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("4","41","Rosas123**","41","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("5","43","Caballero*1","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("6","43","Prueba123*","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("7","43","Pedro123*","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("8","43","Pedro12*","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("9","43","Pedro12*1","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("10","47","Pruebe12**","47","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("11","43","Cab16*","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("12","43","Caballe%*1","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("13","43","Caball4*(","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("14","43","Caballer90%^","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("15","43","Caballer90%9","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("16","43","Cball6(*","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("17","43","Cball6(*7","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("18","43","Cball6(*78","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("19","41","A1238a*","41","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("20","43","Inform123*","43","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("21","2","Arnold124*","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("22","2","Pedro123**()","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("23","2","Pedro123*1q","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("24","2","Pedro123*z","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("25","2","Pedro123*x","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("26","2","Pedro123*xq","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("27","2","Pedro123*xs","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("28","2","Pedro123*xe","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("29","2","Pedro123*xex","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("30","2","Pedro123*xexx","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("31","2","Pedro123*xexx1","2","0000-00-00","0","0000-00-00");
INSERT INTO tbl_ms_hist_contraseña VALUES("32","41","Luis123**","41","0000-00-00","0","0000-00-00");



DROP TABLE IF EXISTS tbl_no_patologias;

CREATE TABLE `tbl_no_patologias` (
  `CODIGO_NO_PATOLOGIA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(60) NOT NULL,
  PRIMARY KEY (`CODIGO_NO_PATOLOGIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_objetos;

CREATE TABLE `tbl_objetos` (
  `CODIGO_OBJETO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(40) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_OBJETO`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_objetos VALUES("1","ESTADO","Sistema de administracion","Administrador","2022-02-09","","0000-00-00");
INSERT INTO tbl_objetos VALUES("2","ROLES","objeto donde se registran personas ","Administrador","2022-02-06","","0000-00-00");
INSERT INTO tbl_objetos VALUES("3","PARAMETROS","","Administrador","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("4","PREGUNTAS","Objeto mantenimiento Preguntas","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("5","PERMISOS","Objeto mantenimiento Permisos","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("6","OBJETOS","Objeto mantenimiento objetos","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("7","BITACORA","Objeto consulta bitacora","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("8","PREGUNTAS_USUARIOS","Objeto consulta preguntas usuarios","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("9","PARAMETROS_USUARIOS","Objeto mantenimiento parametros usuarios","","0000-00-00","","0000-00-00");
INSERT INTO tbl_objetos VALUES("10","BACKUP ","Objeto mantenimiento backup","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("11","RESTAURACION","Objeto mantenimiento restauracion","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("12","TIPO_PERSONAS","Mantenimiento de la tabla tipo de personas.","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("13","REGISTRAR_PERSONAS","Objeto registra una persona.","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("14","EDITAR_USARIOS","Objeto mantenimiento usuarios.","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("15","EDITAR_PERSONAS","Objeto mantenimiento personas.","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("16","ESTUDIANTES","Objeto mantenimiento estudiantes.","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("17","TIPO_SOCIOECONOMICO","Objeto mantenimiento tipo socioeconomico.","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("18","CONTENIDO_SOCIOECONOMICO","Objeto mantenimiento contenido socioeconomico.","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("19","MODALIDAD","Objeto mantenimiento modalidad","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("20","CARGA_ACADEMICA","Objeto mantenimiento carga académica.","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("21","AREA","Objeto mantenimiento de área.","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("22","TUTORIA","Objeto mantenimiento de tutoria.","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("23","MATRICULA","Objeto mantenimiento matricula.","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("24","CALIFICACIONES","Objeto mantenimiento calificaciones","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_objetos VALUES("25","PERSONAS","Gestion complete de personas.","","0000-00-00","","0000-00-00");
INSERT INTO tbl_objetos VALUES("26","GESTION_ESTUDIANTES","OBJETO DE GESTION DE LOS ESTUDIANTES","ADMIN","2022-03-10","","0000-00-00");
INSERT INTO tbl_objetos VALUES("27","SEGURIDAD","GESTION DE SEGURIDAD","ADMIN","2022-03-10","","0000-00-00");
INSERT INTO tbl_objetos VALUES("28","GESTION_CARGA_ACADEMICA","OBJETO DE GESTION DE LA CARGA ACADEMICA","ADMIN","2022-03-10","","0000-00-00");
INSERT INTO tbl_objetos VALUES("29","GESTION_MATRICULA","OBJETO DE GESTION DE LAS MATRICULAS DE LOS ALUMNOS","ADMIN","2022-03-10","","0000-00-00");
INSERT INTO tbl_objetos VALUES("30","GESTION_AREA_MEDICA","OBJETO DE GESTION DE LAS CITAS MEDICAS","ADMIN","2022-03-10","","0000-00-00");
INSERT INTO tbl_objetos VALUES("31","GESTION_AREA_PSICOLOGIA","OBJETO DEL AREA PSICOLOGICA","ADMIN","2022-03-18","","0000-00-00");
INSERT INTO tbl_objetos VALUES("32","GESTION_DE_CITAS","DED","","2022-03-27","","0000-00-00");



DROP TABLE IF EXISTS tbl_otros_antecedentes;

CREATE TABLE `tbl_otros_antecedentes` (
  `CODIGO_OA` int(5) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL,
  PRIMARY KEY (`CODIGO_OA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_otros_antecedentes VALUES("1","Enfermedades base");
INSERT INTO tbl_otros_antecedentes VALUES("2","Problemas visuales");
INSERT INTO tbl_otros_antecedentes VALUES("3","Enfermedades hereditarias ");



DROP TABLE IF EXISTS tbl_parametros;

CREATE TABLE `tbl_parametros` (
  `CODIGO_PARAMETRO` int(11) NOT NULL AUTO_INCREMENT,
  `PARAMETRO` varchar(50) DEFAULT NULL,
  `VALOR` varchar(100) DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PARAMETRO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_parametros VALUES("1","NUM_INTEN_VALIDOS","3","Administrador","2022-02-07","ADMIN","2022-03-10");
INSERT INTO tbl_parametros VALUES("2","NUM_MAX_PREGUNTAS","3","Administrador","2022-02-07","ADMIN","2022-03-10");
INSERT INTO tbl_parametros VALUES("3","NUM_MAX_CONTRASENAS","8","Administrador","2022-02-07","ADMIN","2022-03-10");
INSERT INTO tbl_parametros VALUES("4","NUM_MAX_CARACTER","30","Administrador","2022-02-07","Administrador","2022-02-07");
INSERT INTO tbl_parametros VALUES("5","ADMIN_SERVIDOR_CORREO","smtp-mail.outlook.com","Administrador","2022-02-23","ADMIN","2022-03-07");
INSERT INTO tbl_parametros VALUES("7","ADMIN_CPASSWORD","Prosecar2021*","Administrador","2022-02-23","","0000-00-00");
INSERT INTO tbl_parametros VALUES("8","ADMIN_CUSUARIO","proyecto_prosecar@hotmail.com","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros VALUES("9","ADMIN_CPUERTO","587","ADMIN","2022-03-07","","0000-00-00");
INSERT INTO tbl_parametros VALUES("10","NOMBRE_EMPRESA","PROYECTO SEMILLERO CARMELITANO PROSECAR\n","ADMIN","2022-03-22","","0000-00-00");



DROP TABLE IF EXISTS tbl_parametros_usuarios;

CREATE TABLE `tbl_parametros_usuarios` (
  `CODIGO_PARAM_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_USUARIO` int(5) DEFAULT NULL,
  `CODIGO_PARAMETRO` int(5) DEFAULT NULL,
  `PAR_VALOR` int(5) DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PARAM_USUARIO`),
  KEY `FK_CODPAR_USU` (`CODIGO_USUARIO`),
  KEY `FK_CODPAR_PAR` (`CODIGO_PARAMETRO`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_parametros_usuarios VALUES("1","2","2","1","","0000-00-00","ADMIN","2022-03-11");
INSERT INTO tbl_parametros_usuarios VALUES("2","2","1","0","","0000-00-00","ADMIN","2022-03-10");
INSERT INTO tbl_parametros_usuarios VALUES("3","1","1","0","Administrador","2022-02-01","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("4","40","1","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("5","40","2","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("6","40","3","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("7","41","1","3","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("8","41","2","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("9","41","3","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("10","42","1","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("11","42","2","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("12","42","3","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("13","43","1","2","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("14","43","2","2","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("15","43","3","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("16","44","1","2","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("17","44","2","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("18","44","3","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("19","45","1","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("20","45","2","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("21","45","3","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("22","46","1","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("23","46","2","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("24","46","3","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("25","47","1","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("26","47","2","2","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("27","47","3","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("31","49","1","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("32","49","2","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("33","49","3","0","","0000-00-00","","0000-00-00");



DROP TABLE IF EXISTS tbl_patologias;

CREATE TABLE `tbl_patologias` (
  `CODIGO_PATOLOGIA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(60) NOT NULL,
  PRIMARY KEY (`CODIGO_PATOLOGIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_permisos;

CREATE TABLE `tbl_permisos` (
  `CODIGO_PERMISO` int(10) NOT NULL AUTO_INCREMENT,
  `CODIGO_TIPO_ROL` int(5) DEFAULT NULL,
  `CODIGO_OBJETO` int(5) DEFAULT NULL,
  `INSERTAR` varchar(5) DEFAULT NULL,
  `ELIMINAR` varchar(5) DEFAULT NULL,
  `ACTUALIZAR` varchar(5) DEFAULT NULL,
  `MOSTRAR` varchar(5) DEFAULT NULL,
  `CREADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERMISO`),
  KEY `FK_CO_OBJECT` (`CODIGO_OBJETO`),
  KEY `FK_CO_TROL` (`CODIGO_TIPO_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_permisos VALUES("1","1","1","SI","SI","SI","NO","Administrador","2022-03-02","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("3","2","22","SI","NO","NO","NO","Administrador","2022-03-02","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("4","4","1","SI","SI","SI","SI","","0000-00-00","ADMIN","2022-03-12");
INSERT INTO tbl_permisos VALUES("5","3","1","SI","SI","SI","SI","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("6","1","2","SI","SI","SI","SI","ADMIN","2022-03-04","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("7","2","19","SI","SI","SI","SI","ADMIN","2022-03-04","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("8","1","5","SI","SI","SI","SI","ADMIN","2022-03-05","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("9","1","8","SI","NO","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("10","1","10","SI","SI","SI","SI","ADMIN","2022-03-05","ADMIN","2022-03-18");
INSERT INTO tbl_permisos VALUES("11","1","12","SI","SI","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("12","1","15","SI","SI","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("13","1","3","SI","SI","SI","SI","ADMIN","2022-03-07","","0000-00-00");
INSERT INTO tbl_permisos VALUES("14","1","4","SI","SI","SI","SI","ADMIN","2022-03-07","ADMIN","2022-03-07");
INSERT INTO tbl_permisos VALUES("15","2","4","NO","SI","NO","NO","ADMIN","2022-03-08","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("17","1","25","SI","SI","SI","SI","","0000-00-00","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("18","1","26","SI","SI","SI","SI","ADMIN","2022-03-10","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("19","1","27","SI","SI","SI","SI","ADMIN","2022-03-10","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("20","2","28","SI","SI","SI","SI","ADMIN","2022-03-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("21","2","29","SI","SI","NO","SI","ADMIN","2022-03-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("22","1","9","SI","SI","SI","SI","ADMIN","2022-03-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("23","1","7","SI","SI","SI","SI","ADMIN","2022-03-12","LUISILLO","2022-03-21");
INSERT INTO tbl_permisos VALUES("24","5","30","SI","SI","SI","SI","ADMIN","2022-03-14","","0000-00-00");
INSERT INTO tbl_permisos VALUES("25","4","31","SI","SI","SI","SI","ADMIN","2022-03-18","","0000-00-00");
INSERT INTO tbl_permisos VALUES("26","1","32","SI","SI","SI","SI","","2022-03-27","","0000-00-00");



DROP TABLE IF EXISTS tbl_persona;

CREATE TABLE `tbl_persona` (
  `CODIGO_PERSONA` int(5) NOT NULL AUTO_INCREMENT,
  `PRIMER_NOMBRE` varchar(20) NOT NULL,
  `SEGUNDO_NOMBRE` varchar(20) DEFAULT NULL,
  `PRIMER_APELLIDO` varchar(20) DEFAULT NULL,
  `SEGUNDO_APELLIDO` varchar(20) DEFAULT NULL,
  `DNI` varchar(15) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `LUGAR_NACIMIENTO` varchar(30) DEFAULT NULL,
  `DIRECCION` varchar(500) NOT NULL,
  `FECHA_INSCRIPCION` date DEFAULT NULL,
  `FECHA_BAJA` date DEFAULT NULL,
  `CODIGO_TIPO_PERSONA` int(5) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date NOT NULL,
  `SEXO` char(1) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA`),
  KEY `FK_COD_TIP_PERSONA` (`CODIGO_TIPO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_persona VALUES("1","Admin","Admin","Admin","Admin","","0000-00-00","","","2022-02-11","0000-00-00","1","","0000-00-00","","0000-00-00","");
INSERT INTO tbl_persona VALUES("2","PEDRO","LUIS","AMADOR","AMADO","9888888888","2022-02-14","Tegucigalpa","","2022-02-11","0000-00-00","2","Administrador","2022-02-11","LUISILLO","0000-00-00","M");
INSERT INTO tbl_persona VALUES("34","ALEXANDER","RAUL","GIMARAE","SARMINETO","0801199087873","2009-12-30","Tokio","","2022-02-25","0000-00-00","2","NO DEFINIDO","2022-02-25","","0000-00-00","2");
INSERT INTO tbl_persona VALUES("35","LUIS","COMUNICA","PADILLA","LOZANO","0801199012483","2009-12-30","Tokio","COL SATELITE","2022-02-25","0000-00-00","1","NO DEFINIDO","2022-02-25","","0000-00-00","1");
INSERT INTO tbl_persona VALUES("36","ROMARIO","PABLO","PAGUADA","ROGELIO","0889-1998-909","2010-12-29","TEGUCIGALPA","","2022-02-25","0000-00-00","2","NO DEFINIDO","2022-02-25","","2022-02-25","m");
INSERT INTO tbl_persona VALUES("37","MARIA ","DEL CARMEN","ROJAS","ESTAPE","0000000000000","2009-12-30","La Esperanza","","2022-02-25","0000-00-00","6","NO DEFINIDO","2022-02-25","ADMIN","0000-00-00","2");
INSERT INTO tbl_persona VALUES("38","LUIS","MIGUEL","MIGUEL","BERRIOS","0801-1098-908","2010-12-28","TEGUCIGALPA","","2022-02-25","0000-00-00","5","NO DEFINIDO","2022-02-25","","2022-02-25","f");
INSERT INTO tbl_persona VALUES("39","JUAN","ARNOLD","GARCIA","VALOR","0801-1998-878","2010-12-14","TEGUCIGALPA","","2022-02-28","0000-00-00","4","NO DEFINIDO","2022-02-28","","2022-02-28","m");
INSERT INTO tbl_persona VALUES("40","ROMARIO","ARNOLD","GARCIA","VALOR","0801-1008-909","2010-12-28","TEGUCIGALPA","","2022-02-28","0000-00-00","4","NO DEFINIDO","2022-02-28","","2022-02-28","m");
INSERT INTO tbl_persona VALUES("41","PRUEBA","ARNOLD ALEXANDER","GARCIA","VALOR","2312723188778","2010-12-30","TEGUCIGALPA","","2022-02-28","0000-00-00","4","NO DEFINIDO","2022-02-28","","2022-02-28","f");
INSERT INTO tbl_persona VALUES("42","CARLOS","ENMANUEL","AMADOR","SARMIENTO","0801199801644","2022-03-02","TEGUCIGALPA","","2022-03-05","0000-00-00","4","ADMIN","2022-03-05","","0000-00-00","M");
INSERT INTO tbl_persona VALUES("43","SAMUEL","JOSUE","AMADOR","HERRERA","2147483647","1999-10-04","distrito","EN UNA CASITA,CON SU MICHI UWU","2022-03-23","0000-00-00","5","ADMIN","0000-00-00","","0000-00-00","2");
INSERT INTO tbl_persona VALUES("44","FRANCSICO","PABLO","PADILLA","PAVON","08011992258","2013-02-01","","Tegucigalpa","2022-03-02","0000-00-00","7","","0000-00-00","","0000-00-00","");



DROP TABLE IF EXISTS tbl_persona_especialidad;

CREATE TABLE `tbl_persona_especialidad` (
  `CODIGO_PERSONA_ESPECIALIDAD` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `CODIGO_ESPECIALIDAD` int(5) NOT NULL,
  `FECHA_CREACION` date NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) NOT NULL,
  `FECHA_MODIFICACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_ESPECIALIDAD`),
  KEY `FK_COD_PERSONA` (`CODIGO_PERSONA`),
  KEY `FK_COD_ESPECIALIDAD` (`CODIGO_ESPECIALIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_persona_especialidad VALUES("1","38","3","2022-03-23","ADMIN","0000-00-00","");



DROP TABLE IF EXISTS tbl_personas_alergias;

CREATE TABLE `tbl_personas_alergias` (
  `CODIGO_PA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA_PACIENTE` int(5) NOT NULL,
  `CODIGO_ALERGIAS` int(5) NOT NULL,
  PRIMARY KEY (`CODIGO_PA`),
  KEY `FK_CODPERSONA_PA_` (`CODIGO_PERSONA_PACIENTE`),
  KEY `FK_CODALERGIA_PA` (`CODIGO_ALERGIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_personas_no_patologia;

CREATE TABLE `tbl_personas_no_patologia` (
  `CODIGO_PERSONA_NO_PATOLOGIA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `CODIGO_NO_PATOLOGIA` int(5) NOT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_NO_PATOLOGIA`),
  KEY `FK_CODIGO_PERSONA_NOPP` (`CODIGO_PERSONA`),
  KEY `FK_CODIGO_NOPATA_PP` (`CODIGO_NO_PATOLOGIA`),
  CONSTRAINT `FK_CODIGO_NOPATA_PP` FOREIGN KEY (`CODIGO_NO_PATOLOGIA`) REFERENCES `tbl_no_patologias` (`CODIGO_NO_PATOLOGIA`),
  CONSTRAINT `FK_CODIGO_PERSONA_NOPP` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_personas_patologia;

CREATE TABLE `tbl_personas_patologia` (
  `CODIGO_PERSONA_PATOLOGIA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `CODIGO_PATOLOGIA` int(5) NOT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_PATOLOGIA`),
  KEY `FK_CODIGO_PERSONA_PP` (`CODIGO_PERSONA`),
  KEY `FK_CODIGO_PATA_PP` (`CODIGO_PATOLOGIA`),
  CONSTRAINT `FK_CODIGO_PATA_PP` FOREIGN KEY (`CODIGO_PATOLOGIA`) REFERENCES `tbl_patologias` (`CODIGO_PATOLOGIA`),
  CONSTRAINT `FK_CODIGO_PERSONA_PP` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_preclinica;

CREATE TABLE `tbl_preclinica` (
  `CODIGO_PRECLINICA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CITA` int(5) DEFAULT NULL,
  `PESO` varchar(10) DEFAULT NULL,
  `ESTATURA` varchar(10) DEFAULT NULL,
  `FRECUENCIA_CARDIACA` varchar(10) DEFAULT NULL,
  `FRECUENCIA_RESPIRATORIA` varchar(10) DEFAULT NULL,
  `CREADO_POR` varchar(20) NOT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PRECLINICA`),
  KEY `FK_CODIGO_CITA` (`CODIGO_CITA`),
  CONSTRAINT `FK_CODIGO_CITA` FOREIGN KEY (`CODIGO_CITA`) REFERENCES `tbl_inscripcion_cita` (`CODIGO_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_preclinica VALUES("1","1","80kg","1.75 cm","nose","nose","LUISILLO","2022-03-27","","");



DROP TABLE IF EXISTS tbl_preguntas;

CREATE TABLE `tbl_preguntas` (
  `CODIGO_PREGUNTAS` int(11) NOT NULL AUTO_INCREMENT,
  `PREGUNTA` varchar(60) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PREGUNTAS`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_preguntas VALUES("1","¿Cual el tu comida favorita?","Administrador","2022-02-06","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("2","¿Nombre de tu caricatura favorita de la infancia?","Administrador","2022-02-06","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("3","¿Nombre de tu pelicula favorita de la infancia?","Administrador","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("4","¿Pariente que mas admira?","Administrador","2022-02-02","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("5","¿Nombre de mascota favorito?","Administrador","2022-02-01","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("6","¿Soy yo tu padre, HIJO?"," ADMIN","2022-03-07","ADMIN","2022-03-07");
INSERT INTO tbl_preguntas VALUES("7",""," ADMIN","2022-03-08","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("8",""," ADMIN","2022-03-08","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("9",""," ADMIN","2022-03-08","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("10",""," ADMIN","2022-03-08","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("11","adadas"," ADMIN","2022-03-09","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("12",""," ADMIN","2022-03-09","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("13","¿Cual es tu comida favorita?"," ADMIN","2022-03-09","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("14","¿Cuál es tu mas grande fobia?"," ADMIN","2022-03-09","","0000-00-00");



DROP TABLE IF EXISTS tbl_preguntas_usuarios;

CREATE TABLE `tbl_preguntas_usuarios` (
  `CODIGO_PREGUNTA_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PREGUNTAS` int(5) DEFAULT NULL,
  `CODIGO_USUARIO` int(5) DEFAULT NULL,
  `RESPUESTA` varchar(60) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PREGUNTA_USUARIO`),
  KEY `FK_CODPRE_PREU` (`CODIGO_PREGUNTAS`),
  KEY `FK_CODU_PREU` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_preguntas_usuarios VALUES("1","1","2","BALEADA","Administrador","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("3","2","2","KLDSLKJDASK","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("6","3","2","MONJA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("7","4","2","JKJKGKJG","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("8","1","41","PESACAO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("9","2","41","LOS PICAPIEDRAS","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("10","3","41","LA ROSA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("21","1","47","POLLO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("27","1","43","BALEADA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("28","2","43","BOD ESPONJA","","0000-00-00","","0000-00-00");



DROP TABLE IF EXISTS tbl_receta_medica;

CREATE TABLE `tbl_receta_medica` (
  `CODIGO_RECETA_MEDICA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONSULTA` int(11) DEFAULT NULL,
  `CODIGO_MEDICAMENTO` varchar(10) DEFAULT NULL,
  `INDICACIONES_RECETA` varchar(500) DEFAULT NULL,
  `OBSERVACIONES` varchar(500) DEFAULT NULL,
  `FECHA_RECETA` date DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) NOT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date NOT NULL,
  PRIMARY KEY (`CODIGO_RECETA_MEDICA`),
  KEY `FK_CODIGO_CONSULTA_MEDICA` (`CODIGO_CONSULTA`),
  KEY `FK_CODIGO_MEDICAMENTO` (`CODIGO_MEDICAMENTO`),
  CONSTRAINT `FK_CODIGO_CONSULTA_MEDICA` FOREIGN KEY (`CODIGO_CONSULTA`) REFERENCES `tbl_consulta_medica` (`CODIGO_CONSULTA`),
  CONSTRAINT `FK_CODIGO_MEDICAMENTO` FOREIGN KEY (`CODIGO_MEDICAMENTO`) REFERENCES `tbl_medicamento` (`CODIGO_MEDICAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_roles;

CREATE TABLE `tbl_roles` (
  `CODIGO_TIPO_ROL` int(5) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(40) NOT NULL,
  `DESCRIPCION` varchar(100) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPO_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_roles VALUES("1","ADMINISTRADOR","Todos los permisos","Administrador","2022-02-11","","0000-00-00");
INSERT INTO tbl_roles VALUES("2","TUTOR","Usuario con permisos al modulo de escuela","Administrador","2022-02-11","ADMIN","2022-03-11");
INSERT INTO tbl_roles VALUES("3","INDEFINIDO","Rol no definido para el usuario","","0000-00-00","ADMIN","2022-03-11");
INSERT INTO tbl_roles VALUES("4","PSICOLOGO","CUALQUIERA","","0000-00-00","","2022-03-09");
INSERT INTO tbl_roles VALUES("5","MEDICO","area medica","","2022-03-09","ADMIN","2022-03-11");
INSERT INTO tbl_roles VALUES("6","SACERDOTE","ARE ESPIRITUAL","","2022-03-09","ADMIN","2022-03-11");



DROP TABLE IF EXISTS tbl_roles_objetos;

CREATE TABLE `tbl_roles_objetos` (
  `CODIGO_ROL` int(5) DEFAULT NULL,
  `CODIGO_OBJETO` int(5) DEFAULT NULL,
  `PERMISO_INSERCION` varchar(10) DEFAULT NULL,
  `FECHA_CREACION` varchar(10) DEFAULT NULL,
  `CREADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `PERMISO_CONSULTAR` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_sexo;

CREATE TABLE `tbl_sexo` (
  `CODIGO_SEXO` char(1) COLLATE utf8mb4_bin NOT NULL,
  `SEXO` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`CODIGO_SEXO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_sexo VALUES("F","Femenino");
INSERT INTO tbl_sexo VALUES("M","Masculino");



DROP TABLE IF EXISTS tbl_telefono;

CREATE TABLE `tbl_telefono` (
  `NUMERO_TELEFONO` int(10) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  PRIMARY KEY (`NUMERO_TELEFONO`),
  KEY `Numero_perso` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_telefono VALUES("65465465","35");
INSERT INTO tbl_telefono VALUES("0","43");



DROP TABLE IF EXISTS tbl_tipo_persona;

CREATE TABLE `tbl_tipo_persona` (
  `CODIGO_TIPO_PERSONA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) NOT NULL,
  PRIMARY KEY (`CODIGO_TIPO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_tipo_persona VALUES("1","Administrador");
INSERT INTO tbl_tipo_persona VALUES("2","TUTOR");
INSERT INTO tbl_tipo_persona VALUES("3","no definido");
INSERT INTO tbl_tipo_persona VALUES("4","ESTUDIANTE");
INSERT INTO tbl_tipo_persona VALUES("5","MEDICO");
INSERT INTO tbl_tipo_persona VALUES("6","PSICOLOGO");
INSERT INTO tbl_tipo_persona VALUES("7","FAMILIAR");



DROP TABLE IF EXISTS tbl_tipo_sangre;

CREATE TABLE `tbl_tipo_sangre` (
  `CODIGO_TIPO_SANGRE` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(10) DEFAULT NULL,
  `CREADO_POR` varchar(20) NOT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date NOT NULL,
  PRIMARY KEY (`CODIGO_TIPO_SANGRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_tipo_socioeconomico;

CREATE TABLE `tbl_tipo_socioeconomico` (
  `CODIGO_TIPOSOCIO` int(5) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(50) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `CREADO_POR` varchar(15) NOT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(15) NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPOSOCIO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_tipo_socioeconomico VALUES("1","DISPOSITIVO ELECTRONICO","Dispositivos de los ","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_socioeconomico VALUES("2","SERVICIOS DE INTERNET","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_socioeconomico VALUES("3","PROVEEDOR DE INGRESO","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_tipo_socioeconomico VALUES("4","SERVICIOS BASICOS","","","0000-00-00","","0000-00-00");



DROP TABLE IF EXISTS tbl_tutoria;

CREATE TABLE `tbl_tutoria` (
  `CODIGO_TUTORIA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_AREA` int(5) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `CREADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TUTORIA`),
  KEY `FK_CODATREA_TUTO` (`CODIGO_AREA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_usuario;

CREATE TABLE `tbl_usuario` (
  `CODIGO_USUARIO` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `USUARIO` varchar(15) DEFAULT NULL,
  `NOMBRE_USUARIO` varchar(15) NOT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL,
  `CODIGO_TIPO_ROL` int(5) DEFAULT NULL,
  `CONTRASENA` varchar(255) NOT NULL,
  `FECHA_ULTIMA_CONEXION` date DEFAULT NULL,
  `PREGUNTAS_CONTESTADAS` int(5) NOT NULL,
  `PRIMER_INGRESO` int(5) NOT NULL,
  `FECHA_VENCIMIENTO` date DEFAULT NULL,
  `CREADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_USUARIO`),
  KEY `FK_CODPER_USU` (`CODIGO_PERSONA`),
  KEY `FK_CODROL_USU` (`CODIGO_TIPO_ROL`),
  KEY `FK_CODES_USU` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_usuario VALUES("1","1","Admin","ADMIN","2","1","12345","0000-00-00","0","0","0000-00-00","","0000-00-00","","0000-00-00");
INSERT INTO tbl_usuario VALUES("2","2","Tutor","PEDROLUIS","2","2","Pedro123*xexx1","2022-02-11","3","0","2022-02-28","","0000-00-00","2","0000-00-00");
INSERT INTO tbl_usuario VALUES("40","34","","ALEXANDER","1","2","$2y$10$E1b07xJE.u2HazAJBG9KcO.1C.15MP9ZrL62FgmjEkeSBp48Xcwuq","0000-00-00","0","0","0000-00-00","","2022-02-25","ADMIN","2022-03-07");
INSERT INTO tbl_usuario VALUES("41","35","","LUISILLO","4","1","Luis123**","0000-00-00","0","0","0000-00-00","","2022-02-25","41","0000-00-00");
INSERT INTO tbl_usuario VALUES("42","36","","RAFALEE","5","3","$z&[!a[?","0000-00-00","0","0","2022-04-26","","2022-02-25","","0000-00-00");
INSERT INTO tbl_usuario VALUES("43","37","","MARIROJAS","2","4","Mari123*","0000-00-00","0","0","0000-00-00","","2022-02-25","43","0000-00-00");
INSERT INTO tbl_usuario VALUES("44","38","","LUISMIGUEL","2","5","Luis123*","0000-00-00","0","0","2022-04-26","","2022-02-25","ADMIN","2022-03-17");
INSERT INTO tbl_usuario VALUES("45","39","","LUISFONSI","6","3","Luis12*","0000-00-00","0","0","2022-04-29","","2022-02-28","","0000-00-00");
INSERT INTO tbl_usuario VALUES("46","40","","PRUEBE","6","3","Prueb12*","0000-00-00","0","0","2022-04-29","","2022-02-28","","0000-00-00");
INSERT INTO tbl_usuario VALUES("47","41","","PRUEBES","2","3","Pruebe12**","0000-00-00","0","0","2022-04-29","","2022-02-28","ADMIN","2022-03-10");
INSERT INTO tbl_usuario VALUES("49","43","","JOSUEHERRERA","1","3",":gN\n??7[u&+???","0000-00-00","0","0","0000-00-00","ADMIN","2022-03-23","","0000-00-00");



SET FOREIGN_KEY_CHECKS=1;