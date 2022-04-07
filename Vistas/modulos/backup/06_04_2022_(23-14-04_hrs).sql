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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_alergias VALUES("1","Alergia al polen","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_alergias VALUES("2","Alergia al humo","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_alergias VALUES("3","Alergia al polvo","","","0000-00-00","","0000-00-00");
INSERT INTO tbl_alergias VALUES("4","Ninguna","NO HAY ALERGIAS\n","","0000-00-00","","0000-00-00");



DROP TABLE IF EXISTS tbl_apariencia_fisica;

CREATE TABLE `tbl_apariencia_fisica` (
  `CODIGO_APARIENCIA` int(5) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_APARIENCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_apariencia_fisica VALUES("1","EDEMA HINCHAZON");
INSERT INTO tbl_apariencia_fisica VALUES("2","ICTERICIA");
INSERT INTO tbl_apariencia_fisica VALUES("3","PALIDEZ");



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
) ENGINE=InnoDB AUTO_INCREMENT=886 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_bitacora_sistema VALUES("1","1","7","2022-04-01 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("2","2","1","2022-04-01 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("3","2","23","2022-04-01 00:00:00","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("4","2","23","2022-04-01 00:00:00","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("5","2","22","2022-04-01 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("6","2","2","2022-04-01 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("7","2","2","2022-04-01 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("8","2","1","2022-04-01 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("9","44","1","2022-04-01 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("10","44","32","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("11","1","32","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("12","1","32","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("13","0","1","2022-04-01 00:00:00","Modificacion","Se edito un estado ");
INSERT INTO tbl_bitacora_sistema VALUES("14","0","1","2022-04-01 00:00:00","Modificacion","Se elimino un estado ");
INSERT INTO tbl_bitacora_sistema VALUES("15","44","32","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("16","1","1","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("17","1","20","2022-04-01 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("18","1","14","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("19","1","14","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("20","1","14","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("21","1","14","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("22","1","14","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("23","1","14","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("24","1","20","2022-04-01 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("25","1","20","2022-04-01 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("26","1","20","2022-04-01 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("27","1","20","2022-04-01 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("28","1","20","2022-04-01 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("29","1","20","2022-04-01 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("30","1","20","2022-04-01 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("31","1","20","2022-04-01 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("32","1","14","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("33","1","25","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("34","1","25","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("35","1","25","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("36","1","25","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("37","1","14","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("38","1","25","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("39","1","25","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("40","1","25","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("41","1","1","2022-04-01 00:00:00","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("42","1","3","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("43","0","3","2022-04-01 00:00:00","Editar parámetro","Se editó el registro de un parámetro ya existente");
INSERT INTO tbl_bitacora_sistema VALUES("44","1","3","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("45","1","3","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("46","1","3","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("47","1","1","2022-04-01 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("48","2","1","2022-04-01 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("49","2","2","2022-04-01 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("50","2","2","2022-04-01 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("51","2","2","2022-04-01 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("52","2","2","2022-04-01 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("53","2","23","2022-04-01 00:00:00","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("54","2","23","2022-04-01 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("55","2","23","2022-04-01 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("56","2","23","2022-04-01 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("57","2","23","2022-04-01 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("58","2","23","2022-04-01 00:00:00","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("59","2","23","2022-04-01 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("60","2","23","2022-04-01 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("61","2","1","2022-04-01 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("62","1","1","2022-04-01 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("63","1","32","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("64","1","32","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("65","0","32","2022-04-01 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("66","1","32","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("67","1","32","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("68","1","32","2022-04-01 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("69","44","1","2022-04-01 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("70","44","1","2022-04-01 00:00:00","Usuario bloqueado","Se ingreso el numero de intentos validos");
INSERT INTO tbl_bitacora_sistema VALUES("71","44","1","2022-04-01 00:00:00","Intento de login fallido","El usuario bloqueado intento ingresar al sistema");
INSERT INTO tbl_bitacora_sistema VALUES("72","44","1","2022-04-02 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("73","44","32","2022-04-02 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("74","44","32","2022-04-02 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("75","44","32","2022-04-02 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("76","44","32","2022-04-02 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("77","44","32","2022-04-02 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("78","44","23","2022-04-02 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("79","1","32","2022-04-02 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("80","1","20","2022-04-02 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("81","1","17","2022-04-02 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("82","1","17","2022-04-02 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("83","1","17","2022-04-02 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("84","1","17","2022-04-02 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("85","1","17","2022-04-02 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("86","1","2","2022-04-02 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("87","1","2","2022-04-02 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("88","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("89","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("90","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("91","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("92","1","1","2022-04-03 00:00:00","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("93","44","1","2022-04-03 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("94","44","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("95","1","1","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("96","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("97","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("98","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("99","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("100","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("101","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("102","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("103","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("104","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("105","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("106","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("107","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("108","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("109","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("110","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("111","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("112","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("113","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("114","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("115","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("116","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("117","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("118","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("119","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("120","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("121","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("122","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("123","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("124","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("125","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("126","1","7","2022-04-03 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("127","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("128","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("129","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("130","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("131","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("132","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("133","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("134","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("135","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("136","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("137","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("138","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("139","1","3","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("140","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("141","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("142","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("143","1","3","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("144","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("145","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("146","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("147","44","1","2022-04-03 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("148","1","1","2022-04-03 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("149","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("150","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("151","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("152","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("153","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("154","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("155","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("156","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("157","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("158","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("159","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("160","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("161","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("162","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("163","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("164","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("165","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("166","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("167","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("168","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("169","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("170","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("171","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("172","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("173","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("174","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("175","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("176","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("177","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("178","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("179","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("180","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("181","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("182","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("183","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("184","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("185","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("186","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("187","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("188","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("189","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("190","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("191","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("192","1","2","2022-04-03 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("193","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("194","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("195","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("196","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("197","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("198","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("199","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("200","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("201","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("202","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("203","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("204","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("205","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("206","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("207","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("208","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("209","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("210","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("211","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("212","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("213","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("214","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("215","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("216","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("217","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("218","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("219","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("220","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("221","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("222","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("223","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("224","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("225","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("226","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("227","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("228","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("229","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("230","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("231","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("232","1","1","2022-04-03 00:00:00","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("233","1","1","2022-04-03 00:00:00","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("234","1","17","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("235","1","1","2022-04-03 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("236","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("237","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("238","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("239","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("240","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("241","44","1","2022-04-03 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("242","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("243","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("244","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("245","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("246","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("247","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("248","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("249","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("250","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("251","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("252","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("253","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("254","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("255","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("256","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("257","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("258","44","23","2022-04-03 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("259","44","23","2022-04-03 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("260","44","23","2022-04-03 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("261","44","23","2022-04-03 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("262","44","23","2022-04-03 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("263","44","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("264","44","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("265","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("266","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("267","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("268","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("269","1","17","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("270","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("271","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("272","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("273","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("274","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("275","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("276","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("277","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("278","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("279","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("280","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("281","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("282","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("283","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("284","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("285","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("286","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("287","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("288","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("289","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("290","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("291","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("292","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("293","1","1","2022-04-03 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("294","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("295","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("296","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("297","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("298","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("299","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("300","1","20","2022-04-03 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("301","1","1","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("302","1","1","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("303","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("304","1","4","2022-04-03 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("305","1","1","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("306","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("307","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("308","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("309","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("310","1","14","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("311","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("312","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("313","0","32","2022-04-03 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("314","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("315","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("316","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("317","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("318","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("319","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("320","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("321","0","32","2022-04-03 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("322","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("323","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("324","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("325","1","32","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("326","1","1","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("327","1","1","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("328","1","1","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("329","1","1","2022-04-03 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("330","2","1","2022-04-03 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("331","2","1","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("332","2","1","2022-04-03 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("333","2","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("334","2","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("335","2","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("336","2","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("337","2","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("338","2","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("339","2","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("340","2","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("341","2","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("342","2","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("343","2","1","2022-04-04 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("344","1","1","2022-04-04 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("345","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("346","1","4","2022-04-04 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("347","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("348","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("349","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("350","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("351","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("352","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("353","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("354","1","4","2022-04-04 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("355","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("356","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("357","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("358","1","1","2022-04-04 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("359","41","1","2022-04-04 00:00:00","Usuario bloqueado","Se ingreso el numero de intentos validos");
INSERT INTO tbl_bitacora_sistema VALUES("360","41","1","2022-04-04 00:00:00","Usuario bloqueado","Se ingreso el numero de intentos validos");
INSERT INTO tbl_bitacora_sistema VALUES("361","41","1","2022-04-04 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("362","41","1","2022-04-04 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("363","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("364","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("365","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("366","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("367","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("368","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("369","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("370","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("371","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("372","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("373","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("374","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("375","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("376","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("377","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("378","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("379","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("380","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("381","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("382","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("383","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("384","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("385","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("386","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("387","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("388","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("389","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("390","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("391","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("392","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("393","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("394","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("395","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("396","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("397","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("398","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("399","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("400","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("401","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("402","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("403","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("404","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("405","41","1","2022-04-04 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("406","41","1","2022-04-04 00:00:00","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("407","41","1","2022-04-04 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("408","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("409","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("410","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("411","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("412","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("413","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("414","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("415","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("416","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("417","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("418","41","1","2022-04-04 00:00:00","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("419","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("420","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("421","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("422","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("423","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("424","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("425","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("426","41","1","2022-04-04 00:00:00","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("427","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("428","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("429","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("430","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("431","41","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("432","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("433","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("434","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("435","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("436","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("437","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("438","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("439","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("440","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("441","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("442","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("443","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("444","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("445","41","1","2022-04-04 00:00:00","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("446","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("447","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("448","41","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("449","41","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("450","41","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("451","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("452","41","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("453","41","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("454","41","4","2022-04-04 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("455","41","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("456","41","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("457","41","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("458","41","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("459","41","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("460","41","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("461","41","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("462","41","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("463","41","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("464","41","1","2022-04-04 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("465","43","1","2022-04-04 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("466","43","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("467","1","1","2022-04-04 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("468","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("469","43","1","2022-04-04 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("470","52","1","2022-04-04 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("471","52","1","2022-04-04 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("472","1","1","2022-04-04 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("473","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("474","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("475","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("476","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("477","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("478","1","1","2022-04-04 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("479","52","1","2022-04-04 00:00:00","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("480","52","1","2022-04-04 00:00:00","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("481","52","1","2022-04-04 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("482","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("483","52","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("484","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("485","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("486","1","32","2022-04-04 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("487","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("488","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("489","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("490","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("491","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("492","52","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("493","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("494","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("495","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("496","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("497","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("498","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("499","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("500","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("501","1","4","2022-04-04 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("502","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("503","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("504","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("505","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("506","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("507","1","20","2022-04-04 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("508","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("509","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("510","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("511","1","14","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("512","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("513","1","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("514","1","4","2022-04-04 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("515","52","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("516","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("517","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("518","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("519","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("520","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("521","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("522","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("523","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("524","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("525","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("526","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("527","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("528","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("529","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("530","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("531","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("532","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("533","52","1","2022-04-04 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("534","52","1","2022-04-04 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("535","52","1","2022-04-04 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("536","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("537","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("538","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("539","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("540","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("541","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("542","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("543","52","1","2022-04-04 00:00:00","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("544","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("545","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("546","52","1","2022-04-04 00:00:00","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("547","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("548","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("549","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("550","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("551","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("552","52","1","2022-04-04 00:00:00","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("553","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("554","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("555","52","1","2022-04-04 00:00:00","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("556","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("557","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("558","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("559","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("560","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("561","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("562","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("563","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("564","52","1","2022-04-04 00:00:00","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("565","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("566","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("567","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("568","52","1","2022-04-04 00:00:00","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("569","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("570","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("571","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("572","52","1","2022-04-04 00:00:00","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("573","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("574","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("575","52","1","2022-04-04 00:00:00","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("576","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("577","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("578","52","1","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("579","52","1","2022-04-04 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("580","41","1","2022-04-04 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("581","41","17","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("582","41","17","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("583","41","17","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("584","41","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("585","41","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("586","41","32","2022-04-04 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("587","44","1","2022-04-04 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("588","44","1","2022-04-04 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("589","2","1","2022-04-04 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("590","2","2","2022-04-04 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("591","2","22","2022-04-04 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("592","2","22","2022-04-04 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("593","2","2","2022-04-04 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("594","2","2","2022-04-04 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("595","2","22","2022-04-04 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("596","2","22","2022-04-04 00:00:00","Ingreso a la tabla de Tutorias","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("597","2","2","2022-04-04 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("598","2","19","2022-04-04 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("599","2","19","2022-04-04 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("600","2","19","2022-04-04 00:00:00","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("601","2","1","2022-04-04 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("602","44","1","2022-04-04 00:00:00","Usuario bloqueado","Se ingreso el numero de intentos validos");
INSERT INTO tbl_bitacora_sistema VALUES("603","44","1","2022-04-04 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("604","44","1","2022-04-04 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("605","44","1","2022-04-04 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("606","44","1","2022-04-04 00:00:00","Usuario bloqueado","Se ingreso el numero de intentos validos");
INSERT INTO tbl_bitacora_sistema VALUES("607","44","1","2022-04-04 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("608","44","1","2022-04-05 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("609","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("610","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("611","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("612","41","1","2022-04-05 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("613","41","1","2022-04-05 00:00:00","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("614","41","1","2022-04-05 00:00:00","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("615","41","1","2022-04-05 00:00:00","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("616","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("617","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("618","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("619","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("620","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("621","41","1","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("622","44","1","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("623","44","1","2022-04-05 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("624","52","1","2022-04-05 00:00:00","Usuario bloqueado","Se ingreso el numero de intentos validos");
INSERT INTO tbl_bitacora_sistema VALUES("625","52","1","2022-04-05 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("626","52","1","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("627","41","7","2022-04-05 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("628","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("629","41","20","2022-04-05 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("630","41","20","2022-04-05 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("631","52","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("632","52","1","2022-04-05 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("633","44","1","2022-04-05 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("634","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("635","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("636","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("637","44","23","2022-04-05 00:00:00","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("638","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("639","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("640","44","23","2022-04-05 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("641","41","20","2022-04-05 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("642","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("643","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("644","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("645","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("646","44","23","2022-04-05 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("647","44","23","2022-04-05 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("648","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("649","44","1","2022-04-05 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("650","52","1","2022-04-05 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("651","52","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("652","52","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("653","52","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("654","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("655","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("656","41","32","2022-04-05 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("657","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("658","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("659","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("660","52","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("661","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("662","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("663","52","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("664","52","23","2022-04-05 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("665","52","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("666","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("667","41","32","2022-04-05 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("668","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("669","52","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("670","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("671","41","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("672","41","1","2022-04-05 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("673","44","1","2022-04-05 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("674","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("675","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("676","44","23","2022-04-05 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("677","52","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("678","44","23","2022-04-05 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("679","52","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("680","44","1","2022-04-05 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("681","1","1","2022-04-05 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("682","1","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("683","1","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("684","52","1","2022-04-05 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("685","44","1","2022-04-05 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("686","44","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("687","1","17","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("688","1","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("689","1","4","2022-04-05 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("690","1","7","2022-04-05 00:00:00","Ingreso a la bitacora universal","Consultar la informacion de la bitacora");
INSERT INTO tbl_bitacora_sistema VALUES("691","1","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("692","1","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("693","1","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("694","1","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("695","44","1","2022-04-05 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("696","1","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("697","1","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("698","1","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("699","44","1","2022-04-05 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("700","1","1","2022-04-05 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("701","52","1","2022-04-05 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("702","52","1","2022-04-05 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("703","52","1","2022-04-05 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("704","52","32","2022-04-05 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("705","52","31","2022-04-05 00:00:00","Ingreso a pruebas psicométricas","Proceso de mantenimiento de las pruebas psicométricas");
INSERT INTO tbl_bitacora_sistema VALUES("706","52","1","2022-04-06 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("707","1","1","2022-04-06 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("708","1","1","2022-04-06 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("709","52","1","2022-04-06 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("710","52","1","2022-04-06 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("711","0","1","2022-04-07 00:00:00","Registro","Se registro un Usuario ");
INSERT INTO tbl_bitacora_sistema VALUES("712","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("713","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("714","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("715","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("716","41","32","2022-04-07 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("717","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("718","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("719","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("720","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("721","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("722","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("723","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("724","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("725","41","32","2022-04-07 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("726","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("727","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("728","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("729","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("730","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("731","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("732","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("733","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("734","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("735","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("736","52","1","2022-04-07 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("737","44","1","2022-04-07 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("738","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("739","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("740","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("741","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("742","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("743","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("744","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("745","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("746","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("747","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("748","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("749","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("750","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("751","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("752","41","25","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("753","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("754","44","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("755","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("756","41","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("757","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("758","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("759","41","32","2022-04-07 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("760","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("761","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("762","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("763","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("764","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("765","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("766","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("767","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("768","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("769","44","23","2022-04-07 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("770","44","23","2022-04-07 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("771","44","20","2022-04-07 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("772","44","20","2022-04-07 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("773","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("774","44","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("775","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("776","44","20","2022-04-07 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("777","44","20","2022-04-07 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("778","44","23","2022-04-07 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("779","44","20","2022-04-07 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("780","44","20","2022-04-07 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("781","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("782","44","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("783","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("784","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("785","41","32","2022-04-07 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("786","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("787","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("788","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("789","44","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("790","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("791","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("792","44","23","2022-04-07 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("793","44","20","2022-04-07 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("794","44","20","2022-04-07 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("795","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("796","41","1","2022-04-07 00:00:00","Modificacion","Se edito un estado ");
INSERT INTO tbl_bitacora_sistema VALUES("797","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("798","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("799","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("800","41","32","2022-04-07 00:00:00","Registro","Se vizualiza citas registradas");
INSERT INTO tbl_bitacora_sistema VALUES("801","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("802","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("803","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("804","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("805","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("806","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("807","41","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("808","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("809","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("810","44","23","2022-04-07 00:00:00","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("811","44","20","2022-04-07 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("812","44","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("813","41","1","2022-04-07 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("814","44","1","2022-04-07 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("815","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("816","44","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("817","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("818","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("819","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("820","44","1","2022-04-07 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("821","52","1","2022-04-07 00:00:00","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("822","52","1","2022-04-07 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("823","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("824","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("825","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("826","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("827","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("828","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("829","52","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("830","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("831","52","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("832","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("833","52","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("834","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("835","52","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("836","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("837","52","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("838","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("839","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("840","52","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("841","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("842","52","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("843","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("844","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("845","52","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("846","52","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("847","52","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("848","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("849","52","2","2022-04-07 00:00:00","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("850","52","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("851","52","1","2022-04-07 00:00:00","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("852","44","1","2022-04-07 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("853","44","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("854","1","1","2022-04-07 00:00:00","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("855","1","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("856","1","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("857","1","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("858","1","20","2022-04-07 00:00:00","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("859","1","2","2022-04-07 00:00:00","Ingreso a la tabla de sacramentos","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("860","1","2","2022-04-07 00:00:00","Ingreso a la tabla de sacramentos","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("861","1","17","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("862","1","17","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("863","1","17","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("864","1","17","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("865","1","17","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("866","1","17","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("867","1","17","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("868","1","4","2022-04-07 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("869","1","17","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de tipo socioeconomico ","Ver los registros de los tipo socioeconomico");
INSERT INTO tbl_bitacora_sistema VALUES("870","1","6","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("871","1","6","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("872","1","6","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("873","1","6","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento objetos ","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("874","1","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("875","1","25","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de especialidad  ","Ver los registros de especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("876","1","2","2022-04-07 00:00:00","Ingreso a la tabla de sacramentos","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("877","1","4","2022-04-07 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("878","1","4","2022-04-07 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("879","1","4","2022-04-07 00:00:00","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("880","1","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("881","1","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("882","1","14","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("883","1","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("884","1","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("885","1","32","2022-04-07 00:00:00","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");



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
  `CODIGO_SECCION` int(5) DEFAULT NULL,
  `HORA` time DEFAULT NULL,
  `HORA_FINAL` time NOT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_FINAL` date DEFAULT NULL,
  `ANIO` date NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CARGA`),
  KEY `PK_COD_PE` (`CODIGO_PERSONA`),
  KEY `PK_COD_MOD` (`CODIGO_MODALIDAD`),
  KEY `PK_COD_TUTO` (`CODIGO_TUTORIA`),
  KEY `FK_CODSEC_CARG` (`CODIGO_SECCION`),
  CONSTRAINT `FK_CODSEC_CARG` FOREIGN KEY (`CODIGO_SECCION`) REFERENCES `tbl_seccion` (`CODIGO_SECCION`),
  CONSTRAINT `PK_COD_MOD` FOREIGN KEY (`CODIGO_MODALIDAD`) REFERENCES `tbl_modalidad` (`CODIGO_MODALIDA`),
  CONSTRAINT `PK_COD_PE` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `PK_COD_TUTO` FOREIGN KEY (`CODIGO_TUTORIA`) REFERENCES `tbl_tutoria` (`CODIGO_TUTORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_consulta_medica;

CREATE TABLE `tbl_consulta_medica` (
  `CODIGO_CONSULTA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PRECLINICA` int(5) DEFAULT NULL,
  `CODIGO_CITA` int(5) DEFAULT NULL,
  `SINTOMAS` varchar(500) NOT NULL,
  `DIAGNOSTICO_INGRESO` varchar(100) DEFAULT NULL,
  `EVOLUCION` varchar(200) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_consulta_medica VALUES("5","13","36","leves","bienn","bienn"," bienn","LUISMIGUEL","2022-04-07","","");
INSERT INTO tbl_consulta_medica VALUES("6","14","37","nooooo","noooo","nooooo"," noooo","LUISMIGUEL","2022-04-07","","");
INSERT INTO tbl_consulta_medica VALUES("7","15","38","NOOOO","NOOOO","NOOOO"," NOOOOO","LUISMIGUEL","2022-04-07","","");



DROP TABLE IF EXISTS tbl_contenido_socioeconomico;

CREATE TABLE `tbl_contenido_socioeconomico` (
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_TIPOSOCIO` int(5) NOT NULL,
  `NOMBRE_TIPO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_TIPOSOCIO` (`CODIGO_TIPOSOCIO`),
  CONSTRAINT `FK_COD_TIPOSOCIO` FOREIGN KEY (`CODIGO_TIPOSOCIO`) REFERENCES `tbl_tipo_socioeconomico` (`CODIGO_TIPOSOCIO`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_contenido_socioeconomico VALUES("1","1","Computadora");
INSERT INTO tbl_contenido_socioeconomico VALUES("2","1","Celular");
INSERT INTO tbl_contenido_socioeconomico VALUES("3","1","Tablet");
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
INSERT INTO tbl_contenido_socioeconomico VALUES("22","1","Reloj");



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
INSERT INTO tbl_correo_electronico VALUES("chapatin@mx.com","45");
INSERT INTO tbl_correo_electronico VALUES("rosa@unah.hn","46");
INSERT INTO tbl_correo_electronico VALUES("belkis@gmail.com","47");
INSERT INTO tbl_correo_electronico VALUES("mariorojas@gmail.com","48");
INSERT INTO tbl_correo_electronico VALUES("regelio@gmail.com","49");



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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_especialidad VALUES("1","PEDIATRA","2","AREA DE ATENCION A NIÑOS MENORES","2022-03-17","ADMIN","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("2","MEDICINA GENERAL","2","AREA DE ATENCION A CUALQUIER EDAD","2022-03-17","ADMIN","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("3","PSICOLOGIA_SOCIAL","3","AREA DE ATENCION A NIÑOS","2022-03-17","ADMIN","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("4","PSICOLOGIA COGNITIVA","3","Analiza el funcionamiento de la mem","2022-03-17","ADMIN","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("5","PSICOLOGIA","3","AREA DE PSICOLOGIA","0000-00-00","","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("6","PRIMERA COMUNION","4","CATEQUESIS","0000-00-00","","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("7","CONFIRMA","4","","0000-00-00","","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("8","PODOLOGIA","","AREA DEL ESTUDIO DE LOS PIES","0000-00-00","","0000-00-00","");



DROP TABLE IF EXISTS tbl_estado;

CREATE TABLE `tbl_estado` (
  `CODIGO_ESTADO` int(5) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_estudiante VALUES("24","41","2","SI","3","E","E","E","E");
INSERT INTO tbl_estudiante VALUES("25","39","2","SI","80","MATEMATICAS","VER CARICATURAS","REDES SOCIALES","ESTUDIAR EN LA UNIVERSIDAD");
INSERT INTO tbl_estudiante VALUES("26","42","9","NO","80","MATEMATICAS","VER TELEVISION","REDES SOCIALES","ESTUDIAR");



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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_estudiante_socioeconomico VALUES("35","1","24");
INSERT INTO tbl_estudiante_socioeconomico VALUES("36","11","24");
INSERT INTO tbl_estudiante_socioeconomico VALUES("37","14","24");
INSERT INTO tbl_estudiante_socioeconomico VALUES("38","21","24");
INSERT INTO tbl_estudiante_socioeconomico VALUES("39","2","25");
INSERT INTO tbl_estudiante_socioeconomico VALUES("40","13","25");
INSERT INTO tbl_estudiante_socioeconomico VALUES("41","15","25");
INSERT INTO tbl_estudiante_socioeconomico VALUES("42","20","25");
INSERT INTO tbl_estudiante_socioeconomico VALUES("43","1","26");
INSERT INTO tbl_estudiante_socioeconomico VALUES("44","2","26");
INSERT INTO tbl_estudiante_socioeconomico VALUES("45","3","26");
INSERT INTO tbl_estudiante_socioeconomico VALUES("46","13","26");
INSERT INTO tbl_estudiante_socioeconomico VALUES("47","16","26");
INSERT INTO tbl_estudiante_socioeconomico VALUES("48","19","26");
INSERT INTO tbl_estudiante_socioeconomico VALUES("49","20","26");
INSERT INTO tbl_estudiante_socioeconomico VALUES("50","21","26");



DROP TABLE IF EXISTS tbl_examenes_medicos;

CREATE TABLE `tbl_examenes_medicos` (
  `CODIGO_EXAMEN_MEDICO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXAMEN_MEDICO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_examenes_medicos VALUES("1","HEMOGRAMA");
INSERT INTO tbl_examenes_medicos VALUES("2","HECES");



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
  `TRATAMIENTOS` varchar(200) DEFAULT NULL,
  `ENFERMEDADES` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXPEDIENTE`),
  KEY `COD_CITA_PERSONA` (`CODIGO_PERSONA`),
  KEY `COD_TIPO_SANGRE` (`CODIGO_TIPO_SANGRE`),
  CONSTRAINT `COD_CITA_PERSONA` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `COD_TIPO_SANGRE` FOREIGN KEY (`CODIGO_TIPO_SANGRE`) REFERENCES `tbl_tipo_sangre` (`CODIGO_TIPO_SANGRE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_expediente_medico VALUES("7","42","1","no                        \n                            ","Ninguna");



DROP TABLE IF EXISTS tbl_expediente_psicologico_consulta;

CREATE TABLE `tbl_expediente_psicologico_consulta` (
  `CODIGO_EXPEDIENTE_PSICO` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_CITA` int(5) DEFAULT NULL,
  `SINTOMAS` varchar(100) DEFAULT NULL,
  `DIAGNOSTICO_INGRESO` varchar(200) DEFAULT NULL,
  `DIAGNOSTICO_EGRESO` varchar(200) DEFAULT NULL,
  `OBSEVARCIONES` varchar(600) DEFAULT NULL,
  `CREADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXPEDIENTE_PSICO`),
  KEY `FK_CODIGO_CITA_CONSULTA` (`CODIGO_CITA`),
  CONSTRAINT `FK_CODIGO_CITA_CONSULTA` FOREIGN KEY (`CODIGO_CITA`) REFERENCES `tbl_inscripcion_cita` (`CODIGO_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_expediente_psicologico_consulta VALUES("1","34","SI","SI","SI","SI","MARIOROJAS","2022-04-07","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("9","35","NOOOOOO","NOOOO","NOOOO","NOOOO","","2022-04-07","","");



DROP TABLE IF EXISTS tbl_expediente_psicologico_unico;

CREATE TABLE `tbl_expediente_psicologico_unico` (
  `CODIGO_EXPEDIENTE` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `ANTECEDENTES_FAMILIARES` varchar(500) DEFAULT NULL,
  `ANTECEDENTES_PERSONALES` varchar(500) DEFAULT NULL,
  `ANTECEDENTES_CLINICOS` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXPEDIENTE`),
  KEY `COD_EXP_PERSONA` (`CODIGO_PERSONA`),
  CONSTRAINT `COD_EXP_PERSONA` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_expediente_psicologico_unico VALUES("1","40","No                          \n                            ","no\n                            ","no                        \n                            ");
INSERT INTO tbl_expediente_psicologico_unico VALUES("2","42","si","si","si");



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
  `CODIGO_ESTADO` int(11) NOT NULL,
  `AREA_CITA` int(11) NOT NULL,
  `FECHA_CITA` date DEFAULT NULL,
  `HORARIO` time DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `CREADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CITA`),
  KEY `FK_CODIGO_PERSONAS` (`CODIGO_PERSONA`),
  KEY `FK_CODIGO_ESPECIALISTA` (`CODIGO_ESPECIALISTA`),
  KEY `cod_estaFK` (`CODIGO_ESTADO`),
  KEY `COD_AREA_FK` (`AREA_CITA`),
  CONSTRAINT `COD_AREA_FK` FOREIGN KEY (`AREA_CITA`) REFERENCES `tbl_area` (`CODIGO_AREA`),
  CONSTRAINT `FK_CODIGO_ESPECIALISTA` FOREIGN KEY (`CODIGO_ESPECIALISTA`) REFERENCES `tbl_persona_especialidad` (`CODIGO_PERSONA_ESPECIALIDAD`),
  CONSTRAINT `FK_CODIGO_PERSONAS` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `cod_estaFK` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_inscripcion_cita VALUES("34","42","4","8","3","2022-04-06","10:00:00","0000-00-00","2022-04-07","","");
INSERT INTO tbl_inscripcion_cita VALUES("35","42","4","11","3","2022-04-06","16:00:00","0000-00-00","2022-04-07","","");
INSERT INTO tbl_inscripcion_cita VALUES("36","42","1","13","2","2022-04-06","10:00:00","0000-00-00","2022-04-07","","");
INSERT INTO tbl_inscripcion_cita VALUES("37","42","1","13","2","2022-04-06","09:00:00","0000-00-00","2022-04-07","","");
INSERT INTO tbl_inscripcion_cita VALUES("38","42","1","12","2","2022-04-06","10:00:00","0000-00-00","2022-04-07","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;




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

INSERT INTO tbl_medicamento VALUES("1A","Acetaminofen","Para el dolor","LUISMIGUEL","2022-03-27","","0000-00-00");
INSERT INTO tbl_medicamento VALUES("1B","Tosan","para la tos","ADMIN","2022-03-31","","0000-00-00");
INSERT INTO tbl_medicamento VALUES("2A","Loratadina","para el dolor","","0000-00-00","","0000-00-00");



DROP TABLE IF EXISTS tbl_modalidad;

CREATE TABLE `tbl_modalidad` (
  `CODIGO_MODALIDA` int(5) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(20) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MODALIDA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO tbl_ms_hist_contraseña VALUES("33","52","Mario123**","52","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO tbl_objetos VALUES("33","GESTIONFAMILIARES","PERMISOS PARA INSERTAR DATOS SOCIECONOMICOS FAMILIARES","","2022-03-31","","0000-00-00");
INSERT INTO tbl_objetos VALUES("34","RECETAMEDICA","CRUD Y PROCESO","","2022-04-07","","");
INSERT INTO tbl_objetos VALUES("35","MEDICAMENTOS","PERMISO MEDICAMENTOS","","2022-04-07","","");



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
INSERT INTO tbl_parametros VALUES("4","NUM_MAX_CARACTER","","Administrador","2022-02-07","","2022-04-01");
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_parametros_usuarios VALUES("1","2","2","1","","0000-00-00","ADMIN","2022-03-11");
INSERT INTO tbl_parametros_usuarios VALUES("2","2","1","0","","0000-00-00","ADMIN","2022-03-10");
INSERT INTO tbl_parametros_usuarios VALUES("3","1","1","0","Administrador","2022-02-01","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("4","40","1","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("5","40","2","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("6","40","3","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("7","41","1","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("8","41","2","2","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("9","41","3","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("10","42","1","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("11","42","2","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("12","42","3","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("13","43","1","2","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("14","43","2","2","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("15","43","3","0","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("16","44","1","0","","0000-00-00","","0000-00-00");
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
INSERT INTO tbl_parametros_usuarios VALUES("34","50","1","1","","0000-00-00","","0000-00-00");
INSERT INTO tbl_parametros_usuarios VALUES("35","52","1","3","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("36","52","2","3","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("37","52","3","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("38","53","1","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("39","53","2","0","","","","");
INSERT INTO tbl_parametros_usuarios VALUES("40","53","3","0","","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_permisos VALUES("1","1","1","SI","SI","SI","NO","Administrador","2022-03-02","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("3","2","22","SI","SI","SI","SI","Administrador","2022-03-02","","2022-04-03");
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
INSERT INTO tbl_permisos VALUES("27","1","22","SI","SI","SI","SI","","2022-04-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("28","1","34","SI","SI","SI","SI","ADMIN","2022-04-07","","0000-00-00");
INSERT INTO tbl_permisos VALUES("29","5","34","SI","SI","SI","SI","ADMIN","2022-04-07","","0000-00-00");
INSERT INTO tbl_permisos VALUES("30","1","35","SI","SI","SI","SI","ADMIN","2022-04-07","","0000-00-00");
INSERT INTO tbl_permisos VALUES("31","5","35","SI","SI","SI","SI","ADMIN","2022-04-07","","0000-00-00");



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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_persona VALUES("1","Admin","Admin","Admin","Admin","","0000-00-00","","","2022-02-11","0000-00-00","1","","0000-00-00","","0000-00-00","");
INSERT INTO tbl_persona VALUES("2","PEDRO","LUIS","AMADOR","AMADO","9888888888","2022-02-14","Tegucigalpa","","2022-02-11","0000-00-00","2","Administrador","2022-02-11","LUISILLO","0000-00-00","M");
INSERT INTO tbl_persona VALUES("34","ALEXANDER","RAUL","GIMARAE","SARMINETO","0801199087873","2009-12-30","Tokio","","2022-02-25","0000-00-00","2","NO DEFINIDO","2022-02-25","","0000-00-00","2");
INSERT INTO tbl_persona VALUES("35","LUIS","COMUNICA","PADILLA","LOZANO","0801199012483","2009-12-30","Tokio","COL SATELITE","2022-02-25","0000-00-00","1","NO DEFINIDO","2022-02-25","","0000-00-00","1");
INSERT INTO tbl_persona VALUES("36","ROMARIO","PABLO","PAGUADA","ROGELIO","0889-1998-909","2010-12-29","TEGUCIGALPA","","2022-02-25","0000-00-00","2","NO DEFINIDO","2022-02-25","","2022-02-25","m");
INSERT INTO tbl_persona VALUES("37","MARIA ","DEL CARMEN","ROJAS","ESTAPE","0000000000000","2009-12-30","La Esperanza","","2022-02-25","0000-00-00","6","NO DEFINIDO","2022-02-25","ADMIN","0000-00-00","2");
INSERT INTO tbl_persona VALUES("38","LUIS","MIGUEL","MIGUEL","BERRIOS","0801-1098-908","2010-12-28","TEGUCIGALPA","","2022-02-25","0000-00-00","5","NO DEFINIDO","2022-02-25","","2022-02-25","f");
INSERT INTO tbl_persona VALUES("39","JUAN","ARNOLD","GARCIA","VALOR","0801-1998-878","2010-12-14","TEGUCIGALPA","","2022-02-28","0000-00-00","4","NO DEFINIDO","2022-02-28","","2022-02-28","m");
INSERT INTO tbl_persona VALUES("40","ROMARIO","ARNOLD","GARCIA","","0801-1008-909","2010-12-28","TEGUCIGALPA","","2022-02-28","0000-00-00","4","NO DEFINIDO","2022-02-28","","2022-02-28","m");
INSERT INTO tbl_persona VALUES("41","PRUEBA","ARNOLD ALEXANDER","GARCIA","VALOR","2312723188778","2010-12-30","TEGUCIGALPA","","2022-02-28","0000-00-00","4","NO DEFINIDO","2022-02-28","","2022-02-28","f");
INSERT INTO tbl_persona VALUES("42","CARLOS","ENMANUEL","AMADOR","SARMIENTO","0801199801644","2022-03-02","TEGUCIGALPA","","2022-03-05","0000-00-00","4","ADMIN","2022-03-05","","0000-00-00","M");
INSERT INTO tbl_persona VALUES("43","SAMUEL","JOSUE","AMADOR","HERRERA","2147483647","1999-10-04","distrito","EN UNA CASITA,CON SU MICHI UWU","2022-03-23","0000-00-00","5","ADMIN","0000-00-00","","0000-00-00","2");
INSERT INTO tbl_persona VALUES("44","FRANCSICO","PABLO","PADILLA","PAVON","08011992258","2013-02-01","","Tegucigalpa","2022-03-02","0000-00-00","7","","0000-00-00","","0000-00-00","");
INSERT INTO tbl_persona VALUES("45","ROBERTO","CHAPATIN","GOMEZ","BOLAÑOS","2147483647","1991-05-01","CIUDAD DE MEXICO","LA LAGUNA","2022-03-29","0000-00-00","5","ADMIN","0000-00-00","","0000-00-00","2");
INSERT INTO tbl_persona VALUES("46","ROSA","MARIA","RODRIGUEZ","","2147483647","2009-12-31","Tegucigalpa","LA LAGUNA","2022-03-29","0000-00-00","7","","0000-00-00","","0000-00-00","2");
INSERT INTO tbl_persona VALUES("47","BELKIS","ANTONELLA","CASTELLANOS","LOPEZ","2147483647","2010-01-01","tegucigalpa","KENNEDY","2022-03-31","0000-00-00","8","","0000-00-00","","0000-00-00","1");
INSERT INTO tbl_persona VALUES("48","MARIO","SANDRO","ROJAS","ESTAPE","2147483647","1977-10-08","TEGUCIGALPA","MADRID ESPANA","2022-04-03","","6","","0000-00-00","","0000-00-00","2");
INSERT INTO tbl_persona VALUES("49","ROGELIO","PABLO","CASTELLON","PADILLA","2147483647","2010-01-01","TEGUCIGALPA","LA LAGUNA","2022-04-06","","2","","0000-00-00","","0000-00-00","2");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_persona_especialidad VALUES("1","38","2","2022-03-23","ADMIN","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("2","45","2","2022-03-29","ADMIN","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("3","47","6","2022-03-31","","0000-00-00","");
INSERT INTO tbl_persona_especialidad VALUES("4","48","3","2022-04-03","","0000-00-00","");



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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_personas_alergias VALUES("7","7","1");



DROP TABLE IF EXISTS tbl_personas_apariencia;

CREATE TABLE `tbl_personas_apariencia` (
  `CODIGO_PERSONAS_APARIENCIA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_APARIENCIA` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_APARIENCIA`),
  KEY `CODI_PER_EXPE_APA` (`CODIGO_EXPEDIENTE`),
  KEY `CODI_PER_APARI` (`CODIGO_APARIENCIA`),
  CONSTRAINT `CODI_PER_APARI` FOREIGN KEY (`CODIGO_APARIENCIA`) REFERENCES `tbl_apariencia_fisica` (`CODIGO_APARIENCIA`),
  CONSTRAINT `CODI_PER_EXPE_APA` FOREIGN KEY (`CODIGO_EXPEDIENTE`) REFERENCES `tbl_expediente_medico` (`CODIGO_EXPEDIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_personas_apariencia VALUES("2","7","1");



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_personas_sintomas VALUES("2","2","1");



DROP TABLE IF EXISTS tbl_personas_transtornos;

CREATE TABLE `tbl_personas_transtornos` (
  `CODIGO_PERSONAS_TRANSTORNOS` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_TRANSTORNO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_TRANSTORNOS`),
  KEY `CODI_PER_EXPE` (`CODIGO_EXPEDIENTE`),
  KEY `CODI_PER_TRANST` (`CODIGO_TRANSTORNO`),
  CONSTRAINT `CODI_PER_EXPE` FOREIGN KEY (`CODIGO_EXPEDIENTE`) REFERENCES `tbl_expediente_medico` (`CODIGO_EXPEDIENTE`),
  CONSTRAINT `CODI_PER_TRANST` FOREIGN KEY (`CODIGO_TRANSTORNO`) REFERENCES `tbl_transtornos_corporales` (`CODIGO_TRANSTORNO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_personas_transtornos VALUES("4","7","1");



DROP TABLE IF EXISTS tbl_preclinica;

CREATE TABLE `tbl_preclinica` (
  `CODIGO_PRECLINICA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CITA` int(5) DEFAULT NULL,
  `PESO` varchar(10) DEFAULT NULL,
  `MASA_CORPORAL` varchar(30) NOT NULL,
  `ESTATURA` varchar(10) DEFAULT NULL,
  `TEMPERATURA` varchar(30) NOT NULL,
  `PULSO` varchar(30) NOT NULL,
  `FRECUENCIA_CARDIACA` varchar(10) DEFAULT NULL,
  `FRECUENCIA_RESPIRATORIA` varchar(10) DEFAULT NULL,
  `DESNUTRICION` varchar(40) NOT NULL,
  `CREADO_POR` varchar(20) NOT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PRECLINICA`),
  KEY `FK_CODIGO_CITA` (`CODIGO_CITA`),
  CONSTRAINT `FK_CODIGO_CITA` FOREIGN KEY (`CODIGO_CITA`) REFERENCES `tbl_inscripcion_cita` (`CODIGO_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_preclinica VALUES("13","36","150","18.5","1.70","32","90","70/80","12","Moderado","LUISMIGUEL","2022-04-07","","");
INSERT INTO tbl_preclinica VALUES("14","37","150","18.5","1.70","35","70","70/80","12","Moderado","LUISMIGUEL","2022-04-07","","");
INSERT INTO tbl_preclinica VALUES("15","38","160","18.5","1.70","36","70","80/70","12","No tiene","LUISMIGUEL","2022-04-07","","");



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
INSERT INTO tbl_preguntas VALUES("13","¿Cual es tu comida favorita?"," ADMIN","2022-03-09","","0000-00-00");
INSERT INTO tbl_preguntas VALUES("14","¿Cuál es tu mas grande fobia actual?"," ADMIN","2022-03-09","","2022-04-01");



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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_preguntas_usuarios VALUES("1","1","2","BALEADA","Administrador","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("3","2","2","KLDSLKJDASK","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("6","3","2","MONJA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("7","4","2","JKJKGKJG","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("21","1","47","POLLO","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("27","1","43","BALEADA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("28","2","43","BOD ESPONJA","","0000-00-00","","0000-00-00");
INSERT INTO tbl_preguntas_usuarios VALUES("42","3","41","SPIDERMAN","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("51","1","52","ARROZ","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("52","2","52","PADRINOS MAGICOS","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("53","3","52","SPIDERMAN","","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_receta_medica VALUES("7","5","1A","TOMAR","TOMAR","2022-04-07","ADMIN","2022-04-07","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("8","6","1B","NO","NO","0000-00-00","ADMIN","0000-00-00","","0000-00-00");



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




DROP TABLE IF EXISTS tbl_sacramento;

CREATE TABLE `tbl_sacramento` (
  `CODIGO_SACRAMENTO` int(5) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) NOT NULL,
  `DESCRIPCION` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SACRAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_sacramento VALUES("1","BAUTISMO","El primer sacramento del crist");
INSERT INTO tbl_sacramento VALUES("2","CONFIRMACION","La Confirmación complementa el");
INSERT INTO tbl_sacramento VALUES("3","PRIMERA COMUNION","Celebración de la Iglesia dond");
INSERT INTO tbl_sacramento VALUES("4","NINGUNO","NINGUNO");



DROP TABLE IF EXISTS tbl_sacramento_persona;

CREATE TABLE `tbl_sacramento_persona` (
  `CODIGO_CORRELATIVO` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_SACRAMENTO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CORRELATIVO`),
  KEY `FK_CP_SACRAMENTO` (`CODIGO_PERSONA`),
  KEY `FK_CS_SACRAMENTO` (`CODIGO_SACRAMENTO`),
  CONSTRAINT `FK_CP_SACRAMENTO` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `FK_CS_SACRAMENTO` FOREIGN KEY (`CODIGO_SACRAMENTO`) REFERENCES `tbl_sacramento` (`CODIGO_SACRAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_seccion;

CREATE TABLE `tbl_seccion` (
  `CODIGO_SECCION` int(5) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) NOT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SECCION`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_seccion VALUES("1","A1","A1");
INSERT INTO tbl_seccion VALUES("2","A2","A2");
INSERT INTO tbl_seccion VALUES("3","A3","A3");



DROP TABLE IF EXISTS tbl_sexo;

CREATE TABLE `tbl_sexo` (
  `CODIGO_SEXO` char(1) COLLATE utf8mb4_bin NOT NULL,
  `SEXO` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`CODIGO_SEXO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_sexo VALUES("F","Femenino");
INSERT INTO tbl_sexo VALUES("M","Masculino");



DROP TABLE IF EXISTS tbl_sintomas_neuroticos;

CREATE TABLE `tbl_sintomas_neuroticos` (
  `CODIGO_SINTOMA_NEUROTICO` int(5) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SINTOMA_NEUROTICO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_sintomas_neuroticos VALUES("1","PESADILLAS");
INSERT INTO tbl_sintomas_neuroticos VALUES("2","CONVULSIONES");



DROP TABLE IF EXISTS tbl_telefono;

CREATE TABLE `tbl_telefono` (
  `NUMERO_TELEFONO` int(10) NOT NULL,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  PRIMARY KEY (`NUMERO_TELEFONO`),
  KEY `Numero_perso` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_telefono VALUES("65465465","35");
INSERT INTO tbl_telefono VALUES("0","43");
INSERT INTO tbl_telefono VALUES("32995237","45");
INSERT INTO tbl_telefono VALUES("89732133","48");
INSERT INTO tbl_telefono VALUES("32998585","49");



DROP TABLE IF EXISTS tbl_tipo_persona;

CREATE TABLE `tbl_tipo_persona` (
  `CODIGO_TIPO_PERSONA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) NOT NULL,
  PRIMARY KEY (`CODIGO_TIPO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_tipo_persona VALUES("1","Administrador");
INSERT INTO tbl_tipo_persona VALUES("2","TUTOR");
INSERT INTO tbl_tipo_persona VALUES("3","no definido");
INSERT INTO tbl_tipo_persona VALUES("4","ESTUDIANTE");
INSERT INTO tbl_tipo_persona VALUES("5","MEDICO");
INSERT INTO tbl_tipo_persona VALUES("6","PSICOLOGO");
INSERT INTO tbl_tipo_persona VALUES("7","FAMILIAR");
INSERT INTO tbl_tipo_persona VALUES("8","CATEQUISTA");



DROP TABLE IF EXISTS tbl_tipo_sangre;

CREATE TABLE `tbl_tipo_sangre` (
  `CODIGO_TIPO_SANGRE` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(10) DEFAULT NULL,
  `CREADO_POR` varchar(20) NOT NULL,
  `FECHA_CREACION` date NOT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date NOT NULL,
  PRIMARY KEY (`CODIGO_TIPO_SANGRE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_tipo_sangre VALUES("1","TIPOA","ADMIN","2022-03-31","","0000-00-00");
INSERT INTO tbl_tipo_sangre VALUES("2","TIPOB","ADMIN","2022-03-31","","0000-00-00");



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



DROP TABLE IF EXISTS tbl_transtornos_corporales;

CREATE TABLE `tbl_transtornos_corporales` (
  `CODIGO_TRANSTORNO` int(10) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TRANSTORNO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_transtornos_corporales VALUES("1","SISTEMA RESPIRATORIO");
INSERT INTO tbl_transtornos_corporales VALUES("2","SISTEMA DIGESTIVO");
INSERT INTO tbl_transtornos_corporales VALUES("5","NINGUNO");



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS tbl_usuario;

CREATE TABLE `tbl_usuario` (
  `CODIGO_USUARIO` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `NOMBRE_USUARIO` varchar(15) NOT NULL,
  `CODIGO_ESTADO` int(5) NOT NULL,
  `CODIGO_TIPO_ROL` int(5) DEFAULT NULL,
  `CONTRASENA` varchar(255) NOT NULL,
  `FECHA_VENCIMIENTO` date DEFAULT NULL,
  `CREADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(15) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_USUARIO`),
  KEY `FK_CODPER_USU` (`CODIGO_PERSONA`),
  KEY `FK_CODROL_USU` (`CODIGO_TIPO_ROL`),
  KEY `FK_CODES_USU` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_usuario VALUES("1","1","ADMIN","2","1","12345","0000-00-00","","0000-00-00","","0000-00-00");
INSERT INTO tbl_usuario VALUES("2","2","PEDROLUIS","2","2","Pedro123","2022-02-28","","0000-00-00","2","0000-00-00");
INSERT INTO tbl_usuario VALUES("40","34","ALEXANDER","1","2","$2y$10$E1b07xJE.u2HazAJBG9KcO.1C.15MP9ZrL62FgmjEkeSBp48Xcwuq","0000-00-00","","2022-02-25","ADMIN","2022-03-07");
INSERT INTO tbl_usuario VALUES("41","35","LUISILLO","2","1","Luis123**","0000-00-00","","2022-02-25","41","0000-00-00");
INSERT INTO tbl_usuario VALUES("42","36","RAFALEE","5","3","$z&[!a[?","2022-04-26","","2022-02-25","","0000-00-00");
INSERT INTO tbl_usuario VALUES("43","37","MARIROJAS","2","4","Mari123*","0000-00-00","","2022-02-25","43","0000-00-00");
INSERT INTO tbl_usuario VALUES("44","38","LUISMIGUEL","2","5","Luis123*","2022-04-26","","2022-02-25","ADMIN","2022-03-17");
INSERT INTO tbl_usuario VALUES("45","39","LUISFONSI","6","3","Luis12*","2022-04-29","","2022-02-28","","0000-00-00");
INSERT INTO tbl_usuario VALUES("46","40","PRUEBE","6","3","Prueb12*","2022-04-29","","2022-02-28","","0000-00-00");
INSERT INTO tbl_usuario VALUES("47","41","PRUEBES","2","3","Pruebe12**","2022-04-29","","2022-02-28","ADMIN","2022-03-10");
INSERT INTO tbl_usuario VALUES("49","43","JOSUEHERRERA","1","3",":gN\n??7[u&+???","0000-00-00","ADMIN","2022-03-23","","0000-00-00");
INSERT INTO tbl_usuario VALUES("50","45","ROBERTO","2","5","?Їz???Y%???Z","0000-00-00","ADMIN","2022-03-29","","0000-00-00");
INSERT INTO tbl_usuario VALUES("51","47","BELKIS","1","3","3S:<-??Ga??q??","0000-00-00","","2022-03-31","","0000-00-00");
INSERT INTO tbl_usuario VALUES("52","48","MARIOROJAS","2","4","Mario123**","","","2022-04-03","","2022-04-03");
INSERT INTO tbl_usuario VALUES("53","49","REGELIO","1","0","&\\ ?????Ǳၣ?A","","","2022-04-06","","");



SET FOREIGN_KEY_CHECKS=1;