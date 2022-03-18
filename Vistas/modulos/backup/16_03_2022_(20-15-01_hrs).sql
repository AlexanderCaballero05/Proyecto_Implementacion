SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS db_proyecto_prosecar;

USE db_proyecto_prosecar;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_area VALUES("1","ACADEMICA","","2022-03-14","ADMIN","","");



DROP TABLE IF EXISTS tbl_bitacora_sistema;

CREATE TABLE `tbl_bitacora_sistema` (
  `CODIGO_BITACORA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_USUARIO` int(5) DEFAULT NULL,
  `CODIGO_OBJETO` int(5) DEFAULT NULL,
  `FECHA` datetime DEFAULT NULL,
  `ACCION` varchar(100) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_BITACORA`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO tbl_bitacora_sistema VALUES("90","1","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("91","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("92","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("93","1","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("94","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("95","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("96","1","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("97","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("98","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("99","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("100","1","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("101","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("102","1","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("103","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("104","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("105","2","19","2022-03-14 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("106","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("107","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("108","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("109","2","19","2022-03-14 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("110","2","19","2022-03-14 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("111","2","19","2022-03-14 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("112","2","19","2022-03-14 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("113","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("114","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("115","1","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("116","1","20","2022-03-14 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("117","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("118","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("119","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("120","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("121","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("122","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("123","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("124","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("125","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("126","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("127","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("128","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("129","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("130","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("131","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("132","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("133","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("134","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("135","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("136","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("137","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("138","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("139","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("140","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("141","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("142","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("143","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("144","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("145","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("146","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("147","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("148","1","12","2022-03-14 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("149","1","1","2022-03-14 00:00:00","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("150","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("151","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("152","1","2","2022-03-14 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("153","1","2","2022-03-14 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("154","1","2","2022-03-14 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("155","1","2","2022-03-14 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("156","1","2","2022-03-14 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("157","1","4","2022-03-14 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("158","1","12","2022-03-14 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("159","1","6","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("160","1","1","2022-03-14 00:00:00","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("161","1","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("162","1","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("163","1","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("164","1","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("165","1","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("166","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("167","1","17","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("168","1","17","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("169","1","17","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("170","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("171","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("172","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("173","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("174","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("175","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("176","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("177","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("178","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("179","1","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("180","1","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("181","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("182","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("183","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("184","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("185","1","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("186","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("187","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("188","1","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("189","1","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("190","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("191","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("192","1","14","2022-03-14 00:00:00","actualizo","Se actualizo una persona ");
INSERT INTO tbl_bitacora_sistema VALUES("193","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("194","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("195","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("196","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("197","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("198","1","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("199","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("200","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("201","1","1","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("202","1","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("203","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("204","1","14","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("205","1","1","2022-03-14 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("206","1","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("207","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("208","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("209","1","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("210","1","20","2022-03-14 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("211","1","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("212","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("213","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("214","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("215","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("216","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("217","1","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("218","1","20","2022-03-14 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("219","1","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("220","1","20","2022-03-14 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("221","1","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("222","2","1","2022-03-14 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("223","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("224","2","22","2022-03-14 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("225","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("226","1","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("227","1","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("228","43","1","2022-03-14 00:00:00","Intento de login fallido","El usuario bloqueado intento ingresar al sistema");
INSERT INTO tbl_bitacora_sistema VALUES("229","43","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("230","43","13","2022-03-14 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("231","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("232","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("233","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("234","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("235","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("236","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("237","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("238","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("239","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("240","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("241","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("242","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("243","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("244","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("245","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("246","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("247","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("248","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("249","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("250","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("251","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("252","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("253","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("254","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("255","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("256","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("257","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("258","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("259","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("260","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("261","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("262","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("263","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("264","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("265","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("266","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("267","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("268","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("269","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("270","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("271","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("272","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("273","43","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("274","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("275","2","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("276","43","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("277","43","1","2022-03-14 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("278","43","1","2022-03-14 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("279","2","1","2022-03-14 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("280","2","22","2022-03-15 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("281","2","22","2022-03-15 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("282","2","22","2022-03-15 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("283","2","22","2022-03-15 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("284","2","19","2022-03-15 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("285","2","22","2022-03-15 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("286","2","1","2022-03-15 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("287","43","1","2022-03-15 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("288","43","1","2022-03-15 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("289","43","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("290","43","13","2022-03-15 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("291","43","14","2022-03-15 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("292","43","14","2022-03-15 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("293","43","14","2022-03-15 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("294","43","14","2022-03-15 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("295","43","14","2022-03-15 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("296","43","13","2022-03-15 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("297","43","1","2022-03-15 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("298","2","1","2022-03-15 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("299","2","22","2022-03-15 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("300","2","19","2022-03-15 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("301","2","1","2022-03-15 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("302","43","1","2022-03-15 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("303","43","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("304","43","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("305","43","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("306","43","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("307","43","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("308","43","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("309","43","1","2022-03-15 00:00:00","Modificacion","Se edito un estudiante ");
INSERT INTO tbl_bitacora_sistema VALUES("310","43","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("311","43","1","2022-03-15 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("312","2","1","2022-03-15 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("313","2","1","2022-03-15 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("314","1","1","2022-03-15 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("315","1","13","2022-03-15 00:00:00","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("316","1","14","2022-03-15 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("317","1","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("318","1","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("319","1","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("320","1","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("321","1","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("322","1","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("323","1","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("324","1","1","2022-03-15 00:00:00","Modificacion","Se edito un estudiante ");
INSERT INTO tbl_bitacora_sistema VALUES("325","1","1","2022-03-15 00:00:00","Modificacion","Se edito un estudiante ");
INSERT INTO tbl_bitacora_sistema VALUES("326","1","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("327","1","20","2022-03-15 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("328","1","20","2022-03-16 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("329","1","20","2022-03-16 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("330","1","6","2022-03-17 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("331","1","1","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("332","1","1","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("333","1","1","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("334","1","6","2022-03-17 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("335","1","1","2022-03-17 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_carga_academica VALUES("1","1","35","1","SECCIONA","07:00:00","2022-03-14","2022-05-14","PEDROLUIS","2022-03-14","PEDROLUIS","2022-03-14");
INSERT INTO tbl_carga_academica VALUES("2","1","2","1","SECCIONB","10:00:00","2022-03-15","2022-03-16","PEDROLUIS","2022-03-14","","");
INSERT INTO tbl_carga_academica VALUES("3","3","34","3","SECCIONA","08:00:00","2022-03-14","2022-05-16","PEDROLUIS","2022-03-15","PEDROLUIS","2022-03-15");
INSERT INTO tbl_carga_academica VALUES("4","4","39","2","SECCIONA","11:00:00","2022-03-14","2022-05-15","PEDROLUIS","2022-03-15","","");



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
INSERT INTO tbl_correo_electronico VALUES("proyecto_prosecar@hotmail.com	\n","35");
INSERT INTO tbl_correo_electronico VALUES("gdiaza@unah.hn","36");
INSERT INTO tbl_correo_electronico VALUES("luisillo@unah.hn","37");
INSERT INTO tbl_correo_electronico VALUES("aacaballero@una.hn","38");
INSERT INTO tbl_correo_electronico VALUES("ld@gmail.com","39");
INSERT INTO tbl_correo_electronico VALUES("arnoldpballero@gmail.com","40");
INSERT INTO tbl_correo_electronico VALUES("aaca090lero@unah.hn","41");



DROP TABLE IF EXISTS tbl_direccion;

CREATE TABLE `tbl_direccion` (
  `CODIGO_DIRECCION` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_DIRECCION`),
  KEY `FK_COD_DIRECCIONES` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_COD_DIRECCIONES` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_estado;

CREATE TABLE `tbl_estado` (
  `CODIGO_ESTADO` int(5) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(15) NOT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_estado VALUES("1","NUEVO","Este usuario esta ACTIVO");
INSERT INTO tbl_estado VALUES("2","ACTIVO","este usuario esta nuevo");
INSERT INTO tbl_estado VALUES("3","INACTIVO","este ususario esta inactivo");
INSERT INTO tbl_estado VALUES("4","BLOQUEADO","Esta usuario esta en estado de bloqueo");
INSERT INTO tbl_estado VALUES("5","PENDIENTE","Este usuario esta pendiente de cambiar la contrase");
INSERT INTO tbl_estado VALUES("6","INDEFINIDO","Este usuario esta deshabiltado ");



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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_estudiante VALUES("17","42","8","NO","90","MATEMATICAS","WATCHING TV EVERY DAY","SPEN TIME IN SOCIAL MEDIA","GO AT UNIVERSITITY");



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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_estudiante_socioeconomico VALUES("10","4","17");
INSERT INTO tbl_estudiante_socioeconomico VALUES("11","4","17");
INSERT INTO tbl_estudiante_socioeconomico VALUES("12","4","17");
INSERT INTO tbl_estudiante_socioeconomico VALUES("13","4","17");



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




DROP TABLE IF EXISTS tbl_modalidad;

CREATE TABLE `tbl_modalidad` (
  `CODIGO_MODALIDA` int(5) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(20) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MODALIDA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_modalidad VALUES("1","VIRTUAL","Clases en linea");
INSERT INTO tbl_modalidad VALUES("2","PRESENCIAL","clases en aulas de la parroquia");
INSERT INTO tbl_modalidad VALUES("3","SEMIPRESENCIAL","clases virtuales y presenciales");



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
  KEY `FK_COD_USU_HISCON` (`CODIGO_USUARIO`),
  CONSTRAINT `FK_COD_USU_HISCON` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `tbl_usuario` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_ms_hist_contraseña VALUES("1","2","Pedro12*","2","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("2","2","Pedro123*","2","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("3","41","Rosas12*","41","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("4","41","Rosas123**","41","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("5","43","Caballero*1","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("6","43","Prueba123*","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("7","43","Pedro123*","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("8","43","Pedro12*","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("9","43","Pedro12*1","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("10","47","Pruebe12**","47","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("11","43","Cab16*","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("12","43","Caballe%*1","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("13","43","Caball4*(","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("14","43","Caballer90%^","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("15","43","Caballer90%9","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("16","43","Cball6(*","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("17","43","Cball6(*7","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("18","43","Cball6(*78","43","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("19","41","A1238a*","41","","","");
INSERT INTO tbl_ms_hist_contraseña VALUES("20","43","Inform123*","43","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_objetos VALUES("1","ESTADO","Sistema de administracion","Administrador","2022-02-09","","");
INSERT INTO tbl_objetos VALUES("2","ROLES","objeto donde se registran personas ","Administrador","2022-02-06","","");
INSERT INTO tbl_objetos VALUES("3","PARAMETROS","","Administrador","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("4","PREGUNTAS","Objeto mantenimiento Preguntas","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("5","PERMISOS","Objeto mantenimiento Permisos","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("6","OBJETOS","Objeto mantenimiento objetos","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("7","BITACORA","Objeto consulta bitacora","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("8","PREGUNTAS_USUARIOS","Objeto consulta preguntas usuarios","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("9","PARAMETROS_USUARIOS","Objeto mantenimiento parametros usuarios","","0000-00-00","","");
INSERT INTO tbl_objetos VALUES("10","BACKUP ","Objeto mantenimiento backup","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("11","RESTAURACION","Objeto mantenimiento restauracion","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("12","TIPO_PERSONAS","Mantenimiento de la tabla tipo de personas.","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("13","REGISTRAR_PERSONAS","Objeto registra una persona.","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("14","EDITAR_USARIOS","Objeto mantenimiento usuarios.","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("15","EDITAR_PERSONAS","Objeto mantenimiento personas.","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("16","ESTUDIANTES","Objeto mantenimiento estudiantes.","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("17","TIPO_SOCIOECONOMICO","Objeto mantenimiento tipo socioeconomico.","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("18","CONTENIDO_SOCIOECONOMICO","Objeto mantenimiento contenido socioeconomico.","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("19","MODALIDAD","Objeto mantenimiento modalidad","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("20","CARGA_ACADEMICA","Objeto mantenimiento carga académica.","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("21","AREA","Objeto mantenimiento de área.","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("22","TUTORIA","Objeto mantenimiento de tutoria.","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("23","MATRICULA","Objeto mantenimiento matricula.","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("24","CALIFICACIONES","Objeto mantenimiento calificaciones","ADMIN","2022-03-04","","");
INSERT INTO tbl_objetos VALUES("25","PERSONAS","Gestion complete de personas.","","","","");
INSERT INTO tbl_objetos VALUES("26","GESTION_ESTUDIANTES","OBJETO DE GESTION DE LOS ESTUDIANTES","ADMIN","2022-03-10","","");
INSERT INTO tbl_objetos VALUES("27","SEGURIDAD","GESTION DE SEGURIDAD","ADMIN","2022-03-10","","");
INSERT INTO tbl_objetos VALUES("28","GESTION_CARGA_ACADEMICA","OBJETO DE GESTION DE LA CARGA ACADEMICA","ADMIN","2022-03-10","","");
INSERT INTO tbl_objetos VALUES("29","GESTION_MATRICULA","OBJETO DE GESTION DE LAS MATRICULAS DE LOS ALUMNOS","ADMIN","2022-03-10","","");
INSERT INTO tbl_objetos VALUES("30","GESTION_AREA_MEDICA","OBJETO DE GESTION DE LAS CITAS MEDICAS","ADMIN","2022-03-10","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_parametros VALUES("1","NUM_INTEN_VALIDOS","3","Administrador","2022-02-07","ADMIN","2022-03-10");
INSERT INTO tbl_parametros VALUES("2","NUM_MAX_PREGUNTAS","3","Administrador","2022-02-07","ADMIN","2022-03-10");
INSERT INTO tbl_parametros VALUES("3","NUM_MAX_CONTRASENAS","8","Administrador","2022-02-07","ADMIN","2022-03-10");
INSERT INTO tbl_parametros VALUES("4","NUM_MAX_CARACTER","30","Administrador","2022-02-07","Administrador","2022-02-07");
INSERT INTO tbl_parametros VALUES("5","ADMIN_SERVIDOR_CORREO","smtp-mail.outlook.com","Administrador","2022-02-23","ADMIN","2022-03-07");
INSERT INTO tbl_parametros VALUES("7","ADMIN_CPASSWORD","Prosecar2021*","Administrador","2022-02-23","","");
INSERT INTO tbl_parametros VALUES("8","ADMIN_CUSUARIO","proyecto_prosecar@hotmail.com","","0000-00-00","","");
INSERT INTO tbl_parametros VALUES("9","ADMIN_CPUERTO","587","ADMIN","2022-03-07","","");



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
  KEY `FK_CODPAR_PAR` (`CODIGO_PARAMETRO`),
  CONSTRAINT `FK_CODPAR_PAR` FOREIGN KEY (`CODIGO_PARAMETRO`) REFERENCES `tbl_parametros` (`CODIGO_PARAMETRO`),
  CONSTRAINT `FK_CODPAR_USU` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `tbl_usuario` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_parametros_usuarios VALUES("1","2","2","1","","","ADMIN","2022-03-11");
INSERT INTO tbl_parametros_usuarios VALUES("2","2","1","3","","","ADMIN","2022-03-10");
INSERT INTO tbl_parametros_usuarios VALUES("3","1","1","0","Administrador","2022-02-01","","");
INSERT INTO tbl_parametros_usuarios VALUES("4","40","1","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("5","40","2","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("6","40","3","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("7","41","1","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("8","41","2","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("9","41","3","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("10","42","1","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("11","42","2","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("12","42","3","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("13","43","1","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("14","43","2","2","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("15","43","3","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("16","44","1","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("17","44","2","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("18","44","3","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("19","45","1","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("20","45","2","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("21","45","3","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("22","46","1","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("23","46","2","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("24","46","3","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("25","47","1","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("26","47","2","2","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("27","47","3","0","","","","");



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
  KEY `FK_CO_TROL` (`CODIGO_TIPO_ROL`),
  CONSTRAINT `FK_CO_OBJECT` FOREIGN KEY (`CODIGO_OBJETO`) REFERENCES `tbl_objetos` (`CODIGO_OBJETO`),
  CONSTRAINT `FK_CO_TROL` FOREIGN KEY (`CODIGO_TIPO_ROL`) REFERENCES `tbl_roles` (`CODIGO_TIPO_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_permisos VALUES("1","1","1","SI","SI","SI","NO","Administrador","2022-03-02","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("3","2","22","SI","NO","SI","SI","Administrador","2022-03-02","ADMIN","2022-03-14");
INSERT INTO tbl_permisos VALUES("4","4","1","SI","SI","SI","SI","","","ADMIN","2022-03-12");
INSERT INTO tbl_permisos VALUES("5","3","1","SI","SI","SI","SI","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("6","1","2","SI","SI","SI","SI","ADMIN","2022-03-04","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("7","2","19","SI","SI","SI","SI","ADMIN","2022-03-04","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("8","1","5","SI","SI","SI","SI","ADMIN","2022-03-05","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("9","1","8","SI","NO","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("10","1","10","SI","SI","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("11","1","11","SI","SI","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("12","1","15","SI","SI","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("13","1","3","SI","SI","SI","SI","ADMIN","2022-03-07","","0000-00-00");
INSERT INTO tbl_permisos VALUES("14","1","4","SI","SI","SI","SI","ADMIN","2022-03-07","ADMIN","2022-03-07");
INSERT INTO tbl_permisos VALUES("15","2","4","NO","SI","NO","NO","ADMIN","2022-03-08","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("17","1","25","SI","SI","SI","SI","","","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("18","1","26","SI","SI","SI","SI","ADMIN","2022-03-10","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("19","1","27","SI","SI","SI","SI","ADMIN","2022-03-10","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("20","2","28","SI","SI","SI","SI","ADMIN","2022-03-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("21","2","29","SI","SI","NO","SI","ADMIN","2022-03-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("22","1","9","SI","SI","SI","SI","ADMIN","2022-03-10","","0000-00-00");
INSERT INTO tbl_permisos VALUES("23","1","7","SI","SI","SI","SI","ADMIN","2022-03-12","","0000-00-00");
INSERT INTO tbl_permisos VALUES("24","5","30","SI","SI","SI","SI","ADMIN","2022-03-14","","0000-00-00");



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
  `FECHA_INSCRIPCION` date DEFAULT NULL,
  `FECHA_BAJA` date DEFAULT NULL,
  `CODIGO_TIPO_PERSONA` int(5) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date NOT NULL,
  `SEXO` char(1) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA`),
  KEY `FK_COD_TIP_PERSONA` (`CODIGO_TIPO_PERSONA`),
  CONSTRAINT `FK_COD_TIP_PERSONA` FOREIGN KEY (`CODIGO_TIPO_PERSONA`) REFERENCES `tbl_tipo_persona` (`CODIGO_TIPO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_persona VALUES("1","Admin","Admin","Admin","Admin","","","","2022-02-11","","1","","0000-00-00","","0000-00-00","");
INSERT INTO tbl_persona VALUES("2","PEDRO","LUIS","AMADOR","LOPEZ","0801-1990-00015","2022-02-14","Tegucigalpa","2022-02-11","","2","Administrador","2022-02-11","ADMIN","0000-00-00","M");
INSERT INTO tbl_persona VALUES("34","ALEXANDER","RAUL","GIMARAE","SARMINETO","0801199087873","2009-12-30","Tokio","2022-02-25","","2","NO DEFINIDO","2022-02-25","","0000-00-00","2");
INSERT INTO tbl_persona VALUES("35","ROSA","MARIA","YANES","PADILLA","8080802813912","2009-12-30","Tokio","2022-02-25","","2","NO DEFINIDO","2022-02-25","","0000-00-00","1");
INSERT INTO tbl_persona VALUES("36","ROMARIO","PABLO","PAGUADA","ROGELIO","0889-1998-909","2010-12-29","TEGUCIGALPA","2022-02-25","","3","NO DEFINIDO","2022-02-25","","2022-02-25","m");
INSERT INTO tbl_persona VALUES("37","LUISITO","INFORMATICA","COMUNICA","INFORMATICA","0000000000000","2009-12-30","La Esperanza","2022-02-25","","1","NO DEFINIDO","2022-02-25","ADMIN","0000-00-00","2");
INSERT INTO tbl_persona VALUES("38","PRUEBA","PRUEBA","PRUEBA","PRUEBA","0801-1098-908","2010-12-28","TEGUCIGALPA","2022-02-25","","3","NO DEFINIDO","2022-02-25","","2022-02-25","f");
INSERT INTO tbl_persona VALUES("39","JUAN","ARNOLD","GARCIA","VALOR","0801-1998-878","2010-12-14","TEGUCIGALPA","2022-02-28","","2","NO DEFINIDO","2022-02-28","","2022-02-28","m");
INSERT INTO tbl_persona VALUES("40","ROMARIO","ARNOLD","GARCIA","VALOR","0801-1008-909","2010-12-28","TEGUCIGALPA","2022-02-28","","3","NO DEFINIDO","2022-02-28","","2022-02-28","m");
INSERT INTO tbl_persona VALUES("41","PRUEBA","ARNOLD ALEXANDER","GARCIA","VALOR","2312723188778","2010-12-30","TEGUCIGALPA","2022-02-28","","3","NO DEFINIDO","2022-02-28","","2022-02-28","f");
INSERT INTO tbl_persona VALUES("42","CARLOS","ENMANUEL","AMADOR","SARMIENTO","0801199801644","2022-03-02","TEGUCIGALPA","2022-03-05","","4","ADMIN","2022-03-05","","0000-00-00","M");



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

INSERT INTO tbl_preguntas VALUES("1","¿Cual el tu comida favorita?","Administrador","2022-02-06","","");
INSERT INTO tbl_preguntas VALUES("2","¿Nombre de tu caricatura favorita de la infancia?","Administrador","2022-02-06","","");
INSERT INTO tbl_preguntas VALUES("3","¿Nombre de tu pelicula favorita de la infancia?","Administrador","0000-00-00","","");
INSERT INTO tbl_preguntas VALUES("4","¿Pariente que mas admira?","Administrador","2022-02-02","","");
INSERT INTO tbl_preguntas VALUES("5","¿Nombre de mascota favorito?","Administrador","2022-02-01","","");
INSERT INTO tbl_preguntas VALUES("6","¿Soy yo tu padre, HIJO?"," ADMIN","2022-03-07","ADMIN","2022-03-07");
INSERT INTO tbl_preguntas VALUES("7",""," ADMIN","2022-03-08","","");
INSERT INTO tbl_preguntas VALUES("8",""," ADMIN","2022-03-08","","");
INSERT INTO tbl_preguntas VALUES("9",""," ADMIN","2022-03-08","","");
INSERT INTO tbl_preguntas VALUES("10",""," ADMIN","2022-03-08","","");
INSERT INTO tbl_preguntas VALUES("11","adadas"," ADMIN","2022-03-09","","");
INSERT INTO tbl_preguntas VALUES("12",""," ADMIN","2022-03-09","","");
INSERT INTO tbl_preguntas VALUES("13","¿Cual es tu comida favorita?"," ADMIN","2022-03-09","","");
INSERT INTO tbl_preguntas VALUES("14","¿Cuál es tu mas grande fobia?"," ADMIN","2022-03-09","","");



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
  KEY `FK_CODU_PREU` (`CODIGO_USUARIO`),
  CONSTRAINT `FK_CODPRE_PREU` FOREIGN KEY (`CODIGO_PREGUNTAS`) REFERENCES `tbl_preguntas` (`CODIGO_PREGUNTAS`),
  CONSTRAINT `FK_CODU_PREU` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `tbl_usuario` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_preguntas_usuarios VALUES("1","1","2","BALEADA","Administrador","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("3","2","2","KLDSLKJDASK","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("6","3","2","MONJA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("7","4","2","JKJKGKJG","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("8","1","41","PESACAO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("9","2","41","LOS PICAPIEDRAS","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("10","3","41","LA ROSA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("21","1","47","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("27","1","43","BALEADA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("28","2","43","BOD ESPONJA","","","","");



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

INSERT INTO tbl_roles VALUES("1","ADMINISTRADOR","Todos los permisos","Administrador","2022-02-11","","");
INSERT INTO tbl_roles VALUES("2","TUTOR","Usuario con permisos al modulo de escuela","Administrador","2022-02-11","ADMIN","2022-03-11");
INSERT INTO tbl_roles VALUES("3","INDEFINIDO","Rol no definido para el usuario","","","ADMIN","2022-03-11");
INSERT INTO tbl_roles VALUES("4","PSICOLOGO","CUALQUIERA","","","","2022-03-09");
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
  `CODIGO_TELEFONO` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `NUMERO_TELEFONO` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TELEFONO`),
  KEY `FK_TEL_PER` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_TEL_PER` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=2147483648 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_telefono VALUES("123428","40","");
INSERT INTO tbl_telefono VALUES("1234274","39","");
INSERT INTO tbl_telefono VALUES("23286328","34","23286328");
INSERT INTO tbl_telefono VALUES("32131231","35","32131231");
INSERT INTO tbl_telefono VALUES("98432987","41","");
INSERT INTO tbl_telefono VALUES("2147483647","36","");



DROP TABLE IF EXISTS tbl_tipo_persona;

CREATE TABLE `tbl_tipo_persona` (
  `CODIGO_TIPO_PERSONA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) NOT NULL,
  PRIMARY KEY (`CODIGO_TIPO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_tipo_persona VALUES("1","Administrador");
INSERT INTO tbl_tipo_persona VALUES("2","Tutor");
INSERT INTO tbl_tipo_persona VALUES("3","no definido");
INSERT INTO tbl_tipo_persona VALUES("4","ESTUDIANTE");



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

INSERT INTO tbl_tipo_socioeconomico VALUES("1","DISPOSITIVO ELECTRONICO","Dispositivos de los ","","","","");
INSERT INTO tbl_tipo_socioeconomico VALUES("2","SERVICIOS DE INTERNET","","","","","");
INSERT INTO tbl_tipo_socioeconomico VALUES("3","PROVEEDOR DE INGRESO","","","","","");
INSERT INTO tbl_tipo_socioeconomico VALUES("4","SERVICIOS BASICOS","","","","","");



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
  KEY `FK_CODATREA_TUTO` (`CODIGO_AREA`),
  CONSTRAINT `FK_CODATREA_TUTO` FOREIGN KEY (`CODIGO_AREA`) REFERENCES `tbl_area` (`CODIGO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_tutoria VALUES("1","1","INGLES","2022-03-14","PEDROLUIS","","");
INSERT INTO tbl_tutoria VALUES("3","1","ESPAÑOL","2022-03-15","PEDROLUIS","","");
INSERT INTO tbl_tutoria VALUES("4","1","MATEMATICAS","2022-03-15","PEDROLUIS","","");



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
  KEY `FK_CODES_USU` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_CODES_USU` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_CODPER_USU` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_CODROL_USU` FOREIGN KEY (`CODIGO_TIPO_ROL`) REFERENCES `tbl_roles` (`CODIGO_TIPO_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_usuario VALUES("1","1","Admin","ADMIN","2","1","12345","","0","0","","","","","");
INSERT INTO tbl_usuario VALUES("2","2","Tutor","PEDROLUIS","2","2","Pedro123*","2022-02-11","3","0","2022-02-28","","","2","");
INSERT INTO tbl_usuario VALUES("40","34","","ALEXANDER","1","2","$2y$10$E1b07xJE.u2HazAJBG9KcO.1C.15MP9ZrL62FgmjEkeSBp48Xcwuq","","0","0","0000-00-00","","2022-02-25","ADMIN","2022-03-07");
INSERT INTO tbl_usuario VALUES("41","35","","ROSAS","5","2","((%Z(]-*","","0","0","0000-00-00","","2022-02-25","41","");
INSERT INTO tbl_usuario VALUES("42","36","","RAFALEE","5","3","$z&[!a[?","","0","0","2022-04-26","","2022-02-25","","");
INSERT INTO tbl_usuario VALUES("43","37","","LUISILLO","2","1","COMUNICA","","0","0","0000-00-00","","2022-02-25","43","");
INSERT INTO tbl_usuario VALUES("44","38","","PRUEBAS","6","3","Pruebas1*","","0","0","2022-04-26","","2022-02-25","","");
INSERT INTO tbl_usuario VALUES("45","39","","LUISFONSI","2","2","Luis12*","","0","0","2022-04-29","","2022-02-28","","");
INSERT INTO tbl_usuario VALUES("46","40","","PRUEBE","6","3","Prueb12*","","0","0","2022-04-29","","2022-02-28","","");
INSERT INTO tbl_usuario VALUES("47","41","","PRUEBES","2","3","Pruebe12**","","0","0","2022-04-29","","2022-02-28","ADMIN","2022-03-10");



SET FOREIGN_KEY_CHECKS=1;