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

INSERT INTO tbl_alergias VALUES("1","ALERGIA AL AGUA","ALERGIA EXTRAÑA","EMILIO","2022-04-19","","0000-00-00");
INSERT INTO tbl_alergias VALUES("2","ALERGIA AL POLVO","REACCION ALERGICA AL POLVO","EMILIO","2022-04-19","","0000-00-00");
INSERT INTO tbl_alergias VALUES("3","NINGUNA","NO HAY, NO EXISTE","EMILIO","2022-04-19","","0000-00-00");



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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_area VALUES("1","ACADEMICA","AREA DE CLASES","ADMIN","2022-03-17","2022-04-07","ADMIN");
INSERT INTO tbl_area VALUES("2","MEDICA","AREA DE MEDICINA","ADMIN","2022-03-17","2022-04-07","ADMIN");
INSERT INTO tbl_area VALUES("3","PSICOLOGICA","AREA DE PSICOLOGIA","ADMIN","2022-03-17","2022-04-22","ARNOLDIÑO");
INSERT INTO tbl_area VALUES("4","ESPIRITUAL","AREA ESPIRITUAL","ARNOLDIÑO","2022-04-22","0000-00-00","");
INSERT INTO tbl_area VALUES("6","ODONTOLOGICA","ODONTOLOGIA GENERAL ","","2022-04-26","0000-00-00","");



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
  KEY `FK_COD_OBJ_BIT` (`CODIGO_OBJETO`)
) ENGINE=InnoDB AUTO_INCREMENT=614 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_bitacora_sistema VALUES("1","1","1","2022-06-05","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("2","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("3","1","13","2022-06-05","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("4","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("5","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("6","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("7","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("8","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("9","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("10","1","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("11","1","1","2022-06-05","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("12","2","1","2022-06-05","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("13","2","1","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("14","2","1","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("15","2","1","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("16","2","1","2022-06-05","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("17","2","1","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("18","2","1","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("19","2","1","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("20","2","20","2022-06-05","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("21","2","20","2022-06-05","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("22","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("23","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("24","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("25","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("26","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("27","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("28","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("29","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("30","2","14","2022-06-05","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("31","2","13","2022-06-05","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("32","2","1","2022-06-05","salio al modulo de administrador","Usuario se salio del sistema");
INSERT INTO tbl_bitacora_sistema VALUES("33","2","1","2022-06-05","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("34","2","1","2022-06-05","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("35","2","1","2022-06-05","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("36","2","1","2022-06-05","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("38","1","1","2022-06-06","Autoregistro","El usuario se autoregistro");
INSERT INTO tbl_bitacora_sistema VALUES("40","1","1","2022-06-06","Autoregistro","El usuario se autoregistro");
INSERT INTO tbl_bitacora_sistema VALUES("42","1","1","2022-06-06","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("43","1","1","2022-06-06","Intento de login fallido","Ingreso de Credenciales incorrectas");
INSERT INTO tbl_bitacora_sistema VALUES("45","1","1","2022-06-06","Correo de recuperacion","Solicitud recuperacion de contraseña ");
INSERT INTO tbl_bitacora_sistema VALUES("46","1","1","2022-06-06","Cambio de contraseña","Cambio la contraseña por metodo correo");
INSERT INTO tbl_bitacora_sistema VALUES("47","1","1","2022-06-06","Ingreso al modulo de administrador","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("48","1","14","2022-06-06","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("49","1","14","2022-06-06","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("50","1","13","2022-06-06","Ingreso a la tabla de registro de personas","Usuario se autentifico");
INSERT INTO tbl_bitacora_sistema VALUES("51","1","1","2022-06-06","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("52","1","1","2022-06-06","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("53","1","32","2022-06-06","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("54","1","2","2022-06-06","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("55","0","54","2022-06-17","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("56","1","54","2022-06-17","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("57","1","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("58","1","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("59","1","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("60","1","13","2022-06-17","INSERCIÓN","SE REGISTRO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("61","1","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("62","1","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("63","1","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("64","1","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("65","1","3","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("66","1","54","2022-06-17","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("67","2","1","2022-06-17","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("68","2","1","2022-06-17","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("69","2","54","2022-06-17","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("70","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("71","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("72","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("73","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("74","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("75","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("76","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("77","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("78","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("79","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("80","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("81","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("82","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("83","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("84","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("85","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("86","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("87","2","5","2022-06-17","INGRESO AL MANTENIMIENTO DE PERMISOS","VIZUALIZAR LOS REGISTROS DE LOS PERMISOS");
INSERT INTO tbl_bitacora_sistema VALUES("88","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("89","2","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("90","2","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("91","2","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("92","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("93","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("94","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("95","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("96","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("97","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("98","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("99","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("100","2","5","2022-06-17","INGRESO AL MANTENIMIENTO DE PERMISOS","VIZUALIZAR LOS REGISTROS DE LOS PERMISOS");
INSERT INTO tbl_bitacora_sistema VALUES("101","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("102","2","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("103","2","48","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO DE CITAS GENERALES ","MANTENIMIENTO REGISTRO DE CITAS GENERALES");
INSERT INTO tbl_bitacora_sistema VALUES("104","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("105","2","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("106","2","14","2022-06-17","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("107","2","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("108","2","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("109","2","54","2022-06-17","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("110","1","54","2022-06-17","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("111","1","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("112","1","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("113","1","14","2022-06-17","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("114","1","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("115","1","54","2022-06-17","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("116","2","54","2022-06-17","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("117","2","54","2022-06-17","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("118","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("119","2","5","2022-06-17","INGRESO AL MANTENIMIENTO DE PERMISOS","VIZUALIZAR LOS REGISTROS DE LOS PERMISOS");
INSERT INTO tbl_bitacora_sistema VALUES("120","2","5","2022-06-17","INGRESO AL MANTENIMIENTO DE PERMISOS","VIZUALIZAR LOS REGISTROS DE LOS PERMISOS");
INSERT INTO tbl_bitacora_sistema VALUES("121","2","2","2022-06-17","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("122","2","6","2022-06-17","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("123","2","6","2022-06-17","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("124","2","54","2022-06-17","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("125","2","54","2022-06-17","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("126","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("127","2","2","2022-06-17","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("128","2","23","2022-06-17","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("129","2","23","2022-06-17","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("130","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("131","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("132","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("133","2","1","2022-06-17","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("134","2","18","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO CONTENIDO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("135","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("136","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("137","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("138","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("139","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("140","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("141","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("142","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("143","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("144","2","48","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO DE CITAS GENERALES ","MANTENIMIENTO REGISTRO DE CITAS GENERALES");
INSERT INTO tbl_bitacora_sistema VALUES("145","2","32","2022-06-17","INGRESO AL MATENIMIENTO CITAS HOY ","MANTENIMIENTO A LAS CITAS DEL DIA DE HOY");
INSERT INTO tbl_bitacora_sistema VALUES("146","2","32","2022-06-17","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("147","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("148","2","2","2022-06-17","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("149","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("150","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("151","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("152","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("153","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("154","2","13","2022-06-17","INSERCIÓN","SE REGISTRO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("155","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("156","2","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("157","2","14","2022-06-17","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("158","2","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("159","2","14","2022-06-17","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("160","2","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("161","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("162","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("163","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("164","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("165","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("166","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("167","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("168","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("169","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("170","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("171","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("172","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("173","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("174","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("175","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("176","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("177","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("178","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("179","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("180","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("181","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("182","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("183","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("184","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("185","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("186","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("187","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("188","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("189","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("190","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("191","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("192","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("193","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("194","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("195","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("196","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("197","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("198","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("199","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("200","2","1","2022-06-17","Modificacion","Se edito un estudiante ");
INSERT INTO tbl_bitacora_sistema VALUES("201","2","1","2022-06-17","Modificacion","Se edito un estudiante ");
INSERT INTO tbl_bitacora_sistema VALUES("202","2","1","2022-06-17","Modificacion","Se edito un estudiante ");
INSERT INTO tbl_bitacora_sistema VALUES("203","2","1","2022-06-17","Modificacion","Se edito un estudiante ");
INSERT INTO tbl_bitacora_sistema VALUES("204","2","1","2022-06-17","Modificacion","Se edito un estudiante ");
INSERT INTO tbl_bitacora_sistema VALUES("205","2","1","2022-06-17","Modificacion","Se edito un estudiante ");
INSERT INTO tbl_bitacora_sistema VALUES("206","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("207","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("208","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("209","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("210","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("211","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("212","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("213","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("214","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("215","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("216","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("217","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("218","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("219","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("220","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("221","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("222","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("223","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("224","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("225","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("226","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("227","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("228","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("229","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("230","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("231","2","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("232","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("233","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("234","2","13","2022-06-17","INSERCIÓN","SE REGISTRO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("235","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("236","2","14","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("237","2","13","2022-06-17","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("238","2","13","2022-06-17","INSERCIÓN","SE REGISTRO UNA PERSONA");
INSERT INTO tbl_bitacora_sistema VALUES("239","2","25","2022-06-17","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("240","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("241","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("242","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("243","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("244","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("245","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("246","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("247","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("248","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("249","2","3","2022-06-17","No eliminar parámetro","Intento de invalido de eliminar parametro");
INSERT INTO tbl_bitacora_sistema VALUES("250","2","3","2022-06-17","No eliminar parámetro","Intento de invalido de eliminar parametro");
INSERT INTO tbl_bitacora_sistema VALUES("251","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("252","2","3","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("253","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("254","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("255","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("256","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("257","2","45","2022-06-17","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("258","2","45","2022-06-17","MODIFICACIÓN","SE MODIFICO UN SACRAMENTO");
INSERT INTO tbl_bitacora_sistema VALUES("259","2","45","2022-06-17","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("260","2","18","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO CONTENIDO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("261","2","17","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("262","2","17","2022-06-17","MODIFICACIÓN","SE MODIFICO UN TIPO SOCIOECONÓMICO ");
INSERT INTO tbl_bitacora_sistema VALUES("263","2","17","2022-06-17","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("264","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("265","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("266","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("267","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("268","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("269","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("270","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("271","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("272","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("273","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("274","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("275","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("276","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("277","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("278","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("279","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("280","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("281","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("282","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("283","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("284","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("285","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("286","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("287","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("288","2","20","2022-06-17","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("289","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("290","2","4","2022-06-17","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("291","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("292","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("293","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("294","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("295","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("296","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("297","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("298","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("299","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("300","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("301","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("302","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("303","2","43","2022-06-17","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("304","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("305","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("306","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("307","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("308","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("309","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("310","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("311","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("312","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("313","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("314","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("315","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("316","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("317","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("318","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("319","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("320","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("321","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("322","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("323","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("324","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("325","2","3","2022-06-18","Eliminar parámetro","Se eliminó un registro de parámetro");
INSERT INTO tbl_bitacora_sistema VALUES("326","2","3","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("327","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("328","2","3","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("329","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("330","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("331","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("332","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("333","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("334","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("335","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("336","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("337","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("338","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("339","2","2","2022-06-18","Modificacion","Se edito un familiar ");
INSERT INTO tbl_bitacora_sistema VALUES("340","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("341","2","2","2022-06-18","Modificacion","Se edito un familiar ");
INSERT INTO tbl_bitacora_sistema VALUES("342","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("343","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("344","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("345","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("346","2","2","2022-06-18","Modificacion","Se edito un familiar ");
INSERT INTO tbl_bitacora_sistema VALUES("347","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("348","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("349","2","2","2022-06-18","Modificacion","Se edito un familiar ");
INSERT INTO tbl_bitacora_sistema VALUES("350","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("351","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("352","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("353","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("354","2","13","2022-06-18","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("355","2","14","2022-06-18","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("356","2","13","2022-06-18","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("357","2","43","2022-06-18","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("358","2","4","2022-06-18","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("359","2","45","2022-06-18","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("360","2","18","2022-06-18","INGRESO A LA PANTALLA MANTENIMIENTO CONTENIDO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("361","2","17","2022-06-18","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("362","2","44","2022-06-18","INGRESO A LA PANTALLA MANTENIMIENTO PARENTESCO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("363","2","45","2022-06-18","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("364","2","54","2022-06-18","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("365","1","54","2022-06-18","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("366","1","43","2022-06-19","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("367","1","4","2022-06-19","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("368","1","4","2022-06-19","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("369","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("370","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("371","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("372","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("373","1","45","2022-06-19","MODIFICACIÓN","SE MODIFICO UN SACRAMENTO");
INSERT INTO tbl_bitacora_sistema VALUES("374","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("375","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("376","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("377","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("378","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("379","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("380","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("381","1","45","2022-06-19","MODIFICACIÓN","SE MODIFICO UN SACRAMENTO");
INSERT INTO tbl_bitacora_sistema VALUES("382","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("383","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("384","1","4","2022-06-19","INGRESO A MANTENIMIENTO PREGUNTA","MANTENIMIENTO AL REGISTRO DE PREGUNTAS");
INSERT INTO tbl_bitacora_sistema VALUES("385","1","12","2022-06-19","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("386","1","12","2022-06-19","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("387","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("388","1","45","2022-06-19","MODIFICACIÓN","SE MODIFICO UN SACRAMENTO");
INSERT INTO tbl_bitacora_sistema VALUES("389","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("390","1","45","2022-06-19","INGRESO AL MANTENIMIENTO SACRAMENTOS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("391","1","18","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO CONTENIDO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("392","1","17","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("393","1","18","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO CONTENIDO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("394","1","18","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO CONTENIDO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("395","1","17","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("396","1","18","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO CONTENIDO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("397","1","17","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("398","1","17","2022-06-19","MODIFICACIÓN","SE MODIFICO UN TIPO SOCIOECONÓMICO ");
INSERT INTO tbl_bitacora_sistema VALUES("399","1","17","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("400","1","44","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO PARENTESCO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("401","1","43","2022-06-19","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("402","1","20","2022-06-19","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("403","1","20","2022-06-19","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("404","1","4","2022-06-19","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("405","1","5","2022-06-19","INGRESO AL MANTENIMIENTO DE PERMISOS","VIZUALIZAR LOS REGISTROS DE LOS PERMISOS");
INSERT INTO tbl_bitacora_sistema VALUES("406","1","25","2022-06-19","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("407","1","13","2022-06-19","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("408","1","25","2022-06-19","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("409","1","14","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("410","1","13","2022-06-19","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("411","1","25","2022-06-19","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("412","1","14","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("413","1","25","2022-06-19","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("414","1","14","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("415","1","25","2022-06-19","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("416","1","20","2022-06-19","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("417","1","43","2022-06-19","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("418","1","20","2022-06-19","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("419","1","43","2022-06-19","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("420","1","4","2022-06-19","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("421","1","48","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO DE CITAS GENERALES ","MANTENIMIENTO REGISTRO DE CITAS GENERALES");
INSERT INTO tbl_bitacora_sistema VALUES("422","1","32","2022-06-19","INGRESO AL MATENIMIENTO CITAS HOY ","MANTENIMIENTO A LAS CITAS DEL DIA DE HOY");
INSERT INTO tbl_bitacora_sistema VALUES("423","1","48","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO DE CITAS GENERALES ","MANTENIMIENTO REGISTRO DE CITAS GENERALES");
INSERT INTO tbl_bitacora_sistema VALUES("424","1","32","2022-06-19","INGRESO AL MATENIMIENTO CITAS HOY ","MANTENIMIENTO A LAS CITAS DEL DIA DE HOY");
INSERT INTO tbl_bitacora_sistema VALUES("425","1","32","2022-06-19","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("426","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("427","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("428","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("429","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("430","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("431","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("432","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("433","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("434","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("435","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("436","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("437","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("438","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("439","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("440","1","25","2022-06-19","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("441","1","25","2022-06-19","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("442","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("443","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("444","1","25","2022-06-19","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("445","1","13","2022-06-19","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("446","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("447","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("448","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("449","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("450","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("451","1","23","2022-06-19","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("452","1","23","2022-06-19","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("453","1","23","2022-06-19","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("454","1","23","2022-06-19","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("455","1","23","2022-06-19","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("456","1","23","2022-06-19","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("457","1","23","2022-06-19","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("458","1","23","2022-06-19","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("459","1","23","2022-06-19","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("460","1","23","2022-06-19","Ingreso al proceso de matricula","Proceso que permite matricular tutorias al estudiante");
INSERT INTO tbl_bitacora_sistema VALUES("461","1","23","2022-06-19","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("462","1","23","2022-06-19","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("463","1","23","2022-06-19","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("464","1","23","2022-06-19","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("465","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("466","1","5","2022-06-19","INGRESO AL MANTENIMIENTO DE PERMISOS","VIZUALIZAR LOS REGISTROS DE LOS PERMISOS");
INSERT INTO tbl_bitacora_sistema VALUES("467","1","62","2022-06-19","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("468","1","32","2022-06-19","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("469","1","62","2022-06-19","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("470","1","32","2022-06-19","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("471","1","62","2022-06-19","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("472","1","62","2022-06-19","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("473","1","20","2022-06-19","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("474","1","20","2022-06-19","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("475","1","62","2022-06-19","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("476","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("477","1","6","2022-06-19","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("478","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("479","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("480","1","6","2022-06-19","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("481","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("482","1","6","2022-06-19","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("483","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("484","1","25","2022-06-19","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("485","1","14","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("486","1","14","2022-06-19","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("487","1","14","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("488","1","14","2022-06-19","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("489","1","14","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("490","1","4","2022-06-19","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("491","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("492","1","6","2022-06-19","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("493","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("494","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("495","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("496","1","2","2022-06-19","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("497","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("498","1","6","2022-06-19","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("499","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("500","1","6","2022-06-19","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("501","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("502","1","6","2022-06-19","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("503","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("504","1","6","2022-06-19","Modificacion","Se edito un objeto ");
INSERT INTO tbl_bitacora_sistema VALUES("505","1","6","2022-06-19","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("506","1","54","2022-06-19","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("507","5","1","2022-06-19","Autoregistro","El usuario se autoregistro");
INSERT INTO tbl_bitacora_sistema VALUES("508","0","54","2022-06-19","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("509","1","1","2022-06-19","Autoregistro","El usuario se autoregistro");
INSERT INTO tbl_bitacora_sistema VALUES("510","2","1","2022-06-19","Autoregistro","El usuario se autoregistro");
INSERT INTO tbl_bitacora_sistema VALUES("511","2","54","2022-06-19","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("512","2","54","2022-06-19","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("513","2","54","2022-06-19","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("514","2","54","2022-06-19","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("515","1","1","2022-06-19","Autoregistro","El usuario se autoregistro");
INSERT INTO tbl_bitacora_sistema VALUES("516","1","1","2022-06-19","Autoregistro","El usuario se autoregistro");
INSERT INTO tbl_bitacora_sistema VALUES("517","1","54","2022-06-19","AUTENTICACIÓN FALLIDA","EL USUARIO INTENTO INICIAR SESIÓN CON LA CUENTA INACTIVA");
INSERT INTO tbl_bitacora_sistema VALUES("518","1","54","2022-06-19","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("519","1","25","2022-06-19","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("520","1","13","2022-06-19","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("521","1","14","2022-06-19","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("522","1","25","2022-06-19","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("523","1","54","2022-06-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("524","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("525","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("526","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("527","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("528","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("529","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("530","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("531","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("532","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("533","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("534","1","19","2022-06-26","MODIFICACIÓN","SE MODIFICÓ UNA MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("535","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("536","1","19","2022-06-26","ELIMINACIÓN","SE ELIMINÓ UNA MODALIDAD ");
INSERT INTO tbl_bitacora_sistema VALUES("537","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("538","1","46","2022-06-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("539","1","46","2022-06-26","INSERCIÓN","SE REGISTRO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("540","1","46","2022-06-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("541","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("542","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("543","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("544","1","19","2022-06-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("545","1","46","2022-06-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("546","1","46","2022-06-26","INSERCIÓN","SE REGISTRO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("547","1","46","2022-06-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("548","1","46","2022-06-26","MODIFICACIÓN","SE MODIFICO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("549","1","46","2022-06-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("550","1","46","2022-06-26","ELIMINACIÓN","SE ELIMINO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("551","1","46","2022-06-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("552","1","46","2022-06-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("553","1","46","2022-06-26","INSERCIÓN","SE REGISTRO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("554","1","46","2022-06-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("555","1","46","2022-06-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("556","1","46","2022-06-26","ELIMINACIÓN","SE ELIMINO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("557","1","46","2022-06-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("558","1","22","2022-06-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("559","1","22","2022-06-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("560","1","22","2022-06-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("561","1","22","2022-06-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("562","1","22","2022-06-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("563","1","22","2022-06-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("564","1","22","2022-06-26","ELIMINACIÓN","SE ELIMINO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("565","1","22","2022-06-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("566","1","2","2022-06-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("567","1","2","2022-06-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("568","1","2","2022-06-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("569","1","2","2022-06-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("570","1","2","2022-06-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("571","1","2","2022-06-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("572","1","2","2022-06-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("573","1","54","2022-06-27","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("574","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("575","1","3","2022-06-27","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("576","1","3","2022-06-27","Editar parámetro","Se editó el registro de un parámetro ya existente");
INSERT INTO tbl_bitacora_sistema VALUES("577","1","3","2022-06-27","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("578","1","3","2022-06-27","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("579","1","3","2022-06-27","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("580","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("581","1","3","2022-06-27","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("582","1","3","2022-06-27","Editar parámetro","Se editó el registro de un parámetro ya existente");
INSERT INTO tbl_bitacora_sistema VALUES("583","1","3","2022-06-27","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("584","1","3","2022-06-27","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("585","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("586","1","54","2022-06-27","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("587","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("588","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("589","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("590","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("591","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("592","1","25","2022-06-27","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("593","1","14","2022-06-27","INGRESO A LA PANTALLA MANTENIMIENTO USUARIOS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("594","1","13","2022-06-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("595","1","13","2022-06-27","INSERCIÓN","SE REGISTRO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("596","1","25","2022-06-27","INGRESO A LA PANTALLA DE MANTENIMIENTO PERSONAS","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("597","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("598","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("599","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("600","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("601","1","20","2022-06-27","Eliminación","Se elimino una carga academica ");
INSERT INTO tbl_bitacora_sistema VALUES("602","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("603","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("604","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("605","1","20","2022-06-27","Eliminación","Se elimino una carga academica ");
INSERT INTO tbl_bitacora_sistema VALUES("606","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("607","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("608","1","2","2022-06-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("609","1","48","2022-06-27","INGRESO A LA PANTALLA MANTENIMIENTO DE CITAS GENERALES ","MANTENIMIENTO REGISTRO DE CITAS GENERALES");
INSERT INTO tbl_bitacora_sistema VALUES("610","1","32","2022-06-27","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("611","1","4","2022-06-27","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("612","1","4","2022-06-27","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");
INSERT INTO tbl_bitacora_sistema VALUES("613","1","4","2022-06-27","Ingreso a mantenimiento de Familiar","Aqui se visualiza los familiares que se han registrado");



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

INSERT INTO tbl_carga_academica VALUES("4","1","2","3","1","12:00:00","13:00:00","2022-06-26","2022-07-26","2022","2","ADMIN","2022-06-27","","");



DROP TABLE IF EXISTS tbl_consulta_espiritual;

CREATE TABLE `tbl_consulta_espiritual` (
  `CODIGO_CONSULTA_ESPIRITUAL` int(10) NOT NULL AUTO_INCREMENT,
  `CODIGO_CITA` int(10) DEFAULT NULL,
  `MOTIVO_CONSULTA` longtext DEFAULT NULL,
  `OBSERVACIONES` longtext DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONSULTA_ESPIRITUAL`),
  KEY `COD_CITA_ESPI_FK` (`CODIGO_CITA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




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
  KEY `FK_COD_CIT` (`CODIGO_CITA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_contenido_socioeconomico;

CREATE TABLE `tbl_contenido_socioeconomico` (
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_TIPOSOCIO` int(5) NOT NULL,
  `NOMBRE_TIPO` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_TIPOSOCIO` (`CODIGO_TIPOSOCIO`)
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
  KEY `FK_CORREO` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_correo_electronico VALUES("prosecarinstancia@gmail.com","1");
INSERT INTO tbl_correo_electronico VALUES("BVFDCSXAZ@gftr.com","2");



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
  KEY `TBL_ESP_FK` (`CODIGO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_especialidad VALUES("1","MEDICINA GENERAL ","2","ATIENDE DE TODO ","","0000-00-00","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("2","TERAPIA GENERAL","3","ATIENDE DE TODO TIPO DE LOCOS","","0000-00-00","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("3","CATEQUESIS JUVENIL","4","CHARLAS CON JOVENES","","0000-00-00","0000-00-00","");



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
  `GRADO_ACTUAL` int(3) DEFAULT NULL,
  `REPITENTE` varchar(2) COLLATE utf8mb4_bin NOT NULL,
  `INDICE_ACADEMICO` int(3) DEFAULT NULL,
  `MATE_BAJO_RENDI` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `PASATIEMPOS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DISTRACTORES_ESCOLARES` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `METAS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE`),
  KEY `FK_COD_EST` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_estudiante_socioeconomico;

CREATE TABLE `tbl_estudiante_socioeconomico` (
  `CODIGO_ESTUDIANTE_SOCIOECONOMICO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(15) NOT NULL,
  `CODIGO_ESTUDIANTE` int(15) NOT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE_SOCIOECONOMICO`),
  KEY `FK_CONTSOCIO` (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_CON_ES` (`CODIGO_ESTUDIANTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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

INSERT INTO tbl_examenes_medicos VALUES("1","HEMOGRAMA","EXAMEN DE SANGRE","","0000-00-00","0000-00-00","");
INSERT INTO tbl_examenes_medicos VALUES("2","URALISIS","","EMILIO","2022-04-20","0000-00-00","");
INSERT INTO tbl_examenes_medicos VALUES("3","PRUEBA PCR","","EMILIO","2022-04-20","0000-00-00","");



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
  KEY `COD_EST_EXPE` (`CODIGO_ESTADO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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
  KEY `FK_CODIGO_CITA_CONSULTA` (`CODIGO_CITA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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
  KEY `COD_ESTA_EXPE` (`CODIGO_ESTADO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_familiar;

CREATE TABLE `tbl_familiar` (
  `CODIGO_FAMILIAR` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `ESTADO_CIVIL` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `NIVEL_EDUCATIVO` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `INGRESOS_DE_FAMILIAR` int(6) DEFAULT NULL,
  `NOMBRE_IGLESIA` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_FAMILIAR`),
  KEY `FAM_PK` (`CODIGO_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_familiares_estudiante;

CREATE TABLE `tbl_familiares_estudiante` (
  `CODIGO_FAMILIAR_ESTUDIANTE` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `CODIGO_FAMILIAR` int(5) DEFAULT NULL,
  `CODIGO_PARENTESCO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_FAMILIAR_ESTUDIANTE`),
  KEY `COD_ESTU_PARE` (`CODIGO_ESTUDIANTE`),
  KEY `COD_FAM_PARE` (`CODIGO_FAMILIAR`),
  KEY `COD_PARA_PARE` (`CODIGO_PARENTESCO`)
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
  KEY `COD_AREA_FK` (`AREA_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_matricula_academica;

CREATE TABLE `tbl_matricula_academica` (
  `CODIGO_MATRICULA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CARGA` int(5) DEFAULT NULL,
  `CODIGO_ESTUDIANTE` int(5) DEFAULT NULL,
  `OBSERVACION` int(5) DEFAULT NULL,
  `FECHA_MATRICULA` date DEFAULT NULL,
  `OBSERVACION_MATRICULA` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_FINALMATRICULA` date DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MATRICULA`),
  KEY `FK_COD_ESTU` (`CODIGO_ESTUDIANTE`),
  KEY `FK_COD_CARGA_MATR` (`CODIGO_CARGA`),
  KEY `FK_COD_ESTA_MATR` (`OBSERVACION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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

INSERT INTO tbl_medicamento VALUES("A1","TOSAN","PARA LA TOS","EMILIO","2022-04-20","","0000-00-00");
INSERT INTO tbl_medicamento VALUES("A2","VITAMINA D","VITAMINAS","EMILIO","2022-04-20","","0000-00-00");
INSERT INTO tbl_medicamento VALUES("A4","VITAMINA C","VITAMINAS","EMILIO","2022-04-20","","0000-00-00");



DROP TABLE IF EXISTS tbl_modalidad;

CREATE TABLE `tbl_modalidad` (
  `CODIGO_MODALIDA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MODALIDA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_modalidad VALUES("2","DDDD","dddd");
INSERT INTO tbl_modalidad VALUES("3","SSSSSSSS","{ñÁPLZSDXKOV VCM");



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
  KEY `FK_COD_USU_HISCON` (`CODIGO_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_objetos VALUES("1","ESTADO","SISTEMA DE ADMINISTRACION. ","Administrador","2022-02-09","2022-05-03","ADMIN");
INSERT INTO tbl_objetos VALUES("2","ROLES","OBJETO DONDE SE REGISTRAN PERSONAS   ","Administrador","2022-02-06","2022-05-03","ADMIN");
INSERT INTO tbl_objetos VALUES("3","PARAMETROS"," OBJETO MANTENIMIENTO PARAMETROS","Administrador","2022-03-04","2022-05-06","ADMIN");
INSERT INTO tbl_objetos VALUES("4","PREGUNTAS","OBJETO MANTENIMIENTO PREGUNTAS  ","ADMIN","2022-03-04","2022-05-03","ADMIN");
INSERT INTO tbl_objetos VALUES("5","PERMISOS","OBJETO MANTENIMIENTO PERMISOS  ","ADMIN","2022-03-04","2022-05-03","ADMIN");
INSERT INTO tbl_objetos VALUES("6","OBJETOS","OBJETO MANTENIMIENTO OBJETOS","ADMIN","2022-03-04","2022-05-06","ADMIN");
INSERT INTO tbl_objetos VALUES("7","BITACORA DEL SISTEMA","OBJETO CONSULTA BITACORA ","ADMIN","2022-03-04","2022-06-20","ADMIN");
INSERT INTO tbl_objetos VALUES("8","PREGUNTAS_USUARIOS","OBJETO CONSULTA PREGUNTAS USUARIOS.","ADMIN","2022-03-04","2022-05-06","ADMIN");
INSERT INTO tbl_objetos VALUES("9","PARAMETROS_USUARIOS","OBJETO MANTENIMIENTO PARAMETROS USUARIOS  ","","0000-00-00","2022-05-06","ADMIN");
INSERT INTO tbl_objetos VALUES("10","BACKUP ","OBJETO MANTENIMIENTO BACKUP  ","ADMIN","2022-03-04","2022-05-06","ADMIN");
INSERT INTO tbl_objetos VALUES("11","RESTAURACION","OBJETO MANTENIMIENTO RESTAURACION","ADMIN","2022-03-04","2022-06-20","ADMIN");
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
INSERT INTO tbl_objetos VALUES("23","MATRICULA","OBJETO MANTENIMIENTO MATRICULA.","ADMIN","2022-03-04","2022-06-20","ADMIN");
INSERT INTO tbl_objetos VALUES("24","CALIFICACIONES","Objeto mantenimiento calificaciones","ADMIN","2022-03-04","0000-00-00","");
INSERT INTO tbl_objetos VALUES("25","GESTION_USUARIOS","GESTION DE LOS DATOS DE LOS USUARIOS","","0000-00-00","2022-06-20","ADMIN");
INSERT INTO tbl_objetos VALUES("26","GESTION_ESTUDIANTES","OBJETO DE GESTION DE LOS ESTUDIANTES","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("27","GESTION_SEGURIDAD","GESTION DE SEGURIDAD","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("28","GESTION_CARGA_ACADEMICA","OBJETO DE GESTION DE LA CARGA ACADEMICA","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("29","GESTION_MATRICULA","OBJETO DE GESTION DE LAS MATRICULAS DE LOS ALUMNOS","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("30","GESTION_AREA_MEDICA","OBJETO DE GESTION DE LAS CITAS MEDICAS","ADMIN","2022-03-10","0000-00-00","");
INSERT INTO tbl_objetos VALUES("31","GESTION_AREA_PSICOLOGIA","OBJETO DEL AREA PSICOLOGICA","ADMIN","2022-03-18","0000-00-00","");
INSERT INTO tbl_objetos VALUES("32","GESTION_DE_CITAS","OBJETO QUE GESTIONA LAS CITAS","","2022-03-27","2022-06-20","ADMIN");
INSERT INTO tbl_objetos VALUES("33","GESTIONFAMILIARES","PERMISOS PARA INSERTAR DATOS SOCIECONOMICOS FAMILIARES","","2022-03-31","0000-00-00","");
INSERT INTO tbl_objetos VALUES("34","RECETAMEDICA","CRUD Y PROCESO","","2022-04-07","0000-00-00","");
INSERT INTO tbl_objetos VALUES("35","MEDICAMENTOS","PERMISO MEDICAMENTOS","","2022-04-07","0000-00-00","");
INSERT INTO tbl_objetos VALUES("36","TRANSTORNOS","PERMISO PARA EL MANTENIMIENTO","","2022-04-07","0000-00-00","");
INSERT INTO tbl_objetos VALUES("37","TIPOSANGRE","MANTENIMIENTO TIPO SANGRE","","2022-04-08","0000-00-00","");
INSERT INTO tbl_objetos VALUES("38","GESTION_AREA ACADEMICA","AREA DEL TUTOR ACADEMICO   ","","2022-04-21","2022-06-20","ADMIN");
INSERT INTO tbl_objetos VALUES("39","ALERGIAS","OBJETO MANTENIMIENTO ALEGIAS","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("40","APARIENCIA FISICA","OBJETO MANTENIMIENTO APARIENCIA","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("41","ESPECIALIDADES","OBJETO MANTENIMIENTO ESPECIALIDADES","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("42","EXAMENES MEDICOS","OBJETO MANTENIMIENTO EXAMENES","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("43","FAMILIARES","OBETO MANTENIMIENTO FAMILIARES","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("44","PARENTESCO","OBJETO MANTENIMIENTO PARANTESCO","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("45","SACRAMENTO","OBJETO MANTENIMIENTO SACRAMENTOS","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("46","SECCION ","OBJETO MANTENIMIENTO SECCIONES","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("47","SINTOMAS NEUROTICOS","OBJETO MANTENIMIENTO SINTOMAS NEUROTICOS","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("48","CITAS GENERALES","OBJETO CITAS GENERALES","","2022-04-23","0000-00-00","");
INSERT INTO tbl_objetos VALUES("49","GESTION PRECLINICA","OBJETO PARA VER PRECLINICA POR LOS ENFERMEROS","","2022-04-24","2022-06-20","ADMIN");
INSERT INTO tbl_objetos VALUES("50","PRECLINICA","OBJETO PARA VER PRECLINICA POR PARTE DE LOS MEDICOS","","2022-04-24","0000-00-00","");
INSERT INTO tbl_objetos VALUES("51","GESTION DE ESTUDIANTE","VER LO ASIGNADO A EL ESTUDIANTE.","ADMIN","2022-05-03","0000-00-00","");
INSERT INTO tbl_objetos VALUES("52","GESTION AREA ESPIRITUAL","AREA DEL TUTOR ESPIRITUAL ","ALBERT","2022-05-06","2022-06-20","ADMIN");
INSERT INTO tbl_objetos VALUES("53","CALIFICACIONES ESPIRITUALES","OBJETO QUE PERMITE CALIFICAR LAS TUTORIAS ESPIRITUALES","ADMIN","2022-05-20","0000-00-00","");
INSERT INTO tbl_objetos VALUES("54","ACCESO AL SISTEMA","OBJETO QUE DESCRIBE EL ACCESO AL SISTEMA","HOLA","2022-06-18","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_parametros VALUES("1","NUM_INTEN_VALIDOS","3","Administrador","2022-02-07","2022-03-10","ADMIN");
INSERT INTO tbl_parametros VALUES("2","NUM_MAX_PREGUNTAS","1","Administrador","2022-02-07","2022-04-26","");
INSERT INTO tbl_parametros VALUES("3","NUM_MAX_CONTRASENAS","8","Administrador","2022-02-07","2022-03-10","ADMIN");
INSERT INTO tbl_parametros VALUES("4","NUM_MAX_CARACTER","15","Administrador","2022-02-07","2022-04-07","ADMIN");
INSERT INTO tbl_parametros VALUES("5","ADMIN_SERVIDOR_CORREO","smtp.gmail.com","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("7","ADMIN_CUSUARIO","prosecarinstancia@gmail.com","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("8","ADMIN_CPUERTO","587","ADMIN","2022-03-07","0000-00-00","");
INSERT INTO tbl_parametros VALUES("10","NOMBRE_EMPRESA","PROYECTO SEMILLERO CARMELITANO PROSECAR\n","ADMIN","2022-03-22","0000-00-00","");
INSERT INTO tbl_parametros VALUES("11","FECHAINICIAL","6","ADMIN","0000-00-00","2022-06-27","ADMIN");
INSERT INTO tbl_parametros VALUES("12","HORA_INICIO_ATENCIONCITA","09:00","ADMIN","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("13","HORA_FINAL_ATENCIONCITA","18:00","ADMIN","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("14","HORA_INICIO_CARGAACADEMICA","09:00","ADMIN","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("15","HORA_FINAL_CARGAACADEMICA","18:00","ADMIN","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("16","NUM_MIN_CARACTER","5","Administrador","2022-05-26","0000-00-00","");
INSERT INTO tbl_parametros VALUES("17","MAX_USUARIO","15","Administrador","2022-05-26","0000-00-00","");
INSERT INTO tbl_parametros VALUES("18","MIN_USUARIO","3","Administrador","2022-05-26","0000-00-00","");
INSERT INTO tbl_parametros VALUES("19","NUM_INTENTOS_PREGUNTAS","2","Administrador","2022-05-31","0000-00-00","");
INSERT INTO tbl_parametros VALUES("20","MIN_RESPUESTA_PREGUNTAS","4","","0000-00-00","0000-00-00","");
INSERT INTO tbl_parametros VALUES("21","MAX_RESPUESTA_PREGUNTAS","50","","0000-00-00","0000-00-00","");



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
  KEY `FK_CODPAR_PAR` (`CODIGO_PARAMETRO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_parametros_usuarios VALUES("1","1","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("2","2","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("3","2","2","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("4","2","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("5","2","19","0","","0000-00-00","","");



DROP TABLE IF EXISTS tbl_parentesco;

CREATE TABLE `tbl_parentesco` (
  `CODIGO_PARENTESCO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PARENTESCO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_parentesco VALUES("1","PADRE");
INSERT INTO tbl_parentesco VALUES("2","MADRE");
INSERT INTO tbl_parentesco VALUES("3","HERMANA");
INSERT INTO tbl_parentesco VALUES("4","HERMANO");
INSERT INTO tbl_parentesco VALUES("5","ABUELA");
INSERT INTO tbl_parentesco VALUES("6","ABUELO");
INSERT INTO tbl_parentesco VALUES("7","TIO");
INSERT INTO tbl_parentesco VALUES("8","TIA");



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
  KEY `FK_CO_TROL` (`CODIGO_TIPO_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_permisos VALUES("1","1","1","SI","SI","SI","SI","Administrador","2022-03-02","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("3","2","24","SI","SI","SI","SI","Administrador","2022-03-02","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("4","4","1","NO","NO","NO","NO","","0000-00-00","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("5","3","1","SI","SI","SI","SI","ADMIN","2022-03-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("6","1","2","SI","SI","SI","SI","ADMIN","2022-03-04","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("7","1","19","SI","SI","SI","SI","ADMIN","2022-03-04","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("8","1","5","SI","SI","SI","SI","ADMIN","2022-03-05","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("9","1","8","SI","NO","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("10","1","10","SI","SI","SI","SI","ADMIN","2022-03-05","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("11","1","12","SI","SI","SI","SI","ADMIN","2022-03-05","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("12","1","15","SI","SI","SI","SI","ADMIN","2022-03-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("13","1","3","SI","SI","SI","SI","ADMIN","2022-03-07","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("14","1","4","SI","SI","SI","SI","ADMIN","2022-03-07","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("15","2","38","SI","SI","SI","SI","ADMIN","2022-03-08","ARNOLDIÑO","2022-04-21");
INSERT INTO tbl_permisos VALUES("17","1","25","SI","SI","SI","SI","","0000-00-00","$1","2022-04-25");
INSERT INTO tbl_permisos VALUES("18","1","26","SI","SI","SI","SI","ADMIN","2022-03-10","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("19","1","27","SI","SI","SI","SI","ADMIN","2022-03-10","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("20","2","28","NO","NO","NO","NO","ADMIN","2022-03-10","ARNOLDIÑO","2022-04-21");
INSERT INTO tbl_permisos VALUES("21","2","29","NO","NO","NO","NO","ADMIN","2022-03-10","ARNOLDIÑO","2022-04-21");
INSERT INTO tbl_permisos VALUES("22","1","9","SI","SI","SI","SI","ADMIN","2022-03-10","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("23","1","7","SI","SI","SI","SI","ADMIN","2022-03-12","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("24","5","30","SI","SI","SI","SI","ADMIN","2022-03-14","","0000-00-00");
INSERT INTO tbl_permisos VALUES("25","4","31","SI","SI","SI","SI","ADMIN","2022-03-18","","0000-00-00");
INSERT INTO tbl_permisos VALUES("26","1","32","SI","SI","SI","SI","","2022-03-27","","0000-00-00");
INSERT INTO tbl_permisos VALUES("27","1","22","SI","SI","SI","SI","","2022-04-03","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("29","5","34","SI","SI","SI","SI","ADMIN","2022-04-07","","0000-00-00");
INSERT INTO tbl_permisos VALUES("31","5","35","SI","SI","SI","SI","ADMIN","2022-04-07","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("32","1","28","SI","SI","SI","SI","LUISILLO","2022-04-07","ARNOLDIÑO","2022-04-21");
INSERT INTO tbl_permisos VALUES("33","1","29","SI","SI","SI","SI","LUISILLO","2022-04-07","$1","2022-04-25");
INSERT INTO tbl_permisos VALUES("34","5","36","SI","SI","SI","SI","LUISILLO","2022-04-07","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("35","5","37","SI","SI","SI","SI","ADMIN","2022-04-08","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("36","5","32","NO","NO","NO","NO","","2022-04-14","ADMIN","2022-04-14");
INSERT INTO tbl_permisos VALUES("37","1","33","SI","SI","SI","SI","","2022-04-14","ARNOLDIÑO","2022-04-20");
INSERT INTO tbl_permisos VALUES("38","1","21","SI","SI","SI","SI","","2022-04-23","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("39","5","39","SI","SI","SI","SI","","2022-04-23","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("40","5","40","SI","SI","SI","SI","","2022-04-23","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("41","1","20","SI","SI","SI","SI","","2022-04-23","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("42","1","48","SI","SI","SI","SI","","2022-04-23","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("43","1","23","SI","SI","SI","SI","","2022-04-24","$1","2022-04-25");
INSERT INTO tbl_permisos VALUES("44","1","16","SI","SI","SI","SI","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("45","1","43","SI","SI","SI","SI","","2022-04-24","$1","2022-04-25");
INSERT INTO tbl_permisos VALUES("46","1","6","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("47","1","45","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("48","1","18","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("49","1","17","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("50","1","46","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("51","1","41","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("52","5","42","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("53","7","49","SI","SI","SI","SI","","2022-04-24","","0000-00-00");
INSERT INTO tbl_permisos VALUES("54","5","50","SI","SI","SI","SI","","2022-04-24","$1","2022-04-24");
INSERT INTO tbl_permisos VALUES("55","1","14","SI","NO","SI","SI","","2022-04-26","","0000-00-00");
INSERT INTO tbl_permisos VALUES("56","9","27","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("57","9","5","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("58","9","20","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("59","9","28","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("60","9","13","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("61","9","15","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("62","9","25","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("63","9","26","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("64","9","29","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("65","9","23","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("66","9","6","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("67","9","30","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("68","9","32","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("69","9","31","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("70","9","33","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("71","9","10","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("72","9","7","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("73","9","38","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("74","9","52","SI","SI","SI","SI","","2022-05-06","","0000-00-00");
INSERT INTO tbl_permisos VALUES("75","6","52","SI","SI","SI","SI","","2022-05-06","","0000-00-00");
INSERT INTO tbl_permisos VALUES("76","9","9","SI","SI","SI","SI","","2022-05-21","","0000-00-00");
INSERT INTO tbl_permisos VALUES("77","9","14","SI","SI","SI","SI","","2022-05-21","","0000-00-00");
INSERT INTO tbl_permisos VALUES("78","9","46","SI","SI","SI","SI","","2022-05-25","","0000-00-00");
INSERT INTO tbl_permisos VALUES("79","9","45","SI","SI","SI","SI","","2022-05-25","","0000-00-00");
INSERT INTO tbl_permisos VALUES("80","6","53","SI","SI","SI","SI","","2022-05-25","","0000-00-00");
INSERT INTO tbl_permisos VALUES("81","8","16","SI","SI","SI","SI","","2022-05-25","","0000-00-00");
INSERT INTO tbl_permisos VALUES("82","8","51","SI","SI","SI","SI","","2022-05-25","","0000-00-00");
INSERT INTO tbl_permisos VALUES("83","1","44","SI","SI","SI","SI","","2022-06-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("84","9","12","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("85","9","41","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("86","9","16","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("87","9","43","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("88","9","17","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("89","9","18","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("90","9","44","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("91","9","48","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("92","9","22","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("93","9","19","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("94","9","2","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("95","9","4","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("96","9","1","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("97","9","3","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("98","9","21","SI","SI","SI","SI","","2022-06-05","","0000-00-00");



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
  KEY `FK_SEX_PERSONA` (`SEXO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_persona VALUES("1","ADMIN","ADMIN","ADMIN","ADMIN","0801200017878","M","2000-02-02","TEGUCIGALPA","TEGUCIGALPA","2022-06-20","","3","","2022-06-20","","");
INSERT INTO tbl_persona VALUES("2","JHGFRDS","HGBFDSA","CSXAFVDCS","BGFVDCS","2654851032153","F","2000-03-21","BGVFDSA","BGVFDSASCVCDSXAZXC","2022-06-27","","2","ADMIN","0000-00-00","","");



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
  KEY `FK_COD_ESPECIALIDAD` (`CODIGO_ESPECIALIDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_personas_alergias;

CREATE TABLE `tbl_personas_alergias` (
  `CODIGO_PERSONA_ALERGIAS` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_ALERGIAS` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_ALERGIAS`),
  KEY `cod_expe_fk` (`CODIGO_EXPEDIENTE_PERSONA`),
  KEY `cod_aler_fk` (`CODIGO_ALERGIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_personas_apariencia;

CREATE TABLE `tbl_personas_apariencia` (
  `CODIGO_PERSONAS_APARIENCIA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_APARIENCIA` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_APARIENCIA`),
  KEY `CODI_PER_APARI` (`CODIGO_APARIENCIA`),
  KEY `CODI_PER_EXPE_APA` (`CODIGO_EXPEDIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_personas_sintomas;

CREATE TABLE `tbl_personas_sintomas` (
  `CODIGO_PERSONA_SINTOMA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_SINTOMA_NEUROTICO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_SINTOMA`),
  KEY `COD_EXP_PPSICO` (`CODIGO_EXPEDIENTE`),
  KEY `COD_SINT_PP` (`CODIGO_SINTOMA_NEUROTICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_personas_transtornos;

CREATE TABLE `tbl_personas_transtornos` (
  `CODIGO_PERSONAS_TRANSTORNOS` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_TRANSTORNO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_TRANSTORNOS`),
  KEY `CODI_PER_EXPE` (`CODIGO_EXPEDIENTE`),
  KEY `CODI_PER_TRANST` (`CODIGO_TRANSTORNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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
  KEY `COD_CONSUL_PSICO_FK` (`CODIGO_CONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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
  KEY `FK_CODIGO_CITA_PREC` (`CODIGO_CITA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_preguntas;

CREATE TABLE `tbl_preguntas` (
  `CODIGO_PREGUNTAS` int(11) NOT NULL AUTO_INCREMENT,
  `PREGUNTA` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PREGUNTAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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
  KEY `FK_CODU_PREU` (`CODIGO_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




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
  KEY `FK_CODIGO_MEDICAMENTO` (`CODIGO_MEDICAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_roles VALUES("1","ADMINISTRADOR","Todos los permisos","Administrador","2022-02-11","2022-04-07","ADMIN");
INSERT INTO tbl_roles VALUES("2","TUTOR","Usuario con permisos al modulo de escuela","Administrador","2022-02-11","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("3","INDEFINIDO","Rol no definido para el usuario","","0000-00-00","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("4","PSICOLOGO","Área de psicología","","0000-00-00","2022-04-07","ADMIN");
INSERT INTO tbl_roles VALUES("5","MEDICO","area medica","","2022-03-09","2022-03-11","ADMIN");
INSERT INTO tbl_roles VALUES("6","CATEQUISTA","Área espiritual","","2022-03-09","2022-05-05","ALBERT");
INSERT INTO tbl_roles VALUES("7","ENFERMERO","Area Medica","","2022-04-23","0000-00-00","");
INSERT INTO tbl_roles VALUES("8","ESTUDIANTE","El usuario solo permitirá ver las citas y tutorías que tiene este.  ","ADMIN","2022-05-03","0000-00-00","");
INSERT INTO tbl_roles VALUES("9","SUPER USUARIO","Este tipo de rol, solo sera asignado al usuario admin que es el único que tendrá cero limitaciones.","ADMIN","2022-05-03","0000-00-00","");



DROP TABLE IF EXISTS tbl_sacramento;

CREATE TABLE `tbl_sacramento` (
  `CODIGO_SACRAMENTO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SACRAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_sacramento VALUES("1","BAUTISMO","PRIMER SACRAMENTO");
INSERT INTO tbl_sacramento VALUES("2","PRIMERA COMUNION","SEGUNDO SACRAMENTO");
INSERT INTO tbl_sacramento VALUES("3","CONFIRMA","TERCER SACRAMENTO");
INSERT INTO tbl_sacramento VALUES("4","NINGUNO","No tiene ningún sacramento.");



DROP TABLE IF EXISTS tbl_sacramento_persona;

CREATE TABLE `tbl_sacramento_persona` (
  `CODIGO_CORRELATIVO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_SACRAMENTO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CORRELATIVO`),
  KEY `FK_CP_SACRAMENTO` (`CODIGO_PERSONA`),
  KEY `FK_CS_SACRAMENTO` (`CODIGO_SACRAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;




DROP TABLE IF EXISTS tbl_seccion;

CREATE TABLE `tbl_seccion` (
  `CODIGO_SECCION` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SECCION`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_seccion VALUES("1","ASXCDV DDDD         CDÑ","DLSZX,sskkskkk63c     2");



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
  KEY `Numero_perso` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=95623895 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_telefono VALUES("32995237","1");
INSERT INTO tbl_telefono VALUES("95623894","2");



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

INSERT INTO tbl_tipo_socioeconomico VALUES("1","DISPOSITIVO ELECTRONICO","DISPOSITIVOS DE LOS DFDF","ADMIN","2022-04-07","2022-06-19","ADMIN");
INSERT INTO tbl_tipo_socioeconomico VALUES("2","SERVICIOS DE INTERNET","L","","2022-04-07","2022-06-18","HOLA");
INSERT INTO tbl_tipo_socioeconomico VALUES("3","PROVEEDOR DE INGRESO","","","2022-04-07","0000-00-00","");
INSERT INTO tbl_tipo_socioeconomico VALUES("4","SERVICIOS BASICOS","","","2022-04-07","0000-00-00","");



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
  KEY `FK_CODATREA_TUTO` (`CODIGO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tutoria VALUES("1","1","DASDFVBCXZCVBCDX","ADMIN","2022-06-26","","");



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
  `IMAGEN` longblob NOT NULL,
  PRIMARY KEY (`CODIGO_USUARIO`),
  KEY `FK_CODPER_USU` (`CODIGO_PERSONA`),
  KEY `FK_CODROL_USU` (`CODIGO_TIPO_ROL`),
  KEY `FK_CODES_USU` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_usuario VALUES("1","1","ADMIN","2","9","$2a$07$usesomesillystringforeDLU0KLdU3tCNprit2LU2PhciUHQJFsG","2022-08-19","","2022-06-20","","","");
INSERT INTO tbl_usuario VALUES("2","2","VGFDCSXAZ","1","2","$2a$07$usesomesillystringfore8USgjhqUPL73EuXLK9IsSuU47nXlquu","","ADMIN","2022-06-27","","","");



SET FOREIGN_KEY_CHECKS=1;