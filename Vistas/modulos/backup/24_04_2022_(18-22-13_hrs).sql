SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS db_proyecto_prosecar;

USE db_proyecto_prosecar;

DROP TABLE IF EXISTS tbl_alergias;

CREATE TABLE `tbl_alergias` (
  `CODIGO_ALERGIAS` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ALERGIAS`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_alergias VALUES("1","ALERGIA AL AGUA","ALERGIA EXTRAÑA","EMILIO","2022-04-19","","");
INSERT INTO tbl_alergias VALUES("2","ALERGIA AL POLVO","REACCION ALERGICA AL POLVO","EMILIO","2022-04-19","","");
INSERT INTO tbl_alergias VALUES("3","NINGUNA","NO HAY, NO EXISTE","EMILIO","2022-04-19","","");



DROP TABLE IF EXISTS tbl_apariencia_fisica;

CREATE TABLE `tbl_apariencia_fisica` (
  `CODIGO_APARIENCIA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`CODIGO_APARIENCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_apariencia_fisica VALUES("1","EDEMA HINCHAZON");
INSERT INTO tbl_apariencia_fisica VALUES("2","ICTERICIA");
INSERT INTO tbl_apariencia_fisica VALUES("3","PALIDEZ");



DROP TABLE IF EXISTS tbl_area;

CREATE TABLE `tbl_area` (
  `CODIGO_AREA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_area VALUES("1","ACADEMICA","AREA DE CLASES","ADMIN","2022-03-17","2022-04-07","ADMIN");
INSERT INTO tbl_area VALUES("2","MEDICA","AREA DE MEDICINA","ADMIN","2022-03-17","2022-04-07","ADMIN");
INSERT INTO tbl_area VALUES("3","PSICOLOGICA","AREA DE PSICOLOGIA","ADMIN","2022-03-17","2022-04-22","ARNOLDIÑO");
INSERT INTO tbl_area VALUES("4","ESPIRITUAL","AREA ESPIRITUAL","ARNOLDIÑO","2022-04-22","","");



DROP TABLE IF EXISTS tbl_bitacora_sistema;

CREATE TABLE `tbl_bitacora_sistema` (
  `CODIGO_BITACORA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_USUARIO` int(5) NOT NULL,
  `CODIGO_OBJETO` int(5) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `ACCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPCION` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_BITACORA`),
  KEY `FK_COD_USU_BIT` (`CODIGO_USUARIO`),
  KEY `FK_COD_OBJ_BIT` (`CODIGO_OBJETO`),
  CONSTRAINT `FK_COD_OBJ_BIT` FOREIGN KEY (`CODIGO_OBJETO`) REFERENCES `tbl_objetos` (`CODIGO_OBJETO`),
  CONSTRAINT `FK_COD_USU_BIT` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `tbl_usuario` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_bitacora_sistema VALUES("1","9","1","2022-04-22","Modificacion","Se edito la area ");
INSERT INTO tbl_bitacora_sistema VALUES("2","9","1","2022-04-22","Modificacion","Se edito la area ");
INSERT INTO tbl_bitacora_sistema VALUES("3","9","1","2022-04-22","Modificacion","Se edito la area ");
INSERT INTO tbl_bitacora_sistema VALUES("4","9","1","2022-04-22","Modificacion","Se edito la area ");
INSERT INTO tbl_bitacora_sistema VALUES("5","9","9","2022-04-22","Eliminar Area","Se eliminó la area");
INSERT INTO tbl_bitacora_sistema VALUES("6","9","9","2022-04-22","No eliminar area","Intento de invalido de eliminar area");
INSERT INTO tbl_bitacora_sistema VALUES("7","9","20","2022-04-22","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("8","9","20","2022-04-22","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("9","9","4","2022-04-22","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("10","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("11","9","4","2022-04-22","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("12","9","4","2022-04-22","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("13","9","2","2022-04-22","Modificacion","Se edito un familiar ");
INSERT INTO tbl_bitacora_sistema VALUES("14","9","4","2022-04-22","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("15","9","4","2022-04-22","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("16","9","2","2022-04-22","Modificacion","Se edito un familiar ");
INSERT INTO tbl_bitacora_sistema VALUES("17","9","4","2022-04-22","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("18","9","4","2022-04-22","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("19","9","4","2022-04-22","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("20","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("21","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("22","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("23","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("24","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("25","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("26","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("27","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("28","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("29","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("30","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("31","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("32","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("33","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("34","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("35","9","32","2022-04-22","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("36","9","19","2022-04-22","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("37","9","19","2022-04-22","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("38","9","19","2022-04-22","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("39","9","2","2022-04-22","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("40","9","2","2022-04-22","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("41","9","2","2022-04-22","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("42","9","2","2022-04-22","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("43","9","2","2022-04-22","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("44","9","7","2022-04-22","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("45","9","4","2022-04-22","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("46","9","4","2022-04-22","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("47","9","4","2022-04-22","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("48","9","4","2022-04-22","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("49","9","20","2022-04-22","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("50","9","1","2022-04-22","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("51","7","1","2022-04-22","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("52","7","28","2022-04-22","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("53","7","28","2022-04-22","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("54","7","28","2022-04-22","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("55","7","28","2022-04-22","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("56","7","28","2022-04-22","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("57","7","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("58","7","28","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("59","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("60","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("61","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("62","7","19","2022-04-23","Modificacion","Se edito una apariencia");
INSERT INTO tbl_bitacora_sistema VALUES("63","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("64","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("65","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("66","7","19","2022-04-23","Modificacion","Se edito una apariencia");
INSERT INTO tbl_bitacora_sistema VALUES("67","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("68","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("69","7","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("70","7","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("71","7","1","2022-04-23","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("72","9","1","2022-04-23","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("73","9","12","2022-04-23","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("74","9","12","2022-04-23","Se ingreso un tipo persona","Se vizualiza el tipo de persona");
INSERT INTO tbl_bitacora_sistema VALUES("75","9","12","2022-04-23","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("76","9","14","2022-04-23","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("77","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("78","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("79","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("80","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("81","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("82","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("83","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("84","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("85","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("86","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("87","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("88","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("89","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("90","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("91","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("92","9","17","2022-04-23","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("93","9","4","2022-04-23","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("94","9","20","2022-04-23","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("95","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("96","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("97","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("98","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("99","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("100","9","20","2022-04-23","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("101","9","20","2022-04-23","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("102","9","20","2022-04-23","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("103","9","20","2022-04-23","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("104","9","4","2022-04-23","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("105","9","20","2022-04-23","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("106","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("107","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("108","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("109","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("110","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("111","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("112","9","20","2022-04-23","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("113","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("114","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("115","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("116","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("117","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("118","9","4","2022-04-23","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("119","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("120","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("121","9","20","2022-04-23","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("122","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("123","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("125","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("126","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("127","9","20","2022-04-23","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("128","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("129","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("131","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("132","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("134","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("135","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("137","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("138","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("140","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("141","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("143","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("144","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("145","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("146","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("147","9","7","2022-04-23","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("148","9","7","2022-04-23","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("149","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("150","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("151","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("152","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("153","6","1","2022-04-23","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("154","9","23","2022-04-23","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("155","6","1","2022-04-23","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("156","6","1","2022-04-23","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("157","9","23","2022-04-23","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("158","6","1","2022-04-23","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("159","6","1","2022-04-23","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("160","9","1","2022-04-23","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("161","9","1","2022-04-23","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("162","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("163","6","1","2022-04-23","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("164","7","1","2022-04-23","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("165","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("166","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("167","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("168","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("169","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("170","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("171","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("172","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("173","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("174","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("175","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("176","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("177","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("178","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("179","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("180","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("181","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("182","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("183","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("184","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("185","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("186","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("187","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("188","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("189","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("190","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("191","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("192","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("193","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("194","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("195","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("196","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("197","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("198","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("199","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("200","9","2","2022-04-23","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("201","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("202","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("203","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("204","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("205","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("206","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("207","9","14","2022-04-23","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("208","9","14","2022-04-23","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("209","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("210","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("211","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("212","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("213","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("214","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("215","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("216","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("217","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("218","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("219","9","23","2022-04-23","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("220","9","23","2022-04-23","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("221","9","23","2022-04-23","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("222","9","23","2022-04-23","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("223","9","23","2022-04-23","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("224","9","23","2022-04-23","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("225","9","23","2022-04-23","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("226","9","23","2022-04-23","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("227","9","23","2022-04-23","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("228","9","23","2022-04-23","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("229","9","23","2022-04-23","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("230","9","7","2022-04-23","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("231","9","3","2022-04-23","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("232","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("233","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("234","9","6","2022-04-23","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("235","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("236","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("238","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("239","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("240","7","19","2022-04-23","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("241","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("242","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("243","9","32","2022-04-23","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("244","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("245","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("246","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("247","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("248","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("249","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("250","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("251","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("252","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("253","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("254","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("255","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("256","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("257","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("258","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("259","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("260","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("261","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("262","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("263","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("264","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("265","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("266","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("267","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("268","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("269","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("270","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("271","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("272","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("273","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("274","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("275","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("276","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("277","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("278","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("279","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("280","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("281","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("282","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("283","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("284","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("285","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("286","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("287","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("288","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("289","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("290","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("291","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("292","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("293","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("294","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("295","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("296","9","2","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("297","9","2","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("298","9","22","2022-04-24","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("299","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("300","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("301","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("302","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("303","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("304","9","1","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("305","9","20","2022-04-24","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("306","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("307","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("308","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("309","9","20","2022-04-24","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("310","9","20","2022-04-24","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("311","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("312","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("313","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("314","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("315","9","2","2022-04-24","Ingreso a la tabla de sacramentos","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("316","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("317","9","20","2022-04-24","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("318","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("319","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("320","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("321","9","20","2022-04-24","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("322","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("323","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("324","9","23","2022-04-24","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("325","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("326","9","2","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("327","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("328","7","1","2022-04-24","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("329","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("330","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("331","9","2","2022-04-24","Ingreso a la tabla de sacramentos","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("332","9","7","2022-04-23","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("333","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("334","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("335","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("336","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("337","9","20","2022-04-24","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("338","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("339","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("340","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("341","9","20","2022-04-24","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("342","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("343","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("344","9","20","2022-04-24","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("345","9","4","2022-04-24","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("346","9","20","2022-04-24","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("347","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("348","9","2","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("349","9","2","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("350","9","4","2022-04-24","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("351","9","3","2022-04-24","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("352","9","3","2022-04-24","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("353","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("354","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("355","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("356","9","3","2022-04-24","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("357","9","7","2022-04-23","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("358","9","7","2022-04-23","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("359","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("360","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("361","9","7","2022-04-23","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("362","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("363","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("364","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("365","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("366","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("367","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("368","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("369","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("370","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("371","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("372","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("373","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("374","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("375","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("376","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("377","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("378","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("379","9","20","2022-04-24","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("380","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("381","9","3","2022-04-24","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("382","9","2","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("383","9","2","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("384","9","2","2022-04-24","Ingreso a la tabla de sacramentos","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("385","9","2","2022-04-24","Ingreso a la tabla de sacramentos","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("386","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("387","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("388","9","2","2022-04-24","Ingreso a la tabla de sacramentos","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("389","9","2","2022-04-24","Ingreso a la tabla de sacramentos","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("390","9","7","2022-04-24","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("391","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("392","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("393","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("394","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("395","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("396","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("397","9","17","2022-04-24","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("398","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("399","9","17","2022-04-24","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("400","9","17","2022-04-24","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("401","9","22","2022-04-24","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("402","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("403","9","22","2022-04-24","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("404","9","22","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("405","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("406","9","22","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("407","9","22","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("408","9","22","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("409","9","19","2022-04-24","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("410","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("411","9","7","2022-04-24","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("412","9","19","2022-04-24","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("413","9","19","2022-04-24","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("414","9","19","2022-04-24","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("415","9","2","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("416","9","4","2022-04-24","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("417","9","3","2022-04-24","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("418","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("419","9","1","2022-04-24","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("420","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("421","9","1","2022-04-24","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("422","9","12","2022-04-24","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("423","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("424","9","1","2022-04-24","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("425","9","12","2022-04-24","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("426","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("427","9","12","2022-04-24","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("428","9","12","2022-04-24","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("429","9","19","2022-04-24","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("430","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("431","9","19","2022-04-24","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("432","9","19","2022-04-24","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("433","7","1","2022-04-24","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("434","7","28","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("435","7","28","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("436","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("437","7","28","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("438","7","28","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("439","7","28","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("440","7","34","2022-04-24","Ingreso crud tipo de sangre","Se visualiza los tipos de sangre");
INSERT INTO tbl_bitacora_sistema VALUES("441","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("442","7","34","2022-04-24","Ingreso crud tipo de sangre","Se visualiza los tipos de sangre");
INSERT INTO tbl_bitacora_sistema VALUES("443","7","34","2022-04-24","Ingreso crud tipo de sangre","Se visualiza los tipos de sangre");
INSERT INTO tbl_bitacora_sistema VALUES("444","7","34","2022-04-24","Ingreso crud tipo de sangre","Se visualiza los tipos de sangre");
INSERT INTO tbl_bitacora_sistema VALUES("445","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("446","7","35","2022-04-24","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("447","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("448","7","35","2022-04-24","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("449","7","35","2022-04-24","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("450","7","35","2022-04-24","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("451","7","19","2022-04-24","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("452","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("453","7","19","2022-04-24","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("454","7","19","2022-04-24","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("455","7","19","2022-04-24","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("456","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("457","7","19","2022-04-24","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("458","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("459","7","19","2022-04-24","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("460","7","19","2022-04-24","Ingreso a mantenimiento examenes","mantenimiento examenes medicos");
INSERT INTO tbl_bitacora_sistema VALUES("461","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("462","9","23","2022-04-24","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("463","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("464","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("465","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("466","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("467","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("468","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("469","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("470","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("471","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("472","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("473","9","1","2022-04-24","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("474","9","12","2022-04-24","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("475","9","17","2022-04-24","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("476","9","2","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("477","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("478","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("479","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("480","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("481","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("482","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("483","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("484","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("485","9","1","2022-04-24","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("486","11","1","2022-04-24","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("487","11","1","2022-04-24","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("488","11","1","2022-04-24","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("489","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("490","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("491","7","1","2022-04-24","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("492","9","1","2022-04-24","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("493","11","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("494","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("495","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("496","9","6","2022-04-24","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("497","11","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("498","11","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("499","11","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("500","9","1","2022-04-24","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("501","7","1","2022-04-24","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("502","11","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("503","11","1","2022-04-24","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("504","9","1","2022-04-24","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("505","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("506","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("507","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("508","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("509","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("511","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("512","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("513","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("514","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("515","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("516","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("517","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("518","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("519","7","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("520","7","1","2022-04-24","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("521","11","1","2022-04-24","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("522","11","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("523","11","1","2022-04-24","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("524","9","1","2022-04-24","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("525","6","1","2022-04-24","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("526","9","1","2022-04-24","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("527","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("528","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("529","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("530","9","32","2022-04-24","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("531","9","1","2022-04-24","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("532","9","7","2022-04-24","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("533","6","1","2022-04-24","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("534","9","1","2022-04-24","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("535","9","14","2022-04-24","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("536","9","7","2022-04-24","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("537","9","2","2022-04-24","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("538","9","7","2022-04-24","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("540","9","20","2022-04-24","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("541","9","2","2022-04-24","Ingreso a la tabla de sacramentos","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("542","9","2","2022-04-24","Ingreso a la tabla de sacramentos","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("543","9","2","2022-04-25","Ingreso a la tabla de sacramentos","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("544","9","4","2022-04-25","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("545","9","4","2022-04-25","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("546","9","4","2022-04-25","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");



DROP TABLE IF EXISTS tbl_calificaciones;

CREATE TABLE `tbl_calificaciones` (
  `CODIGO_CALIFICACIONES` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_MATRICULA` int(5) DEFAULT NULL,
  `CALIFICACION` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CALIFICACIONES`),
  KEY `FK_COD_MATRCU` (`CODIGO_MATRICULA`),
  CONSTRAINT `FK_COD_MATRCU` FOREIGN KEY (`CODIGO_MATRICULA`) REFERENCES `tbl_matricula_academica` (`CODIGO_MATRICULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_carga_academica;

CREATE TABLE `tbl_carga_academica` (
  `CODIGO_CARGA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_TUTORIA` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `CODIGO_MODALIDAD` int(5) DEFAULT NULL,
  `CODIGO_SECCION` int(5) DEFAULT NULL,
  `HORA` time DEFAULT NULL,
  `HORA_FINAL` time NOT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_FINAL` date DEFAULT NULL,
  `ANIO` int(11) NOT NULL,
  `PERIODO` int(11) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CARGA`),
  KEY `PK_COD_PE` (`CODIGO_PERSONA`),
  KEY `PK_COD_MOD` (`CODIGO_MODALIDAD`),
  KEY `PK_COD_TUTO` (`CODIGO_TUTORIA`),
  KEY `FK_CODSEC_CARG` (`CODIGO_SECCION`),
  CONSTRAINT `FK_CODSEC_CARG` FOREIGN KEY (`CODIGO_SECCION`) REFERENCES `tbl_seccion` (`CODIGO_SECCION`),
  CONSTRAINT `PK_COD_MOD` FOREIGN KEY (`CODIGO_MODALIDAD`) REFERENCES `tbl_modalidad` (`CODIGO_MODALIDA`),
  CONSTRAINT `PK_COD_PE` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `PK_COD_TUTO` FOREIGN KEY (`CODIGO_TUTORIA`) REFERENCES `tbl_tutoria` (`CODIGO_TUTORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_carga_academica VALUES("1","1","14","1","2","09:00:00","10:00:00","2022-04-21","2022-06-25","2022","3","ARNOLDIÑO","2022-04-21","2022-04-22","ARNOLDIÑO");
INSERT INTO tbl_carga_academica VALUES("2","4","6","2","2","15:00:00","16:00:00","2022-04-21","2022-05-31","2022","3","ARNOLDIÑO","2022-04-21","2022-04-22","ARNOLDIÑO");
INSERT INTO tbl_carga_academica VALUES("3","3","14","1","4","11:00:00","12:00:00","2022-04-28","2022-06-28","2022","1","ARNOLDIÑO","2022-04-22","2022-04-22","ARNOLDIÑO");
INSERT INTO tbl_carga_academica VALUES("4","2","6","1","3","13:00:00","14:00:00","2022-04-21","2022-01-05","2022","3","ARNOLDIÑO","2022-04-22","","");



DROP TABLE IF EXISTS tbl_consulta_medica;

CREATE TABLE `tbl_consulta_medica` (
  `CODIGO_CONSULTA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PRECLINICA` int(5) NOT NULL,
  `CODIGO_CITA` int(5) NOT NULL,
  `SINTOMAS` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `DIAGNOSTICO_INGRESO` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `EVOLUCION` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `DIAGNOSTICO_EGRESO` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONSULTA`),
  KEY `FK_COD_PREC` (`CODIGO_PRECLINICA`),
  KEY `FK_COD_CIT` (`CODIGO_CITA`),
  CONSTRAINT `FK_COD_CIT` FOREIGN KEY (`CODIGO_CITA`) REFERENCES `tbl_inscripcion_cita` (`CODIGO_CITA`),
  CONSTRAINT `FK_COD_PREC` FOREIGN KEY (`CODIGO_PRECLINICA`) REFERENCES `tbl_preclinica` (`CODIGO_PRECLINICA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_consulta_medica VALUES("1","1","1","niguno","ninguno","ninguno"," ninguno","","2022-04-19","","");
INSERT INTO tbl_consulta_medica VALUES("2","2","4","Dolor de cabeza, palidez, cansancio, dolor de cuerpo ","Anemia leve, bajas las plaquetas","En proceso"," Anemia leve, bajas las plaquetas","","2022-04-19","","");
INSERT INTO tbl_consulta_medica VALUES("3","3","14","Dolor de cabeza, dolor de espalda","dengue","bien"," bien","","2022-04-20","","");
INSERT INTO tbl_consulta_medica VALUES("4","4","13","Fiebre alta, dolor de garganta","Covid-19 y 20","Bien"," no","","2022-04-20","","");
INSERT INTO tbl_consulta_medica VALUES("5","5","15","Dolores de cabeza","Fiebre alta","en proceso"," bien","","2022-04-20","","");
INSERT INTO tbl_consulta_medica VALUES("6","6","18","no","no","no"," no","","2022-04-20","","");



DROP TABLE IF EXISTS tbl_contenido_socioeconomico;

CREATE TABLE `tbl_contenido_socioeconomico` (
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_TIPOSOCIO` int(5) NOT NULL,
  `NOMBRE_TIPO` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_TIPOSOCIO` (`CODIGO_TIPOSOCIO`),
  CONSTRAINT `FK_COD_TIPOSOCIO` FOREIGN KEY (`CODIGO_TIPOSOCIO`) REFERENCES `tbl_tipo_socioeconomico` (`CODIGO_TIPOSOCIO`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_contenido_socioeconomico VALUES("1","1","COMPUTADORA");
INSERT INTO tbl_contenido_socioeconomico VALUES("2","1","CELULAR");
INSERT INTO tbl_contenido_socioeconomico VALUES("3","1","TABLET");
INSERT INTO tbl_contenido_socioeconomico VALUES("4","2","INTERNET RESIDENCIAL");
INSERT INTO tbl_contenido_socioeconomico VALUES("5","2","DATOS MOVILES");
INSERT INTO tbl_contenido_socioeconomico VALUES("6","2","AMBOS");
INSERT INTO tbl_contenido_socioeconomico VALUES("7","3","PADRE");
INSERT INTO tbl_contenido_socioeconomico VALUES("8","3","MADRE");
INSERT INTO tbl_contenido_socioeconomico VALUES("9","3","AMBOS");
INSERT INTO tbl_contenido_socioeconomico VALUES("10","3","REMESAS");
INSERT INTO tbl_contenido_socioeconomico VALUES("11","4","ENERGÍA ELÉCTRICA");
INSERT INTO tbl_contenido_socioeconomico VALUES("12","4","AGUA POTABLE");
INSERT INTO tbl_contenido_socioeconomico VALUES("13","4","ALCANTARILLADO");
INSERT INTO tbl_contenido_socioeconomico VALUES("14","2","NINGUNO");



DROP TABLE IF EXISTS tbl_correo_electronico;

CREATE TABLE `tbl_correo_electronico` (
  `CORREO_PERSONA` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `CODIGO_PERSONA` int(5) NOT NULL,
  PRIMARY KEY (`CORREO_PERSONA`),
  KEY `FK_CORREO` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_CORREO` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_correo_electronico VALUES("proyecto_prosecar@hotmail.com","1");
INSERT INTO tbl_correo_electronico VALUES("alejandromatte@dominio.com","4");
INSERT INTO tbl_correo_electronico VALUES("francisca@dominio.com","5");
INSERT INTO tbl_correo_electronico VALUES("pedro@dominio.com","6");
INSERT INTO tbl_correo_electronico VALUES("emilio@gmail.com","7");
INSERT INTO tbl_correo_electronico VALUES("betulio98@gmail.com","8");
INSERT INTO tbl_correo_electronico VALUES("veronica@gmail.com","9");
INSERT INTO tbl_correo_electronico VALUES("arnol95caballero@gmail.com","10");
INSERT INTO tbl_correo_electronico VALUES("genesis@gmail.com","11");
INSERT INTO tbl_correo_electronico VALUES("silvia@gmail.com","12");
INSERT INTO tbl_correo_electronico VALUES("oscar@gmail.com","13");
INSERT INTO tbl_correo_electronico VALUES("Ruben65@gmail.com","14");
INSERT INTO tbl_correo_electronico VALUES("Luzmaria@gmail.com","15");



DROP TABLE IF EXISTS tbl_especialidad;

CREATE TABLE `tbl_especialidad` (
  `CODIGO_ESPECIALIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `CODIGO_AREA` int(5) DEFAULT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESPECIALIDAD`),
  KEY `TBL_ESP_FK` (`CODIGO_AREA`),
  CONSTRAINT `TBL_ESP_FK` FOREIGN KEY (`CODIGO_AREA`) REFERENCES `tbl_area` (`CODIGO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_especialidad VALUES("1","MEDICINA GENERAL ","2","ATIENDE DE TODO ","","0000-00-00","","");
INSERT INTO tbl_especialidad VALUES("2","TERAPIA GENERAL","3","ATIENDE DE TODO TIPO DE LOCOS","","0000-00-00","","");



DROP TABLE IF EXISTS tbl_estado;

CREATE TABLE `tbl_estado` (
  `CODIGO_ESTADO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_estado VALUES("1","NUEVO","Este usuario esta ACTIVO");
INSERT INTO tbl_estado VALUES("2","ACTIVO","este usuario esta nuevo");
INSERT INTO tbl_estado VALUES("3","INACTIVO","este ususario esta inactivo");
INSERT INTO tbl_estado VALUES("4","BLOQUEADO","Esta usuario esta en estado de bloqueo");
INSERT INTO tbl_estado VALUES("5","PENDIENTE","Este usuario esta pendiente de cambiar la contrase");
INSERT INTO tbl_estado VALUES("6","INDEFINIDO","Este usuario esta deshabiltado ");
INSERT INTO tbl_estado VALUES("7","CANCELADA","ESTE ESTADO HACE REFERENCIA A LA CITAS");
INSERT INTO tbl_estado VALUES("8","REALIZADO","ESTADO QUE HACE REFERENCIA A LA REALIZACION");
INSERT INTO tbl_estado VALUES("9","PROCESO","UNA FUNCION EN PROCESO");
INSERT INTO tbl_estado VALUES("10","PROCESOPRECLINICA","PARA PRECESO DE PRECLICA");
INSERT INTO tbl_estado VALUES("11","PROCESOCONSULTA","ESTADO QUE INDICA UNA CITA EN EL PROCESO DE CONSUL");
INSERT INTO tbl_estado VALUES("12","REPORTECONSULTA","CODIGO QUE PERMITE VER EL REPORTE DE CONSULTA");
INSERT INTO tbl_estado VALUES("13","FINALIZADO","CODIGO QUE DESCRIBE  LA FINALIZACION DE UN PROCESO");
INSERT INTO tbl_estado VALUES("14","PLAN_TERAPEUTICO","Estado que espicifica que se hace un plan de terap");
INSERT INTO tbl_estado VALUES("15","PROCESOENCONSULTA","Esta en consulta justo en ese momento");
INSERT INTO tbl_estado VALUES("16","REPORTEPLANTERAPIA","ESTADO PARA EL AREA PSICOLOGICA");
INSERT INTO tbl_estado VALUES("17","EXCELENTE","ESTADO QUE SERA USADO EN MATRICULA");
INSERT INTO tbl_estado VALUES("18","MUY BUENO","ESTADO QUE SERA USADO EN MATRICULA");
INSERT INTO tbl_estado VALUES("19","BUENO","ESTADO QUE SERA USADO EN MATRICULA");



DROP TABLE IF EXISTS tbl_estudiante;

CREATE TABLE `tbl_estudiante` (
  `CODIGO_ESTUDIANTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `GRADO_ACTUAL` int(5) DEFAULT NULL,
  `REPITENTE` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `INDICE_ACADEMICO` int(5) DEFAULT NULL,
  `MATE_BAJO_RENDI` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `PASATIEMPOS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DISTRACTORES_ESCOLARES` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `METAS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE`),
  KEY `FK_COD_EST` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_COD_EST` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_estudiante VALUES("1","9","9","NO","85","MATEMATICAS","VER CARICATURAS","REDES SOCIALES","ESTUDIAR MEDICINA");
INSERT INTO tbl_estudiante VALUES("2","11","10","SI","70","ESPAÑOL, MATEMATICAS","VER TELEVISION ","REDES SOCIALES VIDEO JUEGOS","SER UN PILOTO");



DROP TABLE IF EXISTS tbl_estudiante_socioeconomico;

CREATE TABLE `tbl_estudiante_socioeconomico` (
  `CODIGO_ESTUDIANTE_SOCIOECONOMICO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(5) NOT NULL,
  `CODIGO_ESTUDIANTE` int(5) NOT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE_SOCIOECONOMICO`),
  KEY `FK_CONTSOCIO` (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_CON_ES` (`CODIGO_ESTUDIANTE`),
  CONSTRAINT `FK_COD_CON_ES` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `tbl_estudiante` (`CODIGO_ESTUDIANTE`),
  CONSTRAINT `FK_CONTSOCIO` FOREIGN KEY (`CODIGO_CONTENIDO_SOCIOECONOMICO`) REFERENCES `tbl_contenido_socioeconomico` (`CODIGO_CONTENIDO_SOCIOECONOMICO`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_estudiante_socioeconomico VALUES("20","1","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("21","5","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("22","7","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("23","11","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("24","1","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("25","5","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("26","7","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("27","11","2");



DROP TABLE IF EXISTS tbl_examenes_medicos;

CREATE TABLE `tbl_examenes_medicos` (
  `CODIGO_EXAMEN_MEDICO` int(11) NOT NULL AUTO_INCREMENT,
  `EXAMEN_MEDICO` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXAMEN_MEDICO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_examenes_medicos VALUES("1","HEMOGRAMA","EXAMEN DE SANGRE","","0000-00-00","","");
INSERT INTO tbl_examenes_medicos VALUES("2","URALISIS","","EMILIO","2022-04-20","","");
INSERT INTO tbl_examenes_medicos VALUES("3","PRUEBA PCR","","EMILIO","2022-04-20","","");



DROP TABLE IF EXISTS tbl_examenes_pacientes;

CREATE TABLE `tbl_examenes_pacientes` (
  `CODIGO_EXAMEN_PACIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONSULTA` int(5) DEFAULT NULL,
  `CODIGO_EXAMEN_MEDICO` int(5) DEFAULT NULL,
  `OBSERVACIONES` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `INDICACIONES` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXAMEN_PACIENTE`),
  KEY `FK_COD_EXA_CONSULTA` (`CODIGO_CONSULTA`),
  KEY `FK_COD_EXAMEN_MEDICO` (`CODIGO_EXAMEN_MEDICO`),
  CONSTRAINT `FK_COD_EXAMEN_MEDICO` FOREIGN KEY (`CODIGO_EXAMEN_MEDICO`) REFERENCES `tbl_examenes_medicos` (`CODIGO_EXAMEN_MEDICO`),
  CONSTRAINT `FK_COD_EXA_CONSULTA` FOREIGN KEY (`CODIGO_CONSULTA`) REFERENCES `tbl_consulta_medica` (`CODIGO_CONSULTA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_examenes_pacientes VALUES("1","2","1","NO CONSUMIR BEBIDAS AZUCARADAS","HACERCE EL EXAMEN EN AYUNAS");
INSERT INTO tbl_examenes_pacientes VALUES("2","3","1","NO","HACERLO EN AYUNAS ");
INSERT INTO tbl_examenes_pacientes VALUES("3","4","2","NO","IR EN AYUNAS");
INSERT INTO tbl_examenes_pacientes VALUES("4","5","3","NO","EN LA MAÑANA");
INSERT INTO tbl_examenes_pacientes VALUES("5","6","2","NO","NO");



DROP TABLE IF EXISTS tbl_expediente_medico;

CREATE TABLE `tbl_expediente_medico` (
  `CODIGO_EXPEDIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `CODIGO_ESTADO` int(5) DEFAULT NULL,
  `CODIGO_TIPO_SANGRE` int(5) DEFAULT NULL,
  `TRATAMIENTOS` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `ENFERMEDADES` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXPEDIENTE`),
  KEY `COD_EXP_PERSONA` (`CODIGO_PERSONA`),
  KEY `FK_COD_TIPO_SANGRE` (`CODIGO_TIPO_SANGRE`),
  KEY `COD_EST_EXPE` (`CODIGO_ESTADO`),
  CONSTRAINT `COD_EST_EXPE` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`),
  CONSTRAINT `COD_EXP_PERSONA` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_COD_TIPO_SANGRE` FOREIGN KEY (`CODIGO_TIPO_SANGRE`) REFERENCES `tbl_tipo_sangre` (`CODIGO_TIPO_SANGRE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_expediente_medico VALUES("1","9","2","1","Loratadina","no","2022-04-18");
INSERT INTO tbl_expediente_medico VALUES("2","11","2","1","Ninguno                              \n                            ","Ninguna","2022-04-19");
INSERT INTO tbl_expediente_medico VALUES("3","12","2","1","ninguno                              \n                            ","ninguna","2022-04-19");



DROP TABLE IF EXISTS tbl_expediente_psicologico_consulta;

CREATE TABLE `tbl_expediente_psicologico_consulta` (
  `CODIGO_EXPEDIENTE_PSICO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CITA` int(5) DEFAULT NULL,
  `SINTOMAS` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `DIAGNOSTICO_INGRESO` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `DIAGNOSTICO_EGRESO` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `OBSEVARCIONES` varchar(600) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXPEDIENTE_PSICO`),
  KEY `FK_CODIGO_CITA_CONSULTA` (`CODIGO_CITA`),
  CONSTRAINT `FK_CODIGO_CITA_CONSULTA` FOREIGN KEY (`CODIGO_CITA`) REFERENCES `tbl_inscripcion_cita` (`CODIGO_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_expediente_psicologico_consulta VALUES("1","3","TIENE MUCHAS COSAS","ASABER QUE LE PASO","TIENE SUEÑO","QUE SE VAYA A DORMIR","","2022-04-19","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("2","6","NO ","NO","NO","NO","","2022-04-19","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("3","9","DOLOR DE CABEZA","FATIGA","BIEN","BIEN","","2022-04-19","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("4","10","ANSIEDAD","ANSIEDAD","ANSIEDAD","ANSEIDAD","","2022-04-19","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("5","17","SUDARACION","ANSIEDAD","EN PROCESO","NO","","2022-04-20","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("6","20","SUDARACION ","ANSIEDAD ","MEJORO","BIEN","","2022-04-20","","");



DROP TABLE IF EXISTS tbl_expediente_psicologico_unico;

CREATE TABLE `tbl_expediente_psicologico_unico` (
  `CODIGO_EXPEDIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_ESTADO` int(5) DEFAULT NULL,
  `ANTECEDENTES_FAMILIARES` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `ANTECEDENTES_PERSONALES` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `ANTECEDENTES_CLINICOS` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  PRIMARY KEY (`CODIGO_EXPEDIENTE`),
  KEY `COD_EXP_PERSONA` (`CODIGO_PERSONA`) USING BTREE,
  KEY `COD_ESTA_EXPE` (`CODIGO_ESTADO`) USING BTREE,
  CONSTRAINT `COD_ESTA_EXPEUN` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`),
  CONSTRAINT `COD_EXPSI_PERSONA` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_expediente_psicologico_unico VALUES("1","9","2","  no"," no","no","2022-04-19");
INSERT INTO tbl_expediente_psicologico_unico VALUES("2","11","2","ningún problema","ningún problema","ningún problema","2022-04-19");
INSERT INTO tbl_expediente_psicologico_unico VALUES("3","12","2","No","Depresión","no","2022-04-19");
INSERT INTO tbl_expediente_psicologico_unico VALUES("4","13","2","Ninguno","Depresión ","Ninguno","2022-04-20");



DROP TABLE IF EXISTS tbl_familiar;

CREATE TABLE `tbl_familiar` (
  `CODIGO_FAMILIAR` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `ESTADO_CIVIL` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `NIVEL_EDUCATIVO` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `INGRESOS_DE_FAMILIAR` int(6) DEFAULT NULL,
  `NOMBRE_IGLESIA` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_FAMILIAR`),
  KEY `FAM_PK` (`CODIGO_PERSONA`),
  CONSTRAINT `FAM_PK` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_familiar VALUES("1","12","SOLTERA","SECUNDARIA","3000","MARIA AUXILIADORA");



DROP TABLE IF EXISTS tbl_familiares_estudiante;

CREATE TABLE `tbl_familiares_estudiante` (
  `CODIGO_FAM_EST` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `CODIGO_FAMILIAR` int(5) DEFAULT NULL,
  `CODIGO_PARENTESCO` int(5) DEFAULT NULL,
  `ENCARGADO` varchar(5) NOT NULL,
  PRIMARY KEY (`CODIGO_FAM_EST`),
  KEY `FK_COD_ESTF` (`CODIGO_ESTUDIANTE`),
  KEY `FK_COD_FAM` (`CODIGO_FAMILIAR`),
  KEY `FK_COD_PARENT` (`CODIGO_PARENTESCO`),
  CONSTRAINT `FK_COD_ESTF` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `tbl_estudiante` (`CODIGO_ESTUDIANTE`),
  CONSTRAINT `FK_COD_FAM` FOREIGN KEY (`CODIGO_FAMILIAR`) REFERENCES `tbl_familiar` (`CODIGO_FAMILIAR`),
  CONSTRAINT `FK_COD_PARENT` FOREIGN KEY (`CODIGO_PARENTESCO`) REFERENCES `tbl_parentesco` (`CODIGO_PARENTESCO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_inscripcion_cita;

CREATE TABLE `tbl_inscripcion_cita` (
  `CODIGO_CITA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_ESPECIALISTA` int(5) DEFAULT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL,
  `AREA_CITA` int(5) NOT NULL,
  `FECHA_CITA` date DEFAULT NULL,
  `HORARIO` time DEFAULT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CITA`),
  KEY `FK_CODIGO_PERSONAS` (`CODIGO_PERSONA`),
  KEY `FK_CODIGO_ESPECIALISTA` (`CODIGO_ESPECIALISTA`),
  KEY `COD_ESTA_FK` (`CODIGO_ESTADO`),
  KEY `COD_AREA_FK` (`AREA_CITA`),
  CONSTRAINT `COD_AREA_FK` FOREIGN KEY (`AREA_CITA`) REFERENCES `tbl_area` (`CODIGO_AREA`),
  CONSTRAINT `COD_ESTA_FK` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_CODIGO_ESPECIALISTA` FOREIGN KEY (`CODIGO_ESPECIALISTA`) REFERENCES `tbl_persona_especialidad` (`CODIGO_PERSONA_ESPECIALIDAD`),
  CONSTRAINT `FK_CODIGO_PERSONAS` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_inscripcion_cita VALUES("1","9","1","13","2","2022-04-18","14:30:00","2022-04-19","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("2","9","2","13","3","2022-04-19","11:00:00","2022-04-19","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("3","9","2","13","3","2022-04-19","10:30:00","2022-04-19","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("4","11","1","13","2","2022-04-19","12:00:00","2022-04-19","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("5","9","1","5","2","2022-04-19","13:00:00","2022-04-19","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("6","11","2","13","3","2022-04-19","09:00:00","2022-04-19","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("7","9","2","5","3","2022-04-19","10:00:00","2022-04-19","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("8","9","2","5","3","2022-04-19","16:00:00","2022-04-19","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("9","11","2","13","3","2022-04-19","16:00:00","2022-04-19","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("10","11","2","9","3","2022-04-19","17:00:00","2022-04-19","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("13","11","1","13","2","2022-04-19","18:00:00","2022-04-20","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("14","12","1","13","2","2022-04-19","10:00:00","2022-04-20","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("15","11","1","9","2","2022-04-19","15:00:00","2022-04-20","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("16","11","1","5","2","2022-04-19","14:00:00","2022-04-20","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("17","12","2","13","3","2022-04-19","12:00:00","2022-04-20","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("18","11","1","13","2","2022-04-20","10:00:00","2022-04-20","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("19","11","2","9","3","2022-04-20","13:00:00","2022-04-20","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("20","13","2","13","3","2022-04-20","16:00:00","2022-04-20","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("21","9","1","5","2","2022-04-23","09:00:00","2022-04-23","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("22","12","1","9","2","2022-04-24","16:00:00","2022-04-24","0000-00-00","","");



DROP TABLE IF EXISTS tbl_matricula_academica;

CREATE TABLE `tbl_matricula_academica` (
  `CODIGO_MATRICULA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CARGA` int(5) DEFAULT NULL,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `OBSERVACION` int(5) DEFAULT NULL,
  `FECHA_MATRICULA` date DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MATRICULA`),
  KEY `FK_COD_ESTU_MATR` (`CODIGO_ESTUDIANTE`),
  KEY `FK_COD_CARGA_MATR` (`CODIGO_CARGA`),
  KEY `FK_COD_ESTA_MATR` (`OBSERVACION`),
  CONSTRAINT `FK_COD_CARGA_MATR` FOREIGN KEY (`CODIGO_CARGA`) REFERENCES `tbl_carga_academica` (`CODIGO_CARGA`),
  CONSTRAINT `FK_COD_ESTA_MATR` FOREIGN KEY (`OBSERVACION`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_COD_ESTU_MATR` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `tbl_estudiante` (`CODIGO_ESTUDIANTE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_matricula_academica VALUES("1","1","1","9","2022-04-21","ARNOLDIÑO","2022-04-21","","");
INSERT INTO tbl_matricula_academica VALUES("2","2","2","9","2022-04-21","ARNOLDIÑO","2022-04-21","","");
INSERT INTO tbl_matricula_academica VALUES("3","2","1","9","2022-04-21","ARNOLDIÑO","2022-04-21","","");
INSERT INTO tbl_matricula_academica VALUES("4","3","2","9","2022-04-22","ARNOLDIÑO","2022-04-22","","");
INSERT INTO tbl_matricula_academica VALUES("5","1","2","9","2022-04-22","ARNOLDIÑO","2022-04-22","","");
INSERT INTO tbl_matricula_academica VALUES("6","4","2","9","2022-04-22","ARNOLDIÑO","2022-04-22","","");
INSERT INTO tbl_matricula_academica VALUES("7","4","1","9","2022-04-23","","2022-04-23","","");



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

INSERT INTO tbl_medicamento VALUES("A1","TOSAN","PARA LA TOS","EMILIO","2022-04-20","","");
INSERT INTO tbl_medicamento VALUES("A2","VITAMINA D","VITAMINAS","EMILIO","2022-04-20","","");
INSERT INTO tbl_medicamento VALUES("A4","VITAMINA C","VITAMINAS","EMILIO","2022-04-20","","");



DROP TABLE IF EXISTS tbl_modalidad;

CREATE TABLE `tbl_modalidad` (
  `CODIGO_MODALIDA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MODALIDA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_modalidad VALUES("1","PRESENCIAL","Tiene que ir");
INSERT INTO tbl_modalidad VALUES("2","VIRTUAL","No tiene que ir ");



DROP TABLE IF EXISTS tbl_ms_hist_contrasena;

CREATE TABLE `tbl_ms_hist_contrasena` (
  `CODIGO_HIST_CONTRASENA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_USUARIO` int(5) NOT NULL,
  `CONTRASENA` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_HIST_CONTRASENA`),
  KEY `FK_COD_USU_HISCON` (`CODIGO_USUARIO`),
  CONSTRAINT `FK_COD_USU_HISCON` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `tbl_usuario` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_ms_hist_contrasena VALUES("1","6","$2a$07$usesomesillystringforeKoJzf6CZZSMl0hpLCMVzo.NeEQXkNSW","6","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("2","7","$2a$07$usesomesillystringfore/eHzbY6bdK2lR4Oj9d67nlvscYDxKmS","7","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("3","8","$2a$07$usesomesillystringforesdNhGB5kh3Got8Zesrs9Uh424ty/iNO","8","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("4","9","$2a$07$usesomesillystringforecf5Yb.RFQBKaifEFbUtl7b8/K8tkaty","9","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("5","11","$2a$07$usesomesillystringforeFz7dK1VZWNMEJiH0HNOXYw/HL.5hY4.","11","0000-00-00","","");



DROP TABLE IF EXISTS tbl_objetos;

CREATE TABLE `tbl_objetos` (
  `CODIGO_OBJETO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_OBJETO`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_objetos VALUES("1","ESTADO","Sistema de administracion","Administrador","2022-02-09","0000-00-00","");
INSERT INTO tbl_objetos VALUES("2","ROLES","objeto donde se registran personas ","Administrador","2022-02-06","0000-00-00","");
INSERT INTO tbl_objetos VALUES("3","PARAMETROS","","Administrador","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("4","PREGUNTAS","Objeto mantenimiento Preguntas","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("5","PERMISOS","Objeto mantenimiento Permisos","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("6","OBJETOS","Objeto mantenimiento objetos","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("7","BITACORA","Objeto consulta bitacora","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("8","PREGUNTAS_USUARIOS","Objeto consulta preguntas usuarios","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("9","PARAMETROS_USUARIOS","Objeto mantenimiento parametros usuarios","","0000-00-00","0000-00-00","");
INSERT INTO tbl_objetos VALUES("10","BACKUP ","Objeto mantenimiento backup","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("11","RESTAURACION","Objeto mantenimiento restauracion","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("12","TIPO_PERSONAS","Mantenimiento de la tabla tipo de personas.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("13","REGISTRAR_PERSONAS","Objeto registra una persona.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("14","EDITAR_USARIOS","Objeto mantenimiento usuarios.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("15","EDITAR_PERSONAS","Objeto mantenimiento personas.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("16","ESTUDIANTES","Objeto mantenimiento estudiantes.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("17","TIPO_SOCIOECONOMICO","Objeto mantenimiento tipo socioeconomico.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("18","CONTENIDO_SOCIOECONOMICO","Objeto mantenimiento contenido socioeconomico.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("19","MODALIDAD","Objeto mantenimiento modalidad","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("20","CARGA_ACADEMICA","Objeto mantenimiento carga académica.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("21","AREA","Objeto mantenimiento de área.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("22","TUTORIA","Objeto mantenimiento de tutoria.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("23","MATRICULA","Objeto mantenimiento matricula.","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("24","CALIFICACIONES","Objeto mantenimiento calificaciones","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("25","PERSONAS","Gestion complete de personas.","","0000-00-00","0000-00-00","");
INSERT INTO tbl_objetos VALUES("26","GESTION_ESTUDIANTES","OBJETO DE GESTION DE LOS ESTUDIANTES","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("27","SEGURIDAD","GESTION DE SEGURIDAD","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("28","GESTION_CARGA_ACADEMICA","OBJETO DE GESTION DE LA CARGA ACADEMICA","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("29","GESTION_MATRICULA","OBJETO DE GESTION DE LAS MATRICULAS DE LOS ALUMNOS","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("30","GESTION_AREA_MEDICA","OBJETO DE GESTION DE LAS CITAS MEDICAS","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("31","GESTION_AREA_PSICOLOGIA","OBJETO DEL AREA PSICOLOGICA","ADMIN","2022-03-18","0000-00-00","");
INSERT INTO tbl_objetos VALUES("32","GESTION_DE_CITAS","DED","","2022-03-27","0000-00-00","");
INSERT INTO tbl_objetos VALUES("33","GESTIONFAMILIARES","PERMISOS PARA INSERTAR DATOS SOCIECONOMICOS FAMILIARES","","2022-03-31","0000-00-00","");
INSERT INTO tbl_objetos VALUES("34","RECETAMEDICA","CRUD Y PROCESO","","2022-04-07","0000-00-00","");
INSERT INTO tbl_objetos VALUES("35","MEDICAMENTOS","PERMISO MEDICAMENTOS","","2022-04-07","0000-00-00","");
INSERT INTO tbl_objetos VALUES("36","TRANSTORNOS","PERMISO PARA EL MANTENIMIENTO","","2022-04-07","0000-00-00","");
INSERT INTO tbl_objetos VALUES("37","TIPOSANGRE","MANTENIMIENTO TIPO SANGRE","","2022-04-08","0000-00-00","");
INSERT INTO tbl_objetos VALUES("38","GESTION_TUTOR","AREA DEL TUTOR","","2022-04-21","","");
INSERT INTO tbl_objetos VALUES("39","ALERGIAS","OBJETO MANTENIMIENTO ALEGIAS","","2022-04-23","","");
INSERT INTO tbl_objetos VALUES("40","APARIENCIA FISICA","OBJETO MANTENIMIENTO APARIENCIA","","2022-04-23","","");
INSERT INTO tbl_objetos VALUES("41","ESPECIALIDADES","OBJETO MANTENIMIENTO ESPECIALIDADES","","2022-04-23","","");
INSERT INTO tbl_objetos VALUES("42","EXAMENES MEDICOS","OBJETO MANTENIMIENTO EXAMENES","","2022-04-23","","");
INSERT INTO tbl_objetos VALUES("43","FAMILIARES","OBETO MANTENIMIENTO FAMILIARES","","2022-04-23","","");
INSERT INTO tbl_objetos VALUES("44","PARENTESCO","OBJETO MANTENIMIENTO PARANTESCO","","2022-04-23","","");
INSERT INTO tbl_objetos VALUES("45","SACRAMENTO","OBJETO MANTENIMIENTO SACRAMENTOS","","2022-04-23","","");
INSERT INTO tbl_objetos VALUES("46","SECCION ","OBJETO MANTENIMIENTO SECCIONES","","2022-04-23","","");
INSERT INTO tbl_objetos VALUES("47","SINTOMAS NEUROTICOS","OBJETO MANTENIMIENTO SINTOMAS NEUROTICOS","","2022-04-23","","");
INSERT INTO tbl_objetos VALUES("48","CITAS GENERALES","OBJETO CITAS GENERALES","","2022-04-23","","");
INSERT INTO tbl_objetos VALUES("49","GESTION PRECLINICA","OBJETO DE GESTION PRECLINICA","","2022-04-24","","");
INSERT INTO tbl_objetos VALUES("50","PRECLINICA","OBJETO PARA VER PRECLINICA POR PARTE DE LOS MEDICOS","","2022-04-24","","");



DROP TABLE IF EXISTS tbl_parametros;

CREATE TABLE `tbl_parametros` (
  `CODIGO_PARAMETRO` int(11) NOT NULL AUTO_INCREMENT,
  `PARAMETRO` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `VALOR` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PARAMETRO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_parametros VALUES("1","NUM_INTEN_VALIDOS","3","Administrador","2022-02-07","2022-03-10","ADMIN");
INSERT INTO tbl_parametros VALUES("2","NUM_MAX_PREGUNTAS","3","Administrador","2022-02-07","2022-03-10","ADMIN");
INSERT INTO tbl_parametros VALUES("3","NUM_MAX_CONTRASENAS","8","Administrador","2022-02-07","2022-03-10","ADMIN");
INSERT INTO tbl_parametros VALUES("4","NUM_MAX_CARACTER","30","Administrador","2022-02-07","2022-04-07","ADMIN");
INSERT INTO tbl_parametros VALUES("5","ADMIN_SERVIDOR_CORREO","smtp-mail.outlook.com","Administrador","2022-02-23","2022-03-07","ADMIN");
INSERT INTO tbl_parametros VALUES("7","ADMIN_CPASSWORD","Prosecar2021*","Administrador","2022-02-23","0000-00-00","");
INSERT INTO tbl_parametros VALUES("8","ADMIN_CUSUARIO","proyecto_prosecar@hotmail.com","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("9","ADMIN_CPUERTO","587","ADMIN","2022-03-07","0000-00-00","");
INSERT INTO tbl_parametros VALUES("10","NOMBRE_EMPRESA","PROYECTO SEMILLERO CARMELITANO PROSECAR\n","ADMIN","2022-03-22","0000-00-00","");



DROP TABLE IF EXISTS tbl_parametros_usuarios;

CREATE TABLE `tbl_parametros_usuarios` (
  `CODIGO_PARAM_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_USUARIO` int(5) DEFAULT NULL,
  `CODIGO_PARAMETRO` int(5) DEFAULT NULL,
  `PAR_VALOR` int(5) DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PARAM_USUARIO`),
  KEY `FK_CODPAR_USU` (`CODIGO_USUARIO`),
  KEY `FK_CODPAR_PAR` (`CODIGO_PARAMETRO`),
  CONSTRAINT `FK_CODPAR_PAR` FOREIGN KEY (`CODIGO_PARAMETRO`) REFERENCES `tbl_parametros` (`CODIGO_PARAMETRO`),
  CONSTRAINT `FK_CODPAR_USU` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `tbl_usuario` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_parametros_usuarios VALUES("1","1","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("2","4","1","3","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("3","4","2","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("4","4","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("5","5","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("6","5","2","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("7","5","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("8","6","1","0","","0000-00-00","2022-04-21","");
INSERT INTO tbl_parametros_usuarios VALUES("9","6","2","3","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("10","6","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("11","7","1","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("12","7","2","3","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("13","7","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("14","8","1","1","","0000-00-00","2022-04-19","");
INSERT INTO tbl_parametros_usuarios VALUES("15","8","2","3","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("16","8","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("17","9","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("18","9","2","3","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("19","9","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("20","10","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("21","10","2","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("22","10","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("23","11","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("24","11","2","3","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("25","11","3","0","","0000-00-00","","");



DROP TABLE IF EXISTS tbl_parentesco;

CREATE TABLE `tbl_parentesco` (
  `CODIGO_PARENTESCO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PARENTESCO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_parentesco VALUES("1","PADRE");
INSERT INTO tbl_parentesco VALUES("2","MADRE");
INSERT INTO tbl_parentesco VALUES("3","HERMANA");
INSERT INTO tbl_parentesco VALUES("4","HERMANO");
INSERT INTO tbl_parentesco VALUES("5","ABUELA");
INSERT INTO tbl_parentesco VALUES("6","ABUELO");



DROP TABLE IF EXISTS tbl_permisos;

CREATE TABLE `tbl_permisos` (
  `CODIGO_PERMISO` int(10) NOT NULL AUTO_INCREMENT,
  `CODIGO_TIPO_ROL` int(5) DEFAULT NULL,
  `CODIGO_OBJETO` int(5) DEFAULT NULL,
  `INSERTAR` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `ELIMINAR` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `ACTUALIZAR` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `MOSTRAR` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERMISO`),
  KEY `FK_CO_OBJECT` (`CODIGO_OBJETO`),
  KEY `FK_CO_TROL` (`CODIGO_TIPO_ROL`),
  CONSTRAINT `FK_CO_OBJECT` FOREIGN KEY (`CODIGO_OBJETO`) REFERENCES `tbl_objetos` (`CODIGO_OBJETO`),
  CONSTRAINT `FK_CO_TROL` FOREIGN KEY (`CODIGO_TIPO_ROL`) REFERENCES `tbl_roles` (`CODIGO_TIPO_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_permisos VALUES("1","1","1","NO","NO","NO","NO","Administrador","2022-03-02","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("3","2","24","SI","SI","SI","SI","Administrador","2022-03-02","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("4","4","1","SI","SI","SI","SI","","0000-00-00","ADMIN","2022-03-12");
INSERT INTO tbl_permisos VALUES("5","3","1","SI","SI","SI","SI","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("6","1","2","NO","NO","NO","NO","ADMIN","2022-03-04","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("7","1","19","NO","NO","NO","NO","ADMIN","2022-03-04","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("8","1","5","SI","SI","SI","SI","ADMIN","2022-03-05","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("9","1","8","SI","NO","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("10","1","10","SI","SI","SI","SI","ADMIN","2022-03-05","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("11","1","12","NO","NO","NO","NO","ADMIN","2022-03-05","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("12","1","15","SI","SI","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("13","1","3","NO","NO","NO","NO","ADMIN","2022-03-07","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("14","1","4","NO","NO","NO","NO","ADMIN","2022-03-07","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("15","2","38","SI","SI","SI","SI","ADMIN","2022-03-08","ARNOLDIÑO","2022-04-21");
INSERT INTO tbl_permisos VALUES("17","1","25","SI","NO","NO","SI","","0000-00-00","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("18","1","26","SI","SI","SI","SI","ADMIN","2022-03-10","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("19","1","27","SI","SI","SI","SI","ADMIN","2022-03-10","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("20","2","28","NO","NO","NO","NO","ADMIN","2022-03-10","ARNOLDIÑO","2022-04-21");
INSERT INTO tbl_permisos VALUES("21","2","29","NO","NO","NO","NO","ADMIN","2022-03-10","ARNOLDIÑO","2022-04-21");
INSERT INTO tbl_permisos VALUES("22","1","9","NO","NO","NO","NO","ADMIN","2022-03-10","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("23","1","7","NO","NO","NO","SI","ADMIN","2022-03-12","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("24","5","30","SI","SI","SI","SI","ADMIN","2022-03-14","","0000-00-00");
INSERT INTO tbl_permisos VALUES("25","4","31","SI","SI","SI","SI","ADMIN","2022-03-18","","0000-00-00");
INSERT INTO tbl_permisos VALUES("26","1","32","SI","SI","SI","SI","","2022-03-27","","0000-00-00");
INSERT INTO tbl_permisos VALUES("27","1","22","NO","NO","NO","NO","","2022-04-03","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("28","1","34","SI","SI","SI","SI","ADMIN","2022-04-07","","0000-00-00");
INSERT INTO tbl_permisos VALUES("29","5","34","SI","SI","SI","SI","ADMIN","2022-04-07","","0000-00-00");
INSERT INTO tbl_permisos VALUES("30","1","35","SI","SI","SI","SI","ADMIN","2022-04-07","","0000-00-00");
INSERT INTO tbl_permisos VALUES("31","5","35","NO","NO","NO","SI","ADMIN","2022-04-07","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("32","1","28","SI","SI","SI","SI","LUISILLO","2022-04-07","ARNOLDIÑO","2022-04-21");
INSERT INTO tbl_permisos VALUES("33","1","29","NO","NO","NO","NO","LUISILLO","2022-04-07","ADMIN","2022-04-11");
INSERT INTO tbl_permisos VALUES("34","5","36","NO","NO","NO","SI","LUISILLO","2022-04-07","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("35","5","37","NO","NO","NO","SI","ADMIN","2022-04-08","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("36","5","32","NO","NO","NO","NO","","2022-04-14","ADMIN","2022-04-14");
INSERT INTO tbl_permisos VALUES("37","1","33","SI","SI","SI","SI","","2022-04-14","ARNOLDIÑO","2022-04-20");
INSERT INTO tbl_permisos VALUES("38","1","21","NO","NO","NO","NO","","2022-04-23","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("39","5","39","NO","NO","NO","NO","","2022-04-23","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("40","5","40","NO","NO","NO","SI","","2022-04-23","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("41","1","20","NO","NO","NO","NO","","2022-04-23","$1","2022-04-23");
INSERT INTO tbl_permisos VALUES("42","1","48","SI","SI","SI","SI","","2022-04-23","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("43","1","23","NO","NO","NO","NO","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("44","1","16","SI","SI","SI","SI","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("45","1","43","NO","NO","NO","NO","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("46","1","6","SI","NO","NO","NO","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("47","1","45","NO","NO","NO","NO","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("48","1","18","NO","NO","NO","NO","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("49","1","17","NO","NO","NO","NO","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("50","1","46","NO","NO","NO","NO","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("51","1","41","NO","NO","NO","NO","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("52","5","42","NO","NO","NO","SI","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("53","7","49","SI","SI","SI","SI","","2022-04-24","","0000-00-00");
INSERT INTO tbl_permisos VALUES("54","5","50","SI","SI","SI","SI","","2022-04-24","$1","2022-04-24");



DROP TABLE IF EXISTS tbl_persona;

CREATE TABLE `tbl_persona` (
  `CODIGO_PERSONA` int(11) NOT NULL AUTO_INCREMENT,
  `PRIMER_NOMBRE` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `SEGUNDO_NOMBRE` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `PRIMER_APELLIDO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `SEGUNDO_APELLIDO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `DNI` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `SEXO` char(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `LUGAR_NACIMIENTO` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `DIRECCION` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `FECHA_INSCRIPCION` date DEFAULT NULL,
  `FECHA_BAJA` date DEFAULT NULL,
  `CODIGO_TIPO_PERSONA` int(5) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA`),
  KEY `FK_COD_TIP_PERSONA` (`CODIGO_TIPO_PERSONA`),
  KEY `FK_SEX_PERSONA` (`SEXO`),
  CONSTRAINT `FK_COD_TIP_PERSONA` FOREIGN KEY (`CODIGO_TIPO_PERSONA`) REFERENCES `tbl_tipo_persona` (`CODIGO_TIPO_PERSONA`),
  CONSTRAINT `FK_SEX_PERSONA` FOREIGN KEY (`SEXO`) REFERENCES `tbl_sexo` (`CODIGO_SEXO`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_persona VALUES("1","ADMIN","ADMIN","ADMIN","ADMIN","0801000000000","M","2011-01-01","TEGUCIGALPA","PROSECAR","2022-04-19","","1","NO DEFINIDO","2022-04-19","","2022-04-19");
INSERT INTO tbl_persona VALUES("4","ALEJANDRO","FRANCISCO","MATTE","PEREZ","2147483647","M","1990-01-11","TEGUCIGALPA","COL. NUEVA YORK","2022-04-18","","1","Administrador","0000-00-00","","");
INSERT INTO tbl_persona VALUES("5","EILIN","FRANCISCA","GOMEZ","ESTRADA","2147483647","F","2000-02-15","TEGUCIGALPA","COL. NUEVA ZELANDA","2022-04-18","","1","Administrador","0000-00-00","","");
INSERT INTO tbl_persona VALUES("6","PEDRO","LUIS","RAMIREZ","SARMIENTO","2147483647","M","2000-02-04","TEGUCIGALPA","COL. CARRIZAL","2022-04-18","","2","Administrador","0000-00-00","","");
INSERT INTO tbl_persona VALUES("7","EMILIO","RUBEN","QUEZADA","QUEZADA","2147483647","M","1995-02-15","OCOTEPEQUE","COL. ESPIRITU SANTO","2022-04-18","","5","Administrador","0000-00-00","","");
INSERT INTO tbl_persona VALUES("8","BETULIO","HECTOR","ALTAMIRANO","PEREZ","2147483647","M","1988-07-05","SAN PEDRO SULA","COL : RIO BRAVO","2022-04-18","","6","Administrador","0000-00-00","","");
INSERT INTO tbl_persona VALUES("9","VERONICA","ROGELIA","MENDEZ","MATAMOROS","0801200700297","F","2007-01-01","TEGUCIGALPA","COL LAS MERCEDES","2022-04-19","","4","Administrador","0000-00-00","","");
INSERT INTO tbl_persona VALUES("10","ARNOLDIÑO","ALEXANDRO","CABALLER","GARZA","0801199500015","M","1995-02-12","TEGUCIGALPA","COL: LA LAGUNA CARRETERA A OLANCHO CASA 415 BLOQUE B","2022-04-19","","1","Administrador","0000-00-00","","");
INSERT INTO tbl_persona VALUES("11","GENESIS","NICOLLE","GONZALES","YANES","0801200700458","F","2007-01-07","TEGUCIGALPA","COL LA CANADA CARRETERA A OLANCHO","2022-04-19","","4","Administrador","0000-00-00","","");
INSERT INTO tbl_persona VALUES("12","SILVIA","MARCELA","FUNEZ","FUENTES","2147483647","F","1978-08-10","SAN PEDRO SULA","COL RAFAEL ","2022-04-19","","7","Administrador","0000-00-00","","");
INSERT INTO tbl_persona VALUES("13","OSCAR","HUGO","LOZANO","PADILAA","0801200500015","M","2005-01-05","TEGUCIGALPA","COL LA ESPERANZA","2022-04-20","","4","Administrador","0000-00-00","","");
INSERT INTO tbl_persona VALUES("14","RUBEN","JOSE","AGUIRRE","GIRAFALES","0817196500455","M","1965-05-08","TEGUCIGALPA","COL: VILANUEVA","2022-04-21","","2","Administrador","0000-00-00","","");
INSERT INTO tbl_persona VALUES("15","LUZ","MARIA","MONTOYA","MEDINA","0801199025778","F","2001-05-05","TEGUCIGALPA","COL: 15 DE SEPTIEMBRE","2022-04-24","","9","Administrador","0000-00-00","","");



DROP TABLE IF EXISTS tbl_persona_especialidad;

CREATE TABLE `tbl_persona_especialidad` (
  `CODIGO_PERSONA_ESPECIALIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `CODIGO_ESPECIALIDAD` int(5) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_ESPECIALIDAD`),
  KEY `FK_COD_ESP_PERSONA` (`CODIGO_PERSONA`),
  KEY `FK_COD_ESPECIALIDAD` (`CODIGO_ESPECIALIDAD`),
  CONSTRAINT `FK_COD_ESPECIALIDAD` FOREIGN KEY (`CODIGO_ESPECIALIDAD`) REFERENCES `tbl_especialidad` (`CODIGO_ESPECIALIDAD`),
  CONSTRAINT `FK_COD_ESP_PERSONA` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_persona_especialidad VALUES("1","7","1","Administrador","2022-04-18","","");
INSERT INTO tbl_persona_especialidad VALUES("2","8","2","Administrador","2022-04-18","","");



DROP TABLE IF EXISTS tbl_personas_alergias;

CREATE TABLE `tbl_personas_alergias` (
  `CODIGO_PERSONA_ALERGIAS` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_ALERGIAS` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_ALERGIAS`),
  KEY `cod_expe_fk` (`CODIGO_EXPEDIENTE_PERSONA`),
  KEY `cod_aler_fk` (`CODIGO_ALERGIAS`),
  CONSTRAINT `cod_aler_fk` FOREIGN KEY (`CODIGO_ALERGIAS`) REFERENCES `tbl_alergias` (`CODIGO_ALERGIAS`),
  CONSTRAINT `cod_expe_fk` FOREIGN KEY (`CODIGO_EXPEDIENTE_PERSONA`) REFERENCES `tbl_expediente_medico` (`CODIGO_EXPEDIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_alergias VALUES("15","1","2");
INSERT INTO tbl_personas_alergias VALUES("16","2","1");
INSERT INTO tbl_personas_alergias VALUES("17","2","2");
INSERT INTO tbl_personas_alergias VALUES("18","2","3");
INSERT INTO tbl_personas_alergias VALUES("19","3","1");



DROP TABLE IF EXISTS tbl_personas_apariencia;

CREATE TABLE `tbl_personas_apariencia` (
  `CODIGO_PERSONAS_APARIENCIA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_APARIENCIA` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_APARIENCIA`),
  KEY `CODI_PER_APARI` (`CODIGO_APARIENCIA`),
  KEY `CODI_PER_EXPE_APA` (`CODIGO_EXPEDIENTE`),
  CONSTRAINT `CODI_PER_APARI` FOREIGN KEY (`CODIGO_APARIENCIA`) REFERENCES `tbl_apariencia_fisica` (`CODIGO_APARIENCIA`),
  CONSTRAINT `CODI_PER_EXPE_APA` FOREIGN KEY (`CODIGO_EXPEDIENTE`) REFERENCES `tbl_expediente_medico` (`CODIGO_EXPEDIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_apariencia VALUES("16","1","2");
INSERT INTO tbl_personas_apariencia VALUES("17","2","1");
INSERT INTO tbl_personas_apariencia VALUES("18","2","2");
INSERT INTO tbl_personas_apariencia VALUES("19","2","3");
INSERT INTO tbl_personas_apariencia VALUES("20","3","1");



DROP TABLE IF EXISTS tbl_personas_sintomas;

CREATE TABLE `tbl_personas_sintomas` (
  `CODIGO_PERSONA_SINTOMA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_SINTOMA_NEUROTICO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_SINTOMA`),
  KEY `COD_EXP_PPSICO` (`CODIGO_EXPEDIENTE`),
  KEY `COD_SINT_PP` (`CODIGO_SINTOMA_NEUROTICO`),
  CONSTRAINT `COD_EXP_PPSICO` FOREIGN KEY (`CODIGO_EXPEDIENTE`) REFERENCES `tbl_expediente_psicologico_unico` (`CODIGO_EXPEDIENTE`),
  CONSTRAINT `COD_SINT_PP` FOREIGN KEY (`CODIGO_SINTOMA_NEUROTICO`) REFERENCES `tbl_sintomas_neuroticos` (`CODIGO_SINTOMA_NEUROTICO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_sintomas VALUES("2","1","1");
INSERT INTO tbl_personas_sintomas VALUES("3","2","1");
INSERT INTO tbl_personas_sintomas VALUES("4","2","2");
INSERT INTO tbl_personas_sintomas VALUES("5","3","1");
INSERT INTO tbl_personas_sintomas VALUES("6","3","2");
INSERT INTO tbl_personas_sintomas VALUES("7","4","1");
INSERT INTO tbl_personas_sintomas VALUES("8","4","2");



DROP TABLE IF EXISTS tbl_personas_transtornos;

CREATE TABLE `tbl_personas_transtornos` (
  `CODIGO_PERSONAS_TRANSTORNOS` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_TRANSTORNO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_TRANSTORNOS`),
  KEY `CODI_PER_EXPE` (`CODIGO_EXPEDIENTE`),
  KEY `CODI_PER_TRANST` (`CODIGO_TRANSTORNO`),
  CONSTRAINT `CODI_PER_EXPE` FOREIGN KEY (`CODIGO_EXPEDIENTE`) REFERENCES `tbl_expediente_medico` (`CODIGO_EXPEDIENTE`),
  CONSTRAINT `CODI_PER_TRANST` FOREIGN KEY (`CODIGO_TRANSTORNO`) REFERENCES `tbl_transtornos_corporales` (`CODIGO_TRANSTORNO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_transtornos VALUES("1","1","1");
INSERT INTO tbl_personas_transtornos VALUES("2","2","1");
INSERT INTO tbl_personas_transtornos VALUES("3","2","2");
INSERT INTO tbl_personas_transtornos VALUES("4","2","3");
INSERT INTO tbl_personas_transtornos VALUES("5","3","1");



DROP TABLE IF EXISTS tbl_plan_terapeutico;

CREATE TABLE `tbl_plan_terapeutico` (
  `CODIGO_PLAN` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONSULTA` int(5) DEFAULT NULL,
  `ACTIVIDAD` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `TECNICA` varchar(600) COLLATE utf8mb4_bin NOT NULL,
  `MATERIALES` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `TAREAS` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `RESULTADOS` varchar(600) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`CODIGO_PLAN`),
  KEY `COD_CONSUL_PSICO_FK` (`CODIGO_CONSULTA`),
  CONSTRAINT `COD_CONSUL_PSICO_FK` FOREIGN KEY (`CODIGO_CONSULTA`) REFERENCES `tbl_expediente_psicologico_consulta` (`CODIGO_EXPEDIENTE_PSICO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_plan_terapeutico VALUES("1","1","NO","NO","NO","NO","NO");
INSERT INTO tbl_plan_terapeutico VALUES("2","2","ir al a caminar","Caminar y trotar ","zapatos deportivos","Caminar por 30 minutos cada dia","en proceso");
INSERT INTO tbl_plan_terapeutico VALUES("3","4","ir a cminar","ir a caminar","ir a caminar","ir a caminar","en proceso");
INSERT INTO tbl_plan_terapeutico VALUES("4","5","Hacer ejercicio","No","ropa deportiva","1 hora al día","en proceso");
INSERT INTO tbl_plan_terapeutico VALUES("5","6","Hacer ejercicio","No especificas","Ropa y materiales para hacer ejercicio Ropa y materiales para hacer ejercicio Ropa y materiales para hacer ejercicio","Caminar 1 hora al día","En espera");



DROP TABLE IF EXISTS tbl_preclinica;

CREATE TABLE `tbl_preclinica` (
  `CODIGO_PRECLINICA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CITA` int(5) NOT NULL,
  `PESO` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `MASA_CORPORAL` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `ESTATURA` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `TEMPERATURA` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `PULSO` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `FRECUENCIA_CARDIACA` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `FRECUENCIA_RESPIRATORIA` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESNUTRICION` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PRECLINICA`),
  KEY `FK_CODIGO_CITA_PREC` (`CODIGO_CITA`),
  CONSTRAINT `FK_CODIGO_CITA_PREC` FOREIGN KEY (`CODIGO_CITA`) REFERENCES `tbl_inscripcion_cita` (`CODIGO_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_preclinica VALUES("1","1","115","25.5","1.60","37","70","70","12","No tiene","","2022-04-19","","");
INSERT INTO tbl_preclinica VALUES("2","4","120","18.5","1.56","35","70","70/80","12","Moderado","","2022-04-19","","");
INSERT INTO tbl_preclinica VALUES("3","14","180","18.5","1.20","35","70","70/80","12","Moderado","","2022-04-20","","");
INSERT INTO tbl_preclinica VALUES("4","13","140","18.5","1.802","38","70","70/80","12","Moderado","","2022-04-20","","");
INSERT INTO tbl_preclinica VALUES("5","15","150","18.5","1.70","36","70","70/80","12","Moderado","","2022-04-20","","");
INSERT INTO tbl_preclinica VALUES("6","18","180","18.5","1.85","38","70","70/80","12","Moderado","","2022-04-20","","");



DROP TABLE IF EXISTS tbl_preguntas;

CREATE TABLE `tbl_preguntas` (
  `CODIGO_PREGUNTAS` int(11) NOT NULL AUTO_INCREMENT,
  `PREGUNTA` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PREGUNTAS`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_preguntas VALUES("1","¿Cual es tu comida favorita?","Administrador","2022-02-06","ADMIN","2022-04-12");
INSERT INTO tbl_preguntas VALUES("2","¿Nombre de tu caricatura favorita de la infancia?","Administrador","2022-02-06","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("3","¿Nombre de tu pelicula favorita de la infancia?","Administrador","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("4","¿Pariente que mas admira?","Administrador","2022-02-02","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("5","¿Nombre de mascota favorito?","Administrador","2022-02-01","","0000-00-00");



DROP TABLE IF EXISTS tbl_preguntas_usuarios;

CREATE TABLE `tbl_preguntas_usuarios` (
  `CODIGO_PREGUNTA_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PREGUNTAS` int(5) DEFAULT NULL,
  `CODIGO_USUARIO` int(5) DEFAULT NULL,
  `RESPUESTA` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PREGUNTA_USUARIO`),
  KEY `FK_CODPRE_PREU` (`CODIGO_PREGUNTAS`),
  KEY `FK_CODU_PREU` (`CODIGO_USUARIO`),
  CONSTRAINT `FK_CODPRE_PREU` FOREIGN KEY (`CODIGO_PREGUNTAS`) REFERENCES `tbl_preguntas` (`CODIGO_PREGUNTAS`),
  CONSTRAINT `FK_CODU_PREU` FOREIGN KEY (`CODIGO_USUARIO`) REFERENCES `tbl_usuario` (`CODIGO_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_preguntas_usuarios VALUES("1","1","6","SPAGETTI","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("2","2","6","LOS PADRINOS MAGICOS","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("3","5","6","PELUSA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("4","1","7","PIZZA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("5","3","7","DUMBO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("6","4","7","SU MAMÁ","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("7","1","8","ARROZ CON SANDIA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("8","2","8","BOB ESPONJA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("9","5","8","FIRULAIS","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("10","1","9","CHULETA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("11","2","9","PADRINOS MAGICOS","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("12","3","9","SPIDERMAN","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("13","1","11","LECHUGA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("14","2","11","LOS PICAPIEDRAS","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("15","3","11","SPIDERMAN","","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_receta_medica VALUES("1","2","A1","CADA 2 HORAS","NO","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("2","3","A1","2 TOMAS CADA 2 HORAS","NO","2022-04-19","ADMIN","2022-04-19","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("3","4","A1","2 CUCHARADAS","NO","2022-04-19","ADMIN","2022-04-19","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("4","5","A2","PARA LA TOS","NO","2022-04-19","ADMIN","2022-04-19","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("5","6","A1","NO","NO","2022-04-20","ADMIN","2022-04-20","","0000-00-00");



DROP TABLE IF EXISTS tbl_roles;

CREATE TABLE `tbl_roles` (
  `CODIGO_TIPO_ROL` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPO_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_roles VALUES("1","ADMINISTRADOR","Todos los permisos","Administrador","2022-02-11","2022-04-07","ADMIN");
INSERT INTO tbl_roles VALUES("2","TUTOR","Usuario con permisos al modulo de escuela","Administrador","2022-02-11","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("3","INDEFINIDO","Rol no definido para el usuario","","0000-00-00","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("4","PSICOLOGO","Área de psicología","","0000-00-00","2022-04-07","ADMIN");
INSERT INTO tbl_roles VALUES("5","MEDICO","area medica","","2022-03-09","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("6","SACERDOTE","Área espiritual","","2022-03-09","2022-04-07","ADMIN");
INSERT INTO tbl_roles VALUES("7","ENFERMERO","Area Medica","","2022-04-23","","");



DROP TABLE IF EXISTS tbl_sacramento;

CREATE TABLE `tbl_sacramento` (
  `CODIGO_SACRAMENTO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SACRAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_sacramento VALUES("1","BAUTISMO","PRIMER SACRAMENTO\n");
INSERT INTO tbl_sacramento VALUES("2","PRIMERA COMUNION","SEGUNDO SACRAMENTO");
INSERT INTO tbl_sacramento VALUES("3","CONFIRMA","TERCER SACRAMENTO");



DROP TABLE IF EXISTS tbl_sacramento_persona;

CREATE TABLE `tbl_sacramento_persona` (
  `CODIGO_CORRELATIVO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_SACRAMENTO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CORRELATIVO`),
  KEY `FK_CP_SACRAMENTO` (`CODIGO_PERSONA`),
  KEY `FK_CS_SACRAMENTO` (`CODIGO_SACRAMENTO`),
  CONSTRAINT `FK_CP_SACRAMENTO` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_CS_SACRAMENTO` FOREIGN KEY (`CODIGO_SACRAMENTO`) REFERENCES `tbl_sacramento` (`CODIGO_SACRAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_sacramento_persona VALUES("1","9","1");
INSERT INTO tbl_sacramento_persona VALUES("2","9","2");
INSERT INTO tbl_sacramento_persona VALUES("3","9","3");
INSERT INTO tbl_sacramento_persona VALUES("4","11","1");
INSERT INTO tbl_sacramento_persona VALUES("5","11","2");
INSERT INTO tbl_sacramento_persona VALUES("6","13","1");
INSERT INTO tbl_sacramento_persona VALUES("7","13","2");



DROP TABLE IF EXISTS tbl_seccion;

CREATE TABLE `tbl_seccion` (
  `CODIGO_SECCION` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SECCION`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_seccion VALUES("1","GRADO 1 SECCION B","Niños de poskinder");
INSERT INTO tbl_seccion VALUES("2","GRADO 1 SECCION A","Niños prekinder");
INSERT INTO tbl_seccion VALUES("3","GRADO 2 SECCION A","Niños segundo grado");
INSERT INTO tbl_seccion VALUES("4","GRADO 2 SECCION B","Niños segundo grado");



DROP TABLE IF EXISTS tbl_sexo;

CREATE TABLE `tbl_sexo` (
  `CODIGO_SEXO` char(1) COLLATE utf8mb4_bin NOT NULL,
  `SEXO` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`CODIGO_SEXO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_sexo VALUES("F","FEMENINO");
INSERT INTO tbl_sexo VALUES("M","MASCULINO");



DROP TABLE IF EXISTS tbl_sintomas_neuroticos;

CREATE TABLE `tbl_sintomas_neuroticos` (
  `CODIGO_SINTOMA_NEUROTICO` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SINTOMA_NEUROTICO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_sintomas_neuroticos VALUES("1","PESADILLAS");
INSERT INTO tbl_sintomas_neuroticos VALUES("2","CONVULSIONES");
INSERT INTO tbl_sintomas_neuroticos VALUES("3","NINGUNO");



DROP TABLE IF EXISTS tbl_telefono;

CREATE TABLE `tbl_telefono` (
  `NUMERO_TELEFONO` int(8) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  PRIMARY KEY (`NUMERO_TELEFONO`),
  KEY `Numero_perso` (`CODIGO_PERSONA`),
  CONSTRAINT `Numero_perso` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=99993334 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_telefono VALUES("12345678","1");
INSERT INTO tbl_telefono VALUES("99993333","4");
INSERT INTO tbl_telefono VALUES("33336666","5");
INSERT INTO tbl_telefono VALUES("96993333","6");
INSERT INTO tbl_telefono VALUES("33969999","7");
INSERT INTO tbl_telefono VALUES("95787414","8");
INSERT INTO tbl_telefono VALUES("97854115","9");
INSERT INTO tbl_telefono VALUES("32995232","10");
INSERT INTO tbl_telefono VALUES("97728825","11");
INSERT INTO tbl_telefono VALUES("32858748","12");
INSERT INTO tbl_telefono VALUES("97767823","13");
INSERT INTO tbl_telefono VALUES("97866867","14");
INSERT INTO tbl_telefono VALUES("97477141","15");



DROP TABLE IF EXISTS tbl_tipo_persona;

CREATE TABLE `tbl_tipo_persona` (
  `CODIGO_TIPO_PERSONA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`CODIGO_TIPO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tipo_persona VALUES("1","ADMINISTRADOR");
INSERT INTO tbl_tipo_persona VALUES("2","TUTOR");
INSERT INTO tbl_tipo_persona VALUES("3","NODEFINIDO");
INSERT INTO tbl_tipo_persona VALUES("4","ESTUDIANTE");
INSERT INTO tbl_tipo_persona VALUES("5","MEDICO");
INSERT INTO tbl_tipo_persona VALUES("6","PSICOLOGO");
INSERT INTO tbl_tipo_persona VALUES("7","FAMILIAR");
INSERT INTO tbl_tipo_persona VALUES("8","CATEQUISTA");
INSERT INTO tbl_tipo_persona VALUES("9","ENFERMERO");



DROP TABLE IF EXISTS tbl_tipo_sangre;

CREATE TABLE `tbl_tipo_sangre` (
  `CODIGO_TIPO_SANGRE` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPO_SANGRE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tipo_sangre VALUES("1","TIPOA","ADMIN","2022-03-31","0000-00-00","");
INSERT INTO tbl_tipo_sangre VALUES("2","TIPOB","ADMIN","2022-03-31","0000-00-00","");
INSERT INTO tbl_tipo_sangre VALUES("3","TIPOC"," LUISMIGUEL","2022-04-07","2022-04-07","LUISMIGUEL");



DROP TABLE IF EXISTS tbl_tipo_socioeconomico;

CREATE TABLE `tbl_tipo_socioeconomico` (
  `CODIGO_TIPOSOCIO` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPOSOCIO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tipo_socioeconomico VALUES("1","DISPOSITIVO ELECTRONICO","Dispositivos de los ","ADMIN","2022-04-07","","");
INSERT INTO tbl_tipo_socioeconomico VALUES("2","SERVICIOS DE INTERNET","","","2022-04-07","","");
INSERT INTO tbl_tipo_socioeconomico VALUES("3","PROVEEDOR DE INGRESO","","","2022-04-07","","");
INSERT INTO tbl_tipo_socioeconomico VALUES("4","SERVICIOS BASICOS","","","2022-04-07","","");



DROP TABLE IF EXISTS tbl_transtornos_corporales;

CREATE TABLE `tbl_transtornos_corporales` (
  `CODIGO_TRANSTORNO` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TRANSTORNO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_transtornos_corporales VALUES("1","SISTEMA RESPIRATORIO");
INSERT INTO tbl_transtornos_corporales VALUES("2","SISTEMA DIGESTIVO");
INSERT INTO tbl_transtornos_corporales VALUES("3","NINGUNO");



DROP TABLE IF EXISTS tbl_tutoria;

CREATE TABLE `tbl_tutoria` (
  `CODIGO_TUTORIA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_AREA` int(5) NOT NULL,
  `NOMBRE` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TUTORIA`),
  KEY `FK_CODATREA_TUTO` (`CODIGO_AREA`),
  CONSTRAINT `FK_CODATREA_TUTO` FOREIGN KEY (`CODIGO_AREA`) REFERENCES `tbl_area` (`CODIGO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tutoria VALUES("1","1","MATEMÁTICAS","ADMIN","2022-04-20","","");
INSERT INTO tbl_tutoria VALUES("2","1","INGLÉS","ADMIN","2022-04-20","","");
INSERT INTO tbl_tutoria VALUES("3","1","ESPAÑOL","ARNOLDIÑO","2022-04-22","","");
INSERT INTO tbl_tutoria VALUES("4","1","INFORMATICA","ARNOLDIÑO","2022-04-22","","");



DROP TABLE IF EXISTS tbl_usuario;

CREATE TABLE `tbl_usuario` (
  `CODIGO_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `NOMBRE_USUARIO` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL,
  `CODIGO_TIPO_ROL` int(5) DEFAULT NULL,
  `CONTRASENA` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `FECHA_VENCIMIENTO` date DEFAULT NULL,
  `CREADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_USUARIO`),
  KEY `FK_CODPER_USU` (`CODIGO_PERSONA`),
  KEY `FK_CODROL_USU` (`CODIGO_TIPO_ROL`),
  KEY `FK_CODES_USU` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_CODES_USU` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_CODPER_USU` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_CODROL_USU` FOREIGN KEY (`CODIGO_TIPO_ROL`) REFERENCES `tbl_roles` (`CODIGO_TIPO_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_usuario VALUES("1","1","ADMIN","2","1","$2a$07$usesomesillystringforegJJMyFgrr4TSJCGugRgH5JHTyFT6Ysm","2022-06-18","","2022-04-19","","");
INSERT INTO tbl_usuario VALUES("4","4","ALEJANDRO","1","1","???????aL	\\4?G-?D???f????U??!?p$H?Ȍ?UG???u\\*????o??g7lo","","Administrador","2022-04-18","","");
INSERT INTO tbl_usuario VALUES("5","5","EILIN","1","1","$2a$07$usesomesillystringfore6F1T/a4UnIo7V1IMkKToDcPjr0x9TNC","","Administrador","2022-04-18","","");
INSERT INTO tbl_usuario VALUES("6","6","PEDROLUIS","2","2","$2a$07$usesomesillystringforeKoJzf6CZZSMl0hpLCMVzo.NeEQXkNSW","","Administrador","2022-04-18","2022-04-20","");
INSERT INTO tbl_usuario VALUES("7","7","EMILIO","2","5","$2a$07$usesomesillystringfore/eHzbY6bdK2lR4Oj9d67nlvscYDxKmS","","Administrador","2022-04-18","","");
INSERT INTO tbl_usuario VALUES("8","8","BETULIO","2","4","$2a$07$usesomesillystringforesdNhGB5kh3Got8Zesrs9Uh424ty/iNO","","Administrador","2022-04-18","2022-04-19","");
INSERT INTO tbl_usuario VALUES("9","10","ARNOLDIÑO","2","1","$2a$07$usesomesillystringforecf5Yb.RFQBKaifEFbUtl7b8/K8tkaty","","Administrador","2022-04-19","","");
INSERT INTO tbl_usuario VALUES("10","14","GIRAFALES","1","2","$2a$07$usesomesillystringforesEsVFHfLYD7VEBj6bFcdBFYRU0ck/vK","","Administrador","2022-04-21","","");
INSERT INTO tbl_usuario VALUES("11","15","LUZMARIA","2","7","$2a$07$usesomesillystringforeFz7dK1VZWNMEJiH0HNOXYw/HL.5hY4.","","Administrador","2022-04-24","","");



SET FOREIGN_KEY_CHECKS=1;