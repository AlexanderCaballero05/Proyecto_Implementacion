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
  `CODIGO_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_ALERGIAS`),
  KEY `CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `tbl_alergias_ibfk_1` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_alergias VALUES("1","ALERGIA AL AGUA","EXTRAÑO PADECIMIENTO","DANIEL","2022-07-27","","","2");
INSERT INTO tbl_alergias VALUES("2","ALERGIA CUTÁNEAS","REACCIÓN ALERGICA QUE CAUSA UNA INFLAMACIÓN CUTÁNEA QUE PROVOCA UNA ERUPCIÓN ABULTADA","PAULA","2022-07-27","","","2");



DROP TABLE IF EXISTS tbl_apariencia_fisica;

CREATE TABLE `tbl_apariencia_fisica` (
  `CODIGO_APARIENCIA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `CODIGO_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_APARIENCIA`),
  KEY `CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `tbl_apariencia_fisica_ibfk_1` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_apariencia_fisica VALUES("4","HEMATOMA","2");
INSERT INTO tbl_apariencia_fisica VALUES("5","ICTERICIA","2");
INSERT INTO tbl_apariencia_fisica VALUES("6","OTROS","2");



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
) ENGINE=InnoDB AUTO_INCREMENT=1432 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_bitacora_sistema VALUES("1","0","54","2022-07-25","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("2","1","1","2022-07-25","Autoregistro","El usuario se autoregistro");
INSERT INTO tbl_bitacora_sistema VALUES("3","1","54","2022-07-25","AUTENTICACIÓN FALLIDA","EL USUARIO INTENTO INICIAR SESIÓN CON LA CUENTA INACTIVA");
INSERT INTO tbl_bitacora_sistema VALUES("4","1","54","2022-07-25","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("5","1","13","2022-07-25","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("6","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("7","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("8","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("9","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("10","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("11","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("12","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("13","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("14","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("15","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("16","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("17","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("18","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO RUT COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("19","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("20","2","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("21","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO LUZ COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("22","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO JOSE COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("23","2","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("24","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO GABRIELA COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("25","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO ALEXANDER COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("26","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("27","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("28","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("29","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("30","4","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("31","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("32","4","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("33","6","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("34","6","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("35","6","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("36","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("37","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("38","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("39","2","14","2022-07-26","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("40","2","14","2022-07-26","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("41","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("42","4","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("43","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("44","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("45","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("46","3","54","2022-07-26","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("47","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("48","5","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("49","6","19","2022-07-26","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("50","3","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("51","5","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("52","3","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("53","5","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("54","3","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("55","6","19","2022-07-26","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("56","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("57","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("58","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("59","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("60","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("61","6","19","2022-07-26","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("62","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("63","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO CESAR COMO UN ADMINISTRADOR");
INSERT INTO tbl_bitacora_sistema VALUES("64","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("65","6","12","2022-07-26","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("66","7","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("67","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("68","7","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("69","7","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("70","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("71","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("72","3","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO JUAN COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("73","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("74","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("75","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("76","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("77","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("78","7","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO DAVID COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("79","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("80","6","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO IKER COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("81","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("82","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("83","4","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("84","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("85","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("86","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("87","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("88","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("89","4","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO DANIEL COMO UN MEDICO");
INSERT INTO tbl_bitacora_sistema VALUES("90","2","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO RAQUEL COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("91","4","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("92","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("93","11","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("94","5","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO YAMILETH COMO UN CATEQUISTA");
INSERT INTO tbl_bitacora_sistema VALUES("95","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("96","12","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("97","11","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("98","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("99","12","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("100","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("101","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("102","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("103","6","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO  COMO UN FAMILIAR");
INSERT INTO tbl_bitacora_sistema VALUES("104","7","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO  COMO UN FAMILIAR");
INSERT INTO tbl_bitacora_sistema VALUES("105","3","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO MARGARITA COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("106","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO RAMON COMO UN MEDICO");
INSERT INTO tbl_bitacora_sistema VALUES("107","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("108","15","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("109","5","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO FRANCISCO COMO UN CATEQUISTA");
INSERT INTO tbl_bitacora_sistema VALUES("110","15","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("111","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("112","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("113","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("114","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("115","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("116","2","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO JOSUE COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("117","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("118","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("119","17","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("120","17","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("121","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("122","5","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO LAURA COMO UN CATEQUISTA");
INSERT INTO tbl_bitacora_sistema VALUES("123","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("124","5","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("125","13","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("126","3","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO MAJO COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("127","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO PAULA COMO UN MEDICO");
INSERT INTO tbl_bitacora_sistema VALUES("128","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("129","13","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("130","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("131","20","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("132","2","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO MARIO COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("133","20","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("134","13","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("135","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("136","13","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("137","3","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("138","21","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("139","6","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO CRIS COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("140","21","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("141","16","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("142","8","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("143","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("144","16","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("145","8","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("146","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("147","16","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("148","6","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("149","16","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("150","14","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("151","10","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("152","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("153","10","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("154","7","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO ANDREA COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("155","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("156","14","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("157","18","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("158","7","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("159","18","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("160","2","14","2022-07-26","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("161","18","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("162","19","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("163","22","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("164","18","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("165","5","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("166","19","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("167","22","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("168","3","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("169","22","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("170","22","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("171","6","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("172","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("173","7","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO  COMO UN FAMILIAR");
INSERT INTO tbl_bitacora_sistema VALUES("174","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("175","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("176","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("177","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("178","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("179","7","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("180","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("181","6","14","2022-07-26","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("182","6","14","2022-07-26","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("183","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("184","23","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("185","23","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("186","2","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO KATY COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("187","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("188","24","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("189","9","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("190","6","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO  COMO UN FAMILIAR");
INSERT INTO tbl_bitacora_sistema VALUES("191","24","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("192","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("193","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("194","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("195","5","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO DESIRETH COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("196","5","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("197","2","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("198","3","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO NAOMI COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("199","25","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("200","3","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("201","25","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("202","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("203","1","13","2022-07-26","INSERCIÓN","SE REGISTRO AL USUARIO ERICK COMO UN ESTUDIANTE");
INSERT INTO tbl_bitacora_sistema VALUES("204","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("205","25","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("206","25","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("207","26","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("208","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("209","5","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("210","27","1","2022-07-26","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("211","26","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("212","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("213","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("214","27","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("215","2","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("216","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("217","2","21","2022-07-26","INGRESO AL MANTENIMIENTO ÁREAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("218","3","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("219","2","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("220","2","46","2022-07-26","INSERCIÓN","SE REGISTRO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("221","2","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("222","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("223","2","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("224","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("225","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("226","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("227","9","1","2022-07-26","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("228","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("229","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("230","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("231","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("232","5","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("233","3","21","2022-07-26","INGRESO AL MANTENIMIENTO ÁREAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("234","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("235","7","54","2022-07-26","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("236","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("237","3","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("238","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("239","6","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("240","7","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("241","6","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("242","3","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("243","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("244","5","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("245","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("246","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("247","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("248","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("249","6","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("250","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("251","3","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("252","3","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("253","6","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("254","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("255","3","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("256","6","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("257","3","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("258","7","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("259","5","19","2022-07-26","INGRESO A MANTENIMIENTO MODALIDAD","MANTENIMIENTO A LOS REGISTROS DE MODALIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("260","6","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("261","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("262","7","22","2022-07-26","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("263","7","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("264","6","46","2022-07-26","INSERCIÓN","SE REGISTRO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("265","6","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("266","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("267","6","46","2022-07-26","INSERCIÓN","SE REGISTRO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("268","6","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("269","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("270","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("271","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("272","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("273","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("274","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("275","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("276","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("277","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("278","2","22","2022-07-26","MODIFICACIÓN","SE MODIFICO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("279","2","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("280","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("281","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("282","2","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("283","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("284","2","46","2022-07-26","MODIFICACIÓN","SE MODIFICO UNA SECCIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("285","2","46","2022-07-26","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("286","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("287","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("288","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("289","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("290","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("291","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("292","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("293","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("294","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("295","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("296","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("297","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("298","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("299","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("300","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("301","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("302","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("303","5","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("304","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("305","7","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("306","2","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("307","27","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("308","27","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("309","27","48","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("310","27","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("311","27","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("312","27","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("313","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("314","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("315","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("316","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("317","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("318","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("319","5","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 4 AL ESTUDIANTE 6");
INSERT INTO tbl_bitacora_sistema VALUES("320","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("321","7","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 4 AL ESTUDIANTE 4");
INSERT INTO tbl_bitacora_sistema VALUES("322","3","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 6 AL ESTUDIANTE 7");
INSERT INTO tbl_bitacora_sistema VALUES("323","2","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("324","2","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 2 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("325","5","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("326","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("327","5","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 2 AL ESTUDIANTE 6");
INSERT INTO tbl_bitacora_sistema VALUES("328","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("329","7","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 4 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("330","7","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("331","2","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 4 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("332","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("333","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("334","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("335","7","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("336","2","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 1 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("337","7","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 3 AL ESTUDIANTE 4");
INSERT INTO tbl_bitacora_sistema VALUES("338","1","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 6 AL ESTUDIANTE 8");
INSERT INTO tbl_bitacora_sistema VALUES("339","2","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("340","2","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 3 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("341","6","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 6 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("342","1","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("343","6","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("344","6","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 2 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("345","1","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 2 AL ESTUDIANTE 8");
INSERT INTO tbl_bitacora_sistema VALUES("346","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("347","6","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 4 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("348","7","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("349","7","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 2 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("350","3","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("351","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("352","3","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 3 AL ESTUDIANTE 7");
INSERT INTO tbl_bitacora_sistema VALUES("353","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("354","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("355","2","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("356","6","23","2022-07-26","ELIMINACIÓN","SE ELIMINÓ LA TUTORÍA 2 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("357","5","23","2022-07-26","ELIMINACIÓN","SE ELIMINÓ LA TUTORÍA 4 AL ESTUDIANTE 6");
INSERT INTO tbl_bitacora_sistema VALUES("358","6","23","2022-07-26","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("359","5","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 1 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("360","6","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 2 AL ESTUDIANTE 2");
INSERT INTO tbl_bitacora_sistema VALUES("361","5","23","2022-07-26","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 4 AL ESTUDIANTE 6");
INSERT INTO tbl_bitacora_sistema VALUES("362","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("363","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("364","2","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("365","5","14","2022-07-26","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("366","5","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("367","2","0","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("368","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("369","1","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("370","2","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("371","2","0","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("372","2","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("373","2","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("374","1","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("375","5","0","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("376","7","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("377","7","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("378","7","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("379","7","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("380","5","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("381","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("382","6","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("383","5","0","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("384","2","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("385","2","0","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("386","6","32","2022-07-26","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("387","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("388","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("389","6","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("390","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("391","20","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("392","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("393","6","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("394","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("395","11","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("396","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("397","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("398","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("399","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("400","5","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("401","20","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("402","21","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("403","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("404","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("405","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("406","7","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("407","1","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("408","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("409","12","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("410","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("411","15","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("412","1","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("413","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("414","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("415","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("416","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("417","20","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("418","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("419","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("420","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("421","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("422","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("423","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("424","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("425","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("426","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("427","12","31","2022-07-26","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO31");
INSERT INTO tbl_bitacora_sistema VALUES("428","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("429","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("430","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("431","15","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("432","7","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("433","11","30","2022-07-26","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 10");
INSERT INTO tbl_bitacora_sistema VALUES("434","11","23","2022-07-26","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("435","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("436","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("437","7","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("438","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("439","12","31","2022-07-26","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("440","12","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("441","11","30","2022-07-26","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 10");
INSERT INTO tbl_bitacora_sistema VALUES("442","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("443","12","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("444","7","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("445","7","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("446","15","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("447","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("448","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("449","12","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("450","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("451","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("452","21","31","2022-07-26","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO29");
INSERT INTO tbl_bitacora_sistema VALUES("453","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("454","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("455","15","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("456","15","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("457","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("458","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("459","12","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("460","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("461","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("462","21","31","2022-07-26","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("463","21","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("464","11","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("465","11","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("466","11","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("467","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("468","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("469","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("470","11","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("471","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("472","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("473","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("474","20","30","2022-07-26","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("475","20","23","2022-07-26","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("476","21","31","2022-07-26","REGISTRAR","SE REGISTRO UN PLAN TERAPÉUTICO ");
INSERT INTO tbl_bitacora_sistema VALUES("477","21","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("478","11","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("479","6","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("480","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("481","6","22","2022-07-26","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("482","20","30","2022-07-26","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("483","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("484","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("485","21","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("486","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("487","21","34","2022-07-26","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("488","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("489","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("490","20","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("491","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("492","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("493","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("494","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("495","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("496","21","47","2022-07-26","Editar","Se edito un sintoma neurótico");
INSERT INTO tbl_bitacora_sistema VALUES("497","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("498","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("499","21","47","2022-07-26","Editar","Se edito un sintoma neurótico");
INSERT INTO tbl_bitacora_sistema VALUES("500","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("501","21","47","2022-07-26","Ingreso a mantenimiento sintomas neuroticos","Describe los sintomas de un paciente psicológico");
INSERT INTO tbl_bitacora_sistema VALUES("502","12","31","2022-07-26","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("503","12","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("504","21","34","2022-07-26","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("505","21","62","2022-07-26","MODIFICACIÓN","SE MODIFICÓ UN EXPEDIENTE PSICOLÓGICO ÚNICO");
INSERT INTO tbl_bitacora_sistema VALUES("506","21","34","2022-07-26","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("507","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("508","21","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("509","5","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("510","5","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("511","21","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("512","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("513","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("514","6","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("515","11","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("516","12","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("517","21","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("518","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("519","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("520","21","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("521","21","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("522","2","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("523","2","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("524","12","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("525","12","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("526","12","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("527","21","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("528","21","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("529","21","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("530","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("531","12","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("532","11","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("533","6","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("534","20","40","2022-07-26","MODIFICACIÓN","SE MODIFICÓ UNA APARIENCIA FISICA");
INSERT INTO tbl_bitacora_sistema VALUES("535","20","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("536","12","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("537","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("538","6","32","2022-07-26","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("539","6","32","2022-07-26","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("540","1","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("541","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("542","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("543","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("544","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("545","6","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("546","6","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("547","6","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("548","13","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("549","13","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("550","13","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("551","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("552","20","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("553","3","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("554","13","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("555","13","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("556","13","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("557","3","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("558","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("559","3","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("560","13","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("561","3","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("562","3","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("563","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("564","8","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("565","3","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("566","20","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("567","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("568","20","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("569","3","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("570","3","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("571","3","32","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("572","3","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("573","20","54","2022-07-26","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("574","20","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("575","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("576","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("577","8","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("578","10","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("579","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("580","10","51","2022-07-26","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("581","10","51","2022-07-26","CONSULTA DE CITAS ESPIRITUALES","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS ESPIRITUALES");
INSERT INTO tbl_bitacora_sistema VALUES("582","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("583","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("584","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("585","10","51","2022-07-26","CONSULTA DE CITAS ESPIRITUALES","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS ESPIRITUALES");
INSERT INTO tbl_bitacora_sistema VALUES("586","21","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("587","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("588","10","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("589","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("590","10","51","2022-07-26","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("591","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("592","10","51","2022-07-26","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("593","20","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("594","10","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("595","1","32","2022-07-26","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("596","1","0","2022-07-26","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("597","10","48","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("598","20","30","2022-07-26","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 30");
INSERT INTO tbl_bitacora_sistema VALUES("599","20","23","2022-07-26","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("600","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("601","10","51","2022-07-26","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("602","10","51","2022-07-26","CONSULTA DE CITAS ESPIRITUALES","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS ESPIRITUALES");
INSERT INTO tbl_bitacora_sistema VALUES("603","10","51","2022-07-26","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("604","10","51","2022-07-26","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("605","20","30","2022-07-26","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 30");
INSERT INTO tbl_bitacora_sistema VALUES("606","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("607","10","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("608","5","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("609","20","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("610","5","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("611","20","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("612","20","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("613","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("614","20","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("615","20","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("616","16","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("617","3","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("618","16","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("619","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("620","16","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("621","1","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("622","1","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("623","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("624","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("625","1","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("626","11","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("627","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("628","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("629","6","54","2022-07-26","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("630","6","2","2022-07-26","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("631","6","5","2022-07-26","INGRESO AL MANTENIMIENTO DE PERMISOS","VIZUALIZAR LOS REGISTROS DE LOS PERMISOS");
INSERT INTO tbl_bitacora_sistema VALUES("632","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("633","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("634","11","32","2022-07-26","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("635","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("636","11","30","2022-07-26","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 27");
INSERT INTO tbl_bitacora_sistema VALUES("637","11","23","2022-07-26","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("638","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("639","11","30","2022-07-26","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 27");
INSERT INTO tbl_bitacora_sistema VALUES("640","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("641","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("642","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("643","11","20","2022-07-26","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("644","11","2","2022-07-26","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("645","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("646","6","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("647","11","13","2022-07-26","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("648","11","54","2022-07-26","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("649","0","54","2022-07-26","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("650","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("651","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("652","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("653","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("654","1","54","2022-07-27","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("655","1","32","2022-07-27","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("656","1","32","2022-07-27","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("657","1","32","2022-07-27","MODIFICACIÓN","SE MODIFICÓ UNA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("658","6","13","2022-07-27","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("659","7","54","2022-07-27","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("660","7","2","2022-07-27","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("661","7","5","2022-07-27","INGRESO AL MANTENIMIENTO DE PERMISOS","VIZUALIZAR LOS REGISTROS DE LOS PERMISOS");
INSERT INTO tbl_bitacora_sistema VALUES("662","7","6","2022-07-27","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("663","7","3","2022-07-27","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("664","7","1","2022-07-27","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("665","7","54","2022-07-27","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("666","23","54","2022-07-27","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("667","23","51","2022-07-27","CONSULTA DE CITAS MEDICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS MEDICAS");
INSERT INTO tbl_bitacora_sistema VALUES("668","23","51","2022-07-27","CONSULTA DE CITAS PSICOLOGICAS","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS PSICOLOGICAS");
INSERT INTO tbl_bitacora_sistema VALUES("669","23","51","2022-07-27","CONSULTA DE CITAS ESPIRITUALES","EL ESTUDIANTE CONSULTO LA PANTALLA DE SUS CITAS ESPIRITUALES");
INSERT INTO tbl_bitacora_sistema VALUES("670","23","51","2022-07-27","CONSULTA DE MATRICULA ESTUDIANTE","EL ESTUDIANTE CONSULTO LA PANTALLA PARA VER SU MATRICULA");
INSERT INTO tbl_bitacora_sistema VALUES("671","23","54","2022-07-27","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("672","1","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("673","1","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("674","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("675","1","14","2022-07-28","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("676","1","23","2022-07-28","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("677","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("678","1","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("679","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("680","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("681","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("682","1","54","2022-07-28","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("683","6","54","2022-07-28","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("684","6","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("685","6","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("686","6","1","2022-07-28","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("687","6","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("688","1","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("689","1","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("690","1","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("691","1","23","2022-07-28","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 6 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("692","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("693","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("694","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("695","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("696","1","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("697","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("698","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("699","1","32","2022-07-28","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("700","1","54","2022-07-28","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("701","11","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("702","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("703","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("704","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("705","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("706","11","32","2022-07-28","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("707","11","23","2022-07-28","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("708","11","30","2022-07-28","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("709","11","20","2022-07-28","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("710","11","20","2022-07-28","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("711","11","20","2022-07-28","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("712","11","2","2022-07-28","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("713","11","2","2022-07-28","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("714","11","2","2022-07-28","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("715","11","54","2022-07-28","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("716","1","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("717","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("718","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("719","1","2","2022-07-28","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("720","1","22","2022-07-28","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("721","1","21","2022-07-28","INGRESO AL MANTENIMIENTO ÁREAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("722","1","46","2022-07-28","INGRESO AL MANTENIMIENTO SECCIONES","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("723","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("724","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("725","1","32","2022-07-28","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("726","1","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("727","1","54","2022-07-28","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("728","1","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("729","1","23","2022-07-28","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("730","1","23","2022-07-28","ELIMINACIÓN","SE ELIMINÓ LA TUTORÍA  AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("731","1","23","2022-07-28","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("732","1","23","2022-07-28","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 3 AL ESTUDIANTE 5");
INSERT INTO tbl_bitacora_sistema VALUES("733","1","54","2022-07-28","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("734","1","54","2022-07-28","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("735","6","13","2022-07-28","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("736","6","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("737","6","32","2022-07-29","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("738","6","2","2022-07-29","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("739","6","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("740","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("741","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("742","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("743","1","13","2022-07-29","INSERCIÓN","SE REGISTRO AL USUARIO ANYH COMO UN CATEQUISTA");
INSERT INTO tbl_bitacora_sistema VALUES("744","1","32","2022-07-29","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("745","1","32","2022-07-29","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("746","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("747","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("748","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("749","1","13","2022-07-29","INSERCIÓN","SE REGISTRO AL USUARIO ISEL COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("750","1","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("751","29","1","2022-07-29","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("752","29","1","2022-07-29","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("753","29","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITO RECUPERAR LA CONTRASEÑA POR CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("754","29","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("755","29","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("756","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("757","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("758","1","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("759","29","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("760","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("761","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("762","1","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("763","5","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITO RECUPERAR LA CONTRASEÑA POR CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("764","5","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("765","29","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD FUE FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("766","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("767","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("768","2","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("769","2","54","2022-07-29","MODIFICACIÓN DE CONTRASEÑA","EL USUARIO MODIFICÓ LA CONTRASEÑA POR EL METODO DE PREGUNTAS DE SEGURIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("770","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("771","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("772","1","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("773","29","54","2022-07-29","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("774","29","54","2022-07-29","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("775","29","54","2022-07-29","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("776","29","54","2022-07-29","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("777","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("778","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("779","1","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("780","5","54","2022-07-29","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("781","5","54","2022-07-29","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("782","2","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("783","1","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("784","1","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("785","6","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("786","1","14","2022-07-29","MODIFICACIÓN","SE MODIFICO UNA CONTRASEÑA");
INSERT INTO tbl_bitacora_sistema VALUES("787","1","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("788","2","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("789","5","54","2022-07-29","MODIFICACIÓN DE CONTRASEÑA","EL USUARIO MODIFICÓ LA CONTRASEÑA POR EL METODO DE CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("790","5","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("791","6","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("792","5","13","2022-07-29","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("793","5","13","2022-07-29","INSERCIÓN","SE REGISTRO AL USUARIO ARMANDO COMO UN PSICOLOGO");
INSERT INTO tbl_bitacora_sistema VALUES("794","5","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("795","30","1","2022-07-29","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("796","30","1","2022-07-29","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("797","30","54","2022-07-29","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("798","30","54","2022-07-29","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("799","30","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("800","30","54","2022-07-29","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITO RECUPERAR LA CONTRASEÑA POR CORREO");
INSERT INTO tbl_bitacora_sistema VALUES("801","6","13","2022-07-30","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("802","1","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("803","1","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("804","17","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("805","17","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("806","17","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("807","1","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("808","1","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("809","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("810","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("811","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("812","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("813","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("814","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("815","1","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("816","1","32","2022-07-30","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("817","1","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("818","1","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("819","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("820","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("821","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("822","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("823","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("824","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("825","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("826","11","30","2022-07-30","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 25");
INSERT INTO tbl_bitacora_sistema VALUES("827","11","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("828","11","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 25");
INSERT INTO tbl_bitacora_sistema VALUES("829","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("830","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("831","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("832","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("833","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("834","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("835","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("836","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("837","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("838","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("839","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("840","11","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("841","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("842","1","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("843","1","32","2022-07-30","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("844","1","0","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("845","1","32","2022-07-30","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("846","1","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("847","1","32","2022-07-30","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("848","1","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("849","1","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("850","20","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("851","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("852","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("853","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("854","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("855","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("856","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("857","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("858","20","30","2022-07-30","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 9");
INSERT INTO tbl_bitacora_sistema VALUES("859","20","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("860","20","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 9");
INSERT INTO tbl_bitacora_sistema VALUES("861","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("862","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("863","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("864","20","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("865","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("866","20","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("867","20","30","2022-07-30","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 24");
INSERT INTO tbl_bitacora_sistema VALUES("868","20","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("869","20","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 24");
INSERT INTO tbl_bitacora_sistema VALUES("870","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("871","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("872","20","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("873","20","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("874","20","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("875","20","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("876","20","32","2022-07-30","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("877","20","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("878","1","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("879","1","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("880","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("881","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("882","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("883","28","1","2022-07-30","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("884","28","1","2022-07-30","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("885","28","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("886","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("887","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("888","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("889","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("890","28","54","2022-07-30","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("891","28","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("892","28","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("893","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("894","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("895","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("896","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("897","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("898","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("899","11","54","2022-07-30","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("900","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("901","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("902","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("903","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("904","1","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("905","1","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("906","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("907","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("908","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("909","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("910","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("911","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("912","11","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("913","11","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 10");
INSERT INTO tbl_bitacora_sistema VALUES("914","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("915","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("916","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("917","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("918","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("919","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("920","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("921","11","54","2022-07-30","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("922","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("923","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("924","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("925","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("926","11","32","2022-07-30","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("927","11","23","2022-07-30","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("928","11","30","2022-07-30","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("929","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("930","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("931","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("932","11","20","2022-07-30","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("933","11","2","2022-07-30","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("934","11","54","2022-07-30","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("935","6","13","2022-07-30","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("936","6","13","2022-07-31","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("937","6","13","2022-07-31","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("938","6","13","2022-07-31","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("939","1","54","2022-07-31","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("940","6","32","2022-07-31","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("941","1","54","2022-07-31","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("942","1","32","2022-07-31","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("943","6","13","2022-07-31","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("944","1","32","2022-08-01","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("945","1","32","2022-08-01","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("946","1","34","2022-08-01","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("947","6","32","2022-08-01","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("948","6","13","2022-08-01","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("949","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("950","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("951","6","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("952","6","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("953","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("954","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("955","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("956","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("957","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("958","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("959","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("960","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("961","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("962","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("963","3","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("964","3","1","2022-08-02","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("965","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("966","3","14","2022-08-02","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("967","3","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("968","3","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("969","3","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("970","3","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("971","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("972","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("973","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("974","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("975","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("976","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("977","1","22","2022-08-02","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("978","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("979","1","22","2022-08-02","INSERCIÓN","SE REGISTRO UNA TUTORÍA");
INSERT INTO tbl_bitacora_sistema VALUES("980","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("981","7","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("982","1","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("983","7","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("984","3","13","2022-08-02","INSERCIÓN","SE REGISTRO AL USUARIO LUISMI COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("985","3","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("986","31","1","2022-08-02","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("987","31","1","2022-08-02","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("988","1","13","2022-08-02","INSERCIÓN","SE REGISTRO AL USUARIO VALERIA COMO UN TUTOR");
INSERT INTO tbl_bitacora_sistema VALUES("989","31","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("990","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("991","31","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("992","32","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("993","3","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("994","3","22","2022-08-02","INGRESO AL MANTENIMIENTO TUTORÍAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("995","32","1","2022-08-02","Ingreso de preguntas para recuperacion","Nuevo usuario registro las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("996","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("997","32","1","2022-08-02","Cambio de contraseña","Usuario nuevo, hizo el cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("998","32","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("999","32","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1000","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1001","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1002","7","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1003","7","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1004","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1005","1","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1006","2","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1007","2","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1008","2","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1009","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1010","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1011","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1012","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1013","7","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1014","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1015","1","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1016","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1017","3","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1018","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1019","30","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1020","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1021","30","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1022","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1023","30","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1024","3","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1025","1","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1026","3","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1027","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1028","30","54","2022-08-02","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1029","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1030","3","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1031","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1032","11","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1033","0","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1034","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1035","21","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1036","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1037","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1038","1","14","2022-08-02","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1039","21","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1040","3","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1041","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1042","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1043","11","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1044","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1045","3","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1046","30","54","2022-08-02","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1047","3","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1048","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1049","11","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("1050","3","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1051","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1052","3","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1053","1","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1054","21","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1055","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1056","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1057","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1058","15","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1059","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1060","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1061","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1062","15","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1063","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1064","21","31","2022-08-02","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO30");
INSERT INTO tbl_bitacora_sistema VALUES("1065","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1066","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1067","1","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1068","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1069","15","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1070","21","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1071","21","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1072","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1073","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1074","15","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1075","21","31","2022-08-02","REGISTRAR","SE REGISTRO UN PLAN TERAPÉUTICO ");
INSERT INTO tbl_bitacora_sistema VALUES("1076","21","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1077","11","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1078","15","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 30");
INSERT INTO tbl_bitacora_sistema VALUES("1079","11","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1080","21","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1081","3","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1082","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1083","15","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1084","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1085","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1086","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1087","7","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1088","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1089","11","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1090","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1091","3","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1092","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1093","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1094","15","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1095","3","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1096","3","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1097","15","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 31");
INSERT INTO tbl_bitacora_sistema VALUES("1098","21","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1099","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1100","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1101","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1102","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1103","15","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1104","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1105","21","31","2022-08-02","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO24");
INSERT INTO tbl_bitacora_sistema VALUES("1106","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1107","2","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1108","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1109","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1110","15","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1111","2","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1112","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1113","21","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1114","21","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1115","2","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1116","17","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1117","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1118","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1119","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1120","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1121","21","31","2022-08-02","REGISTRAR","SE REGISTRO UN PLAN TERAPÉUTICO ");
INSERT INTO tbl_bitacora_sistema VALUES("1122","21","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1123","17","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1124","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1125","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1126","17","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1127","2","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1128","2","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1129","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1130","2","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1131","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1132","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1133","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1134","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1135","2","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1136","15","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1137","15","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1138","2","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1139","2","0","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1140","2","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1141","17","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1142","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1143","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1144","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1145","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1146","17","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1147","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1148","10","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1149","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1150","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1151","17","31","2022-08-02","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO27");
INSERT INTO tbl_bitacora_sistema VALUES("1152","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1153","17","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1154","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1155","15","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1156","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1157","1","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1158","21","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1159","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1160","17","31","2022-08-02","REGISTRAR","SE REGISTRO UN PLAN TERAPÉUTICO ");
INSERT INTO tbl_bitacora_sistema VALUES("1161","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1162","21","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1163","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1164","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1165","21","34","2022-08-02","INGRESO A MANTENIMIENTO EXPEDIENTE PSICOLOGICO UNICO","MANTENIMIENTO A LOS REGISTROS DE EXPEDIENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1166","21","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1167","17","31","2022-08-02","REGISTRAR","SE REGISTRO EL EXPEDIENTE PSICOLÓGICO A LA PERSONA CON CODIGO9");
INSERT INTO tbl_bitacora_sistema VALUES("1168","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1169","17","31","2022-08-02","REGISTRAR","SE REGISTRO UNA CONSULTA PSICOLÓGICA ");
INSERT INTO tbl_bitacora_sistema VALUES("1170","17","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1171","17","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1172","3","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1173","10","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1174","0","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1175","0","54","2022-08-02","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1176","17","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1177","6","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1178","2","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1179","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1180","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1181","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1182","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1183","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1184","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1185","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1186","2","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1187","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1188","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1189","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1190","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1191","1","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1192","1","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1193","11","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1194","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1195","6","2","2022-08-02","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1196","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1197","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1198","11","30","2022-08-02","REGISTAR EXPEDIENTE","SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO 29");
INSERT INTO tbl_bitacora_sistema VALUES("1199","11","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1200","11","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 29");
INSERT INTO tbl_bitacora_sistema VALUES("1201","2","13","2022-08-02","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1202","2","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1203","11","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1204","11","35","2022-08-02","INSERCIÓN","SEREGISTRÓ UN MEDICAMENTO");
INSERT INTO tbl_bitacora_sistema VALUES("1205","11","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1206","11","35","2022-08-02","ELIMINACIÓN","SE ELIMINÓ UN MEDICAMENTO ");
INSERT INTO tbl_bitacora_sistema VALUES("1207","11","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1208","2","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1209","2","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1210","11","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1211","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1212","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1213","11","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1214","11","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 10");
INSERT INTO tbl_bitacora_sistema VALUES("1215","11","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1216","11","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1217","1","54","2022-08-02","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1218","1","32","2022-08-02","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1219","1","32","2022-08-02","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1220","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1221","11","32","2022-08-02","Ingreso a la pantalla de mantenimiento de Inscripcion Cita ","Ver los registros de los Inscripcion Cita ");
INSERT INTO tbl_bitacora_sistema VALUES("1222","11","23","2022-08-02","Ingreso Matricula","Ingreso al proceso/registros de matricula ");
INSERT INTO tbl_bitacora_sistema VALUES("1223","11","30","2022-08-02","REGISTRAR CONSULTA","SE REGISTRÓ UNA CONSULTA MEDICA AL PACIENTE CON CÓDIGO 9");
INSERT INTO tbl_bitacora_sistema VALUES("1224","11","2","2022-08-02","Ingreso a la tabla de expediente medico","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1225","11","54","2022-08-02","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1226","0","54","2022-08-04","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1227","6","54","2022-08-04","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1228","6","2","2022-08-04","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1229","6","23","2022-08-04","ELIMINACIÓN","SE ELIMINÓ LA TUTORÍA 6 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("1230","6","23","2022-08-04","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 6 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("1231","6","23","2022-08-04","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("1232","6","23","2022-08-04","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("1233","6","23","2022-08-04","INSERCIÓN","SE MATRICULÓ LA TUTORÍA 3 AL ESTUDIANTE 1");
INSERT INTO tbl_bitacora_sistema VALUES("1234","6","23","2022-08-04","INGRESO A MATRÍCULA","AGREGA UNA MATRÍCULA ESPIRITUAL");
INSERT INTO tbl_bitacora_sistema VALUES("1235","6","20","2022-08-05","Ingreso al proceso de Carga Academica","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1236","6","32","2022-08-05","INGRESO A LA PANTALLA MANTENIMIENTO DE CITAS GENERALES ","MANTENIMIENTO REGISTRO DE CITAS GENERALES");
INSERT INTO tbl_bitacora_sistema VALUES("1237","6","32","2022-08-05","INGRESO A LA PANTALLA DE PROCESO CITAS","REGISTRA UNA CITA DE LAS DIFERENTES AREAS ");
INSERT INTO tbl_bitacora_sistema VALUES("1238","6","14","2022-08-05","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1239","6","14","2022-08-05","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1240","6","54","2022-08-05","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1241","6","54","2022-08-05","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1242","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1243","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1244","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1245","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1246","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1247","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1248","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1249","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1250","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1251","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1252","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1253","6","2","2022-08-08","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1254","6","13","2022-08-08","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1255","6","54","2022-08-08","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1256","0","54","2022-08-08","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1257","6","54","2022-08-08","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1258","5","54","2022-08-08","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1259","1","54","2022-08-10","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1260","1","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1261","1","54","2022-08-10","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1262","6","54","2022-08-10","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1263","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1264","6","3","2022-08-10","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("1265","6","3","2022-08-10","Editar parámetro","Se editó el registro de un parámetro ya existente");
INSERT INTO tbl_bitacora_sistema VALUES("1266","6","3","2022-08-10","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("1267","6","3","2022-08-10","Ingreso a la pantalla de mantenimiento parámetros","Aqui se visualiza los registros existentes de la tabla parámetros");
INSERT INTO tbl_bitacora_sistema VALUES("1268","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1269","6","1","2022-08-10","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("1270","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1271","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1272","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1273","6","1","2022-08-10","Usuario ingreso a modificar preguntas","Usuario modifico las preguntas");
INSERT INTO tbl_bitacora_sistema VALUES("1274","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1275","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1276","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1277","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1278","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1279","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1280","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1281","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1282","6","17","2022-08-10","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1283","6","2","2022-08-10","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1284","6","48","2022-08-10","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1285","6","48","2022-08-10","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1286","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1287","6","12","2022-08-10","Ingreso a mantenimiento preguntas","Pregunta realizadas al usuario para cambio de contraseña");
INSERT INTO tbl_bitacora_sistema VALUES("1288","6","19","2022-08-10","Ingreso a mantenimiento especialidad","mantenimiento especialidad");
INSERT INTO tbl_bitacora_sistema VALUES("1289","6","1","2022-08-10","Ingreso a la pantalla de mantenimiento usuarios","Ver los registros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1290","6","54","2022-08-10","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1291","6","54","2022-08-10","SOLICITAR RECUPERACIÓN DE CONTRASEÑA","EL USUARIO SOLICITÓ RECUPERAR LA CONTRASEÑA POR PREGUNTAS DE SEGURIDAD");
INSERT INTO tbl_bitacora_sistema VALUES("1292","6","54","2022-08-10","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1293","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1294","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1295","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1296","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1297","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1298","6","26","2022-08-10","INSERTAR","SE REGISTRO EL PARENTESCO DEL CODIGO 1 DE ESTUDIANTE CON EL CODIGÓ 3 DE FAMILIAR ");
INSERT INTO tbl_bitacora_sistema VALUES("1299","6","13","2022-08-10","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1300","6","26","2022-08-10","INSERTAR","SE REGISTRO EL PARENTESCO DEL CODIGO 1 DE ESTUDIANTE CON EL CODIGÓ 4 DE FAMILIAR ");
INSERT INTO tbl_bitacora_sistema VALUES("1301","6","48","2022-08-10","INSERCIÓN","SE REGISTRÓ UNA NUEVA CITA");
INSERT INTO tbl_bitacora_sistema VALUES("1302","6","2","2022-08-10","Ingreso a la tabla de roles","Usuario se autentifico ");
INSERT INTO tbl_bitacora_sistema VALUES("1303","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1304","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1305","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1306","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1307","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1308","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1309","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1310","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1311","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1312","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1313","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1314","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1315","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1316","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1317","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1318","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1319","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1320","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1321","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1322","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1323","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1324","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1325","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1326","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1327","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1328","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1329","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1330","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1331","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1332","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1333","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1334","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1335","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1336","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1337","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1338","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1339","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1340","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1341","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1342","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1343","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1344","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1345","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1346","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1347","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1348","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1349","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1350","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1351","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1352","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1353","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1354","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1355","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1356","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1357","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1358","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1359","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1360","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1361","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1362","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1363","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1364","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1365","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1366","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1367","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1368","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1369","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1370","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1371","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1372","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1373","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1374","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1375","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1376","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1377","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1378","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1379","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1380","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1381","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1382","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1383","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1384","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1385","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1386","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1387","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1388","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1389","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1390","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1391","6","9","2022-08-11","MODIFICACION","SE MODIFICO CONTADOR");
INSERT INTO tbl_bitacora_sistema VALUES("1392","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1393","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1394","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1395","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1396","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1397","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1398","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1399","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1400","6","54","2022-08-11","CERRAR SESIÓN","USUARIO CERRÓ SESIÓN");
INSERT INTO tbl_bitacora_sistema VALUES("1401","3","54","2022-08-11","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1402","3","54","2022-08-11","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1403","3","54","2022-08-11","AUTENTICACIÓN FALLIDA","INTENTÓ DE INICIO DE SESIÓN FALLIDO");
INSERT INTO tbl_bitacora_sistema VALUES("1404","3","54","2022-08-11","AUTENTICACIÓN FALLIDA","EL USUARIO FUE BLOQUEADO POR INTENTOS DE INICIO DE SESIÓN FALLIDOS");
INSERT INTO tbl_bitacora_sistema VALUES("1405","6","54","2022-08-11","AUTENTICACIÓN CORRECTA","USUARIO INICIO SESIÓN CORRECTAMENTE");
INSERT INTO tbl_bitacora_sistema VALUES("1406","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1407","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1408","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1409","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1410","6","14","2022-08-11","MODIFICACIÓN","SE MODIFICO UN USUARIO");
INSERT INTO tbl_bitacora_sistema VALUES("1411","6","1","2022-08-11","Parametros Usuarios","Ver los parametros de los usuarios");
INSERT INTO tbl_bitacora_sistema VALUES("1412","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1413","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1414","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1415","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1416","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1417","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1418","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1419","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1420","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1421","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1422","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1423","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1424","6","44","2022-08-11","INGRESO A LA PANTALLA MANTENIMIENTO PARENTESCO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1425","6","17","2022-08-11","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1426","6","17","2022-08-11","INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO","SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1427","6","13","2022-08-11","INGRESO A LA PANTALLA REGISTRO DE PERSONAS","USUARIO SE AUTENTIFICO");
INSERT INTO tbl_bitacora_sistema VALUES("1428","6","6","2022-08-11","Ingreso a la pantalla de mantenimiento objetos","Ver los registros de los objetos");
INSERT INTO tbl_bitacora_sistema VALUES("1429","6","5","2022-08-11","MODIFICACIÓN","SE MODIFICO UN PERMISO A UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1430","6","5","2022-08-11","MODIFICACIÓN","SE MODIFICO UN PERMISO A UN ROL");
INSERT INTO tbl_bitacora_sistema VALUES("1431","6","5","2022-08-11","MODIFICACIÓN","SE MODIFICO UN PERMISO A UN ROL");



DROP TABLE IF EXISTS tbl_carga_academica;

CREATE TABLE `tbl_carga_academica` (
  `CODIGO_CARGA` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_TUTORIA` int(5) NOT NULL,
  `CODIGO_PERSONA` int(5) NOT NULL,
  `CODIGO_MODALIDAD` int(5) DEFAULT NULL,
  `CODIGO_SECCION` int(5) DEFAULT NULL,
  `CODIGO_ESTADO` int(11) NOT NULL,
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
  KEY `FK_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_CODSEC_CARG` FOREIGN KEY (`CODIGO_SECCION`) REFERENCES `tbl_seccion` (`CODIGO_SECCION`),
  CONSTRAINT `FK_ESTADO` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PK_COD_MOD` FOREIGN KEY (`CODIGO_MODALIDAD`) REFERENCES `tbl_modalidad` (`CODIGO_MODALIDA`),
  CONSTRAINT `PK_COD_PE` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`),
  CONSTRAINT `PK_COD_TUTO` FOREIGN KEY (`CODIGO_TUTORIA`) REFERENCES `tbl_tutoria` (`CODIGO_TUTORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_carga_academica VALUES("1","2","18","1","1","2","13:30:00","14:00:00","2022-08-02","2022-08-27","2022","2","GABRIELA","2022-07-27","2022-08-03","ALEXANDER");
INSERT INTO tbl_carga_academica VALUES("2","6","16","1","1","2","13:30:00","14:00:00","2022-08-04","2022-08-31","2022","1","ADMIN","2022-07-27","2022-08-03","RUT");
INSERT INTO tbl_carga_academica VALUES("3","4","8","1","1","2","14:00:00","15:07:00","2022-07-30","2022-11-26","2022","1","CESAR","2022-07-27","","");
INSERT INTO tbl_carga_academica VALUES("4","6","21","1","3","2","12:00:00","13:00:00","2022-07-26","2022-08-26","2022","2","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_carga_academica VALUES("5","3","18","1","3","2","11:00:00","12:00:00","2022-07-27","2022-08-28","2022","4","RUT","2022-07-27","","");
INSERT INTO tbl_carga_academica VALUES("6","1","16","1","2","2","10:00:00","11:00:00","2022-07-26","2022-08-31","2022","2","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_carga_academica VALUES("7","5","32","1","1","2","14:00:00","15:00:00","2022-08-02","2022-09-29","2022","4","LUZ","2022-08-03","","");
INSERT INTO tbl_carga_academica VALUES("8","3","13","1","2","2","11:00:00","11:00:00","2022-08-06","2022-09-03","2022","3","CESAR","2022-08-03","","");



DROP TABLE IF EXISTS tbl_consulta_espiritual;

CREATE TABLE `tbl_consulta_espiritual` (
  `CODIGO_CONSULTA_ESPIRITUAL` int(10) NOT NULL AUTO_INCREMENT,
  `CODIGO_CITA` int(10) DEFAULT NULL,
  `MOTIVO_CONSULTA` longtext DEFAULT NULL,
  `OBSERVACIONES` longtext DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CONSULTA_ESPIRITUAL`),
  KEY `COD_CITA_ESPI_FK` (`CODIGO_CITA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_consulta_espiritual VALUES("1","17","Consejo espiritual","Ninguna","2022-07-26");



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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_consulta_medica VALUES("1","1","11","Fiebre alta","Tiene baja las plaquetas","Ninguna"," Ninguna","","2022-07-27","","");
INSERT INTO tbl_consulta_medica VALUES("2","2","4","inflamación, dolor y ardor","grave","toda la cara"," piel muy irritada","","2022-07-27","","");
INSERT INTO tbl_consulta_medica VALUES("3","3","18","le duele la cabeza en situaciones de estrés","migraña a causa de estrés","al tomarse el medicamento se siente mejor"," todo bien","","2022-07-27","","");
INSERT INTO tbl_consulta_medica VALUES("4","4","3","ninguno","ninguno","ninguno"," ninguno","","2022-07-27","","");
INSERT INTO tbl_consulta_medica VALUES("5","5","20","fiebre,vomito dolor de cabeza etc","se ve muy mal","no se tiene aun"," mandar a hacer examenes y recetar","","2022-07-29","","");
INSERT INTO tbl_consulta_medica VALUES("6","6","26","fiebre dolor de cuepero","NO SE TIENE uno aun","ninguno"," nada aun","","2022-07-30","","");
INSERT INTO tbl_consulta_medica VALUES("7","7","34","no tiene","no tiene ","no tiene "," no tiene","","2022-07-30","","");
INSERT INTO tbl_consulta_medica VALUES("8","8","35","no tienen","no tiene","no tiene "," no tiene","","2022-07-30","","");
INSERT INTO tbl_consulta_medica VALUES("9","9","22","nkjnjknkjnk","jnknjnknknj","jknkjnkjn"," nmknm,n,mnm,","","2022-07-30","","");
INSERT INTO tbl_consulta_medica VALUES("10","10","23","jkjkhk","jnkjnkjnhjkhhkjhjhkjhkh","jnkjnkjnjknkjhkjhkjkkjhk"," jnkkkjhhkkjhkhkjhkj","","2022-07-30","","");
INSERT INTO tbl_consulta_medica VALUES("11","11","40","DIARREA","AGUDO","LEVE"," NINGUNO","","2022-08-03","","");
INSERT INTO tbl_consulta_medica VALUES("12","12","42","FIEBRE ALTA","POSIBLE INFECCION ORINARIA","EN TRATAMIENTO"," NINGUNO","","2022-08-03","","");
INSERT INTO tbl_consulta_medica VALUES("13","13","43","MAREOS ","PRESION ALTA","NINGUNA"," PRESENTA  PRESION ALTA ","","2022-08-03","","");
INSERT INTO tbl_consulta_medica VALUES("14","14","50","DOLOR DE CABEZA","POSIBLE FIEBRE","LEVE"," NINGUNO","","2022-08-03","","");
INSERT INTO tbl_consulta_medica VALUES("15","15","51","DOLOR DE CABEZA,NAUESAS","RECETAR MEDICAMENTOS Y EXAMNE","SE ESPERAN BUENOS RESULTADOS"," NINGUNA","","2022-08-03","","");
INSERT INTO tbl_consulta_medica VALUES("16","16","52","DOLOR DE CUERPO","POSIBLE COVID","LEVE","  NINGUNO","","2022-08-03","","");



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
INSERT INTO tbl_contenido_socioeconomico VALUES("9","3","ABUELA");
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

INSERT INTO tbl_correo_electronico VALUES("compartirhospital@gamil.com","1");
INSERT INTO tbl_correo_electronico VALUES("dianaamador130@gmail.com","2");
INSERT INTO tbl_correo_electronico VALUES("montoyaluz0405@gmail.com","3");
INSERT INTO tbl_correo_electronico VALUES("jose@gmail.com","4");
INSERT INTO tbl_correo_electronico VALUES("gabriela17@gmail.com","5");
INSERT INTO tbl_correo_electronico VALUES("aacaballero@unah.hn","6");
INSERT INTO tbl_correo_electronico VALUES("cesar.rovelo@unah.hn","7");
INSERT INTO tbl_correo_electronico VALUES("juan@gmail.com","8");
INSERT INTO tbl_correo_electronico VALUES("davidochoa@gmail.com","9");
INSERT INTO tbl_correo_electronico VALUES("ikerCasillas@gmail.com","10");
INSERT INTO tbl_correo_electronico VALUES("daniel@gmail.com","11");
INSERT INTO tbl_correo_electronico VALUES("lidia@gmail.com","12");
INSERT INTO tbl_correo_electronico VALUES("gisseladiaz1998@gmail.com","13");
INSERT INTO tbl_correo_electronico VALUES("Josue@gmail.com","14");
INSERT INTO tbl_correo_electronico VALUES("sendykarina@gmail.com","15");
INSERT INTO tbl_correo_electronico VALUES("margarita@gmail.com","16");
INSERT INTO tbl_correo_electronico VALUES("ramon@gmail.com","17");
INSERT INTO tbl_correo_electronico VALUES("francisco@gmail.com","18");
INSERT INTO tbl_correo_electronico VALUES("josue@unah.hn","19");
INSERT INTO tbl_correo_electronico VALUES("laura@gmail.com","20");
INSERT INTO tbl_correo_electronico VALUES("majo@gmail.com","21");
INSERT INTO tbl_correo_electronico VALUES("paula@gmail.com","22");
INSERT INTO tbl_correo_electronico VALUES("mario@gmail.com","23");
INSERT INTO tbl_correo_electronico VALUES("Cris25@gmail.com","24");
INSERT INTO tbl_correo_electronico VALUES("andrea@gmail.com","25");
INSERT INTO tbl_correo_electronico VALUES("karen@gmail.com","26");
INSERT INTO tbl_correo_electronico VALUES("katy@gmail.com","27");
INSERT INTO tbl_correo_electronico VALUES("Nolvia@gmail.com","28");
INSERT INTO tbl_correo_electronico VALUES("desireth@gmail.com","29");
INSERT INTO tbl_correo_electronico VALUES("naomi@gmail.com","30");
INSERT INTO tbl_correo_electronico VALUES("erick@gmail.com","31");
INSERT INTO tbl_correo_electronico VALUES("hmeli90@yahoo.es","32");
INSERT INTO tbl_correo_electronico VALUES("iselflores@gmail.com","33");
INSERT INTO tbl_correo_electronico VALUES("gisseladiaz@gmail.com","34");
INSERT INTO tbl_correo_electronico VALUES("luismi@gmail.com","35");
INSERT INTO tbl_correo_electronico VALUES("valeria@gmail.com","36");



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_especialidad VALUES("1","MEDICINA GENERAL ","2","ATIENDE DE TODO ","","0000-00-00","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("2","TERAPIA GENERAL","3","ATIENDE DE TODO TIPO DE LOCOS","","0000-00-00","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("3","CATEQUESIS JUVENIL","4","CHARLAS CON JOVENES","","0000-00-00","0000-00-00","");
INSERT INTO tbl_especialidad VALUES("4","PEDIATRIA","2","ATENCIÓN A MENORES DE EDAD","","0000-00-00","","");
INSERT INTO tbl_especialidad VALUES("5","PSICOLOGIA COGNITIVA CONDUCTUAL","3","ÁREA PSICOLOGÍA","","0000-00-00","","");



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
  `GRADO_ACTUAL` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `REPITENTE` varchar(2) COLLATE utf8mb4_bin NOT NULL,
  `INDICE_ACADEMICO` int(3) DEFAULT NULL,
  `MATE_BAJO_RENDI` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `PASATIEMPOS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DISTRACTORES_ESCOLARES` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `METAS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE`),
  KEY `FK_COD_EST` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_estudiante VALUES("1","9","QUINTO","NO","85","matematica","videojuegos","youtube","ingeniero");
INSERT INTO tbl_estudiante VALUES("2","10","TERCERO","NO","90","Matemáticas","Ver televisión","Redes sociales","Estudiar en la Unah");
INSERT INTO tbl_estudiante VALUES("3","24","NOVENO","NO","90","Inglés","Ver televisión","Redes sociales","Estudiar medicina");
INSERT INTO tbl_estudiante VALUES("4","25","QUINTO","NO","96","Matematica","television","celular","doctora");
INSERT INTO tbl_estudiante VALUES("5","27","SEPTIMO","NO","98","ninguna","leer hacer calculos matematicos","youtube","ser astronauta");
INSERT INTO tbl_estudiante VALUES("6","29","OCTAVO","NO","80","Español","Dibujar","Videos Juegos","Estudiar Ingeniería Agrónomo ");
INSERT INTO tbl_estudiante VALUES("7","30","ONCEAVO","NO","90","Inglés","Decorar y dibujar","Instagram","Ser Doctora");
INSERT INTO tbl_estudiante VALUES("8","31","OCTAVO","NO","80","matematicas","jugar futbol","redes sociales","ir a la universidad");



DROP TABLE IF EXISTS tbl_estudiante_socioeconomico;

CREATE TABLE `tbl_estudiante_socioeconomico` (
  `CODIGO_ESTUDIANTE_SOCIOECONOMICO` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONTENIDO_SOCIOECONOMICO` int(15) NOT NULL,
  `CODIGO_ESTUDIANTE` int(15) NOT NULL,
  PRIMARY KEY (`CODIGO_ESTUDIANTE_SOCIOECONOMICO`),
  KEY `FK_CONTSOCIO` (`CODIGO_CONTENIDO_SOCIOECONOMICO`),
  KEY `FK_COD_CON_ES` (`CODIGO_ESTUDIANTE`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_estudiante_socioeconomico VALUES("1","1","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("2","2","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("3","3","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("4","5","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("5","7","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("6","11","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("7","12","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("8","13","1");
INSERT INTO tbl_estudiante_socioeconomico VALUES("9","1","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("10","2","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("11","4","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("12","5","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("13","7","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("14","8","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("15","11","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("16","12","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("17","13","2");
INSERT INTO tbl_estudiante_socioeconomico VALUES("18","1","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("19","2","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("20","4","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("21","7","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("22","11","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("23","12","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("24","13","3");
INSERT INTO tbl_estudiante_socioeconomico VALUES("25","1","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("26","2","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("27","6","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("28","8","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("29","9","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("30","11","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("31","12","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("32","13","4");
INSERT INTO tbl_estudiante_socioeconomico VALUES("33","1","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("34","2","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("35","3","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("36","4","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("37","7","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("38","11","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("39","12","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("40","13","5");
INSERT INTO tbl_estudiante_socioeconomico VALUES("41","1","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("42","4","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("43","7","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("44","8","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("45","11","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("46","12","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("47","13","6");
INSERT INTO tbl_estudiante_socioeconomico VALUES("48","1","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("49","2","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("50","4","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("51","7","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("52","8","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("53","11","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("54","12","7");
INSERT INTO tbl_estudiante_socioeconomico VALUES("55","1","8");
INSERT INTO tbl_estudiante_socioeconomico VALUES("56","6","8");
INSERT INTO tbl_estudiante_socioeconomico VALUES("57","7","8");
INSERT INTO tbl_estudiante_socioeconomico VALUES("58","11","8");
INSERT INTO tbl_estudiante_socioeconomico VALUES("59","12","8");
INSERT INTO tbl_estudiante_socioeconomico VALUES("60","13","8");



DROP TABLE IF EXISTS tbl_examenes_medicos;

CREATE TABLE `tbl_examenes_medicos` (
  `CODIGO_EXAMEN_MEDICO` int(11) NOT NULL AUTO_INCREMENT,
  `EXAMEN_MEDICO` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `FECHA_CREACION` date NOT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `CODIGO_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_EXAMEN_MEDICO`),
  KEY `CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `tbl_examenes_medicos_ibfk_1` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_examenes_medicos VALUES("1","HEMOGRAMA","","DANIEL","2022-07-27","","","2");
INSERT INTO tbl_examenes_medicos VALUES("2","ELECTROGRAMA","","DANIEL","2022-07-30","","","2");



DROP TABLE IF EXISTS tbl_examenes_pacientes;

CREATE TABLE `tbl_examenes_pacientes` (
  `CODIGO_EXAMEN_PACIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_CONSULTA` int(5) DEFAULT NULL,
  `CODIGO_EXAMEN_MEDICO` int(5) DEFAULT NULL,
  `OBSERVACIONES` varchar(400) NOT NULL,
  `INDICACIONES` varchar(400) NOT NULL,
  PRIMARY KEY (`CODIGO_EXAMEN_PACIENTE`),
  KEY `FK_COD_CONSULTA` (`CODIGO_CONSULTA`),
  KEY `FK_COD_EXAMEN_MEDICO` (`CODIGO_EXAMEN_MEDICO`),
  CONSTRAINT `FK_COD_CONSULTA` FOREIGN KEY (`CODIGO_CONSULTA`) REFERENCES `tbl_consulta_medica` (`CODIGO_CONSULTA`),
  CONSTRAINT `FK_COD_EXAMEN_MEDICO` FOREIGN KEY (`CODIGO_EXAMEN_MEDICO`) REFERENCES `tbl_examenes_medicos` (`CODIGO_EXAMEN_MEDICO`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_examenes_pacientes VALUES("1","1","1","NINGUNA","EN AYUNAS");
INSERT INTO tbl_examenes_pacientes VALUES("2","2","1","HACERLO EN AYUNAS, SOLO SE PUEDE TOMAR AGUA","PARA VER NIVEL DE GLOBULOS ROJOS Y BLANCOS");
INSERT INTO tbl_examenes_pacientes VALUES("3","3","1","TRAER LOS EXAMENES","REALIZARLO EN LA CLINICA DE AQUI");
INSERT INTO tbl_examenes_pacientes VALUES("4","4","1","IR TEMPRANO","ES PARA VER COMO EST");
INSERT INTO tbl_examenes_pacientes VALUES("5","5","1","PARA CHEQUER","HACERLO EN AYUNAS");
INSERT INTO tbl_examenes_pacientes VALUES("6","6","2","IR DESAYUNADO","PARA REVISION DEL CORAZON");
INSERT INTO tbl_examenes_pacientes VALUES("7","7","2","IR EN AYUNAS","PARA CHEQUEO DEL CORAZON");
INSERT INTO tbl_examenes_pacientes VALUES("8","8","2","NO TIRNE","PARA CHEQUEO DEL CUEPRO");
INSERT INTO tbl_examenes_pacientes VALUES("9","10","2","\n\nDFJNDFNKNK+6\n`\n\nNJN\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\\55454454544=CDMFM\n\n232323389212\nJM\n\nKNNJNJJNJ\nJNJJJ\n\n M\n\n\n\n N\n\n\n\n\n\n\n\n\n\n\nNDM\nD\n MN M M MFMNDMFNBMBDMFDM\n\n\nN\n54654MNDMNFMNMNMN\nNM NM DN MN NNMN323232\nNMMNMMNNM233\nNBNMFMNDBM\n\n14\n\n\n\n\n\n\n546546451\\]]DF\n\nNSBDMNBMNK NKNS KDNKNNKSJDNFK KJNDKJNKJD\n63232\nDSFMNMNS,MDNSMN 313\nD NFSN \nK KFDNKJND NKDKD\nK","12 CICLO  ACRIVIDAD 6\n\n");
INSERT INTO tbl_examenes_pacientes VALUES("10","11","2","HACERLO EN AYUNAS","SANGRE COMPLETO");
INSERT INTO tbl_examenes_pacientes VALUES("11","12","1","NINGUNA","REALIZARLO EN AYUNA ");
INSERT INTO tbl_examenes_pacientes VALUES("12","14","1","EN AYUNAS","SANGRE COMPLETO");
INSERT INTO tbl_examenes_pacientes VALUES("13","14","2","NINGUNA","PARA CHEQUEO");
INSERT INTO tbl_examenes_pacientes VALUES("14","16","1","NINGUNO","SANGRE");



DROP TABLE IF EXISTS tbl_expediente_espiritual;

CREATE TABLE `tbl_expediente_espiritual` (
  `CODIGO_EXPEDIENTE` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_PERSONA` int(10) DEFAULT NULL,
  `CODIGO_ESTADO` int(10) DEFAULT NULL,
  `NOMBRE_IGLESIA` varchar(50) DEFAULT NULL,
  `GRUPO_IGLESIA` varchar(50) DEFAULT NULL,
  `TIEMPO_ASISTIR_IGLESIA` varchar(50) DEFAULT NULL,
  `MOTIVACION_IGLESIA` longtext DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_EXPEDIENTE`),
  KEY `COD_EXP_ESPIRITUAL_PERSONA` (`CODIGO_PERSONA`),
  KEY `COD_EST_EXP_ESPIRITUAL` (`CODIGO_ESTADO`),
  CONSTRAINT `COD_EST_EXP_ESPIRITUAL` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`),
  CONSTRAINT `COD_EXP_ESPIRITUAL_PERSONA` FOREIGN KEY (`CODIGO_PERSONA`) REFERENCES `tbl_persona` (`CODIGO_PERSONA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_expediente_espiritual VALUES("1","10","2","Santa Tereza de Jesus","Ninguno","Hace 1 año","Participar en las actividades","2022-07-26");
INSERT INTO tbl_expediente_espiritual VALUES("2","9","2","alemania","ninguna","1 año ","dios ","2022-07-30");



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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_expediente_medico VALUES("1","10","2","9","Ninguno","Asma leve","2022-07-26");
INSERT INTO tbl_expediente_medico VALUES("2","31","2","8","ninguno por el momento","alergias unicamente","2022-07-26");
INSERT INTO tbl_expediente_medico VALUES("3","30","2","9","acetaminofén","migraña","2022-07-26");
INSERT INTO tbl_expediente_medico VALUES("4","27","2","8","ninguno","nou tiene","2022-07-26");
INSERT INTO tbl_expediente_medico VALUES("5","25","2","8","ninguno por los momentos","no tiene","2022-07-30");
INSERT INTO tbl_expediente_medico VALUES("6","9","2","8","no tiene","no tiene","2022-07-30");
INSERT INTO tbl_expediente_medico VALUES("7","24","2","9","NO TIENEn","no tiene","2022-07-30");
INSERT INTO tbl_expediente_medico VALUES("8","29","2","8","NINGUNO","DEPRESION LEVE","2022-08-02");



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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_expediente_psicologico_consulta VALUES("1","10","ESCUCHA VOCES,NO PUEDE DORMIR POR LA NOCHES","NINGUNO","SE ESPERA EN RESULTADOS","ES UN CASO DELICADO","","2022-07-27","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("2","9","SE PRESENTA TRISTEZA EN LA MAYOR PARTE DEL TIEMPO","POR LOS SINTOMAS ENCONTRADO LA PERSONA SUFRE DEPRESION","HA MEJORADO AL HACER EJERCICIOS FISICOS","NINGUNA","","2022-07-27","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("3","13","NO TIENE SITNOMAS EL DIA DE HOY","ESTA MEDIO MAL HUMOR","TODAVIA NO SE TIENE","NO SE LE VA CREAR PLAN,SOLO HACER CHARLAS ","","2022-07-27","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("4","41","NERVIOSISMO, DOLORES DE CABEZA INTENSOS","ANSIEDAD SOCIAL","ANSIEDAD","LE CUESTA COMUNICARSE","","2022-08-03","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("5","44","POCA PACIENCIA Y TOLERANCIA","SINTOMAS DE ABANDONO","IRA","SE COMPORTA DEMASIADO INFANTIL","","2022-08-03","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("6","45","NO TIENE ","NO SE TIENE AUN","SE ESPERA QUE BUENO","NINGUNA","","2022-08-03","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("7","46","NO TIENE ","NO TIENE","NO TIENE","NO TIENE","","2022-08-03","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("8","47","NO PUEDE DORMIR EN LA NOCHE,VE SOMBRAS","SE VE TEMEROSA,MIEDOSA","SE ESPERAN BUENOS RESULTADOS","RECETAR PLAN","","2022-08-03","","");
INSERT INTO tbl_expediente_psicologico_consulta VALUES("9","49","ESCULLAS VOCES,LE CUESTA DORMIR POR LAS NOCHES","ES UN CASO DELICADO,SE DEBE TRATAR CON DISCRECION","NO SE TIENE AUN ","NINGUNA","","2022-08-03","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_expediente_psicologico_unico VALUES("1","31","2","SUS FAMILIARES TUVIERON PROBLEMAS DE EQUIZOFRENIA NIVEL 4","SOSPECHAS DE EQUIZOFRENIA","SALUDABLE","2022-07-26");
INSERT INTO tbl_expediente_psicologico_unico VALUES("2","29","2","VIVE CON SUS PADRES  Y SE OBSERVA UNA EXCELENTE RELACION ","TIENE APTITUD POSITIVA ","NINGUNOS ","2022-07-26");
INSERT INTO tbl_expediente_psicologico_unico VALUES("3","30","2","DEPRESIÓN","ANSIEDAD","NINGUNO","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("4","24","2","IRA","NINGUNO","NINGUNO","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("5","27","2","NO TIENE NINGUNO","NO TIENE,PERO PUEDE PADECER ALGUNSO","SE ENCUENTRA EN BUENA SALUD","2022-08-02");
INSERT INTO tbl_expediente_psicologico_unico VALUES("6","9","2","NO PRESENTA NINGUNO","TENDECIAS EQUIZOFRENICAS DESDE PEQUEÑO","SOLO PRESENTA ALERGIAS","2022-08-02");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_familiar VALUES("1","14","CASADO","SECUNDARIA","15000","NINGUNA");
INSERT INTO tbl_familiar VALUES("2","15","CASADA","UNIVERSITARIO","80000","BASILICA DE SUYAPA");
INSERT INTO tbl_familiar VALUES("3","26","SOLTERA","SECUNDARIA","6000","BASILICA DE SUYAPA");
INSERT INTO tbl_familiar VALUES("4","28","CASADA","SECUNDARIA","5000","NINGUNA");



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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_familiares_estudiante VALUES("1","2","1","1");
INSERT INTO tbl_familiares_estudiante VALUES("2","1","2","2");
INSERT INTO tbl_familiares_estudiante VALUES("3","4","3","2");
INSERT INTO tbl_familiares_estudiante VALUES("4","2","4","2");
INSERT INTO tbl_familiares_estudiante VALUES("5","1","3","2");
INSERT INTO tbl_familiares_estudiante VALUES("6","1","4","8");



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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_inscripcion_cita VALUES("1","27","6","5","3","2022-07-27","10:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("2","27","6","5","3","2022-07-26","10:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("3","27","1","13","2","2022-07-26","09:30:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("4","31","8","13","2","2022-07-26","09:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("5","29","6","5","3","2022-07-26","09:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("6","9","1","7","2","2022-07-27","12:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("7","25","4","7","2","2022-07-27","14:30:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("8","10","1","7","2","2022-07-26","09:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("9","29","9","13","3","2022-07-26","13:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("10","31","2","13","3","2022-07-26","17:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("11","10","1","13","2","2022-07-26","12:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("12","31","8","0","2","2022-07-26","14:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("13","31","2","13","3","2022-07-26","15:30:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("14","25","4","5","2","2022-07-26","18:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("15","29","9","0","3","2022-07-26","14:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("16","29","9","9","3","2022-07-26","14:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("17","10","3","13","4","2022-07-26","11:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("18","30","8","13","2","2022-07-26","15:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("19","10","6","5","3","2022-08-10","15:00:00","2022-07-27","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("20","31","1","13","2","2022-07-28","15:00:00","2022-07-29","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("21","9","10","11","4","2022-07-30","12:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("22","10","1","13","2","2022-07-30","09:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("23","31","1","13","2","2022-07-30","09:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("24","30","1","9","2","2022-07-30","10:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("25","27","1","9","2","2022-07-30","10:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("26","25","1","13","2","2022-07-30","18:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("27","25","1","9","2","2022-07-30","11:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("28","10","1","9","2","2022-07-30","11:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("29","31","1","9","2","2022-07-30","12:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("30","30","1","9","2","2022-07-30","12:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("31","27","1","9","2","2022-07-30","13:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("32","25","1","9","2","2022-07-30","13:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("33","24","9","9","3","2022-07-30","17:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("34","9","8","13","2","2022-07-30","17:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("35","24","8","13","2","2022-07-30","18:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("36","9","1","9","2","2022-07-30","14:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("37","24","1","9","2","2022-07-30","16:00:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("38","9","1","9","2","2022-07-30","16:30:00","2022-07-30","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("39","31","4","5","2","2022-08-20","14:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("40","31","1","13","2","2022-08-02","09:30:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("41","30","9","13","3","2022-08-02","14:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("42","30","4","13","2","2022-08-02","13:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("43","31","4","13","2","2022-08-02","15:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("44","24","9","13","3","2022-08-02","10:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("45","31","6","13","3","2022-08-02","09:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("46","30","6","13","3","2022-08-02","09:30:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("47","27","6","13","3","2022-08-02","10:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("48","25","9","9","3","2022-08-02","10:30:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("49","9","6","13","3","2022-08-02","10:30:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("50","29","1","13","2","2022-08-02","14:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("51","10","1","13","2","2022-08-02","17:00:00","2022-08-03","0000-00-00","","");
INSERT INTO tbl_inscripcion_cita VALUES("52","9","1","13","2","2022-08-02","15:30:00","2022-08-03","0000-00-00","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_matricula_academica VALUES("2","3","4","13","2022-07-27","Falta de atención remitirlo al psicólogo","2022-07-26","CESAR","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("3","2","7","9","2022-07-27","","","LUZ","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("4","1","5","13","2022-07-27","  Debe ir a misa todos los domingos","2022-07-26","RUT","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("5","1","6","9","2022-07-27","","","GABRIELA","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("6","3","1","13","2022-07-27","Practicar en las operaciones de sumar","2022-07-26","CESAR","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("7","3","5","9","2022-07-27","","","RUT","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("8","6","5","9","2022-07-27","","","RUT","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("9","5","4","9","2022-07-27","","","CESAR","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("10","2","8","9","2022-07-27","","","ADMIN","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("12","2","2","9","2022-07-27","","","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("14","1","8","9","2022-07-27","","","ADMIN","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("15","3","2","9","2022-07-27","","","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("16","1","1","9","2022-07-27","","","CESAR","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("17","5","7","9","2022-07-27","","","LUZ","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("18","6","1","9","2022-07-27","","","GABRIELA","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("19","1","2","9","2022-07-27","","","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("20","3","6","9","2022-07-27","","","GABRIELA","2022-07-27","","");
INSERT INTO tbl_matricula_academica VALUES("22","5","5","9","2022-07-29","","","ADMIN","2022-07-29","","");
INSERT INTO tbl_matricula_academica VALUES("23","2","1","9","2022-08-05","","","ALEXANDER","2022-08-05","","");
INSERT INTO tbl_matricula_academica VALUES("24","8","1","9","2022-08-05","","","ALEXANDER","2022-08-05","","");



DROP TABLE IF EXISTS tbl_medicamento;

CREATE TABLE `tbl_medicamento` (
  `CODIGO_MEDICAMENTO` varchar(10) NOT NULL,
  `NOMBRE_MEDICAMENTO` varchar(50) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(20) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  `CODIGO_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_MEDICAMENTO`),
  KEY `CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `tbl_medicamento_ibfk_1` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_medicamento VALUES("0102","ACETAMINAFEN","PARA LA INFECCION","DANIEL","2022-07-27","","","2");
INSERT INTO tbl_medicamento VALUES("WJ785","ALERGIN","PARA LA ALERGIA","DANIEL","2022-07-27","","","2");



DROP TABLE IF EXISTS tbl_modalidad;

CREATE TABLE `tbl_modalidad` (
  `CODIGO_MODALIDA` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_MODALIDA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_modalidad VALUES("1","PRESENCIAL","tienen que ir");



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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_ms_hist_contrasena VALUES("1","2","$2a$07$usesomesillystringfore37tskQ0TgAuqkXPeNH3AVSZts/Lxk.i","2","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("2","4","$2a$07$usesomesillystringforePP9wVrG7ur0QdkQ9rpSzfE/DlP4e8u.","4","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("3","6","$2a$07$usesomesillystringforeP7mXKbfh9ebyT3M.rcGnqD3gYHLx/pu","6","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("4","5","$2a$07$usesomesillystringfore55fKevwQuQAFVH9Lewld91JpLY1ghPG","5","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("5","3","$2a$07$usesomesillystringforeFz7dK1VZWNMEJiH0HNOXYw/HL.5hY4.","3","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("6","7","$2a$07$usesomesillystringforelk7hEP5l/8xGhqhzzpBD065n5bEXx2S","7","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("7","11","$2a$07$usesomesillystringforePH8CXTpBjgw/NZeLeXQ6eBg2yFS9OE.","11","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("8","12","$2a$07$usesomesillystringforeUBzOoe/fyqEveRzs1qiMcRg0TjegQPu","12","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("9","15","$2a$07$usesomesillystringforeFUN5v3JgHk8ENz9lcf.hrCfeYRowdmi","15","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("10","17","$2a$07$usesomesillystringforeto0mvDpaV0DK4cFtWyWxnWiZ4qt7Z4.","17","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("11","13","$2a$07$usesomesillystringfore/K7kHH0AKBo3XrR19eUxnbbahup7owe","13","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("12","20","$2a$07$usesomesillystringforeUvuV8h0neq0uPPmQLgOJsjz2TeSbXeC","20","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("13","21","$2a$07$usesomesillystringforeC1qiwiZxWnmXgS0TeTaf41.2zC9eoJa","21","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("14","16","$2a$07$usesomesillystringfore.OFApK0lnq2pWTrZBEzPs25tOi/peQO","16","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("15","8","$2a$07$usesomesillystringfore24KuaN0qO9IVZ9tIXt3l5Gy/G5o.KWm","8","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("16","10","$2a$07$usesomesillystringforecHYBqgWfna9zyvdLydQv0EYK49B5C82","10","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("17","14","$2a$07$usesomesillystringforeVxRNnRV8j0V/Qv7SN5pK5Zs/4jXqeqa","14","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("18","18","$2a$07$usesomesillystringforeOe47YYBALHNylsq90yhjERGpHl.p9kG","18","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("19","19","$2a$07$usesomesillystringforeVTuDZ.MUZx5QQxqolAMBpd2VqKlfrRa","19","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("20","22","$2a$07$usesomesillystringforemrCfnY4uA0DxWUm8xBIP17QxqXX.scS","22","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("21","23","$2a$07$usesomesillystringforehRJWC.CF6mpqr2p1llRk3PxU/cZ65DS","23","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("22","24","$2a$07$usesomesillystringforeHgs1s2uw38U9bfe/nzsY9NxbYN5tPiC","24","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("23","25","$2a$07$usesomesillystringforeBNDqae843YwiG.YpUXHq9I4KSLbDAQ6","25","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("24","26","$2a$07$usesomesillystringfore6EINqszN38WG50TBh9xqXuz82S4gTBK","26","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("25","27","$2a$07$usesomesillystringforeP5wUikw4pkTxWim7XoEvmNeS8uKtbjS","27","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("26","9","$2a$07$usesomesillystringforeK2F0CA.OyIc/hzje/abe5/.lBawI8Ca","9","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("27","29","$2a$07$usesomesillystringforeblZb1GTXAapsXwHWRL.b5euZYiVxqqi","29","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("28","2","$2a$07$usesomesillystringforeCFgULGhtYgEopegGdjbjYiHOQCeHz.S","2","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("29","5","$2a$07$usesomesillystringforek7hUNAdfzELkC2Xk6YPva7JCsoP6rh.","5","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("30","30","$2a$07$usesomesillystringforexaT521Gc5.mSUIJJ0vSh13z7PZH50h2","30","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("31","28","$2a$07$usesomesillystringforef3K3SHJ3KU57GQVdI9QQ7CPsELwicyS","28","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("32","31","$2a$07$usesomesillystringforeo.Za9sjz40Tnh798TxidWyZRTQ.mtoC","31","0000-00-00","","");
INSERT INTO tbl_ms_hist_contrasena VALUES("33","32","$2a$07$usesomesillystringforeXAQheGJF7USzYzdQgtA7gv6RllsR2Va","32","0000-00-00","","");



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

INSERT INTO tbl_objetos VALUES("1","MANTENIMIENTO DE ESTADOS","SISTEMA DE ADMINISTRACION. ","Administrador","2022-02-09","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("2","MANTENIMIENTO DE ROLES","OBJETO DONDE SE REGISTRAN PERSONAS   ","Administrador","2022-02-06","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("3","MANTENIMIENTO DE PARAMETROS"," OBJETO MANTENIMIENTO PARAMETROS","Administrador","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("4","MANTENIMIENTO DE PREGUNTAS","OBJETO MANTENIMIENTO PREGUNTAS  ","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("5","MANTENIMIENTO DE PERMISOS","OBJETO MANTENIMIENTO PERMISOS  ","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("6","MANTENIMIENTO DE OBJETOS","OBJETO MANTENIMIENTO OBJETOS","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("7","BITACORA DEL SISTEMA","OBJETO CONSULTA BITACORA ","ADMIN","2022-03-04","2022-06-20","ADMIN");
INSERT INTO tbl_objetos VALUES("10","RESPALDO Y RESTAURACION","OBJETO MANTENIMIENTO BACKUP  ","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("20","GESTION CARGA ACADEMICA Y ESPIRITUAL","OBJETO MANTENIMIENTO CARGA ACADÉMICA Y ESPIRITUAL","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("23","MATRICULA ACADEMICA Y ESPIRITUAL","GESTION DE LA MATRICULA ACADEMICA Y ESPIRITUAL","ADMIN","2022-03-04","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("25","GESTION USUARIOS","GESTION DE LOS DATOS DE LOS USUARIOS","","0000-00-00","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("26","GESTION DE ESTUDIANTES","OBJETO DE GESTION DE LOS ESTUDIANTES","ADMIN","2022-03-10","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("27","SEGURIDAD","GESTION DE SEGURIDAD","ADMIN","2022-03-10","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("30","AREA MEDICA","OBJETO DE GESTION DE LAS CITAS MEDICAS","ADMIN","2022-03-10","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("31","AREA PSICOLOGIA","OBJETO DEL AREA PSICOLOGICA","ADMIN","2022-03-18","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("32","GESTION DE CITAS","OBJETO QUE GESTIONA LAS CITAS","","2022-03-27","2022-07-07","ADMIN");
INSERT INTO tbl_objetos VALUES("38","AREA ACADEMICA","GESTIÓN DEL MÓDULO DEL TUTOR ACADEMICO","","2022-04-21","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("49","GESTION DE PRECLINICA POR ENFERMEROS","OBJETO PARA VER PRECLINICA POR LOS ENFERMEROS","","2022-04-24","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("50","GESTION DE PRECLINICA POR MEDICOS","OBJETO PARA VER PRECLINICA POR PARTE DE LOS MEDICOS","","2022-04-24","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("51","AREA DE ESTUDIANTES","VER LO ASIGNADO A EL ESTUDIANTE.","ADMIN","2022-05-03","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("52","AREA ESPIRITUAL","GESTION DEL AREA ESPIRITUAL POR EL CATEQUISTA","ALBERT","2022-05-06","2022-07-08","ADMIN");
INSERT INTO tbl_objetos VALUES("54","ACCESO AL SISTEMA","OBJETO QUE DESCRIBE EL ACCESO AL SISTEMA","HOLA","2022-06-18","0000-00-00","");



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
INSERT INTO tbl_parametros VALUES("2","NUM_MAX_PREGUNTAS","2","Administrador","2022-02-07","2022-08-11","ALEXANDER");
INSERT INTO tbl_parametros VALUES("3","NUM_MAX_CONTRASENAS","8","Administrador","2022-02-07","2022-03-10","ADMIN");
INSERT INTO tbl_parametros VALUES("4","NUM_MAX_CARACTER","15","Administrador","2022-02-07","2022-04-07","ADMIN");
INSERT INTO tbl_parametros VALUES("5","ADMIN_SERVIDOR_CORREO","smtp-mail.outlook.com","","0000-00-00","2022-07-06","LUIS");
INSERT INTO tbl_parametros VALUES("6","ADMIN_CPASSWORD","Prosecar123*","","0000-00-00","","");
INSERT INTO tbl_parametros VALUES("7","ADMIN_CUSUARIO","pruebaprosecar@outlook.com","","0000-00-00","2022-07-06","LUIS");
INSERT INTO tbl_parametros VALUES("8","ADMIN_CPUERTO","587","ADMIN","2022-03-07","0000-00-00","");
INSERT INTO tbl_parametros VALUES("10","NOMBRE_EMPRESA","PROYECTO SEMILLERO CARMELITANO PROSECAR\n","ADMIN","2022-03-22","0000-00-00","");
INSERT INTO tbl_parametros VALUES("11","MAX_MESES_DE_TUTURIA","6","ADMIN","0000-00-00","0000-00-00","");
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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_parametros_usuarios VALUES("1","1","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("2","2","1","0","","0000-00-00","2022-08-11","");
INSERT INTO tbl_parametros_usuarios VALUES("3","2","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("4","2","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("5","2","19","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("6","3","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("7","3","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("8","3","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("9","3","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("10","4","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("11","4","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("12","4","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("13","4","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("14","5","1","3","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("15","5","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("16","5","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("17","5","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("18","6","1","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("19","6","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("20","6","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("21","6","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("22","7","1","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("23","7","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("24","7","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("25","7","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("26","8","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("27","8","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("28","8","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("29","8","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("30","9","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("31","9","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("32","9","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("33","9","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("34","10","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("35","10","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("36","10","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("37","10","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("38","11","1","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("39","11","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("40","11","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("41","11","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("42","12","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("43","12","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("44","12","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("45","12","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("46","13","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("47","13","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("48","13","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("49","13","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("50","14","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("51","14","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("52","14","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("53","14","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("54","15","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("55","15","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("56","15","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("57","15","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("58","16","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("59","16","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("60","16","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("61","16","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("62","17","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("63","17","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("64","17","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("65","17","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("66","18","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("67","18","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("68","18","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("69","18","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("70","19","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("71","19","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("72","19","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("73","19","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("74","20","1","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("75","20","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("76","20","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("77","20","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("78","21","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("79","21","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("80","21","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("81","21","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("82","22","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("83","22","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("84","22","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("85","22","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("86","23","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("87","23","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("88","23","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("89","23","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("90","24","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("91","24","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("92","24","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("93","24","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("94","25","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("95","25","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("96","25","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("97","25","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("98","26","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("99","26","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("100","26","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("101","26","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("102","27","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("103","27","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("104","27","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("105","27","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("106","28","1","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("107","28","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("108","28","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("109","28","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("110","29","1","3","","0000-00-00","2022-08-11","");
INSERT INTO tbl_parametros_usuarios VALUES("111","29","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("112","29","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("113","29","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("114","30","1","2","","0000-00-00","2022-08-11","");
INSERT INTO tbl_parametros_usuarios VALUES("115","30","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("116","30","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("117","30","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("118","31","1","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("119","31","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("120","31","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("121","31","19","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("122","32","1","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("123","32","2","1","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("124","32","3","0","","0000-00-00","","");
INSERT INTO tbl_parametros_usuarios VALUES("125","32","19","0","","0000-00-00","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_permisos VALUES("1","1","1","SI","SI","SI","SI","Administrador","2022-03-02","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("6","1","2","SI","SI","SI","SI","ADMIN","2022-03-04","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("8","1","5","SI","SI","SI","SI","ADMIN","2022-03-05","ADMIN","2022-03-11");
INSERT INTO tbl_permisos VALUES("10","1","10","SI","SI","SI","SI","ADMIN","2022-03-05","$1","2022-08-12");
INSERT INTO tbl_permisos VALUES("13","1","3","SI","SI","SI","SI","ADMIN","2022-03-07","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("14","1","4","SI","SI","SI","SI","ADMIN","2022-03-07","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("15","2","38","SI","SI","SI","SI","ADMIN","2022-03-08","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("17","1","25","SI","SI","SI","SI","","0000-00-00","$1","2022-07-13");
INSERT INTO tbl_permisos VALUES("18","1","26","SI","SI","SI","SI","ADMIN","2022-03-10","$1","2022-07-13");
INSERT INTO tbl_permisos VALUES("19","1","27","SI","SI","SI","SI","ADMIN","2022-03-10","ADMIN","2022-03-10");
INSERT INTO tbl_permisos VALUES("23","1","7","SI","SI","SI","SI","ADMIN","2022-03-12","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("24","5","30","SI","SI","SI","SI","ADMIN","2022-03-14","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("25","4","31","SI","SI","SI","SI","ADMIN","2022-03-18","","0000-00-00");
INSERT INTO tbl_permisos VALUES("26","1","32","SI","SI","SI","SI","","2022-03-27","$1","2022-07-13");
INSERT INTO tbl_permisos VALUES("36","5","32","NO","NO","NO","NO","","2022-04-14","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("41","1","20","SI","SI","SI","SI","","2022-04-23","$1","2022-07-13");
INSERT INTO tbl_permisos VALUES("43","1","23","SI","SI","SI","SI","","2022-04-24","$1","2022-04-25");
INSERT INTO tbl_permisos VALUES("46","1","6","SI","SI","SI","SI","","2022-04-24","$1","2022-04-26");
INSERT INTO tbl_permisos VALUES("53","7","49","SI","SI","SI","SI","","2022-04-24","","0000-00-00");
INSERT INTO tbl_permisos VALUES("54","5","50","SI","SI","SI","SI","","2022-04-24","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("56","9","27","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("57","9","5","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("58","9","20","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("62","9","25","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("63","9","26","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("65","9","23","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("66","9","6","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("67","9","30","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("68","9","32","SI","SI","SI","SI","","2022-05-03","","0000-00-00");
INSERT INTO tbl_permisos VALUES("69","9","31","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("71","9","10","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("72","9","7","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("73","9","38","SI","SI","SI","SI","","2022-05-04","","0000-00-00");
INSERT INTO tbl_permisos VALUES("74","9","52","SI","SI","SI","SI","","2022-05-06","","0000-00-00");
INSERT INTO tbl_permisos VALUES("75","6","52","SI","SI","SI","SI","","2022-05-06","$1","2022-07-08");
INSERT INTO tbl_permisos VALUES("82","8","51","SI","SI","SI","SI","","2022-05-25","","0000-00-00");
INSERT INTO tbl_permisos VALUES("94","9","2","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("95","9","4","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("96","9","1","SI","SI","SI","SI","","2022-06-05","","0000-00-00");
INSERT INTO tbl_permisos VALUES("97","9","3","SI","SI","SI","SI","","2022-06-05","","0000-00-00");



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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_persona VALUES("1","ADMIN","ADMIN","ADMIN","ADMIN","","M","2000-05-20","TEGUCIGALPA","","2022-07-26","","3","","2022-07-26","","");
INSERT INTO tbl_persona VALUES("2","DIANAA","RUT","GARCIA","AMADOR","0801200012391","F","2000-06-16","FRANCISCO MORAZAN","EN UNA CASITA :3","2022-07-26","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("3","LUZ","MARÍA","MONTOYA","MEDINA","0801200108492","F","2001-05-04","TEGUCIGALPA","MI CASA","2022-07-26","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("4","JOSE","LUIS","MORALES","DIAZ","0810199365874","M","1993-08-23","TEGUCIGALPA","COLONIA ALEMAN","2022-07-26","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("5","GABRIELA","GISSELA","DIAZ","AGUILERA","0601197000182","F","1970-11-17","CHOLUTECA","BARRIO LAS COLINAS CHOLUTECA ","2022-07-26","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("6","ARNOLD","ALEXANDER","CABALLERO","","1411199600015","M","1990-07-05","OCOTEPEQUE","LA LAGUNA","2022-07-26","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("7","CESAR","FERNANDO","ROVELO","VELASQUEZ","0801199902485","M","1999-02-02","TEGUS","UN LUGAR ","2022-07-26","","1","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("8","JUAN","ALBERTO","PEREZ","CRUZ","1202199601236","M","1996-03-06","LA PAZ","COL. KENEDY","2022-07-26","","2","LUZ","0000-00-00","","");
INSERT INTO tbl_persona VALUES("9","DAVID","ALEJANDRO","OCHOA","MARQUEZ","0943928932402","M","2011-05-26","TEGUCIGALPA","PRADOS UNIVERSITARIO","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("10","IKER","JOSUE","URQUIA","YANES","0801200902454","M","2009-05-01","TEGUCIGALPA","LA LAGUNA","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("11","DANIEL","FERDINAND","MARTINEZ","MORADEL","9565566556556","M","1998-05-08","TEGUCIGALPA","COLONIA LAS COLINAS","2022-07-26","","5","JOSE","0000-00-00","","");
INSERT INTO tbl_persona VALUES("12","LIDIA","RAQUEL","AMADOR","BORJAS","0812331232123","F","1974-06-18","CHOLUTECA","LOMAS DLE GUIJARRO","2022-07-26","","6","RUT","0000-00-00","","");
INSERT INTO tbl_persona VALUES("13","YAMILETH","KARLA","AGUILERA","DIAZ","0612199500162","F","1995-11-21","PESPIRE","PESPIRE","2022-07-26","","8","GABRIELA","0000-00-00","","");
INSERT INTO tbl_persona VALUES("14","JOSUE","EMMANUEL","URQUIA","YANES","0801199015454","M","1990-02-05","TEGUCIGALPA","LA LAGUNA","2022-07-26","","7","ALEXANDER","0000-00-00","","");
INSERT INTO tbl_persona VALUES("15","SENDY","KARINA","MARQUEZ","VELASQUEZ","9891283901823","F","1979-06-13","TEGUCIGALPA","PRADOS UNIVERSITARIO","2022-07-26","","7","CESAR","0000-00-00","","");
INSERT INTO tbl_persona VALUES("16","ELENA","MARGARITA","MARTINEZ","CASTILLO","0801199032657","F","1990-07-13","TEGUCIGALPA","COL. 15 DE SEPTIEMBRE","2022-07-26","","2","LUZ","0000-00-00","","");
INSERT INTO tbl_persona VALUES("17","RAMON","JOEL","SOTO","DIAZ","4365445546543","M","1995-04-05","TEGUCIGALPA","COLONIA LAS BRISAS","2022-07-26","","5","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("18","FRANCISCO","","FLORES","","0602199001728","M","1990-07-30","CHOLUTECA","CHOLUTECA","2022-07-26","","8","GABRIELA","0000-00-00","","");
INSERT INTO tbl_persona VALUES("19","JOSUE","SAMUEL","AGUILAR","ZAPATO","0814700023212","M","1978-05-18","FRANCICOS MORAZA","LAS CASITAS","2022-07-26","","6","RUT","0000-00-00","","");
INSERT INTO tbl_persona VALUES("20","LAURA","","ESPINAL","","0611198501230","F","1985-10-06","VALLE","VALLE","2022-07-26","","8","GABRIELA","0000-00-00","","");
INSERT INTO tbl_persona VALUES("21","MARIA","JOSÉ","MONTALVAN","IRIAS","0803199909637","F","1999-03-09","TEGUCIGALPA","COL.  LAS VEGAS","2022-07-26","","2","LUZ","0000-00-00","","");
INSERT INTO tbl_persona VALUES("22","PAULA","SOFIA","MARADIAGA","GARCIA","0812456859874","F","1993-04-05","SAN PEDRO SULA","COLONIA VIDELLA MORALES","2022-07-26","","5","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("23","MARIO","ALEX","POW","RIVERA","0640148787848","M","1990-08-16","FRANCISCO MORAZAN","MIRAFLORES","2022-07-26","","6","RUT","0000-00-00","","");
INSERT INTO tbl_persona VALUES("24","CRISTOPHER","JOSUE","URQUIA","YANES","0801200898987","M","2008-02-24","TEGUCIGALPA","COL LA LAGUNA","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("25","ANDREA","LUCIA","MACHADO","VELASQUEZ","6657567567567","F","2011-10-04","TEGUCIGALPA","ALDEA DE SUYAPA","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("26","KAREN","LIZTHE","MACHADO","VELASQUEZ","6950695096059","F","1984-08-24","TEGUCIGALPA","ALDEA DE SUYAPA","2022-07-26","","7","CESAR","0000-00-00","","");
INSERT INTO tbl_persona VALUES("27","KATY","DANELA","ZAPATA","MORALES","0801201012339","F","2010-05-15","FRANCISCO MORAZAN","EL PEDREGAL","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("28","NOLVIA","MELLISA","GONZALES","","0501989256456","M","1989-05-25","TEGUCIGALPA","COL CERRO GRANDE","2022-07-26","","7","ALEXANDER","0000-00-00","","");
INSERT INTO tbl_persona VALUES("29","DESIRETH","KENDRA","GALEAS","BACA","0607201000121","F","2010-01-21","MARCOVIA","CHOLUTECA","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("30","ESTEFANY","NAOMI","VARELA","MAYORGA","0801200563961","F","2005-01-29","TEGUCIGALPA","LAS CASITAS","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("31","ERICK","","VACA","SOTO","0140545447488","M","1998-04-05","SAN PEDRO SULA","COLONIA EL HOGAR","2022-07-27","","4","","0000-00-00","","");
INSERT INTO tbl_persona VALUES("32","ANY","MELISSA","HERNANDEZ","FUENTES","1702199600058","F","1996-03-13","ALIANZA VALLE","ALBORAYA PUEBLO VALENCIA ","2022-07-29","","8","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("33","ISEL","DARIELA","FLORES","FLORES","0611199600333","F","1996-06-02","CHOLUTECA","CHOLUTECA","2022-07-29","","6","ADMIN","0000-00-00","","");
INSERT INTO tbl_persona VALUES("34","ARMANDO","JOSE","PERALTA","AGULAR","0608199000125","M","1990-10-20","TEGUCIGALPA","TEGUSCIGALPA","2022-07-29","","6","GABRIELA","0000-00-00","","");
INSERT INTO tbl_persona VALUES("35","LUIS","MIGUEL","CRUZ","MENDEZ","0801199012645","M","1990-07-11","TEGUCIGALPA","COL. SAN MIGUEL","2022-08-02","","2","LUZ","0000-00-00","","");
INSERT INTO tbl_persona VALUES("36","VALERIA","SOFIA","PADILLA","ZEELAYA","0802199000168","F","1990-05-05","ALUBAREN","FRANCISCO MORAZAN ","2022-08-02","","2","ADMIN","0000-00-00","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_persona_especialidad VALUES("1","11","1","JOSE","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("2","12","5","RUT","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("3","13","3","GABRIELA","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("4","17","4","ADMIN","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("5","18","3","GABRIELA","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("6","19","2","RUT","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("7","20","3","GABRIELA","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("8","22","1","ADMIN","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("9","23","2","RUT","2022-07-26","","");
INSERT INTO tbl_persona_especialidad VALUES("10","32","3","ADMIN","2022-07-29","","");
INSERT INTO tbl_persona_especialidad VALUES("11","33","2","ADMIN","2022-07-29","","");
INSERT INTO tbl_persona_especialidad VALUES("12","34","2","GABRIELA","2022-07-29","","");



DROP TABLE IF EXISTS tbl_personas_alergias;

CREATE TABLE `tbl_personas_alergias` (
  `CODIGO_PERSONA_ALERGIAS` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE_PERSONA` int(5) DEFAULT NULL,
  `CODIGO_ALERGIAS` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_ALERGIAS`),
  KEY `cod_expe_fk` (`CODIGO_EXPEDIENTE_PERSONA`),
  KEY `cod_aler_fk` (`CODIGO_ALERGIAS`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_alergias VALUES("1","2","2");
INSERT INTO tbl_personas_alergias VALUES("2","1","1");
INSERT INTO tbl_personas_alergias VALUES("3","4","1");
INSERT INTO tbl_personas_alergias VALUES("4","5","1");
INSERT INTO tbl_personas_alergias VALUES("5","6","1");
INSERT INTO tbl_personas_alergias VALUES("6","7","1");
INSERT INTO tbl_personas_alergias VALUES("7","8","1");



DROP TABLE IF EXISTS tbl_personas_apariencia;

CREATE TABLE `tbl_personas_apariencia` (
  `CODIGO_PERSONAS_APARIENCIA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_APARIENCIA` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_APARIENCIA`),
  KEY `CODI_PER_APARI` (`CODIGO_APARIENCIA`),
  KEY `CODI_PER_EXPE_APA` (`CODIGO_EXPEDIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_apariencia VALUES("1","1","4");
INSERT INTO tbl_personas_apariencia VALUES("2","2","4");
INSERT INTO tbl_personas_apariencia VALUES("3","3","6");
INSERT INTO tbl_personas_apariencia VALUES("4","4","5");
INSERT INTO tbl_personas_apariencia VALUES("5","5","6");
INSERT INTO tbl_personas_apariencia VALUES("6","6","6");
INSERT INTO tbl_personas_apariencia VALUES("7","7","4");
INSERT INTO tbl_personas_apariencia VALUES("8","8","4");



DROP TABLE IF EXISTS tbl_personas_sintomas;

CREATE TABLE `tbl_personas_sintomas` (
  `CODIGO_PERSONA_SINTOMA` int(5) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_SINTOMA_NEUROTICO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONA_SINTOMA`),
  KEY `COD_EXP_PPSICO` (`CODIGO_EXPEDIENTE`),
  KEY `COD_SINT_PP` (`CODIGO_SINTOMA_NEUROTICO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_sintomas VALUES("1","1","1");
INSERT INTO tbl_personas_sintomas VALUES("2","2","3");
INSERT INTO tbl_personas_sintomas VALUES("3","3","1");
INSERT INTO tbl_personas_sintomas VALUES("4","4","1");
INSERT INTO tbl_personas_sintomas VALUES("5","5","1");
INSERT INTO tbl_personas_sintomas VALUES("6","6","1");
INSERT INTO tbl_personas_sintomas VALUES("7","6","2");



DROP TABLE IF EXISTS tbl_personas_transtornos;

CREATE TABLE `tbl_personas_transtornos` (
  `CODIGO_PERSONAS_TRANSTORNOS` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_EXPEDIENTE` int(5) DEFAULT NULL,
  `CODIGO_TRANSTORNO` int(5) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PERSONAS_TRANSTORNOS`),
  KEY `CODI_PER_EXPE` (`CODIGO_EXPEDIENTE`),
  KEY `CODI_PER_TRANST` (`CODIGO_TRANSTORNO`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_personas_transtornos VALUES("1","1","4");
INSERT INTO tbl_personas_transtornos VALUES("2","2","5");
INSERT INTO tbl_personas_transtornos VALUES("3","3","4");
INSERT INTO tbl_personas_transtornos VALUES("4","4","4");
INSERT INTO tbl_personas_transtornos VALUES("5","4","5");
INSERT INTO tbl_personas_transtornos VALUES("6","5","4");
INSERT INTO tbl_personas_transtornos VALUES("7","6","5");
INSERT INTO tbl_personas_transtornos VALUES("8","7","4");
INSERT INTO tbl_personas_transtornos VALUES("9","8","4");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_plan_terapeutico VALUES("1","2","HACER EJERCICIO, EJERCITARSE ","ANDA A PASO LIGERO DE 15 A 30 MINUTOS","LA COMPAÑIA DE UN AMIGO","EJERCICIOS DE RESPIRACION QUE PUEDE AYUDAR A REENCOTRARSE MEJOR CON LA DEPRESION","EN CUANTO A LA PRACTICA DE ESTAS TECNICAS ESTA MEJORANDO ");
INSERT INTO tbl_plan_terapeutico VALUES("2","4","ESCRIBIR EN UN DIARIO LO QUE SIENTE","DE RELAJACIÓN","DIARIO PERSONAL, LAPIZ","ESCRIBIR AL MENOS MEDIA PÁGINA TODOS LOS DÍAS POR  2 SEMANAS","LO AVERIGUAREMOS :U");
INSERT INTO tbl_plan_terapeutico VALUES("3","5","HORIGAMI,  PRACTICAR DEPORTE","DE RELAJACIÓN ","PAPEL, BALÓN PARA PRACTICAR ALGÚN DEPORTE","HACER HORIGAMI AL MENOS 3 VECES EN LA SEMANA","NINGUNO POR EL MOMENTO");
INSERT INTO tbl_plan_terapeutico VALUES("4","8","VER PELICULAS DE TERROR","NINGUNA ","UN TELEVISOR ","ESCRIBIR EN UN DIARIO ANTES DE DORIR","SE ESPERA REDUCIR LAS PESADILLAS");



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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_preclinica VALUES("1","11","100","18.5","1.20","35","70","70/80","12","No tiene","","2022-07-27","","");
INSERT INTO tbl_preclinica VALUES("2","4","138","19","1.85","38","85","70/85","12","Moderado","","2022-07-27","","");
INSERT INTO tbl_preclinica VALUES("3","18","115","20.5","1.50","37","80","70/10","13","No tiene","","2022-07-27","","");
INSERT INTO tbl_preclinica VALUES("4","3","130.5","18.5","1.82","35","70","70/80","21","No tiene","","2022-07-27","","");
INSERT INTO tbl_preclinica VALUES("5","20","130.5","12.5","18.5","35.5","70","70/80","12","No tiene","","2022-07-29","","");
INSERT INTO tbl_preclinica VALUES("6","26","130.5","18.5","1.81","37.5","70","70/80","12","No tiene","","2022-07-30","","");
INSERT INTO tbl_preclinica VALUES("7","34","130.5","15.5","1.92","37.4","70","70/80","12","No tiene","","2022-07-30","","");
INSERT INTO tbl_preclinica VALUES("8","35","140.5","18.8","1.96","13.6","30","70/80","12","No tiene","","2022-07-30","","");
INSERT INTO tbl_preclinica VALUES("9","22","130.5","183.","1.95","36","15","70/80","70","No tiene","","2022-07-30","","");
INSERT INTO tbl_preclinica VALUES("10","23","45545","262","5545","623","263","262","23","No tiene","","2022-07-30","","");
INSERT INTO tbl_preclinica VALUES("11","40","134","19","1.87","37.2","80","70/80","11","No tiene","","2022-08-03","","");
INSERT INTO tbl_preclinica VALUES("12","42","135","18.2","1.66","37","70","70/80","12","No tiene","","2022-08-03","","");
INSERT INTO tbl_preclinica VALUES("13","43","130","18","1.68","37.1","70","70/80","12","No tiene","","2022-08-03","","");
INSERT INTO tbl_preclinica VALUES("14","50","138","18.5","1.83","38","70","60/80","45","No tiene","","2022-08-03","","");
INSERT INTO tbl_preclinica VALUES("15","51","130.5","18.6","1.85","37.5","70","70/80","12","No tiene","","2022-08-03","","");
INSERT INTO tbl_preclinica VALUES("16","52","135","15.5","1.85","65","48","70/80","13","No tiene","","2022-08-03","","");



DROP TABLE IF EXISTS tbl_preguntas;

CREATE TABLE `tbl_preguntas` (
  `CODIGO_PREGUNTAS` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO_ESTADO` int(5) DEFAULT NULL,
  `PREGUNTA` varchar(60) NOT NULL,
  `CREADO_POR_USUARIO` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `MODIFICADO_POR` varchar(30) DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`CODIGO_PREGUNTAS`),
  KEY `FK_CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `FK_CODIGO_ESTADO` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_preguntas VALUES("1","2","¿CUAL ES TU COMIDA FAVORITA?"," ADMIN","2022-07-16","","");
INSERT INTO tbl_preguntas VALUES("2","2","¿NOMBRE DE TU CARICATURA FAVORITA DE LA INFANCIA?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("3","2","¿NOMBRE DE TU PELICULA FAVORITA DE LA INFANCIA?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("4","2","¿PARIENTE QUE MAS ADMIRA?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("5","2","¿NOMBRE DE TU MASCOTA FAVORITA?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("6","2","¿UN JUGADOR DE FUTBOL FAVORITO?"," ADMIN","2022-07-18","","");
INSERT INTO tbl_preguntas VALUES("7","2","¿COLOR DE ROPA FAVORITO?"," ADMIN","2022-07-18","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_preguntas_usuarios VALUES("1","7","2","NEGRO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("2","1","4","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("4","5","5","MANOLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("5","1","3","POLLO ","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("6","1","7","PIZZA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("7","1","11","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("8","2","12","NO TIENE","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("9","1","15","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("10","4","17","MI NOVIA UWU","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("11","1","13","CARNE ASADA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("12","1","20","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("13","7","21","NEGRO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("14","1","16","CAMARONES","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("15","4","8","MI PADRE","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("16","5","14","PELUSA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("17","1","10","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("18","1","18","ARROZ CON VISTED","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("19","7","19","NEGRO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("20","1","22","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("21","1","23","PIZZA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("22","1","24","TACOS MEXICANOS","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("23","1","9","PIZZA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("24","4","25","PAPA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("25","4","26","MIS PRIMAS","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("26","1","27","POLLO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("27","1","29","CHULETA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("28","1","30","CHULETA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("29","1","28","ARROZ","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("30","7","31","NEGRO","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("31","4","32","A MI MAMA","","","","");
INSERT INTO tbl_preguntas_usuarios VALUES("32","2","6","BOB ESPONJA","","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_receta_medica VALUES("1","1","0102","TOMAR DOS DIARIAS\n","NINGUNA","2022-07-26","ADMIN","2022-07-26","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("2","2","0102","TOMAR 1 CADA 8 HORAS","NINGUNA","2022-07-26","ADMIN","2022-07-26","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("3","4","0102","ES PARA LA TOS","O OTRA COSA","2022-07-26","ADMIN","2022-07-26","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("4","5","WJ785","TOMAR CADA 5 HORAS","NO COMER ANTES","2022-07-28","ADMIN","2022-07-28","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("5","6","WJ785","PARA LAS ALERGIAS","NINGUNA","2022-07-30","ADMIN","2022-07-30","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("6","7","WJ785","PARA LA ALERGIA","TOMAR CADA 4 HORAS","2022-07-30","ADMIN","2022-07-30","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("7","8","WJ785","PARA LA ALERGIA","NINGUNA","2022-07-30","ADMIN","2022-07-30","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("8","9","0102","MNMNMNMN,M","M,N,NM","2022-07-30","ADMIN","2022-07-30","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("9","10","0102","BNBNB","NNBNB","2022-07-30","ADMIN","2022-07-30","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("10","11","0102","TOMAR CAD 2HR","NINGUNA","2022-08-02","ADMIN","2022-08-02","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("11","12","0102","TOMAR CADA 8 HORAS ","SI SE PRESENTA MUY SEGUIDO LA FIEBRE TOMAR CADA  CUATROS HORAS","2022-08-02","ADMIN","2022-08-02","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("12","13","WJ785","TOMAR UNA AL DIA","NINGUNA","2022-08-02","ADMIN","2022-08-02","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("13","14","0102","CADA 8 HORAS","NINGUNA","2022-08-02","ADMIN","2022-08-02","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("14","15","0102","M,M,M,","M,M,M","2022-08-02","ADMIN","2022-08-02","","0000-00-00");
INSERT INTO tbl_receta_medica VALUES("15","16","0102","CADA 8H","NINGUNO","2022-08-02","ADMIN","2022-08-02","","0000-00-00");



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



DROP TABLE IF EXISTS tbl_sacramento_estudiante;

CREATE TABLE `tbl_sacramento_estudiante` (
  `CODIGO_CORRELATIVO` int(10) NOT NULL AUTO_INCREMENT,
  `CODIGO_ESTUDIANTE` int(10) DEFAULT NULL,
  `CODIGO_SACRAMENTO` int(10) DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CORRELATIVO`),
  KEY `COD_EST_SACRA_FK` (`CODIGO_ESTUDIANTE`),
  KEY `COD_SACR_FK` (`CODIGO_SACRAMENTO`),
  CONSTRAINT `COD_EST_SACRA_FK` FOREIGN KEY (`CODIGO_ESTUDIANTE`) REFERENCES `tbl_estudiante` (`CODIGO_ESTUDIANTE`),
  CONSTRAINT `COD_SACR_FK` FOREIGN KEY (`CODIGO_SACRAMENTO`) REFERENCES `tbl_sacramento` (`CODIGO_SACRAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

INSERT INTO tbl_sacramento_estudiante VALUES("1","1","1");
INSERT INTO tbl_sacramento_estudiante VALUES("2","2","1");
INSERT INTO tbl_sacramento_estudiante VALUES("3","3","1");
INSERT INTO tbl_sacramento_estudiante VALUES("4","4","1");
INSERT INTO tbl_sacramento_estudiante VALUES("5","4","2");
INSERT INTO tbl_sacramento_estudiante VALUES("6","5","1");
INSERT INTO tbl_sacramento_estudiante VALUES("7","5","2");
INSERT INTO tbl_sacramento_estudiante VALUES("8","6","1");
INSERT INTO tbl_sacramento_estudiante VALUES("9","6","2");
INSERT INTO tbl_sacramento_estudiante VALUES("10","7","1");
INSERT INTO tbl_sacramento_estudiante VALUES("11","7","2");
INSERT INTO tbl_sacramento_estudiante VALUES("12","7","3");
INSERT INTO tbl_sacramento_estudiante VALUES("13","8","4");



DROP TABLE IF EXISTS tbl_seccion;

CREATE TABLE `tbl_seccion` (
  `CODIGO_SECCION` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SECCION`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_seccion VALUES("1","SECCION A","Es una seccion");
INSERT INTO tbl_seccion VALUES("2","SECCION B","Es una sección");
INSERT INTO tbl_seccion VALUES("3","SECCION  C","Es una sección");



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
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_telefono VALUES("94894940","1");
INSERT INTO tbl_telefono VALUES("96265645","2");
INSERT INTO tbl_telefono VALUES("99999999","3");
INSERT INTO tbl_telefono VALUES("98456587","4");
INSERT INTO tbl_telefono VALUES("99841502","5");
INSERT INTO tbl_telefono VALUES("32995232","6");
INSERT INTO tbl_telefono VALUES("82478593","7");
INSERT INTO tbl_telefono VALUES("96333333","8");
INSERT INTO tbl_telefono VALUES("32423423","9");
INSERT INTO tbl_telefono VALUES("87842545","10");
INSERT INTO tbl_telefono VALUES("89865464","11");
INSERT INTO tbl_telefono VALUES("97361678","12");
INSERT INTO tbl_telefono VALUES("87753245","13");
INSERT INTO tbl_telefono VALUES("98945984","14");
INSERT INTO tbl_telefono VALUES("34234234","15");
INSERT INTO tbl_telefono VALUES("39693333","16");
INSERT INTO tbl_telefono VALUES("34543534","17");
INSERT INTO tbl_telefono VALUES("98031038","18");
INSERT INTO tbl_telefono VALUES("89124000","19");
INSERT INTO tbl_telefono VALUES("32502114","20");
INSERT INTO tbl_telefono VALUES("98522222","21");
INSERT INTO tbl_telefono VALUES("34324655","22");
INSERT INTO tbl_telefono VALUES("89100017","23");
INSERT INTO tbl_telefono VALUES("96954654","24");
INSERT INTO tbl_telefono VALUES("92394923","25");
INSERT INTO tbl_telefono VALUES("98878789","26");
INSERT INTO tbl_telefono VALUES("88885644","27");
INSERT INTO tbl_telefono VALUES("98987165","28");
INSERT INTO tbl_telefono VALUES("33211251","29");
INSERT INTO tbl_telefono VALUES("32569999","30");
INSERT INTO tbl_telefono VALUES("98343243","31");
INSERT INTO tbl_telefono VALUES("89727401","32");
INSERT INTO tbl_telefono VALUES("96125487","33");
INSERT INTO tbl_telefono VALUES("99804562","34");
INSERT INTO tbl_telefono VALUES("99001111","35");
INSERT INTO tbl_telefono VALUES("89902525","36");



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
  `CODIGO_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_TIPO_SANGRE`),
  KEY `CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `tbl_tipo_sangre_ibfk_1` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tipo_sangre VALUES("8","TIPO D"," DANIEL","2022-07-17","2022-07-17","DANIEL","2");
INSERT INTO tbl_tipo_sangre VALUES("9","TIPO A"," DANIEL","2022-07-17","2022-07-17","DANIEL","2");
INSERT INTO tbl_tipo_sangre VALUES("10","TIPO B"," DANIEL","2022-07-17","2022-07-17","DANIEL","2");



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

INSERT INTO tbl_tipo_socioeconomico VALUES("1","DISPOSITIVO ELECTRONICO","DISPOSITIVOS","ADMIN","2022-04-07","2022-06-21","ADMIN");
INSERT INTO tbl_tipo_socioeconomico VALUES("2","SERVICIOS DE INTERNET","SERVICIOS","","2022-04-07","2022-06-21","ADMIN");
INSERT INTO tbl_tipo_socioeconomico VALUES("3","PROVEEDOR DE INGRESO","PROVEEDOR","","2022-04-07","2022-06-21","ADMIN");
INSERT INTO tbl_tipo_socioeconomico VALUES("4","SERVICIOS BASICOS","SERVICIOS","","2022-04-07","2022-06-21","ADMIN");



DROP TABLE IF EXISTS tbl_transtornos_corporales;

CREATE TABLE `tbl_transtornos_corporales` (
  `CODIGO_TRANSTORNO` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `CODIGO_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_TRANSTORNO`),
  KEY `CODIGO_ESTADO` (`CODIGO_ESTADO`),
  CONSTRAINT `tbl_transtornos_corporales_ibfk_1` FOREIGN KEY (`CODIGO_ESTADO`) REFERENCES `tbl_estado` (`CODIGO_ESTADO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_transtornos_corporales VALUES("4","TRASTORNO COMPULSIVO","2");
INSERT INTO tbl_transtornos_corporales VALUES("5","DISMORFICO CORPORAL","2");



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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_tutoria VALUES("1","1","ESPAÑOL","RUT","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("2","4","COMUNIÓN","LUZ","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("3","4","CONFIRMA","LUZ","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("4","1","MATEMATICAS","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("5","4","PERSEVERANCIA","LUZ","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("6","1","INGLES","ALEXANDER","2022-07-27","","");
INSERT INTO tbl_tutoria VALUES("7","1","CIENCIAS","CESAR","2022-07-27","2022-07-27","RUT");
INSERT INTO tbl_tutoria VALUES("8","1","BIOLOGÍA ","ADMIN","2022-08-03","","");
INSERT INTO tbl_tutoria VALUES("9","1","CIENCIAS AMBIENTALES ","ADMIN","2022-08-03","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO tbl_usuario VALUES("1","1","ADMIN","2","9","$2a$07$usesomesillystringforeDLU0KLdU3tCNprit2LU2PhciUHQJFsG","2022-09-24","","2022-07-26","","","�PNG\n\n\0\0\0IHDR\0\0@\0\0@\0\0\0͐��\0\0\0IDATx^���dgy�?�C�����s�4\n�,$��8,��î�`�6�?�8cc�\0!	ei�ь&��	=�s�]Օ���ܚ؟��o�B����­��=��9���m~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W`~�W�-������ҹϛn�W~��������y�-�����[���������٦/Y3\\��٩iK�;n�M6;��k���x<.���֥K�&\\�ž7^|�z�uѬ����+Wr96S*�����¶�fkp�.�?^�퉩�Lgb�����O]��w˝s�Sd����$�bO���9&�-������w�\n��#�;�����������e�]��޽k��bJ�ŔtH*�X(;�#��-󻧇��S��D\"K&��D<eI�R��������&�)���f��$�0����9}�����)i�LIsDRV��,~~���ְ�b�۬����:���n�l�P�n�F������Ԝ/�[�(R_����=��o~��]~\\<�U�5��=���=;\nf���H2Z=��S���kRv��ۭ�i1�]L	{*��\0x�T<唔��2�n&�,&�����vg�9fJ����%F]u�O��C�!)3w��)~�����1��	\'��_~I%|�&,�ق��챩��H,5][�(��C�^_8j���_�qe��\\�O{\"њ��+}*�.��������|\n�.=|���#�M5c�m���ޙ��Yh��\"�e|�N�.�97��w8��h���\0�$9g�M2%��;aq��\"I����L�X2M$�Z�~���d��dR���@Z�璉�U�Y�f31�Œ�YL|-�*/�rU�	�m A\\��m�`2���לuf��M��)v͍EH&f#�@�7�rg���PN�2�\n��=�iqgL�-sR$�g2=�i���]����?���r�����>�awf�R���t�.o�;�s,uDj�X,aO����a1�U(�IqQ��c)	E�\nF��I8�h���L���`�-�H�߇���ϱX�K����R�$�5��i 	R�#ScG!n@P,֔XA_0NL|��u:��ΰKF���|9���Im�Or�aIjl�XN�Ģ�H2����xf��`0j�[�9�y!��5M�\'l6ی;��=�,n��&�}���na�\\iͧH��o���w�\'���et��8\n���U�/���d�M��xL\n!o咚�\ns<h�v��\0`f	��𥌟[[%�K ��9_B�8?�%NJ0�a�]\"d��g�`S�#�5V�j���Y/�����\0�x0�;A�0_��\"W�;���\"a1[�b���f3��<ܮ_���䗲\\�T�:$�m��\"�%y�W�)Y9V��wHF&Ѫ��HEƒ��l|�7NI<jud{}>W�ɞ�G}qb���VWIi�؝C��������z}�|[�\0����\'�`�v�h��/�*�]�L.���Td�/0\'��#��ȷ�Xڃ��37���1��B253\'OXf=Q����TX戅��cO�$u��$���JDg�(����D_6Ԉ���H��Vk{�澹�&�n��F�f1k�PO#B�B�3ED@d~�F�W�%�4p�`��)����N)*pD��SPrr쒝m�#*YYIY�P\"��)))rIn�Y2�|e���[�2�驉\0�\nE�wf�t$IZ���቙�E�׶��ْ��1_;|]+�\0��0O��o��xq�7Y��g��l۔aov�b5�T<7�g8�n�Òm\n,�%�3��dP�E���LG��������J�&	EMRQ�Xr�Zn\0�H���&-[�\"],�\0OG}�����G`�/A��e�ݡ������S�3~��a��\"�UpT�K�M_��T\0�س��]�A��&�$Ò��Ҭ��5(��䚤�,ʳIiQ�T��Jyq�Jc�G2]�&�bu��ģ��\\Na�܄�?�S\\��;�#��kww�;�޴��;���g�	�6� �|�W{��ți/��<��)��a�lu\"�s��ԙr��L{F������lR�:ƥ���!��%e&b�9�f�ڳ���Ha�Vq�fIfy��l.���X%��Dx	�O�3��)*6e�h���[�>+_PW�����0���_(�-`�<��x����8z�\'B�k�7�H��f�F��#�A}-��pI �!.u�$Qh�Cܤ�� ��I�l#NUP�{d�kB�=(.��d8��i�u�椾�,�ER�X!VG�d<?�p�G�b��le4�ZKɳ-1[�������I���:w�˳뮿�}�B�|c�S�ѩ����b�xVE��;��цH`���T������fs���|�Ԭ�z�}26���e��v|2$���R���b�d�%���\05�D*����@�Mc0� \0�1��4~-f;58����|<�$�,���!~�J8�����$I�$�M�d2��47b����u>��z^�X���l�\0ϯ͓\0M\'5�\\�:��H�+&聀��iL��Y2�� �&�I�����C퐚!\0��gH\"j���Qq�N��b�PV�a�\0L��eN��>��g��{/ B��ΗE�J���@�Kh�8�<~.h5�$g���\'�J��IECKV{����>2ko�k�����T�?�y\0|{�N~7SN,��\'wI̻!���\'��<S\"�Y[� ��G�o(!��&�K�\0���$�8)o�!�$`d��l�\"�r�^�\06)Ω�I��{D�DK1�A�,\0�4g�Q�#�+mL�*��Am��0�B2Gq�]����B��]vj�stf�mD��V�ɨ���ya.�`��N�~���s��+���� I0h�GD��DcT\n��bI��8��A19�$e��6^?�F��4����AC7���H���*��x���8��ߠZ�!ɤv������d�e��R)�Iu���Y$7+Dcg.�J�\"���_���.-X��b,�ћ�S?�Q�Q�x��vX���-�)�R�X�z�ت���\nK2�ޖ�,��LE6��\0�����2��+*c�)���J�@HF&,2p���^8��+܀�~e~.�hv\";\"���3i\'�$_&+�D;\"?���Pk�t5E�V��nKa@\"T�HlF���k����^@\'(��٤�3<7�MB�!24;�OV��\04I�Cf�>�dd�9C�\0F\0n����&hT\08$�\0��/�8�\0g*�����&��y�\0�,�ze<�(/����HcD�t���8A.ǟ�=��N�?�s��?�`�|���w���+���k3da}��Tf�PqHv�5au�BIG0829��)���yUM5�k����Z�W��|T���n�<\0��>���L=��K-2���µ����vS<��ڋ3l9�VK�D6�P����I�8<Hj���V4�*�����H��4B��]@C�a7�\0��FF.��PD���q_RP�9�Z��є8l���(�����8�̆ba�:���C��r8\0Ԥ��3DQ.Y�b��/��ؼ���--�]�L�.��H�>KJa�]��JI9�星�o<Ľq���ܜG��1�/�f�Lr!���7Kr<J�Jf�s&)o-\\�r����5F��hz�k\'9N\nƨ�K�t�:˦T�Ȓ4 ����f�sl��b�TUH55��¸�\\�1G$3���L���d��$�Y�r*o��6�㟩Xv�~�-t��<��&�[�C���gg�����쒔���yn�w�V#1_т�Ƭ��\"�djÃ1��J{۬�tx��HS����=�#�<�\0�^��I�KA�\n4}T\"2*\n\0���F�g�h�F�a��E�^q����Ѻ�͑mPUl��&U\"3��$�M��P��)a) 뗪�2ٻo�<�ޅ2Ix��z2(�[\0�Z��Y$7�&6.��<�SV����EL(�ZW�LJ[[�\\8T������t�%�״��̸�2�R���{���@���%��;+-\"��f��R!ց.1 n�A���עs�Łx�/�`1%[�@�UI�ʌoJ���1���(��gGd�mN�JE��.r�8���`�S2��o�����t�}�3�׿r�d���S�����0�?�����d7�j���[�����@ފ,����t:L���\\i��!�����t��ex�Fm,����%W�Y�D>..j��zԶ�	.h@J�AK\"F�C�iK��0�\\��i%����D�qJ$(ܧ��Z/��q�������Q�h���!2T0�F��tW�d%��Ps�\"8��fIUM�l۹��Hy���URTH�1\"�����8O�uKVF�,_����GS�fjRVV$����\'��СCr�t��Rc$R���v���dI�lܶT\n�r��wHΜn���4l�2r�s�N<1G�O��#6Y��=\'|��v�U��_J�a�L\0`��w\00�����%��!��#�������ex��YY�<Wj�$�4\'��0#��0������Dl�Xd�Dj�o_wU�8��L������\n����H�^Ɍ��47���?=y�U��d מZ�k�x�����|���KFǝ���+�uC���W�=;K��\0@��)W�Dd�b\'ʉ��	�c�P��d�I�]�����̌,��DG\\��er睻��wH/5E�2��#244#^O������1���.\0�<�P��­�4���bRPh��\"��B����8KJ��8vRi�E���r�q\0�&�ѯ�盉�.ӕ�0+d˖U��D��n�B�C�鈷I�f4f��hI���5��C�IM���˫�7g�l?��Rfb4u�<y�cB�sh��Z��g%D�/M�Qҍ.���>֥��f�P�8�:\0a��#����f����\\랔sW\'�v�M.qʪ�RYg��G3�@q(���a���9��S�O�K鰩p�M\"���L��y\0�/<R�k���X���-������eQK��lq��M����27��y�p�z�r�rR\\B(k���t7B�$@InZ��P=����\0��0���]�+L�\nbpd�f���C�2�t��4%�� �ܸ��,T�4���-��K��nB���Di,����� Ҋ\0���G��Jĩ`�����J�T�E]��V*.���T@#���T���{�l����1y�������B�m��?�ٸ�\\V.-�֕��ʅ>	S$��qq� �Х�*˝�\"�������7D�� �-D��mrdN��f6��Y�l�3����A;�~/���PxT5J��}$~ꈙ�b(�~��e�iP.\\�kZ�kc��mFb8���G2g&�Jb��_��ʪ���Y�b�+_�_�b���b��o��+0����w���2yl����<���Q*�y9�9Kd|\"A�6)?�a�����0�4ГT!�\\�s�����S�2S��)\0����Lr�i��r9����i�\n�D���dӆ}Ҹ�^�kj��t�KϿ\"��KvF����7��tn��o�&K��\'�/���J��f)�]�ަ�f��\0�\"\0{v���.y���\0|\\nݵJnݷ�\0т|�t�tJC�B�w�vy򇯋gvH�IWmvVa|�n�a�\0�5J��P o���,g�]���6��/���ZR!�ݶY�z�MOKn^��Eܳ��H�\\M�.�5�21�*�Z��˖sG��j����~}�T�����|�\"]��2��5�:$e�$*�,K% r&Z6�\\�VEN7닩�C��yy�����*�N2����ڡG��MHgװ����%��i]1��]��W44W��q����)�\\u:������&��q�m�|�������\0�3^�T��D�N���?��l�:{*P�cu���B�<y��(����G���ez��RW�%i/\"��$�lC���\nHe\0|f�ua�v��psa:�3(�(�)����l�P�<��òq�2Y���ͺ�FJ]��2�Ȩ/ b�G�0+7��Eꬬ�tDU_%�zu�4�uz�����@|�Za��zGf�>����JϓAsC��)��)�\0�r�RWW.=}ӆ|��?pY�T%�����:ZYLeh��.��O���\0Q��\nѩ</)��IQQ����2��2 *��YoH\nke��F���N�}U���l� \"�ɒ��z����Y��F�|�\0c�ESHׄ]�	�Q��p��NP��|J5R���c�h�%�!s���!��^���V_c���GeYyYC�+kh��|�g`�s�����S��b�1Y�k�?�kS�~\0F��J\\q��wI��\0|{�ޑF��\\�t䙢hrzf��/./Nʄ�)�s(\'D{V:��|\"=jM�Cp���3lt,#Dsf�{Yytyi�\0vR1Mל��׈��C�HHc}��q�.y��������A����5��`\0Ν���������+�D����읝5���.�������+����Z.�%3@$\03%N�s�ѕR�#�5^�ܙ�Xie����O�l۶:̘�A�0��:i�h�\0R�Lf����,�L���Hk{7��MR�{)-/�Fa��s��MRV�F��Fy�I�����ڃ*d|bD�mh���n$%�7�Z�y<^ޟ�L�TV��C�<\"��m�|����ŋ�l�A��XD�)V��VT,�%�+���P��iYcK�kRIֱ\"�D2%�q��]d@�����/˗Zd����g��F3���YO��@�gwi���]���T���i�����r��g��)��2y~��Е��l�ΰ�dg�ے��$���	�|qL�za�E�J8E�����vAeQ�\\W\0�0�({6�e4��.bn`��Bx~z��Y�j�gc#㤢�^�x䙈x�dﮝ����	����?~BN�:+��>��*�V\\�⦱\0w��=\"���#r��kW.K���\'k�T�m�ۤ��WZ;Fę�/�yE�A-\"R54���T�\\�U���� ��\0_�;�e���t�h�Hg��&M���LmOF|�a([�]mŻ 9���$�ڒ�)�l��I�M�v�J�aH,����Sn� �B^\0�ʦMKH}q����q��t3��{.]&K���>W��i����\"پ�#Z�����^c�\\t���R=��Vd�a�~vL!�ȝD��%����������\'dt�:/miј<p�t��I�]XM�\nF��TY\'��T.;��~�šމ��E�F+i���X�y\0�O\\�T����L�n�͌6VV�EI�GE�������F�cj:��BpN�^r1�N�A���\\:�I�k�\0�Ev���0�2 ��z\"�ۻo�5r��r��y�L�H~A6Zօ�r�2��@\0#/<*�����w�p��ub�ǍT\\i)Z��&�,+-0\0���M����ٵ[*�0�u�\\��.C��F%P:�J���SyE���|\0��^��˥]�LLL���kTT���v�\0��S����(�mԐ�[�\0@(7tq����UB��v�$-��FZ��FGG$��\0\0T�\\��ϐ��]� [�-llĩ��P[\0��\0,�\'��\"K������\0@���uV�o}�\0�:x��䩧��Db�؄,�Mג�A�\"���Fxr��J�g�\'�U��Z��R��%�D��<Gx���P߀�Y�j�����B������U���[���}�цe[��eޒ�?�zէ����=����\\TY�;��;�y�po���,wyQe�sl\"&=��5~W��3��H�Vlu��*����	\0ǅI���QF����\0\0�l?��bY�\n���>�\0�a������kjj�X�+�vi4�y�D/��q��C��_F팮.�� 饅���ب/���r2�H	ӵ�\0����r䵗��Hna�lX�J.��H{?ј�K�U��\n%�$?���,a�RH��}�}�T}Z�,0V̒+��ً�et��	���i*=�	P�ͨ^���:��C���S:��obvАƭ۰��	��^gW�,4/���l���rRlY.���[dŪ:���%d�b�\\i8SS �z�Ud����\02��ї����~�|���)�H� K����n������:Y;�ə�q�N�1�+@�����H��6�N4hv���=E�c��r�B\\����|�O֮��ʕ��Q�#�������-�X]~�ic^���cѯ�?sy|x��ߝo��\'\\��\0�����Ћy�}g�v��э���B�9�a\'}�vꩧ���x�te��\\5E�Z1�b@�*���xt*�r��6�킙@�֤���e�e٢j��,��;��������S����X��Z--���~�M�T��K��^%o�:$���bu!Y��\n#5�p�:x;����	��u��eX�����K\0��LO�I\0�tq��Y�B�fϐ���C�.��E�cϣ3� ��` *˖.�A�&e�w*][�n��v�����u�u�j����ISJ�S�0�o~a����	�eܯ���9)����A!24<�Z�M�>��m�E���ظ@��݊���62Q�/a�!4�0��E�NiX���mj�SM/�K�ҕ�e�R�A���M)�����l.���QY�fӜ�P�S�!�+M+u�Q~��P\nnd�p�d���x7IT&��q��d�N��� e����YF�*t�z����P�h����9��x�ĩ��ܾ�Wo�e�N�w�S�G���~*�E�s�F�N�Dޛg/��#�YU�$2jj����0.-NR�B	��Ke�\0T�rd�&C��3Í,���AHAfE:J-)����H�s����6Km�3�7%+�������%��޵��RS[ltH͖��������(@�P3y�E�a#5ͤ����2Ĳ��(�GQA��v﹋�� �cE��J�Ze��F�[���GO��i\\1J�&r��uSKS����9r�	 �\"�5uB�R�H;]�0M��K�KJ\n�m���&$g�n)����[F����c\0Mj\\��zd��q�L���ty-U�����3Ы���Gf\'��4T��L�;�SPx�\0�,ꮋ뤡��\0��7r;��*%$�E/������oI[K�\\8�&�]�<�4��1��U�����I4ǆ,���~�h��D���R&ݣ��^\0?-���ʆe4u�<��.����B�RX^�X�xY��4Ih��_������\0�q*��s�shGh�ʃW�?�����:\'��jI-���r�X�\\��79��ċT)���A9ʊ|���|�V������>a�4R�Y���̷HȮ������%��Km.����r{L�=�5p�|��������Dz�Ay��\'�D�PPPk\"rQ�����r�b��FR\0SMofJ&�cR�eo`�.\'��i3Y���#��W���<s��U���\0�\\I��#qRJ��T���E&�fȎ=k3�˝��_����4ph\\�^oߺEJj����[��S�R�]/�H��P����,+ ���d��>Dx�}σ�vQ�q��\'����&ٵe353D������5&{q��[b�֭�����4��O�$/zM��o�L�����O3V��B�<x�{��7F�UN�~AFz=�a�v�u����U���q�B)������ �ц��{��^ٱ�\0�vJ�r�/�Fڇ�dٲ5�3�ҩ�������Ġ.���>���N:�G�~�+�/��=��r�gJƧ��ʧ>��.$e�A7\\��h�j�tg߆�gS���ϧ/�;�n�������\n����UK%z�tT%FN�25z�~�L��5��MO��jӘ\\o���vi�ɔ�`	�<�ee��.�����b�߼\\n�e�4_B�A{6J�|������ew���\\.[�,�5k��rE�?,��Cr����i��^�q\0\n��6��:�!�V.�5�ڡ�dp���b#\nk�_�1�ұ<B��E���*y�jTDSNj�����O��@�֊2���.�[ZU]+�ݹSJ\0�;n�-�te/6uA6�\'��5�&J.���R\\hx�4��I��Y%�DBX��v��eh<�Ō5=�[�����GN�:��?lV<�d��D�{���o�#4v���ܩ&�ݼ���ޣ�:86�6X�^Ӏ�$��(F`��zAt��S�q3Rhh5j�UC����Y�ω���a�oˀ�\\jʫip�>��V��$��2�dЌfH�s��T˪5ˍ��h�w���d�RR�RB���\\j��~x\ni�1����7��6,�=lzj�;�/����2����r�{Ou��Ɣ�\\�&�T�o)�Z��\'�\'��j��n��3�_��yɯM�8���zc��?x*�u�C����S���3];��N���TZa�=1,M��\\����S���/ M�B�۩�n�jy�{���禤��8�K`k����=���(�h�C�9�`�@��>y��	9q���N��$����))~�V�����z��>sL�.\\�����E�4O����J�7�A&%V��{6�m;6S.p��HO_� � ӹ3�+*��K@��)\"5[B�\\N�[ G�7A���4)(C������R��u�I{� �^�ō���,i�0\n�^Y����c`�u���������1��ʭw�C�j��]D�锻�Za���/^��%sI��F�w7�LTHC�k���KI1H���ᣬ�%ٺc\'�i��%euRoݰj�x�~�[���������NsDB�\\�vE*Kד�t���\0�D��Z���P��r�����>�4�V��~j�U���?��?�M&Fǜµ�Ri�~���C�gb�����)�sS��v�Ab��\'ZH�c�sec���2wF����O���,��H�y��L�o޼�����������?~L~q�@߫��F�n˰��YS�r�5�@�|����ٝ$BC_:�îM��EM�V\0PQ���XUza�޵rr9`�D�>��L0��	��`��/�{�E�ߛ�C�q�Ȧ-+��V⦲Z*�\0���Aq�	iM�/|E�߶����ƍ��AZ�|�ƋK�,ѵRSQ�rnP��P�����4�{�r������:��0cS�r��^_���������k�a���\"���3������c-��[w����㧽QR{:���:�nqG�1R����ME��,\\��5jk��wY��RV� ���~ׯa/i�-���e`�#��o�q��x�q���4�c�IHsW�ΆA����d\0��/~d������)�8�}���(���$��s�n����^��,W��ڶ�N;�vH�.�9D�1FM?_s�U:���;w�$bE>��DGޝ��>u�&�ÜB[��(C�X�\0����*cT_B��M1�Ӷ�88���ɩK�h��? r�����K\"��vJ���鬯���;O�3��.������?���OX�T�,j��#�4��7ӳ�v�*2�~��ƐM�兗���irDk��TPw��r�HBm��hS1H�P3�b�v������ѹl�;$�X1�ߔ��mi�{��j���ï=#�/����\'����,.̽(\"f�_�X.����V�������+�g�>������9yB|�Y�Ё��\n���Յ�W20\02��K]�Ó��\n3t���M#�8c�=��#�b���\\��ڥY�\"Gn;p��}�9C�aźk�!jR�Ig���r�d�6jf&�*��ހO�R�{��l\0�`o;�^9vi�H)���͐��)1��vm�/�&\"2$~D�V��B:�Z�;7q`�o(3�jaEH���(}��_8H$\n�CV^�Op�����r�c��:i�\\oi�y�-7o6�t��z��1	A�1ر)�<bu����\0���i\0���|>[�M�0~O�@�y�0��n��8�����j�l�:Ju\n1H�  ��O��Ge��2cTpU�Q<�\'#��23;uh5O��\0�W�tdXc�3̡�|Sܚ�4gPj-����s���O�����\n�;wIE��l��\n��U��e[�=Y�D��0Y-\"�^���1�.#�+��5����<𣃩)���<�$�j�F%:â�3P:��l��B����W���K�����X���u��4�d�:�P���ثt>!=S�ҫ���+���eղL#�{��A9K���;p1ٶi��Sr��y�_c�ǅł��-��mk��ѕ�E]��\0��J�$��P:RXf�p)�	��Ͻ\"�#�I�4dz�ʖ1M�sxX���Kr�,�4b�a~G!2��W�pc�(]W�j��D���m!���n������a/C�C��㳤�sHײ��dq�CXs���c�?z�t\"l�������zs���nj�q»��藋��rx��o0�m	Q���ݵ��D���l5ԗ;�4�܅9�,m�V��2\0����BZ�J`��^y�y��h�,^A�~��_�s;|�������ht��x�F�����8���{I�/�/4����<TYb|�H\"��:�C+�caM����>�+L�\'NF��Ժ���$�&�E��&]�O_l�?��-�u��󷟴�࿱:�h�[f.�NL]�XW�����Z��T��m�;�x����N�R)�[mhv�\\�B>BUv�jk��BP]�dv@gp�W͢�y�[%�����x���!O�LA��`\0�)�QZ�(}\\��϶ʒeeԵM�n�z�:n)�F#�����1�^je9���Y�i�G������c�ލ-�E��NX\n��S����aZ���c�2Gĥ�8�;�e�&�=�Rf鬪�U��Y�畓�\\KQ	T�I�8\n t�8���I���7��(L�D~96�D��o\n���֠����j�:�	�:ef`�}&���U��|�Ȧ��C\nM�>C�|g�Q\09�E+tgQ	f\\���e�H�a���e�����.X�JP#2��88���a�����%�����\n�\"�;G��}���Dx>sdQ>h\\R�w�UGO���!�6R~��[��ihXU?W��&���o߂iv��?$�:\"o9��4�B=`U��\0@c\"��E��=m��ۭ o-�ڑ(pڇbƏ�q\n��\\��Σ��#������{�5���-���K?�7���\n��Z�T�j���������;l)G��V-_��?;(ϼ<$}���Z/�4\"t��B/�z6�$��;��H�[�����&��J\n���/5K���O���\n鬋�N`��beD��&&p�I�v���ҥn�=jzmW�(S� ���:������q�<��+42�y��	��(Čl+������<\"(�Z��Ћ۬z�N�xz��/7KK�s��K��	�<+./V��o��P� -��\0<dm�9+ҵ8D_i���7�i�BTS<�s��/�>�E��0�/�0��`X`�&		Ѩ���*L�UN��]S�D����!\"D�ӵ�:������q���2����W$���;��8s�q�>��hm�	X/��$��JN�U����$��(�q^�d���CXt�0�3.Sss�@բ�����k�j���A�m�=:ʹ��e��k������N���3�{���������\0�MF��9\"܉��6��_��V�s��F!Py�4@tf�͍V��QɘJ��B���M꿓sf��n���J��=�R^�\'�U����0Y2��2]����HN׭M���ۿZ�y\0��I�(M��t��p�C!��2��Z^U�O^{�C�{����+ŜS&^���pEf�Y^X�fB�=�ӊ���Ri*x��1y��7�b\nZ�gH�Ա�����\\��~��Q3\\���F��-��Y4�EH:z��1H=���n8�\"w�}\0�ܐ\\���b6�x9͐C�j�2ٻ�\\Vo\\\'�H���o�?�{��ۻQp�2��o^	zA�{�!x�ϼtH.�t��p�%��9P� M���e\\J5I�Zu(���\0}���噓l�&Q\"�(�f�~�y�� �S	H�� ��#�@J�\0�A ��(*��~�4�j�Brdr�5%tF�#v���ƾ�>3<��Ţ�O?GʍY*!�C�<������Ѕ��,���^����j�h4Q��8#�#p�v˺U�8��S���i/��R\"�li�k|��l�\n�F�RXHjJ���/P��|���oO�h�|���8�]����\'�+��}G��;q������&�҉֯ϑ/���7�C�j�z>�Y��(*���jx�4��j��]2>9�	�B1�q�I&���pD�x�_F��ˣ�6�\n�/>k��P��`pʕ[�\"��?�!\\�G���\n���5I�c�w⁑���\'���ek���6S�!�/�I���t�]��Ʉ�{Y�*8�p�4�t��\\:R!��1�äv��@t�ztl\nE�n��u��}��ч�Ճ�ih�T�M��U��9����4�i�l.�|\\U5�����c��\n\0�~s9VPPJ/���Z�\"(&1---�	&��A�E�(�`T0:�q#�Oa&��2��ȑ�d�:�o�-���RD�!@,� ����G�zX��t9�M��Ҳƪˉ�|Ax�f6�E\0Q;�ހ)Uc\'�ul��P��<�i44�~��ЀnZ�����t�Q��S�)Q[g\"�A�F=Ű�L�zjdD�lv�����6�nˮt����\n���1ܶ��L q��-2�E�s�� �.^�!�B�tz)��i��ˬ%�9;��q���s{��O}W�|�iRg��q�>y��\"�����I�Q]_�\0�R��W�k�8Y��z�$�5�йθySGv�h(5��PW\\F�-��r.6˽��eǖE�~��=ձ0a�zm�A�g����l�������p�]�����3B�d�GFF�n���r���gR#�ɓ/�s�PL��⪂�@\0|Q+6��:��Ib��x٭���EK��5.��*�a�9l�\'f:��}�P,\\(�\'�RԓQ}���7+�o}�	��E��<��*0��ڻ:�u\\_/���n8�vbtp��(H�$,g������d��LY�q�4�Z/�Ӵ�����0j�j�iG���M�FS�)H=�xp&f�*W�LGҧ�.�>�ߊ]�O�O�a	�Bjq8�0\\(��o�f��0]��q��̈B�N@V��]HJ�`��Q��G�N�3�O�x�&�����vD��V��I\0̈́a���,:��L�h!}U~�n4F�`jh���S�@�@):����\0���f��{+ n����N���6,�Lݣ٣�A1	S��=zӀTm	4��?N9cD�i�A��e,�e��)�+�#Bv�qaꘓ�3�P�d8���X��D�;����I>�[�]�q��cp�+D��\0 G���R\'	���1-3uL�r�8��o�\\W��YN\\l���(&�Ndtyl������K3rR���q�����?~r����+Gn��\0c�˛}�C������6G��3琓�V9�˿^�1��ܘ�f2s����C�V)��O�����D��H!�F��Yj^�i@$b�g� �F)��Iw�r��s�c��ԏ�r���\\��H��9r��������ŅP��t�4�^��2�s��\'�QoS3N�L��@��\0,�B]�|��^縨�!=�\"!҂��57���A�-*�IOD�R�ePZ2���Jʆ����_\\��|�� ��Q��Yx�V��߆�����(�ip�U�p���T\\^&�#�De)�S�E���m٭�y�arE�3��I�S�D�m@��F��	��O:̉b�迹�1�S`�zM���ZF��{rRx�iy����7����s�F%\nOA�	����~��ihM(Q����ef��`��a���|m�.�Ƀ����}R����<{QN�o�v����J�8��n���\'e؄��\'�����/Jk�5��}Q*G�\"P��!`�o\'�*�D��Xh�Y��Y���$z��+C�i�IQB����N���!��u��l�쿣L�\n���z��e�\n��ʆ����\'�sޯ�w��]������/83;�Xf5WX���Cqi��PT����1w��f��PK�LDDX-��E��=A�=G�k�ʺ��È�Ξ�&g�۠=8I#����4�\'����JH�r�ſ�	�}σwCb.���\\h�S�B�}� u�i�.��\\�S�K��<E\nW-�\\,��:�z�����L��z����F�_��W�n8K\'q6NⲐ�J�L`.��N$�򞌦5O\\�v�Z.4Irv3�V@����I�2\0Pg��/�\0�J����:���H)/�zAż/����=@�<)	��ƕ+�}PLh�=rB�{��p᪓������4�3�**viyQ����궬��Z&�����h�}�c3�K\0�:@����aOw���	j��J��u�\'�xK8T;��P��=����yn���Pk$z%�O�Lp4��ق��Ҿ�ʫ���;o�[7�׊M����e|��	y �����\\)E�tjQ�d]j�3\'k?(6�)��������r��\"~�]R[�+g��OKУq_.��R��p��4�\0���!��3>j����V�tζ�K\'P脆��\\D.��g&Ǫ(�,�I��:���楺���#�w-\0vt���P�n�glSF���aG�?`e�젼zl�B���e.�G���߼$u3�֭`���)\0����R7�3��>v�%2��J�j�%(R���B������5�-[*QhԢ����C��Ǽ�ٺ����=�����Yf��8T===Pp�tw��Y��raM��F�=H�s��g�\\7��AR1:��:\n�Z@�~���!�9����9��������r�\\�����b�6m�Q[B,<5E:����X@V�/��U|]Y�\\�\0�7��í��~M\n��߁��\n&��]o�� ��*����1����\0+�>2ǭ�u�	�A0S��vP���\n��4	mjf�W�Ϫ�Y���=�����q��j��\0\0]�ޝ]D�mV&�w�t�q�ɡ&h�!㤓E$7I��O����v?�M��r�C�����y~��a�@ab`]4^<t�:\'>L�e��^(H�2>z�����Pj�V�i��?��/�i.���½��*[�e��]y m�ԃ�h��,r\n*v�s�u�}���P���8R�$�>Y�s�C�^��z\\��;�\\b�<U3#ûc>�ɖ��\\��KW}z���+���q<�4����U�aFG_G\\���ˉSvx&1{7嬅�Q� �*3\'��4���ɗFj�dIy�gfh�F�R�2ˎ���U�SO��ζI�	b�$���r���g� �����n�Є�)/�^H�O=�\0�5K��8>J�=�y,�w\'0�@b�t���^SmX�7@�=w�h\n;�0N�3h�gh���,��83\nI?p�}�m����SS����h�Z���d�(@���2q߅����\'���=���_~�(��E�q�s�c�P��~��JR3��v���hQ/�j8|���.�o�dl ��a�Ɔ+j�,��\n\0\'	�F#�^W&��C˱�M6� �:�R�k���s�j=��8�%x)63�Y	�.f��+���j��$h�AcM�4h&\nXD]f��f��Vf|R>km~�H0u\"�*��W㿨c\"��]�e��CJ�s����sr����lz�&�M={Myp�0O�od���Q�D�ljY�C������g��t?(��\\!��VK6Ǟ��X~���G���М2��V�?VƓ���;�VeѩV}4�ѥ�|��b�����/�����r���y�̔gAp����l�#��[��{����l���ۻ\n\0O����й�ZgOܝ�to��]�h�6./��#GNz�R4JA���rq/��*�&�P�>R_.R+6�CR-�]�؞Sיa����	$G��dQC��^�۫#��0��c@N���&�����~�}214\'��-���,u��2G ���o`�D���ㆂa��+��P\\�K^Y�\\l�B]�����F��\0)@\0;���qfU`�N$JhV�.���	j}ɸG���T�K	n.)��	��&�RCD5YDBD��Xu��ʡ|��e�lٰEv�[+/>��f�e������L�,_fD�1�_k�\"w��*�l)���q���ۖH/f	ڠY�fM\n�2m\0$�Çt��6B��`����&U�\0j�X���;���/!���{��c!\n޲y��bQ5�D�f�4Bt#�k�����g%�ˤ���^t\n�4J1N7����l2������pQ���9M��f.˨���t�Ct��� �x�eY�j!��W����QFF#-*��b#�.�`[�Wkx-.������H���r_�y1Ͽ*W[��?���r�n�\"}�ڄ�(���ـ�	��7�t@T����^,��͡Pk�)֟Y�����=�8s��Nl^�ۈ�}�w\0�R/�$нv��럘�X��[����u��,/\n#��F���De�J�Z\']�H\\XEE%n��0�\":���P��*�w/!�����D��;wS˾����9aI�ǧ�������|����ӯ����e��ֽ���Y(���Nٻn�|�k�˕.�t�����LQ[L��/T/�9�D@�~��g�s��HS���$dWp�V�Z.e(,n�#�\n̈^���)����\0h�t*s�쐎��m<&3����՘��_�Lc������Ny����W��>+ٰ��aS��/�S#*�x�r)�y��1��YD���>@���F���-���wGBF�����6n��X���1:�j3�	��z����N�J������&I��eyrײҰd6�9�,5�323Iy�h�uJf~9uVm������4R#�1��bh@��d��idN�$���B��厼��i�|���,e�r����Q�w1L���j�?=�.�͗ee�fY\\��+R�	#�wfPK�++0>$��-�O~�1��\\�M��ϱIN�܍c�ȃ�_)!��@�d����pkc�O��t?6==�-��X�	C��-bx{��vi��Sr��g�*[�|���-�5/��$�|�ON/����w�+\0p��kv��Չ@߯�%��</�F�}^������Ng0��M1�]��IY��$6�?RI[��8�ݙ��?2%��z���V�#`�$�A���a����r�n�}�9t�$r7��|&��f�6Yh��bn��^>!ϟ@�Ɩ�F��i�8>��rØ��$��=E��e�#��d��6����ƪʞ#���Q�4fq1g���d�����(��ilX��$��N�|�u��������ɭ�WHΧ?E��y�E8���U�����{���(N���6�I]���y�q���4����MDZS�#\nW�^PI�f6Y���o�\\ԝ�).�Y��7�2��.�\'�<����a��5h5�}-D�z��٘�����~sS:���M�6��1���Ip��3���m�v�jY��}r���>�&�x4vODe����t���tҦ�@x��Y�9d%ۡ$��nT�̷�|���!�8w��\\�n�T��l_�\n�Ӆ����Ɔ�}�{#2�y�N�!6;%��a�@|�N��F���#���Nk�0Խ��m�1�B�D�*��N���6�q:�إ�)ρ��\\���^C�vCuJ1#�6AU严��3�Ą�[��$�j��ɮ�ns���ʾ��^|�d_�j�w���X��f�O.���^�m.�+,�P���6(箵�4�$��\"/$-�7vS��Q�1�����p�4mh(\'M)Â��z� \'D��5�	v��k�e��m�����6Nl���?�s%�W3��a�e��d1�޾�\\��D��#Iu��;���o��:�n���;�ڥ��t��/�|,`����Nͤ~1����R����\\x{��ܶw��޺S��`z��}�t��y��Ny�(�X�ʁ�Jv�=B*��\0��|��<�\"�p^�����4K����9��_�%<����ލ�_;��}������u���XPBϗ�q�ښ�N5�v�S68�����q��ˁ{�#�K`%v�����Y�S���;�g���T%��5��@}M��f�5O��\"�km�A��ؕ�oo=�rٲ�\\�v1�~tV.\\�n~��z	�]8�� �.�F��Y���\0&^,�<�m��:$+�Y�`l�J����ۙ#�P��rŬ�y�ݤ���oW���p�1F��TÌ��<��ݿ���:��9q�*Cԇd����O�HͰ���%J�d��6Y�d=��r��3Ԅ������\0��࣬K�î�4�ԋЂ���Y��2:k\"���kϚ�M-����H���C��������꫎���[�:��5�p����o���ӗ}�VQp^��⢋�\"�t�O%bI@��ς-{\\��+ᾱ��Rioo���,9s��F	u$����$N1W��7����eO��� �6�p���0�\"�z�za7�$3��(G�r)+��Aq;�܊k��Tn���柤�7�����llC�T�1e^+�釧g#�\'t�H!͇��*Y�x��D�[��;����p�B���5�s��M�{�o)%���19�}���&�Z���g|���@H��駞7�#tJ��g�v\n�4���^�H�����ƭ��D%��P�0�W��a��\0hH�\0�\n�.�>� ��-�����ǰ�W=��� ��\0u�q@���<D9���EcD�\"�(b4?s��1:s��G�������W��_T�I�ދ_Z��9����	�k��P_���pMD�.���;Ѡ���4��_�$�{x�!U��G�s�=.��qQ`ÍL.0l]�0���h���ޝ��o2���ay��c�\'�����(=(�h��I2�����1krkz�x��7p�A�=�d�*bqsHtn���h ��@�Ө���$\nͦIB9gɂJ6QSi$2����ЇR�ǽ�S��Ң���w����#�V��l��-�%7\'�1͵��E�ډJi�d�fb@	��N�r��R�K,nF�y}cR���M�����F:S]�]-c$�G�d�nP&G���B�����YBm���?��q��m?F����_�Ʃ���7 \'І�[y/X�,]�JN���8ܺ8n�Qjv\"�� C�\0(�e���+�Z\n�3*��<7�1���[.�`1_Q�g�.B^u�N�����O~ ߣ�@ưp�\"��0��\0��6���铗����~f�Ƚ�݅��J\0��ϝ�ʀ�80\'eh�c4���� a�Hk� c\0��y3�|�mfɒ%�����D7K���x1&���\\U��s����I���@h���#,).1\\oJ�g痖��]�\n45Օ7���w��ؠJ3G!T5�F.m�i�M+���,�9����W٬\"O�ĝ{�Imm	���(���-�>:�8��N�S\n1C�0tW��l01H�n�\n�K!�uf�Tɘ�/ϼzL�t�}�,B-R\n\n4j�3pP�%�D�s:A��l&Fj���_|DJ�\0)��;*��h2�#�_ ���K9�-W���e��n��{샻����\'�9�:��\\�V\07f\'��j��c^�`�۞Ccd��9u�O�2*��T��9����ى�{\n���W�S�_8ݸ�w��d�w,\0�B���������d��\'�E���0��	9v֋6��Njr5���-�l*߲��%�Н���n(���3eP�͘͟��R>��ǰ�o\'E|]N����톶�µ����:Z1�r��#,���+Y��x�|��OB��D�\0�v��H%��*�\"g�O�Ej\n��FMOɾV\"�`���6�Bԉv+y�Ta����l��zHgm��Q\"������X����>�	�\0���\\�R��k�M�*DT:����.�n�VKe��|G^uڍ%�$�\\�{��e�Iܹ��A��`�{���\"\'�A���!_����ng��W��P�%ׇd톕�׹ʰ�\nɓ?|ΨY&	��J�d�[��B�\\��ފ֙�V順t^8�I����P��Z�pT6���z�N��ES�z��x�Dү��\\n�ά�L��_��R,�0F��%��M��Z-��9�Ef���;8�y�9��3�I3���҈ Vꥱ�;�t�Q���D�n7��i��\"�r{���iLY�=������^;�\"�:��A���h_��F�M����я@*i�f�)]An�5+Vȇ~akl�7B��J�v�}݌D�V�a�\"y���g�\"�Mes�3ۙ���C|�%��[,�������\n=9��{�/����ё�;\0[�~�48�zoqf�gĵ 3Y�>}�4�/E��g���_D!:���9Q����	.�]`5j���pP\n�g\0��p��o�$F�\n�ze����]$�����U���e���Z�\0�v���W��8�<Oc��Tp���J<$����A׎�.\n�.O���BG �I�$-���Z^�ֺH�2bCZ���Fʨ������5Ԑh�\\��خsq閎s�y�U�0�\"��&�\0X��6.D,�x�$Fɛ�Ρkc���cQUYmԦ4���ֽ�M��ǅ==9G�w���L�8#_ϥ9P ����9N͍Z�5W::gȰ�d�:x��2<�u�|\0�\n3����,ZRM�LM`�����M�HgǈE���YZU u�(����������7jt)��Ҵ�\0?�U��1R�`�A�W71;�͠� ^$�Ԇ��|fl�t����XwY��|����n�d�yr���)��\0Y�S�,ӵ��EY72�꜉4M�nMM9s��X���J�yh�ɕґ���U1���n��0��(�R&y�3�1*$x��D��{|߶y��B�LSوn���y��a�UL4��,�*��&ii��;G9Qj\n�I%;�	���yV�%ޕ���>�2u��)֧�F���*vG��u�x�%��2셪���{{������=�����Pq��1ˑg�5�x�BS��\"�t�2��7B�Eʦ�t����:��!��9q�L�\"��0�t�R�d�\0�K����\n`~�!�{��dhh������D�~�|�O\0\\�Xb��-;�#ۤ�p��H-�h��J&��Y��0��4�����δ4�3����n�ܲm�\\�.4ǽDo�=r�8sD6��;hz$�����b�0�z�6d=zԢ����خ�fj�>��nFf���g6bR;JyDMi�E�����ps���8z�8u>n<�H}� 5��?\0{�SEy:�����p�L3�;i��E22�JSb��w`=&�^��׾%W�/��#�a���b.�Gw�w#��!�\\�?vRF�\")3P%��?��R�!�p����(6���d�����MU�S�]XW@-v�h.! �Ê��-o�e-�R5Oa���2YZ�55��24:$�~�(OD�.���b��yz�NF�)�ǩ�~�64�B�I���LC��3�6NFq�J\'͏v6%�(��|�L:��k�I]i�����99r�kxi\">�e��O��TWr>0����U���G3偔~��ċ�FgLm�\"d1<��r� �����_E�}I�\nRu�zM�L�Ijt�����YϲE2�N��w\0�����:�z8b�7[����aj�Nu˫����_D�`%.��DV�������@�Q�.Z����ATVY^C�hb4�H�u�J�<��첏bgTX�4�i3���*W��ȝ�{Wp���t2�a������\'�h#\0�Y�;���ahz_99(��,GЍ&,̏-�BI�%�:\"�ѭ�Q��\0����	X�Lq|�U�x��f��|�b��j�|��Ա�Z\0^E�A%�\"�z�t��V�6\"�i�*v\"��\0(e��P���]���Gy��V �&=\0)7�QM}�L`@���}\'Z��p����Q\"�Z��M��F75����0�����~�m:��iپ��0j()�a[!��	�y8_�5R�3����^�\\����׈��2{c�1��\n5�ҒF���]�1_XԸ�c#դ��͜/����E	��򶈚7��Zx���z#/ΦU�q�x��l3�vfؼ�#���A�g\'��VTU���e4X���WыC[�kG\'p�|�	�&��B�`��g�  7�&�ڝ��_���\"Cg ���7��Zx?�����X�i���j�Ї�\n�OS�CG��;_��\\9��0��u��MUS�ø\0\'��g�;��iC%]\'tbG��=��?D�W;�Nꌦ�2(Sj��l`�@����|ɡ�IO�]�U彇/~���u_���λ�c\0p`��gx��l�cpB��e��ʐ��u����(#�� �D~$tv-Dy�scP@\\xzpR8y���ݻ�37)Z�\"���kD����v1�`#:���F>z���6��EF������ґ�\n��qW���.�`&Â��E4\"�O��9\"��\\Nb���c^j�\\M.T7�@����T ZۋAw�kp���{��8�}��C�AD�1\"Md/���d�y��qR�9�!��(�����6ﯭ����fػk$��zT^~�eY�vV�uDg�I�\0+\\�)\n��D@�\"y�I�^ٱ{�������d4i�cl����a��g���S|��Yٵg%d�.lfSr��KV�ƅ�r�\"�V��7���u��9�l��9�MEP�K�(n��� ҌJ!�za�+q�}�zQ+-�s���Pa�h���u��uپ�W�Ku>U�草D�D�߸I�є��V i�{l�6hAjv�sڋ��#�ݕ	�h:i}�9>3݄xÐ��B�!��uC\'4R߮�\\B�[<���#��2sl�s����4ш<)�ÆH�J���*	�4����%xBn4([�E^2\'5�,$�j)#�PɠN�K*M��J�u��Zx�yP����W�`�\'mL��%�,���,�e�>2���%��;��g7,��w���;\0\\��������}{+\nr�c�wv���W!�6J(U+q[�	TD��GH��7�t)��V���g�I}�AY����,�q�m$Bڈy�R����)]]#D���<��z���d�\0�C���\'��w`C�. �G(J̲���9g(���s�J�%xb4F���LiWѽ��-BGь�=\\��GP<Đ��)ޛ`og\"�Ct���bh�Q��~B�S���h�ne�M\0�^+��i=�����H���\\�f�cw0mLz�:h��\"�ȷ���k���Wz�ɾN��Y@Sh�He�j��f�0cM|]�f�n�2~�ѵ�����\0`�Y2�����M�eU�����#훴�=��쁦�_Bu��$�Y��	�H�\'�nc0�2C�L�MD�2FY�Mv���\'���:�\'\0�NBS�C�AHN��g.�Bt��[h�`�Z�{�Ff��������P��I�aB�8e��� �e��ܲq���iRc>K�\n2�s�`U§�/�lNv�[/Щ�:�����^�s�<=�0N�r�R(�}d���]b\0�,M�b4�+W/�����L�Q6ɾ;k���F�w�\"�P��!����sJD9K ��Ϋ痏Hَf���ڌ�_��r�S�IKw�%���ڔ���hjbh��Zpf\n	\n}�wZ��\0���/�N�5�x&�Ȳe֙S�����ŗ�9��Iu��	�I�DҺ�NlK&ud���~�0�ܸk�|��f����Ul��\0C�(�ds�[���?��K3\'v��z�T��Is�Q.y`锇��^Ym�+\'#�������N���!��c0�\"���Z�\03Ӗ��F;�G,\0W+�0\'�	ɈI���s�D�P4����E��\0�*I�;��R�a�R/��2R>�Q@|Õ�ˎ��8�m����-�.u�������P�?�]�9����;�S\'����P��0�N�l��dQ5��0\"�ҵ��y���ZI����^�Kq/ئfV�Vw2�c֠v(?-LtU�SLi!����\0t)N,�Lq��#����ƣ�|�\"<�)Tl\"�et��o܋o��^\'�� �q��C��~>�0��Pt�XI�gKây�d��J$w1�aDդ���za$�Y���\\��f G�9�Q�Xs0Y`=���e-c:�n-�_9�_ex�8�VH?S>/\'N!4Ѻ�\0P�7N������B���s�	xqdsUe%��6�m��V0�H�0�o���%�^-�w�6�t�BQ�g�����v���f�#�<П�I�]I�i�\0�OR��Qx��*�����3��J��?�&�X\\lR��]<�3\"�S���M��Q���=\0t�AA`����g�}�V�:W���Z[f0�Q�Y+q�B�Y�h0hHy�5b���9v�,��[6����QTkD���	y��A��~�����;��K-m�ăP,&�����K�� �|V�л�Ĵ׏������÷���[�Q���\n�/%�Bgș�1s��GF�\0�PPى[��_�H�;9�Ň�0ᇅ�Y��T����:��W)t���[��\\���t���	#J��g�Ef�L/��薞9��\'C�~��sr��#���I}i��b�_h8�<�R�v�DAuuD!Da\"��U�Kij�N��B����u�XuH�\"拔qՆ}����^���H�RA33�=��,�|��	����5����\n��rC5:�)(��&4\\��\"V�@er��Xœ���H+�\nl��\\6������ma�l�r6�$�Ck��j���E��nR�2���\0@��)�:D�����q�����فZ��g0��Ʌ֙�%l�E:�l(�^B�k�nh��\0�;���6Q~��\n`���x=;��Y�&6���\n8�; ����ћ�;x]���{���?����̘dg���!̼�[OO.7�½�H��+A}s�/���+�5BӚ�s�I9�U# %��0NHp.dvz�\n�QnjAs풅�-NG�2��5>ua���/,X����;������wmɾ;#��G]���,G�{b4�H�~�t	�S�A��K�à�:���:�͘��ll�&��3�䛶l��#�q=����9*���ŮQ���nӦJÝ9��^�:\\�M{!�~���I}M�|��*����2��]�s�bY߰|�樴s����b��a�D��LsCA.C��Q��ȧ4N�NQ��\"7�ᘨ�$�c���{��L�F55n`����_��*-��l�O`��IH�G�A�+�\\\\Ri\\�j+�DT�@1�����A���P@���~��S�,�ݻv2��҈�4�4k4�~TQT)�+l��tG1yU���B���d�_���j_Ol%.�|�x����\0:3��<�&/K�66�g@s{����.��������\'y��n��M)\'�dR{��\"E0�\nb0i�Ш��5K�z�;���r�zR��b�j��W��0D�)\0a��RQ^\'׮v��?#Ͼ�cL�[�b�l\\�X|+?���\n�(\0[\nY=�Z�>O��Qtk�ʡ��gǥ&�3�ʌ�w޵M>p�#��ܞ���r��%�KAT���3g��u���G6�<��dB�Op��%�$����߼Iv0󹌺��Zx�H;�8�+�,(I�\\��\\�\\�q^:p�f_>-6��-`\\dH�KC��f�\'��>�Ə���\'wn����m~{[`wWse���>�xW�l�\\�ջxvN.����^�m�P�?�a�<Q����d�;@���G&Ee?2v>\'�c�@$�3I�\\�~E.�4F V�T�0�|J�	Ǡ7�������i�{��~�g^��������h���Z��ya#:(�)4�8�@�G�b��&��\0P\"4@��XSvcX�~����u~��RkDg����������B����wQ���#�@\'�.�<3:YMm�I�4�2OBi?QR�Yf�jj4N��ԓ/���#�����MeH���#`���)A�\n<�Т$^U�h���Ȁ	R�n@:��Ci.�{���>M*�����E��/���bp����}D��Mg�,nXF*���r��s椷�W����hF.&N�(��ܴ�GXV�/%\0��c~Ak���,�-q�Y�r	|˨t0�]�	%��7w\08�IQ-�b�:k�9W�d�ʺ[���p�F���8[�0ŉ9��u.�_��V�215m|6)��Aiz#��d���NI~a���Z�\'�;y�uB+�s;���&��Ξ?)O?�<Zrj�1�ر���kcY���.s���U�4VIMaލt~/zo!0��\'}76<F�Z%��Q�1�g�\0��2��S��͸\\_�i\"޲C�_~<0�6�N%3�[fS=�L�o{���\0{��R��|��;��e��G�Y��T�Ha�0��ip�2ÖT�w��3�����f�@�`7�σ�a��?M�=m�·���Li`6\n�ع�hD��5�\'>�0i�c8�W��/d��[�f,%�����.�-�ŏy���	v��� ^La����$��w���wa��Henj�WH�/�F�r��K8TZ�;UAX�.�$\0�(�M\0�arF�2��Ĺ�C�fX�$J��X�w_YE�	�����B��u�y�ځQЉk�L8���M�����|�s�3dh�t6�\'��ӊ���6�Z�\\�9%ʍS��%H�5�Ӓ��2[\0nk�p֦F���:wD�PN#A}N�޼�NQ@,�F6�Ŷ��_������ׯ�{Ii�Ʃ�7)��˒IW�j&��Bg��{�#r�GIb���D{;6�M���>)�c��|�W�2����2�GI��8zJ����~SRY]3 \"W����o��H�1�}�8:�\0�4n�+<==��w��`��\n�l>_.=�	����gk.\\G�[,��cr��i�<�DDa(�P��y��֫�G�Y���^�/�[�m##n���u�S/�<<�lp9��¡9�^�sQ��(p�����wu�f�Yg<\'�!{�ʳ/�g�Y����u$˙�����nˑ��h���nZb�\n߮��%\0���dm�������ݳ�P]ł��~% O��--�����ʨ��J6�rє�?�4��-���!�YE4/f兗^7�j�ַ�Q�{�K55��}��J�Q��N��[ҵ��:�Kd�?�ǿ�M{_����?����������W���,ɑY�^��U��<K\0��G5휁+��u�J@�v�Pgz慞Z\\�)�%^z�i<�����94n7\0�	@�35���J�Q�\'�Fe7�*Hy�K٨oEun���8�g0F��H�M�3\"��T�����\"W��\\�z\nQ�g�Q�ݘ�������o{��I��v�ɦ\0o�\'E0#�3,��m3�C=B\\�(H�Kʡ�dMJ\'�Ht�-��BX�\0ag}g\0MK��Y�^)(Q�q2�����K��g陊aK��E�ձ�Di�1�����5ήuJ_g��[V��z�.v��~�ܡ�|1�	�q��<����\0�D��E2n.\"����2�c�p�[:�Q�z���!Y�@\n�K�\'����%E���7��ѡf�����^it�/5_�s�>u�hu�gR����e���԰�ڡ�\'G�lJ��?�����|;e��l\n!�+8�K�F�%�%��|�d�QzP��Ĭ�F)��`�|�Šܝ��5��>\\��/���u����O�G���立\0G��;;t��x`�a.�����9-�ay��D �b�mfw�� n���a��Z6]���� �)�kMS�$QX�)��GO0����ڇqg��[S&_���7�� �ǩ/�5�ƭe��UB��Γ�yϷ2���R������Yt��K�Q�SՇ�F�S\0���1=��8�p��[���1\\R4�S��{�M�H?D���fx\0(��\'�F�i�\0#Z4�Qn�;���]��B8d�0)l��0HD���L�� q\0��ђ�\\�_K�����%3(�����<�;^}���M�p��]������b޸��jk��L��$Ѵ����Rh�*���ǍFu����x�2��Z�\0�,\"H��H�N�r����\\��?���U4E��Z;�Ne��CL��XL���w��J|g���lD��4�t�}zֈ������rd�󊷣�_��d�c%����أr荋��oPcHق%��<f;�+��8&	�ؒ����c��yϣ��B�@����t��rරeͪm�&ʞ�U�1[�Qj���g�t��������eL���L�I���Aj\\GPưy�g�繙�C7� �8%�D�t-Ig�&*s2���o���T��ɱ���y{��+\'k�g �#�T�\\��d�*��q��|�\0aM�?3���e�nf�*��<� �.\n�UR��RG��;��\n?��^~�d>���~�lI�8��|����3�U#��|r�A����z��@�^i�I���r�j��sb[=��Yɻ:���\'E����`P�ic�h4���ݛwIso\0ލ���4�q�O�Q T�jz�F�����:x��`��^�f�C��6\0���̬O����4�>\n��T3�ziMJ���{3{\0<���kG�H�f���y�<fI�b�\0�0`�RW�Φ���I�P*�\05���3tW��ʇ��2ޏ�^�p9��b4����R\0UN�F��dي��~���%���\'�`c	[����zo�6��0���P�Ɋ�B&��>e�_9*C}}b�\n����iN�Ut��P*��}�?(%Pn�\\����V\0j�V���{h�P�Ԫ\n�B�y����yE��c0Lhi8��p�n���Q���nH�dxhT^a��%��eUK\09���U��J�TR�-�Tu21=$M�2))��PT���L����y��/r�\0�_���ԑ;�#�.3%�%)X�g/��vރ\"�ͅ��h��h�B<�������n2I��!k�/��t�֡�-íX�����yrBΜxC�:�0�Ҋ�cj�etJE�zIO�h[G\'G��E�N);w�dL��y�*y��< �EWXT����/B-*Nc�4 C�5�^&���n�V�#kx���F���Y_A������H#�@����oD�I����n��h�cj�\"�P\"5Q��ũA0i��̙�^�fM�Ld4\'~���������PWߠ��Oxr}+\0\\���c��h�S\',�G��jc��9(��I��:�W�\\v�j* ���t��hu��dԃ�g��C;<:C�FS�����d��e����<&��SK�ˑv�����/��e&	RL>{+&�ݿ��M��o���U��H����JG�NT׬zA�R;y������l5�\n�~7��������N����J7y	���z�{V^>�����X�J��^�F�aSC���׮�w;�O�L*y>Ls$�4�F��\0��D*�	��}�w*�����e��k�fzק\"\'&L�혮��no�0�j�\'F�o�쾝��ކ�̌�[�gSߨ�\"n�fA���^Ϛ8��\0���V�c�{Dvmc�!��&]J��S*��d�G����r��W ����/��\\�R��@��~��.9{�*mh�����ɱ�~���s�:ހ9z�R6�D)� ���f�\"�&7ʤ�b�&ס���MS՟t�Y4\">����n~��>�~�i\'Y��4@�O;�ڀ�$ʨP\n�6à$����_6f�f��X��i3B�A�,��B�O��D���\0�Oy��W%6�����[�q�[��6�[��q�d�u�Q{褼1$��:����v��t=B\0��Ј�?ǘQ>K��v��%F��=���!d�Ё�2�o����˅3����Rn����-[��܃���oC(cd��[eӆu2�W�A�SP$U9�\0�>��F)	��׾GG�-��4H5A3_��!�j����<X���etjo���r�=i�G��E�����#�G�:���8�1�a?s`�1u8t��Z���&R&꧆�Ö�d.�!����0��ե�̥Q��li\\�5d�T��]��lAj*����ɴ�m\'�{�\0�$��&GZx�ǖgZ�N���xV��Y�Q�/\'�`�q�s��qmq@���$����^�D}�Cp�����t;;\'��c�<Xi45����Z%/=�C����/�毰+?@�AԸ���i�$\'p��ž)E���MM�c��3�v�F0�a�p�\'��������F9��!b����H�駀ݿƀs����~7�]?�t�#����1V�0*P������ڬ�c;$bN��t�d���PLgpД��C)%�<N�;#��\"UJ�O���5��q��f����ۿ��a*=ȥ#\"��nC���p\n+��qI�+�[�K\\гD�=�`ҝ9Nw�<R7�Ǝ�h���n�f]D9:k�a��:%��峸]kn6R�	n��>��^��|3� �90����m��&�#P�&��Ub��e����^�5��o��݆d@k�/,.7(���V�4�2��KGי){��ِ�4��G�3υ&�=6��6�L�w�.Y�e4�t%��ޠsP�p��y=r��5�~��K�A��������-_���\0��u)�ɂ�X�TQ\"�L7�L]�O��ycQ��W�]���Z��ϸ˞_���^�i�[��o\0L�/�����!o����D�tu����G�\'ԉ9����A-�z�Iu�:� ��u�5x�l��۪���p�����0�B���-��[�˶5�R�+�CLA[�(�O���MI����vt�����������vT�ŰY�uq�jD���SGim>�W;k���%����l��654�0�V�*f��߸����_�\0�nF��0JL�6�]O%~7�N�ў��~\0o��>.\n8(�E�\')�&�%�5ý��]��%���q5��T\n��~Z��Ƶ���������3�u-F��)�&?��TLh�R�,m�p�D���e�R�ܠZ}C��0F�#�B���ߩϥ�����Ԡ�~���\0�k��M=6�ťE<�R^R�38�����}���C�!J�c�L�QC��r�*���g�K����.k,��˗��fAݚ/��t.qz6�C*.���n��z�rKߴu�@��A��JJ:_�җ��OVoX���3�W�c�q� �\'I����<���C�ٹi��НaX:���^=�4���T��CE}U��i΍\0���\\\0]�%K7�	R|\"ct�VS�\"0ۺ5ir��~y�����V*��<\0������apz �m�Z���f��OS��[�6>�<�^pa+/���?o���D,j��oKiLooy�r��	dTLעk���0���|��?p@�k5F�n�e���W_���)1C���.@+|��{���;�М���UO\\.�(���om:D��^�C��/�~��sԖ��\0;�>;���1ڿq���w��`D�Z\"S`3�-	��7�~7\"@����Q4�sӍ�Fwڄ@�J��J�3	T��6��hp?E��+u��t.��q.����)��\0�ZzXx k�ݲS���y�E�C�hvT&P�|H��1`�,-��Wih��ÄaE�T-a������ ��d��AĶ>\\-�YD��\0���g���$)u�T������ @�S�IwճI��q�QiMe�a��7;%o�}����?�~9s�|�;�#�,�z���H\n;yuo��|����5�lLZ���&�-e��e�6���p�:ư�Lj9Qgi��b�Z�a�:D�M�(Aϙ �އ>���.����qU�N��t<����4�F����\n���~��!ٰ�M���&z�F��U_y��ϼ|�m�8���������s×_}_����a��|ȓO��z��|�\'��<%����R/�\n��Ih/*�ʅ�[C�Xo�]سi�Ü��� ������qH���ߒ�|�`g�F�=���}��r�������8�A1���G����RӝRI�Aj%AD�j�ٙ�Mk���3�H)�9�7a�����%�~\n� �F���������>���h�3_�&E]~N�I.�$����O��^!�������t�����*��Y\\,j�_GSGo�����OFW�h@���)���[�����Ӟ_SK%\\3ꊟt�!S��v�[>���{��)ٽm�T1V���5��V�MJ�\'�^�e����s��;o�u�R�!�\'������o�Z���[�2�4��#B���E�r�Ն���n����TW�o��d62�\\�F�Y��6�*��60Ai������������u��a�� e�N��j���&�I6�\0����r��V���Z�Lym\\��WO�O�e|F��P�����-�����g����r�\nŐ�s�㭲�q��D��QZ2�~���5��g�JM2��r����埿�2�x�esd�!0ѷ=�L;��Mno�0�b*�ѝ�]�嶖鰘���e���PX�����,*�ᄎS�J��`�eλ��z�EQ�uk$[I�,`\'�ٌ�\'uC\'��H��Q<t��a��#�׍��eR^]+=������2W�ԅs�\'��舐�i2�)�VT��-kd��9��H��tt��~!鶃�+�Ëη��4�f��Hwo����N���%M{I��fʫQ��oF���h�𣦐1��~�x�5.�@*Vlإ�\"4�� .��f��O)*?���_u��jDV�ʀc�5a�V�9^��zy��tHQv�9>��M� �\0tzu�����:l#���F;ݪE֛F�z��������]J�^�3cp(�����@5j��A�R�+vua�o��)�|\n#3(���1T7T1�Tn�\0V�0́+4��eԓUѣO��Bz��Ԡ6g\\�ݿ��s��Y����\\#��X�e�	,b��*y��{e����n��6C¸u��N�	|L��~��p�Ir�6��0�j��M�{��)�+\'�}w�%F���E�}�������7缇��[���@������a\n7d�P�����ꡇE;t�����X;�%�r��,Hr��h� v�n\n51�`�|`S�E^YY�{0�LH�4&�,4+\\hcq.b�E?���4=��j��sI����{���3r�1�a҄Y�Gy�qq�宅������&�ܾX��#G�t�G�Xk��X��L&�$-\0�T��O��;�i��B7�P�7\nx�ߤ��Ly�h��\n�?�]b�+HMsi|~aԍ�HE�o��7�uo�ߍ�Hsp}��v�?˿k����P��M��N�)F�B\0�f瑚z&�0T-�;���زNΞb.�ѣ\08��}|� �2.�U� ��e��kX��A��5�>�~�)��5��<5�J�K�������h��9��,0t#	QOЁU�O���.ټy�4��,\'��#m����c����թ�(JL$�p���脌_Q\\!w�=���z��i:�g೎HU-3>�=��{wm�d��p�iV���S�тq�@�=��uS!��BHӝ��^cS�F�ƙ\'��v�XJF:��K�`!K:v|�Ѭ�X�cwۃ�vK�.�5ЖJ�;e2m������|�l\n���ϼc��t�\n�Œ�\ncG��KM�͖��_�Rar4;�v7\'�)&����%�}����c�����ۢEtzw�$�#u�Z�\nq��AU�)�]�����7������z��t�`�OC<�Q$�\"�7s2�pq+�������5�m��h��hN:�E�`�8��Q�!�c`S��O �֍zۛ�[M�n_����R����\0;My�N�i�����߸�>V���M&��U\"��H��{s����@�_����=����]K�X}���/`����k������te�2V3����[�A}\'���/�SAԎI�_#x]�x(ť���P�(6��U-�5���`���˟�G�����059u\n��I���u�\'׬X*W.^���\\���ϐn3z��je��*y���4_q�a����j����E�Mmچ3Oe��s�h/&����5h�oٳS��v��_H�nh��:���Uy��i��SQ���_xV�Z0=`�gzD�qܶ���`ԋA�R�b1Ή0��ɂL�q)�Y�yr��,���5X���(�LLv��d�����%#�Tj��y}����G�6��Ƞ]�[l(2�nY�$�Y@��H65e�!�����hXP���τ�vw����o�\0�(h���8<O��ԡS42��j>1G:Kڀf4$b���8���@E��L�v��ine�A&�B�hfq�1Z�A����T��L��:,ǎ6���L.��ec�Frt�L�\'RC�@s���o�/F�u�����Y�B�P�n��Ѡ�Ѥ�Y/4~�>7�Ӡ���]��ԱԷ�����8��;�+ۖe��vn�Q��y��y��o�bCR�9�����t�4_�Н���+R��x�͉�>u�����^}苟|>xYA54�l�#�<����pl~AV,_�\nd1�3�.7�-�2���	��4C�_/�Ҧ�;���7��4���ve�j�(�q�I�/_��!c|�Z��]���r�S�u9+���۲�T�#KW������]|R�W*��]Pj��9i���c��z~^hf����Vu�;�S��U��WA~��9�>CØ���0G�������}Mښ�@�.�	Q�H��D�WQ��bz�5���H��)@��q#�IO�b�*��-��	3�ځ��[1>ֲ�̚הJ�y�d����-��@���Y��c�WV�d�3��r�)єZE��_N�D���Ha �P���0�얋-��!��tS�/|畐tC\'8z�I������MG�;/��Xd�n���,�� \'�ɲ<��<�8<�?n��(D���WO�\'s!��z:s�դ8�L{���6�� �W���0w$W�x����dz�w�4ER�_����c�n\0���z���T�{C��W�!O�!�\0�]����k��?�\"4�$�LD����Lp�p�vl|��a\0�*�b��fK?������U��Vf��g4��{{�1�N܍�S����Q�4˚/�4f�(@9Q�\\e|i�DT/|�J4�i�d��8m(+�D<���tu�H�}�*9a}�/!Uܻs���\\� w��/�\"���$�� N�0؜�C��|�I��<�\n�Y��ɔ���������㜃�P<�k�g�L�EdÒ�HNIאG��)ɀ4m�Rk�!VG��%��\0��_]�[v��<x��O��8}aVN�����I�nm��t��Ї<a��nF���V��{�s�\0�Z�MWڌ��9�f\\Kq���%۫>(���J��)���N�\'%1�?0R����ͫXu�CP~�[����x��:8��l_V�^��9%Mx3�w�����% 3~*�Nv&���~mߺ�r\"2婩�T� �9�v�C�������dw��=�aR�֞\"J\n�B�G>璕k˂�j#���S��P,�Q#B�F5?����ܱ~�l]���2N�\\�3��(4q���O0�0�W��\\Z/��n�濦���e)��{Œ����͏�ݕP:�Kia�ftx��a<���iм���������/J	!m����z`1u�L�@��=u)zT���]\\}�4*�&����$+?�S_;�7��Y_�٥D<����c���B��jM�sq�پi-u��ͧN�~f�,[�P��\\5�{Z�ȁQ<�<�LZ���&J%F\n��7<�)S��^��<~�˘7+525#(\"�m��Fpb|�T��ť����K�L�R,@��K]y@����f�o���=�loV�h�˝}eL�/��t�����d�Ų�f�^L:(CS���mT���oS�A�	}��t����6�٭ƌ��w���˫dŚ���I�)xf&�zTW ����2��I���f$�9�,����%,����N����ss�k�&�7���M�u�[���@���%���J�Sk�;��H�t��`R&\"�9x��\0M-�jE���LhN\'\'bu����|1fϾ��1�Yt�@�u��DLm3����]~瓻e���|�\\=w�t�lX�R��;�$Ro�6mH��Ƒ!s�ס=8�$�6:�9n�M�޽�d͢t3D]��sZ_Z*�|͇\0��T�-���|�R����7ji7���97�]C��4��~��\'�P�p�֎�*��Pw�;�0�O�Ho|�6����ɧγq�z\"^��Sì�R��ؽ�e��-�E��?Jv��4�V�1��k���H;����B����c$�tN�����g-³p����M�_��m|�Qf~�H5��y�6�0��7�)��L�<�<ٴv=\0�n<�;kl�Yꭱ�@6�������8��،u~���c�\0ur\\���M�x9��Lem<P�?~��l.9�%�f�a�j�{�\0��N�V�������W����\'�ᯔ�}��deC��d)��+���a�r��h����N&c`}�Ƶ�㖻d��U4\n�cy��S��K/P{d��e�Ed�u�U\"���W-�{o�&��\n�f|ZWZF�̻�z��RR��\\���|*����:35A�h���veY��9�C7ܗD�\'R[�d:w���O��]�=����r�֥+~Kr�R\0�J��#�+�xڏ���U��@�ˋ�!����^QG��P�.YP^2!9�hx�1\\�L�<������0�z���|�IID�sR\0���v�����?�3�{�|�#�\'����nYBqp�Q3������i����<cZP�,�N1z�|6�P���[���ȼ�\'�1�#u7V�A�vz�Y��\\dW�F�n��Jc1+��fCDO,�(�Pu�o����Pzp_~��E���H���}���|���\0�<U�scp�29^�=�Cpb���̀�������_��� ������W��w������6�+�?xI��Ơp:�S�&d`�����������i�2��ҐA�\"����`Fn\0�M9�q����~>u�1�X7eөPg�{�$6�Oi)��x�\01]sĮƮV:����J�g��q,V��q��&7Zڈ�^4\"T@�tZ��<D���6kGX�v��Nj	\0[I�H5���(EŊ�&I��yY&1>{3�N�4f�\"8n�i��,�/^���Q����ߔ`2�����M������˿&M�24���sf���w�/>F��Q��2z��b�\\鞔F��w�j�f�������_�\\���f�u�b���f8�e�ȃ��=����`�>�C��/�嗍!�x�G�Mr?������7�b۬�&I�&��������u�e%��/��A4��l�=����m}}�����j��t�yK`W�3���dJ��鄴�u��SC8�dI,~��\'�	���!�`�LbtPY]${���J����-���s߾.��~�}K+�ɇ?�a����W�н�`�|�~��n��.�vAK_�=�����~��6��S�\\��<�J��lپr�|��wrY�K��M�su�_輎�:���8C�Gp����� ���I�{F7X���(�qaߨ���#���.��jD�uKҸ `k�]���$�Q�/��.���f��gfO����\0��nAMp!gO�~s��~����Ц���\nB�Ԃ\0BK���gi���*J�Yk���Ms�n�m����3Q���7��o�u��M�|�4L�yc]|4�<�Fs˩t\"j\"�����!�T��Й��o�t�������c획�vm-t}��OOC},��Z�B?��J���nXCQdcR�x���!T���m\n9!�k�\\˹������\\t���T@߳��f�Ï8X��LJLЄ��d<k�?��U~��!/<������o���Y�X��:ݲER�H�!,`�rҌ�(L��*��)�^&�]�t�s>�&��*�@��|��6��[w�m[p8\"���\'0��h�C�)F1�mLC5���%6#�����(�>\n�V=��Ya�.�jT6>Ƙ�eq}�D̤�\"�e�=3\'q!2v谣�����/?����e\0������O�D��+��c1�\\oŇ����s��a�3ðSW�&��y$�`�ʕL; (����6�[��2\"�\"cɒ%�tд�6�D����@&�,@�X.K�Tb=�v�:��.`�Є\\�W~�k@Gb\'�e����*ٴ})QF\"}��bY�M_gΛ悺��(�I��s����̥�l��jT�c��]^��@�nƴ7�Dmp�x�܀�	B�9ꠦ|f�\0�6r2����Q�\04uA�����C��/+jȝ{��&�������?e�g�,].w}g\n���IBIQ�zqJ9!xӔ$J��U��Ghi�4}��O#<�~�5�*p��S�M�	�o��?�ݏ���R7���F\'*e�%���j���l���շOǝ�-�nh��I��+��$\0�}�NY�f�,YZ�u<GRa������bf����\nz\n�3�؊3��/�hC��r�d!�-�V�7�y�CA��[߲����h�h��A&��>���o<>�(M�Ο�$簵z��=d���}�����~Y��N�g\"��Lb�\n#��y�Z�����Ç��Acb�\\j��;%�H9��-�5��ٰT	533�\'sƸb�0��F�����,�a#�>W.��z�N�IZY�������h��R5��>ih�$׮�Kcm\\֯�b��A��.;úӞ���S��ֺ�e\0p���ʎ���)w�ɔC�!H*\0)3B��<S;E[�L-���=�1��U���I��F\0�pa��޽A�����\\��p�+?B ~��D.�4dfm[��t��R2������K��K�:�^������J!}XvuL�P�5��VA?��DN/�;�\0��櫲��pY�ǩc�]�)\")���>U���oF�OA����ȼ�Pu/\0��n���\'2J��0���\n�� b�b��ౣR�q���o���&��	�����RK����O���@s&ʝC��C66M�����q�>�N8O֯C:X\\MTH��8i\0ߏj~i�L�g����?7�k��Y�P�ߛպ���u�U����#d.C۫���	u̠����I��ڨ�\'B���s|^a��ܫ�Nl���cOπ�<y��~�d�-;e�B#;�ܹK���n���zU����	v�PK�Uf��͐իגV���ݴ�A*�D�f:�I��kWC��o��>9s挱��ђ�ٲe=ރ�⵫l�=H�d��AN�НoزCJ����E��o�.p/\n��D�H7<Sr�Q�:9#v%\'�����z����)��ڲA��ۉ����ڽ�I�7���cG����(�ܲ�6��\'?!K�#觞j��_9�L�	�[�6��۬nc@�N����Q9��t�-�<h6Ct��eAm�4���,�u&��X�M�Lk�RQ�[\0;������\'�hp�����hZ�;=�����a+O ���j�S(:�-e���b�s�l�RB�J�#���C$���{����}K�qI=rFΞfn/�|%̜-�Y.s�Ъ��Å�s��� ��\0hu��/��RʒM�eqe�̍�Kӹ��$�{d9����z�)x`mrk��W&ZOӢ��M:��Eg�N-1H�H\\��r�ݥ��pr1h-JXN�s��O#�<,�NJf�����\"u1mΥ�+H�I��F�����{�`Ȑ+}��~;����f\'t�z�[�� �z�0�Q�<_.&�)B���\n$��7�g�n��bc��Dvm�p4X�yZ�C:�S$���o�iE:0����\no�7���w-W�\"M߷�kV����Ge�{\nFVu����n:���nf3䝿oݶK.8���\"����4<�;�����Ǳ���\n�5�t}Dn�QP��|�n�:���ɋD��D�kd��t�44���|�3T�Mc����s�\\��)/<f�`i6b2u�Y1p|�R�|���o/�\0�\\���̧6�v�F��O�W�i�*\'F��I��N�;�+���������2=Ĭ_\0ۖM\nʢ�����W�*eU��^(wޱO6Q���+Fm6C)�(ׯ\\��Vf���U��_��Ge�����]�$͐f\\ge�s�z�9i�g@�um�~�چ土M��}2�ʘl8eh���x�e�g��=K�!�ް�������s{K\0�o��&���z��r1�p�zd�Cj���9�E��s,��\n����Z`n>�tR���ji�$W�^��p��~�V���+���ˆY��|���x?�C�$��w��:o5\0MŌɂ+�]L}��\0uN��-ZR�(Aͱa�2���ׇ��p�A�&�b٘-����R���3@��`f�zU�;�b�e�ZGC:IO�ԅ��j��m�nb�M�>MyӠ�n�� ��џ��5�/i\0#��\0��8�d�d�:AR�e�d��-�k��Cz[P|�|�xo�����@�\\@mbX�����{��H�h��%;�z���S��Ȳf����:��CB{-§������S�B��t4gR��7�>\"l����E��G�F̸��1��ǁ���Q*й�~( :\"Sנ����HM�9��3@k[7�r�#�Q��6�`}�ӿ!��9��kF�tb�Y�L��DTP��8�[o�C֬]���D����/�Dd��眺=e��qKA���>M;��_e����,_��AZ���46����R���N)�q�������Y\"�k���Y�M��|�2���L���U@gQ�S�[�e#�&y�\'���K��aI�C��x�`�c^�P�]��S��$��Z\"����Z���禺��q��d�w�Z��\"�=��6��_�r�����<k�y��Z��tӎ���i�+MH�kLnW���8�f��H��-�*��D^Y�X� �s�fʢɾ=����ίL/Z��/y������=C��Mw��z�6f᪘HfKsT����Y���2ґ�&�6��4\n�egï��hJ��47_��z�d��o{�.˶��dɲ��PO�7�?�.	5�%n�[j�:�0઴X���L^���tD�W�a�f��bU��(��9`2H���#�CtF��ic��6��������6�ʦq���H���M-�k��\0\n��wC�qC���޴�Jg��aG�����Xkq\"�&e�N`!��{��Oʴqe�<�O\'�(��O�8a�\'�kX�.�������7(��ԥ��?��1����x>@�͚�r���\\x2���;�n\"#6.6�2g߄�����4ެ��Sa�G�I7R�N\'l3|�:��^AO�v�{ڦ]�Gm\n)��E����MM�]}:�I�6c�P-��h`8��������J��o`HZ�w�v\\�9�|~����\n3B�d߾=���e�wc~zR�2�J��.l��aJ�����3���Zq���H߾�HJ��1����)%���nd�۷1���ipJ\n���~唦P%1�h��m����,[����	\'3K>�����!3�>��6�o���$H��2�p�0eB�!}�QCk�?��Vǈ�5�?qtJN�j�	�ݫ�tUY��\\�D{��Դ�u�C����zZ�{��Ɠ�����W5�6��ցO*�3kك�R�U����ҹ.,�#�h�\\�{�]�H��Lk��*�>�dUk-��c�s�������¸t;#!+q��N��Jy�w0&�X|��%��\\��VM	�j�W	�)���u{>��-���WHS3Ѿ���*��.N譒��D�j~i��Gvs]���r��5\"6�1�8���\':S���@R�Q��/8�R!.�N��s��rbo���Bi&�}��)j{���+�3��yS�[<w�����P�,nZ���ě�n�sU*_Ou��$�Mo?E8S5v�8�\0��F�Wц�b��\'\\F�Vs�`��R������G���ȟ|������zv(@UF�4G����>����{>�H.�_{�4���\\8D�H�4-�Pk��o~Z�G�p��,���&��Ȳ&ِ��	���i[�\0B1:����1�X$E䒀֒���@���7@��eT�¢�AȠ����ѭ��t���v?]��h�����	/g�8e��=���@��G��i\0����%+W��BD~��m��9�o�D�[h����e`E��R	��%�d��i�GyOQAe!�\0���:d@�N����^����[/���r��C��+\n�s��q��ar�S���=%^��l���A�_�;G��ʇ�`������ΞT4�Ǫ�YW7\0~I��rp���g�~B:�]���\\6�|�ˌ�\\�xл��-H�_+Nϯ|��\" ��u�V�G�ѡ簛�Cm�\0nj.�Լ��*c�<g�E�cŜK$r�\'��^�zV�c�����%;m�ǻF�3�P�؏҆�#�\\0�z��~v�w��i��O���9�!���V��1�fc�t����k���lQ����i�O�#�o�y�ނ~�Y9s�8�	�e�<)�[�:����Ȯ-jh�)�^.�똠�Ѓ�*���\n(3�8�b�]P:��3�������V�8�	���9��Q,��������H�0]k�-�q�������z������Ά��>�iFm~Ϩ3�In�몀�`gR#���44��VR~�I����mD�A:��|�3�f���ꖺ�*���~Fvo*�g�wV���2F�V�K8I�o\0Bu�B����m���%����ޗNʩ�k��.H���h9ė��X��?|�O#myϭ���2Rb��~���𪢈�,ޭΑPR��R�4t��$}H�:�#�!\n+�d ���&Z��B�N)=ӣ��\\D��Q����v���,�z������f��f��J�5u����_��|�w~Uv�\0���&ȋ/��42ʆ�W�z�w������|��ߖ���-]�;�r\"�k��E��> ���^��8���k-�0LL0J��ζ۵���	�����՟�UZ^Цn�M�\0�f�\08à�Ρ�sIo��THCo�K�	��<�Q{�����5Y��� �&�Zy�W��|k7��0p�M)dISlT��6~��1y���hЕJ#��N	��e�v������t��>z�C��կ# �\n,�c�(-@�T����S(�6,#s`-_����7�9�y�,��O�I����H����j8���^�:L�V#���\\4���.�wZ�o^��\0�T2#sS��65���������#E33М)^ZP��D�K/2l��5G����&ľ�n��%����ʖͿ.�N�cG3$����p���C�b���3�D*��u�z���R�dL��Lz�?\\��^h��	3%�V#�\\�3G�#�z�~�>1��9�ɪц>Tʧ�Κ�e����()GJ;�έ�F�Z��E:Lln��5� ��YU�K���Gk����d�|4�����»n�#����s������Eq���Gs��<���G~�������i:|8�L%�A��];��Br�5-�����^y��FK[;�8�;�\\h(�t5 Д|l6RC��I�c>>��ڗ�\"X����������L�y�(��Q�ţ�FS�|�{{��m��bE����h��i�����.��0�u�����/�����P���{�H��:��`�����;�\\�e�*%K�d�r�,+���r���).ql�-V��.Q�(R�e+��}[�{�`����of�����H�~�e0�}�{�{�=�\\�%K�E�!�򴛒Gd���ݾ��s���w_v_��w068�	����96�G�u��/>���08���t����n�^ ��)���\\c�e^��.�^���Yًi�<�K�FS��J{������LN� �i������Q\"E�|�4���$�u|�o\0���]&U�7�t��d]�sRt���U+7�B0��p� :o�v:����o�}/�5ZV��{��1fn��V$�KQ�Գ�q�.�C�����ʕh�a@D����lKE%$��y��Z3>2������,�#�#Ӓ�ѹ��ɞ�;�)�<��\'��?�\08??�;6�_����75������l��)t����-��wK% eehC���@�{��ܩ���o�q�n���*�/����ȉ\n�$-���\"������h�w3����ǚ$w�R�ʗ��fZ�]�=���ɸ�+\\Ҏ<��s�N�~)���3����㙅�i�)��ג�����6����銫��s��m�����SY\\a��V�`�$������f�,j�4g�s�	l8C��&#����6�9���_�K/>O��3F9�G��M�g~�_�[�q����G��{�4B~rO�[I��I�0=.�g�9��+�t[��z��S����\\Y�Rc����V�z|>�M�Z�0\"\'n�hNc;��I�ڍ5����=YfK�iR�����l�6l��)5�,��BI�+%����.���\0��LE3?��#ϝ�3�k��9>�����LwKc�(g��tb}h���筴��OފeU����#:n�X�m-���o�O�W��>���U@,�m|��ƥ��kxMFobh�M�B�Ϥ�P�	2��NG��M�e���8�B�}g��i�\\��%�|R .���눺��4W\05��H�\n}?o4�S.��M	R�YJ��T��r�!���H����H��6�X�~�^w�6he�M�Tä���y�ͻ�+{u�K^mƥ��㎹c�wM����2FE���@��׬�1�6+��y7�^Aü|y�۲=�e�f�����Վ�?ג�yw�g�������꩑���ܼ��P\0G�kj��Y�`-����Ǎ�p`` A����Y9��SbԳ���7��{\0kN�7������v�>�v�?p�{��O>>x�}��G���v�}�#��kM\"z�1�6`�O�M�$����%�n�0r���TJM�\n��yh��¥�\0�����@$lA/��T�P\'$�߄�jmU���K��=x��^��_RuŽ���T\"*�0�8]nn3��ѿ��jݭ?|�}ݳO�q_��?�����������>�	���ĝ�����k�{\\7���N(+q��$[9\0��_ǵ��N�ߓ�7�2c*�9بfL���<�]���v75��\n\n&�-]^�vݽ�]�2WT	~��I�����l7#��䘣l\ns鰧�[)�dI&��o�k�	�\0Gc�+���[2@^�0��<ͪe�x{�9��WE�O7��=�$��R\nɸr�Z]wx�ݸ7^v�}�;^����{��e����GJ�筤��ǈ�����;Y��98�s�w�;u�(�J���8D ����TYH5�e���Բ�͔�%|��o��B���u$����%���[��@w\\���\"ev�l�S�v�p�9v���I��q����C���=��pZ�M=M���qI�h&��\n�|ؐw��0��\"��$�����p�)��ZkXJ��������w��lk��w1n��Wv���͡;�>�@��s�I�5�A�%�P�>+���)ĬؿP�wg��$���JMi�p�~d2��p��Y������-�x�Ԇ��g?�S4.F�?`�S�:iL���!�*�p՝�\0�k������.Rq�d��C�8q� �q��Md����qx2��f�P[�!u/b!�\0����_�\'�_��p�=͔�(%I�����5�4�-��u�_���м���[��,��g^0�}&Äv��\"]�s|�6[�b�wu�Z	��~t�����#`3y�f2�b���j��f�fu6T���Q�2�����J�ip����q�X��aE���߽�~��\'(�Fpt.t�LF˦f��g>���v�کQ�uh�qA8����,��%�1u�\'s�Q��[�3o��Ϻ�{_$;�@����-�����1�����:�C�4�\"�(.W\'}�9q+�	W\n��a��VX�2�ʓ=�!��w/���xv~�2�Ѵ9�p�!���wE7��}�xό���Z����C�����A�`j�m�C.s5utu �d�U�l���n�.��r�^���\'a��u���Ξ9?o��?�O�z�?�>�G�F9�Jv�ݮ�w�O�Ĩ����j�@b����oɒR�v�0�@?�2Hd.���u�ǚ$~������:�p�����R�G���X�q�~��E7��0�B9U���쁄��C�����))�g�l)��̄(�M�B�`>P��2��	�t�U���&�^@��	�a���Z�T��q��\"��˒�/��4\n_V��B��a��TY`ઘ���E��c�(T�yPtJ������Ft�27V0�߹.-�z����k��ah����3�\0�����?�2�K�ƌ���50�8f)����)��\"�/�V��؃�P@CyؐY9d�H�R�A%g���8L�X�Pk��,+ˇm��FW]SO �Ar섙ea��-W�K�B�V׻-�J]����^Xp��W��vnp��X�Z*�φ純�슡8i�V� �#�ו��*��	*!K�ɺ��-��k:`�P���+�2�o����y�q��@ӑHq1:܃�R���_�%(���o�v���7 ?�M���<����>����\n����_hp�U�U�Ҡ��]X� 0��=<�Q�{\\�<B3�J��q���q>������Iʼ�l$��)uRx��P�:��A\'��j��̎E�����g��l��3�FW�O`j�|�k�8�t���s��������C��m�JR�kd��`T\n��e��\\��h~��Rn��n��q��z�:��Ք�}eB�	��;�c�#8[n\0˵6�U�{���������_�}2p�T_}�+C��/|��v�.�k�sQa��iq�Q\n\n��fdk���nX��6��y�Q���}�V8����K��X��xǲ�<��^]I�5����A�[˨D���.\"�ϻ��z���/�=8��ҙK	��5WP�L�@9)@z=--C��74t�Zh;���`B.9u�N�#�s�xTvA���t��>�`]��Q��U�j����\"�*ĺ>w(���ŌJ`��UI�>d��������FLei�o65XZ^�^U�[\'���4\0�0x����f���l9��w�-ww6��Ǟ�w���K��Q�kp�`~%ZJ�)vy����\0��w^O��N֘��7�Y��j\0>b�Sd��-	��ٜ�84��2~�y����?|�F?D��*I������q{`�[_v%~���n�df\'�S�+��ɲWR�R�C�VfB�/})��$O��C۠T��_�}ݴ�a[IIAS��\";~�ʍ\0-�_�,m�E�Os�)/W2/��O�Q����ꋮk��!�yp�����Gsü���W_w/��ו3�o\\.Ԕ��Ƥ`e.��|¸D���#~�w4�����ܧ>x�� �;Jw���n��h\'���&81H��-B���@�IS������صH�<t�l��йdv�\\�i�,�ad�+M�SO�d+��.\0.ȝB9�{�����@)%��.������a|��U�����zȐ�͌�@r����9/��2���ܟ��/Q¿l������_����g~��i�������Gc15x+�N�IX_q%��v0;F���n�4޵Ïk\n_��������e�b���\n?/W\n(Of���{쉓����Q��K���Y��}��<d�N�,UD���N�Q2̺2����Sn�\ne��{,��M��H�2wȃm�F[&�KYQ	��F(\0R1TTd�!θ}��o�)��<)y�}���\0�#��67����h�����~a�\\��SY�+���-����Z�����3�\0�z.T��c�O��.-F2��	��3Ki���O�4jJ4���۔���z\\k�ne���\\DWe%\nyZ8ޛy#���9m`�h*8aqs�I�zP�9x��j۵1��1�o-%̦a�L�ق��ZQ\0lpH~l��\"�)����X`N]`^�$Q���#%��sX�\"=j��Gc�_��\"8t�D�OAp΂�J)al>vY��V���}�ݻ��}�=������A&*:����\"��S�}�>7������k �)��8T0�.@�L�\\���BUCp�A���Q��Ru�7\n���{��,������%�-/V���8��|~���B���X$u�Jـ�(��t$ebpi�����mÌL����maHn�ݾM�i�Bh�в�y���������Rb%��|(9�K�r������Tt%�3C��#�����Af��y�{�0ي�\'ep/R\"^��s�p�\nQ�LM����r�iz\0�Baq�O���7s=�!l�4[��}�[�3Qn���o}��$�%=�\'讇��e%�]	�PӤ���P�(����#xg�<�Yf�+C�G����SƤ�peH���r�����Y��<~Ђ���!.Hb�28�>���	몖P51M���]>s�l����{�o�g	�*1���,��P	q�T�����$�\n���u�!7�_�[��)	���H~����U���]�Xĵ0{��I��.�e��ק�n�57�^�?�ǻ\0&��3za�F[O?P�T�Rָ=��:��Y�\\]�Oх����榀��d��NBy��\0׹!왋����&%*�\n���bl�E�����q�>DQ$k�(z��I�WQ���ff���͎S�a��ݷc��׫��g��,�tޔ	�T��AS��QҢTV�.dL�td>��I�}_�8�<�gZ1}5K6\0*�J�/ �])�����d�,� �:�\"9�u�s�ÿs;6�����rO?�4`���������w��o�����-7Di[\0�aFmL����(;���N�cO[5P=�fM-�v��[�(aR�!�{��YS�̘�X\"𐑪.�Oe�dm�<@a2C+���61�¦N2Y���uꖋ [B���S/]v��t\0����I�ǡ	b������O�c\n`>�KO/r:_;����y2�F%�U��$���9b�� o���C !\0��ѳ��Q:���W���Ι��)M�s�����#�����ܗ�T���Wm�K6v���=��?�����d5��\nS���}�#\0��4�\'-�,0Hݟ�h��OYb�C�_\0:���2��ɮ���0�a�Wc�`f��F���ƽ���������t�F����I�����족�WT_�4�4����\"��[���nJRǼmWz�C�M����N�lr5\"y�B��0}�s��a� ����\'�(�H�>�s�D�,��5�s?xi��z�z2��ԩ�#�+�����:~&я?��@R������p�������<�,q���1��N`\0bg&���\'���,�hR[��0�4��@mmd(:Ћ�m��<���9�O٬���u��)fP�����A��(AY�a�y��+�Y��2tפ\0Y`�)v\0v���P8��L�+����J�t�ˢ�h7���r�<3�1�Pn�[GT�o,�6E��!��!�Ԋq2:��\"׺�|�x��[�>������`�}�L�`KW;�aL?�s�=�o��&����2Ic�\'K��W8���	����)�	�����X�4IM����_dv����J�I�tH%\n\\?s���-u�,˂���\'��)y��#Cܽ7?^D\"�1l*-���2�ac�W/�TA���U7@���X�d`��E�_��GDR�]�^�+ָ��^�-Х�u�ytFe�dd#�<�Dʖ�#Bi�ٶ�H��X6��#�Ƚ��}�+���K���Y��l���g�������gh� �Ho?��=�U)�����\'_��i&W�@��\\�~���Ƀ�_5�0�8�QN�ҦC$O��p�r����֟v�����΁s�W!\"T]y��̞#���L������AP\\X��s���w%@�z.5#(8��g4P�P}�f�Lg�B��s�ٗ�AQ�w���j}�$f�m��5E�2�>�\0��^���XA��e͍��~m�!���7]�w��~\0��W���Z ��,d��{�(t�� O2�����[�4�2��rŒ഻\'~�mn�3�������o����~]�[�������ܓ�=��8K��_	�m&dc��l�eJ0���>���^���BP^�S�nݺՆ)�P��V�h^��Q^�9C�N�{PX��r��_S[�F�Q	��}�V�7���y>���y#kJ�c#�<c��ĪA�I�1�6��[����?�o�\\���?}ֽ��>o��l��9������o�sO�����Ⱦ)ȫBd�sz�a j�f��H�W�S�F��~cB��ȕ�#�u���e���3yA�2;�,?kZf�~_��!�=�E�]\0{�%��qI��e k����a�� ��Gw��\'\\�0춮�r�D幎\\���b�Y@W����;�m�8v�&�GwuͪUt~K��W�F�M{��ϗ�����wx��\\���Z������jn�I����{����t�\'^�0n��c��v���?|ž�u�RS��qo6�8�8�ߜ�$j�;=�������zLL�<��y��t�R��.Rxn���f��P�A����Sҹ4��^��wv���kQ1q��g\0\"� �v!ޖKp.��k{Xg8�|T\'�@�[;q��vE���2X�pO��i�H�����:xȝ�i�7�~�t���|��z�Q t�jf�1��g9���Kk�J-A%j�)=g��LGT;�C�ij�rU���ZN,ܸ�����O��)[�T��w5\0�\\����K\'���}��\\<��\0E:��O@��ㄓ%�����4w�][�k����O��O�=�_��~���~��n�u[�!@ߺ5����y����ݑӍ8������w.P��rR�0Pf�7����\nY0��K���y��n:��-��9,�*���q��H%!�աg�Z�t�h7���E>�����M̢h��vO=�<���1�m݄$i�Fl���4e.�Q+/�)F�`|~��\n,1(q�s����!���/or�淾���ІV3˵��,~e�CY����n���ݹ�.p�<�h=K�6q����.c�j�X�� �ϪY<�o��֡��t��߼B=��$>ʔX�63X�P#$��&��9���Q6Ⱥf�ǌ-P�R�M�)B]T�~kZ� �p�@��~�w���]�О��;E����&�VzFÇ�X��];�*�/��të�4oX�0�ںwu�2��u����[Á�g�����p�	���\"@�-����V����B@�~0\"4�=l���p�\\-�S_��wm�hnN�=/��7oݚ:�2����MVIS!��e����P\\�_<g�8���s\'��-�W�p���Nm�����w��I�@\"c�)���@�u7��\0B����Q���ɸ�~8$��0�32o���l\0�?�s���g�8���x�Sa�R�L1��4�1�w���JꗹZF��Vջ|�0�us��{��}�[Ϻ�g��ʗQ�xY�0@�v��P��Y�8/�� Ҝf4mYE�\'���u7n뙝�2�g���pnf$����&�E�s�z��X0��B�ge����ٜ�P��������)�����s��9�\\�j�8��v�(��6����2�ît���,�N^����Țx��\'+���F��8s	~y�Qgh�]��릋2ݑ}/��p�4~0B`I��*�c �Nbi�֒/Kf�������qΝ:G��	�t�[�m/e�Y�/3�lh�45O!@���p��q�Μ�1ܜ�����p\'J�o����w�_y,3͝c�LRN�k�\\�;0��g�â�ڑ�g�e�p,�pcS�4�B��l�m����$x�=��e����H�gٞJ��ʂ�&�G���QQ!��b:�ɂ��t1�k*Y�$p���O���̓���h#��,u�Vc�1�2����u\\�/6���0�Bn;t\"S3��8c�T�u3���}�1�8k���?O����{�գ۩j�iD�%�{8ʻ���d�\\��e\0q(�K=�Jk��V�ʻ15�,Efy�V2���~˨2F�1�,,�v�n݉�tN,�������Sg �����z`��֮!w��R�����]Бxm�M7���vsc�6j����O<��;���0������*jॎ���ܒ5n��!ELt���.2k���H�sd��q;?߆�� ��_ ���n��0��y���/q����\'����z��|���Ϻ�3-@d��8�D]�>��MH B���[��\\3M\"睁�<W?S��ι���g�\0s�S+F;g���s�koa�oϐ�< �zc�䄑\"�,N��B�L�L����d񣜨#HɎ�^�o�;��<��W�u��{�i~+��Jn[K�n-3-��^s{q�b[��h\"�̠-��c��ip����b�U��-)���;��N��%N�8j5,�;�r�Ǡk`�����ٲ�t�]���[z�N|�Z���#pV��2X_�7��x�(��*D��iҶ��:����O������`����ϻ��z�͍����6r��	\"��uC/!�)ɦ�:��\0�l��{��e�F˛��,^�L����$&,�<i��)���m\0Jz�0��:ѯUpSƨ�ӂ��B%!�ͬ|7��S]�,6J��)2r?\n����%dL]�7���Yl]�T �\0�8AY��y�r��4��$�ݝh��\\�p��F��Y�q��A6��.��ܰ0��~ �ʺ��!3\\�◿,C��=�YJ�۶1in\'M:U\"�}���?�w�	.`%��%��o=�\\⮿��3?��1��S�`L�������bU�C������\\T\n�uN6���_v�8W;y�|���F2	�r|&p��`}���#�ɂ�ܗ���n���t��^J�\n(��9z!�+��&P����<@�)��C�BS���p���M�����:|��{�X��~������~��G�E>E��������kIC_������v=\0kp��3�Fc�|&.�}��c��X#DC�+�B%���s������|W�Z��p�<P,���������bl�H�rsdG�~R�Q*�X���Ǳ񮇠���<%9���]��\\E�*\\t/@�<JIq���[��C�7�Jf��Ӎ��iS�\nw��6=���|l�+���V��[�����a���g����o�t��;r���ͭQ\0f��%T�DQ�g��ٶ�|#�#�}CLƪ�;@y����a��ޛ*R+x���t!��=K֦g�J��!ǅ����%k�g0Ƃ��O����/����p_���hx� ˎi�Ί&����)��\0�?���+��Ni�d�dN�ܕ���1/Fz�]�~V�d��l����g��<����ԭ�\'H���DP�!�\"P��W��l�s]a?�����������G1�%��ݽ�v�%�>\'�����؝��F����AS_[���t\n=y�s�@}%��8Zo�v����Ӕ�l~\'є.\"e#�VژK=�8C4ZN5\\t!�o�޼��o�e�s\\�f��$j���\n��p�pQ~���7BU�7�u�����:4)T����P����\'�kg)P��N�f���)�c>�k�nk����}��93�P�Ϝ�ۚǀW��}�E3���mm��d�IwU�<k�\"��>HCD���&x�P��r-#��Q�r���T����^�&�`�0AB��V�{2�Q\"��\0��W+�k~��ɪ�26��|�C>���,�0�1�@U�:�5}�tƷ\"���\0��f.�GW �*���?������h��9��a2|28Em�6��:��e��J�޿G��~�s������p�v?����=���e[��{�#�de\0BO�����\n�f)�م,�5��l绾6)<\0��*� �]%ݮ��5�.^�5��1���:�~3Ǒ�-@	)+�1�������Kh����N�s����E�#�ϳS�d����c^�cC�{�G���基���sb�����>�;���m�����QR(�Z��2ͽ���F��a5S4�	*�ᄶAK:�����7�Qsu)���f��v)=�~���y���[O�]�3�P^5E<�=L��ZX�P��� �J���Hg,��[�x��g�ZO��A�����u�C�wx����ܺ*��|�`��}�ٍ�jY���a����N�`�v�:�<�e��tɫ���[ �o��`%���].Ү4�SB����Բ�J��]&,����w)%O:����߼�=��~�f��S�]��Z��p��h�w��~�F�+��H�$���0u�YN��_d����+qp����ԅSnB��:��)�q]�;��f!4����@��ʩ���u������ h*�mu%��S���-�M�a4�I�d���1��aڵ�6ܴcs�]K]�/����	<@F�Y��%\0��>!� j�����Y����2@�5�����Pp�%{�B�$gG�|3������69��x�2@&p�_�pb+����?G���]H˩IS1�o�FOń F�VTQB$�N#`i:�q��O���Kqڽ�1���i6�u��B�>J��\0��C�y:�ς�<��+�\\�F����8��4#µ��8ۧl�q�MY������P��Q;���>#E��7��ܨj�6�5 �NYBe��t�u�t0�p�NW.���Q� r���Ziag(�B�j���ܿ������/mp�������2�:����pop�\'�������b�[&��`\'nZ����(��]���q�b\n\'�� �6�g����%{%�8l4#�G:tFs( Hk��؄,��F�6\" �b![�g6�=�&�ic5��z�>?ey��0>7��\"�b��\0x7����s%�~>�~�Y����j�J?xw��\"pq�Ue�3O�������t��\nK����һRse����k��R	<�э��U�I\n��Y�Ӽ����5��l0,}H#��U�Ҳw��a�������w���_��im���M�����:��7����<����Aւ��p�����\'}�sU���\\�f�*���UB���M5�򏏓ݮ��2�Y���{i�A�b�\n݊�\n��_��\n$�� qt��.����&у������v�_��ݎ����������q{_?��LGNXh	��ᑺ�:��\n���Sӫl-&&*��f4���;�����ʾ���>u���7sf��6}f��*�%%�ĕ���b?ޕ\0��p���`uF��(>��6:�p�o���z����v3 ^Yٟ�j]�\0)�,�d��s&�Ʀv|��Aj���S+q@)����a��ԲlL/�p��B���^x�;��8��-n�@q�t�ـ���ز�������N(bޓ��}J�����59�֒l��p��y�ń��Q���4/�U�!g �k��NʇT�P)Pt«$�q��\n֙�RgG�۾s��u�\\bb����,�������O��gP|@?���CN�i6y�!��KÒK���D7W�A�)��W�X��d�*�5���Z�S��7�% S���fMdᅔ0�e.��}eV�Ռ\\-��%W \nz��3�x�if��ٌ���g�ylP~$_�)8����js#}��JL�b�O#������H��IJ�&��mG)2?�$�\'?º�C��0e_����b@2c�\\�o0:�SƱrJ2��6랦W�c?Վ�lІ�Ù�!/��A����\\Uޭ�>�!��CS��D�\\����_����A�G��4am�����C8��t�2�`���ޞ.S�!��ߜ��o��~����ޑe�օr)��m�ZP�+�,�IM��<�r��c��z6�f|t7�7��O%�#9�1Ru-���-#�)�;w��R��:�Q��!:�G��CS\0�{m�b���K|�A�|�A\"�T)T���Q�@y����ҋ�!,��iY:�g���]{�+p��)c����/h��w����GO �=8��^�%�q<ƨ��F�+�\\3�,/�u���_%#d���Un��Xa-���aJ؍��:B�����w\'�X43�dj��CA�8{�p��8a[�ɩ�^�~%��(��t�>Ɔg�^� `W�*Jc�@34�� �Er��Gn�ns\'���چ	���Ns�|\\ \0.(����U�X�2�qO��y�=�P��_��o2~��P�kcS���>�ڠ�}���ݷ�.��B�b�\nh�tq�WΌT��	��p@�3�L]��%�8�$f�R��\0�k����#���oS���|��&Df.���8%����b\"=+��P��ۉס�� O!�>�`x�hP�8N��.W���?6���N��(�|��M�h��>Kp��c�w�֕�p�!�֑	����,�q9�veH��v��Ì�UN2��P���0{z��j��*��\'����K�f��#�t�	��iO�c�P���g�;8˙�������>���w��A��Ⱦ����o�R�g!�X�XA���8�V/Ǧ~IX$����v�.�0~�����(d����_�T^n:�i��v�jE|Ns���d�W�1F*��$!��HT�Aw�KM�}���V\'�6kQ{d1�`=�߈��H��׭[Rn\\S=�s�������ښb\0�H̢��C�m���e�g���hP�*@��e�ϛ\"����W/�?��1ƕ\"���_�o+_�6{���_\0lm����rq���X�<�)��Q���R.�\'T��\"/\0zg�G�5��f>6_�fUP�`�GZ�s�\"��q/�;��A��.���@�%�[:v𣆓eSzȲh=oj\0<������4h�Lۊ1Н&�sO>�\"h$ۊcwt�u�v����c.���G������X�a���ۯ��U�fI-�v�b��n�� �p2-+}����(ӕ�P/>|���!w�@�p���^��R�~�w�r��ݳ���E\'�P�R�}�9	��MB&��r{h�i}Z2ƒL�����꺢���}�!!�ɯl��5��K�!����c�NɒԍӐ�\"x�$k���Y�O�Eϔ��ϯ#��%�7��l^�fa�ԩl�Iw|Ϭ��O�`�[�ixd��y���}d�\0���p�V3����A#��`zՙ�W����s��`����ĕ�b�7x��4t�.1h����t�O<>m#.ׯ[�7L���1�\"�2<i�����c#_b�V/3/#HPmg����Z�~�I����f�lp��[�A�9��нvC�z�_q���}�U�	��r�k_���Ї�O�O�,N\\#s;��,��Ǧ�E��gq\0� d��-ܮ�;��^w	��[�ݛ���v�9���46�1+ٻLXE)�!@ط��2JB�`����u���Y=�+0����C�ۇH;4�W���\nL\\�{�Տ_��j0�hQ@@�7�\"��yUi�Bo��CoM�O����+L�T�Ap.����t70�$���m@DSC�+ͭ�2	�Y�ޕO�J�?wbr�2�?����EQR����7z��Ҥ4�+F��Ŗ�#��@^u��-�$�.\0�W]�M�t�-�	~U]��>q��,���~�Ps��U � �	~�C�@z�����Vȶ��՚m� ����	I+:A�4H�7me�۸���K�0�6༞S~������*Z���bn��e�������x�\0��4v�$JFT[S���{qt�q_��?�܌hi8r�\n���b�I|��%���҂�����P����5�1�fZ�5)�Z\04u�0:up=�A3aP��{�;o�2�-�ֺ��6�b]����H��8�A{&�����xm���v�hy-�0���Jx��ӕeU�\n��Al��!��~A�i��Z��g�I��n�I/� %�6��mڰ	sv�o�y�0����d�Y4F��)B��&�`,\'n9���պ����F�����}	���A����n�i��n�Z�wtv�FR)Z�۲ɕfci�~����X�:5*��r-�S�a���s��0���n��v�K��s�?��?f����#~��1}��3�Y���A�m��m[����)3��PJj���W-��pp�&�r˄�A��4:6����Q�L��H�YW�Z�p�x�r�Q�p,��q�-eM�R�ܸi�[%^�R2/%Y���¡6q>X�,������~��$�����Q�N��٠#ux52P��:$]M��&��{��hm��/�$N�ホ3O)�y�Mͽn~3�����Lfǽ+Q�?��pa�bp���ޅP��Ҿ�y������eN�+�NR�~u!�4Z29\"Q>tވCm.l��:����!_o�j�8eL��d#��)��3.�t�4���#�F��YĠ�u�58*ou���]L|3p��r�H̡�������h�����������@v�>s8@��]�����lƹ����S`KX�h�0e��V��Y��T����Ї(���_x�9|�U��,��3כn/t�����oq%�@��h|V��70=8�>>�%\\�~�N�T);pJ���I���p���I�7��m(^=]l3��nfz����*��cM#�����p�D��F�U6HF4nY���T\"�75\"\\�Ŗ3܎�VfC��W��ѹ�F��B�YŬaϭ��]��i�:?:0�%�ұ�{�������E���#�y]5�Q�P��P���H�\\m�rx�0�ʚr��nq2ȁ�q�Hdc��@\'ˀ6�C��A�����XY���.7��&<����3���>��s�����X���!�m|e�{\\�(U�����r?���n��8df����[gƨm�#�?�嬪$hq�0�49ZYy!�4=���f<�\0�=K�=��D��?�&g %-\0+�&�K��-�V`�5���k�2]cW�[�:��\\.K��،=?M\n?^19�@(a�$F���lj�~T/��G�Q`� c	$���*=I��CZ{s0�}d�aH����4�Z[{�C�ܫQquw?T��+�sx׮?y�<=\0RC�OM���Ţ���4YD��s	PQ�2sԻx�R�\'H2\0�bS��\n\'�G�;)��JHz���U����3�S>HO0\n�E���h���ۊs�F��TXgₑ���r*�x~���c�M�熭^�ܣ��D�x�s=Ò�:��k\n�PbtU9��08����~��3O@��\\-��lF����8܏#�Pw2Q���d����{�q/�`��i�~�������l� ٢��׫���A]M>T�ڵ��Z�o|N��䐑-\0)Q5�f�#W���(Y:�B]{�E6�Bd�=��G����(Vw[��?���0�ף�Bn��-�oM?5>�cR�@���a�&DM�R֔z<YV��b;��.1#l�ȗ��H	�#�M�c�c��W�\"Syp`�)�׈�n�ǔ�c�@�?Ff����K\nM)�~��^Lɟ��ړF&*zu������	fPs�^���\07���พ���F94��9d��=/���~�۴�!���9��RȌ+X[�X����j��_��u��X��N�uј2�U��`KU5j�1E��U��,�ڴi�oq�W(��ڝFޗ��z��\0�d�\'�k��?\"�a�����#8A>�sPb�qܝ�S��B�IE��	[׬=ͺ�W�K��V����( \'1�oyl� �#=Tk�8�����G�es�-��{`OÁ���c���}9>��\'&��dH�1=(��?.�O{�s��?O��?��,ڳ��r��W�!����k�#1.O?N\'aZ~��:^��5�m�IC�4��\"�J�R?�eC�Lhe�ņ5��:�Y�*\'&E�I%��`J����9~9��p}��t梒D��TcņO�\'��ȸH�ɬ� _W���{�]��&s)��X�f��|s���C���>��uIZYe4Ð���3�e����4��{��`�?�5��Q�BT���m���x~\\Ł�6���!�d\"���*f�1�2��PDI����A�9���� �r���xť�FQ���T	1��@���ȭ�\\Q�M\0>�ۈ��d�е��8IWY����\0���L���Ffct���@#*g����i5�X��\"^���5��5Cr^�r��tT�����9�D��/]�<�*�LI�߰�Ә�8��$b��ǂ�k�EbWUG9��B���fI߇u�R���c��o�^����`0��nӺ��λk<�H~?���,hSs\"L���� <6N��g]���O�&��?&�E�qIG�\0�m�ͻ�~��*��\0<���XU�b�}��Z��>N���n�\"p)_}�Q�RSk��2lr˙/�_/&Ƅ�I5/�	��ֿ��:�Yo&��X?�`G��}l��$���vS��˔7���ѓ��q	�#�5����+\0&�¢�\n�^��U�*T��ݿ�� 3ӗZ̬�n&L-+��gWd�$���<f�W��C��n�C�<���*u���--%��\"=�Tu�ة��0��4�0ߛd�U���7cj�՗�-��rW�0����xÙ�#�HuaBl2�+��6���ӧ��,l�fϢ�&�`�Ka\0�߽��>�2�ɠ��Qp*�@��gʯ2�Y����a�����v?��m\\�ŝ9r������z������ȡfu�����d��Z�Y6ܹ�)ܳ���F0o�D�L\'��X����<�f�̖c�|*�X��qL�F��f8HƐc3�\'�M�l�i�WLW}sѬ]K�����	��al��pk�&�m�����.����e����ӌ�$�/p(��G���ꂠ{Y���0�\\%�@&�z~��J�i�$\\���|���p�2����kǚܩ�d~hH�� U$�����P���As�\"�2��O1&3���)�#Ź��\"sı��x�O�YЀ�$ɇ�&�)�)��Hg0����@#\'D$SF��n��*�Kp-g�ƍ��Ӕ��X�#wd��?}�q&zE��Ȕ�^N�k�E����0��E���&͟������a���\'ɟF����~���!���ɼ�)��������˪}��|�1��+\'ݣO�w�Ju�\\;\\�nW�V�J#��t{��f|P���bZƷ���٬�4��0�w\0Τ��tݥ#�J���Y~�l���F���O�g�Y��W�n`���Vb(\\��`0��`b̤u�\\�.\\Xx\"Yp-NP��Y�^�ǎ۽��FK|���)N�	��\0U��!07��X�`��G�1������@�����(�i��9��aj՞�r�s*1|��L]WR\n�ᕴ�K�	��.qv��������(HW�dy��\n{S=�b	c�9�����%b�7�\'�L$c�l8m��#t��0�`�k���X��{�{���iՋ{)s�!x�q+����-nϑt�Rٚ9e\nܶt\n��9*w��7�Pއ�=���.���~,��s	��D���!\"���,������H�lh28�{#-�zD�w��QW�;J氰�TH��#�԰Tʪ�2G�=�M�J��\\�+�P���1$[d\"T�lZ�nX���Z_��0BRfTc8����+�C�a�b:�,Y��`&��LQՠ�X�3Z0�hïO;��)�ˌ2L�s��>q�E����D=�QF͋!:��� [�!Ci���	7�y�?����1�8�L���%�뚦�WN!?a� �B��벋���f*�,(%Z��tR�{�-7��e:`�������~\0�\nywaQZ�Bh�`0�:�%s���LW��)k.\"6}�/��۲����\nа��� �_�\nk��n�ڕdr���C����N���h�e��c4����B������!\"�/Ȏ����Vx{��i�\'mG^�o8�W�[��mD�/���s��څ���1Ȅ	w���I�yh�aLp�C�ȼo����8_��\\���X�\0h΍��Pȟ~`G#��f�q�Y��g��?�H*��BH�j]��=�x ���{25S�)�n%��+��*��������Y�߷���:ĮC�L���OY֣ ���dX��Oug��k��un\0G�¢\\f����o�J�\nܱcG)}������>�ܪ5%����L����#���<DVsC��=���yW��5�*]aIs��Cd��}\nF�S�$�|�N��e�� .������Ƚ*P�ԓY0���J�#l~F b�T[��,����L �ۜMZ�Y^\n�m�i}�`t#�P�z%��u�W�$����G=+G�>;�&�~\n`���l ��]4�7�F�\'2hw��Q���-Ï\0�OB�0�%���P%���\nG��5��M�[�q9�!�0M(�l���e�ܰ��iI*�*D���pV���*B:�ta<f�h�|�I���r\"� ]z�KdOq����2h2BW:~�/0kE}�g_x�-Y�!1�%�O�^t��D��`���R�J�Hz\\a�z��L���T����@�w�J���w����F�M��xvqX�ѥ>�j���]�xI��1���C���Dʠ.��r)�J�%��x����g��$��t]��$�ԉI��h�����������ۢi�G�#������7\0���c#U�\'�C�\0�Hxb�hVɸf�h{�>ǻ(�G���;�C��ޒ0�ߞ͓6��ȓL����E����r۴�|�_Z���V,[i�����8�[؈p�V���M)?���<vF}L�h>l���f�>h٨�+`���IJ�l����t�m�͚H��طM�<���V�w��~�k�0\n��%���R�9����T��9�Fz�\0�9C�1�\\QZ�V0�|I��zC�1�gxݓ.׏t�,��Rߋ�$E+��G9Y��?�[ϺW�i����q\0\0\0IDAT�h%a��<5}��X�.m&�A�� �,ApN�Z��V~��#M�PU����������0�wu�M\\#3�$���l��o�&J�\n�f-�i:��/��_�2�9=HW>�������ʌF�2_��<C	x6c�H�R���g�\'��G��0w��O�P��C3Y�L&������Ǹiz.�V��+�@�G�(ԁc~{�<.�6+L� z� �(\'N�e��L�]�����b|�L�{�C�g��zgT�IJ�ծ~���Q�A�1<m3��t2�Z�aY����@���1�(��s�l�f\\+_�ix:xk�t�vUxڰ�>^�3ї����\"!�7L��I�4������˫�Ƣ2��	�ST5�����L����klJx^��a�W��G�Oв��pz?�@��tc�Kq�	�E�9��`	������ �?���6��]����<�Ph���^�Ћ`�8+x��n6.���Ю�끮W}?�om|I�=\'ۨ#̏�R��Xj���V6h������.V./�d��Ҩ���f2���~&V�P��s��ki��R�OR6H�QN\0�k�p$W$P�ro�Ʋb�J6�E��U���0p8�ʠt2���?�iGC�����wi��Q�`]�A�J�TpO�_�t,S��S�*��M�]-<�l���$AWC��T��P�4��KAX����W���a9�}�����̝F��$�?���\nt��c�s�i��j��ėt^VF*%S6X���W\\��l�u�U��se�N�L�py���g.1�!�����;��ݰs=K�{Z���+63��\"~�yz��K\'�ƖR�\0k�O0�}� ��S*�F�C����6�;��l��$C��YT?\nv��(�I(M�`c�u8��3�A\"����u�w��e�ѭARA�뾄�	n_\0\\3�2X�^0RW�Ix9���ܡç�6!G��8xT�\'f���>�J���:�����:�g.4�V�gp;V�U�K�U���\n����x����2����9�5d�y�T�m.:y�{I1�<�.��+�Z��o�?؍b&�1�E��*JƧ}�TY���-���i/&&��u�XG�z\"oCk���5������_Hc�c0��$;ao��Z�Y�pa:03Mۗ�E�\\�	�ΉX�B�: lSD\\}�\\���.�\\��I�@!��S	\'�+ULtQO��:u�;\']\'7�o9���\0eB)!z��N%lh�����f�9���	�.�!�\nN�r(*�N�rǰI�[�ކ�<��-(�8U��6����?Na��އ`�Sq��ɧ��Β�ƹ��]b2j��,��s�-�\0�h.��6�d*�ēL�R|��%HY~���7!�J#�M���q���c���[1��ʹ�N�����ף��Шs3�`Q���.lT���#�ɤ�#�.@�]x�	��.�����	:��{�x{��K�fs�!ʩ�/˰�`z�+��D�>y�$z�&�*J����������np�g���� itJ���LT�,gt%����8���Q�pd��A��������v6�i2�붭!��&�,r��\'�\n�!���L�p֡�1�\0y7��g�\'�\'O�a�7+�n:�:�^N���ڠte�2G���y����s��W��ָ��\"\'���O��&��k0s��ﺏ5����i���Rбm��ڰWE������o�7P�Uk�-\'�t�x����a2x�?؁	3΀�����`���aC�G�p��8��������PT*QY��3��S�GG����v�\'�&�i�,�)�-��*O�����u;q����Gó���hv�3�\'|��?Yt��������s3\0��p�D15�B����<5c�k=�\\��7�Z�����ڛ�+��\0sɻT���&��?I�y�]n��2�qq����9�/��E�+���RD�,Ȉ��|��I��0��Ep�Bc	Φ۷�$/Y2(�N�I8s�5+�K�D�p���	�P�;\0M�\0[���Q��~������i����Ac�FQ%�O���SY��	�����Ԟa:�4fY\\�J@�a96	y8L�&��RY�6�H�(XP>����Q2B�8�L��gȪDYH�ʠ�n����2u��r�g���h�d�$�\0��⒋�![�ͫ����K�t��F&m�⽭��|߃7�J��^3����W^�̭۴�n�;x�5�2�\'�Fx�7`�� ؃Z��R��:�o���:p0�o��B��}�Z��ad1�/�}&�{�F9���qY���`���(vtc�%�M�[��9�%����s`�����)z\'V����������72�s�n�����v��ڨ�� [Я��w�=��-Tܮ�o��3NW��ٳ�����ڥ4�G�A��a�8��_�:��7�4����NΝ(��Z{�ah3��\n\\�s�_~�j`�\0bD\n��p>\'�p��HӠy�GI���n�y���U���Gr�Z�0������g�\0�DB\"µǙ����X�|؏�/2\'R���E},f!z��8\\��0�nR�%�D�������M�/Y_)s�x�5���9q�о��YW�RG�*�=���K�Mv�V�gs$2�����=�}�}��~��\\]S�*���������k_�,��k���l���*t���s�����ϷN�HE�-T��F������SRWX��x���N�����4�ZqB�\'����Ԏ�S�O�5>�[T��q�V�}jB�(<B���09��ĵI��8Y�ap,�)t����,����(,K]G���_N�����n2��S騟!6(#��j�v)���d=���,w5N����M�M����A�\n�%�;Ȧ�y���LR�Py�?D��c�]ݫ�� u#�7ܸ�n53��Z�ӌޫ5DXos�+s�u ��dk4K������E7Q��LPM�$%F������}�}n��($\ni�\0GhgZ @6�M�b%���މ0j��>�5�gÖ�H�ȼ�?���<����2#�	��i\0��f�]�ĝ���p��Ox�r�o�F��c`�j�(�����3�jW��<8n<��U�Ӏ|¼oQ�T�N�a�Z�p�F�QT �$6Z#���U\n��`(X�EY�{����-�<~վfՐU�0�\"l�{�,������h�� Ի�X�\0H\n��)`zZFIIA��5g[�������u�H^�߫1�s����$�wr�&?{zWa��~��O% �����Ot�2fvd¯��+�˩	[��m���UeA�[\n��-�������*+�!^{��#�:��\"��e[�<�l��`S8=��ܟ��q���O�Mֳ�>�++��u�n�I\'7�}�gɌ�a	���������Z�b������I�8Yl��C�N��ni\0�������2�y6y+J騠��i�u��	!9���i��<�h�@����H4BcB���\n���1�.{�&�J>]�	���t�+�`��/|�}�[L���\'�Z��`WQ^i�Z%�\\w�m8w;�qnN!*��isǎ�\"cY��To�ѱ!��Q�dl���13%:��ҽ�s�0KI�9D���`��*x≧��5`�U����,���VkF�NB���s�nymi�5��\0T��\"�CNX��s���\nH�`s`oz���W벟K>�՗�G��5>4�[iH���^���Y�y,�0��D~7|WVo� �K�n�\"��P���CZ�`�5RS]��pЖE��4��1��Qz��5\'ⴆb�S����0r�J?彚!�������T�5����mhY���y�/���[S��n��ɛ>D�I4ܒ�4�Q��u��zi$pK(�Z�//#��-�%zߋ/\0�灙���f�s*���aX�c��D3IdsWN�wx�������ʯ�Che�`�.fX]DS�����4������3�.�P*gM��g#ll}]�8���Z���R\n��Y6�.��y=bdCS�p�<�t�,0�3�8�m��@���V��f�������TH%���d*f�\\�Q�Ű�Ő2P��@�C@٨����ƭM6�����>e�e����R������T��D�I%cd��Y��&�T����21�Y��Jt��S����Y��f�y�����p�M�Ɉ\\�����g�z{�-f����������	����qS�����,��76�K�aV��92LW�mL���#o>6�>�0S�\'��8�[\n�RAa1�OeǼ9	�+EJ٣01�q�^�	����AW^��6��,F�\n��m��r��Wc�W�F[]\0!�m-\\�0���I��=�oSʢ����\\�V�k9�g����t}����6��R�h�r�hFP��/�o�	���G*?�*Wo��i��/%^�Uٜ~�9�Q_�G�{<�I&�_̐	�±I�6QQgE��9�,��ŋMW���	��_~��ik�w4��C���cr�4�T�¼٤+���L���,{�������=��C�n���\0�����NI�^髊03�\'C���R̢r�4�m�G6Bt�; C��eh�G@��k��*ޟ��LRc��3!��0��bS�_/�n������Ԇ��K���fS�q�׻�#����ҌZ� Q��6&A�K��_�6�\0�h�W�\0(!:�b���k�T.��]/��ҵ�y��=��Q	x�ԧ�UٛJ��d\'�(��w�l���kW�5K�1��MC��ǂ[Y>�4��ܽk�I)�l��!)����Ƀ{im:�%t0������|`��P%��n�\n\\c���\0�[\\1ʋ�˹�ȭ���z��>E	*i�<\'�I� �7R7�o��q��2�H��nk��R_�!�FCPE�zU��q<��Z/R��2��g�ٷ�>(F����h�qZ��:����v�:�v�*{~e�/A�okM����ړaF&k͂�P��V�ײ	��p��,�1(0��n� \0}��LWO�&�[�NbA]9O�4`AizyF���a��u�߈��{y˿�ϟ���a�P���=E�`�8.Jc�c�����������X�({�����s\'j�,�K%1�=�Y�<���AuS�L\\�d���9e~�x��P\0ł<�`�d��<��axyG8�p}R\'�m��^��eP��Ki�[�~6��.�����@Q��F����<�IC�.-X�/�|U롋��0��<���m��S��%*�;x�5#�N�m۾�:�,����Wy(��4��A�[�R�$?����D`I�t-��U��^%�ie0����\nY��(X،�`A���R�>��R�����->�uЖ0�i�u2�}O�-[���G�#��9qH���M�L��?D�Z��ڵ��yS��I���Ixq���k[���::�eȅ���F¾�ܘ$ۖ�a��e�1(k���f<p�F���с+���4T+v�3��E�g��Z����%������g]�A2Z�J$��:;F�yq�љ\'[mn�u��.z﷯��f�3��*�S�XZ���I&�]�(	��v�ܪMl�Yq��e����a�O�+]�K�G�����v�ϝ=\nꚌXŁ�p!�S���^j�:���p4�֙%s�L�<2��>k���Ɇ���hL�Q��y�$�VO���W��^M��7���Ͻ50&�}���\\J��3���3�!�s�\0ݹ�=	������޶}sv_�P���ـJ��1͚�\n�������kE`k�\'.������D���d����^	�=?�<ld��-ư���ad��\'ؽ��3��=n���M�²g�xz��)�Z���Kp�Un׮]F�9v�{��(��13��!%`������v���d�k��]]v�{����uV6�}���!Yj�^�uֆ�k�N��=���+ٟ�������V�2�?�;K���jvEQ�J�DM����o&\\����3�K7�2PY�����d��\0�K	Bv:����YL!ԛB�/�d�G�\'Z���hw`��ЃN��Hc�3��ir�&%~�-�̅�.]\\)D�(�oر��b�w��۝9q�\\�	�ʦ�5,�/O�F�ue�SL?�@Ƶv�RW�\n�-4���Ҧ���N�{�d�FГ	�%h�� �g��3W:�^�URRNN�y�b\0�^�Ҝ��b��\0��o�e�r�>w�u��r��R�K�.�:\\:W\0���=��w�C�F\0�7�qm�R��Q���p=��kk�-i�YR9��KXj֩��cǎL���~���ٵb[V��-_Q�|N�u�CA0@�����B$��ش��MF�R�PΤ�Q�A�8DTU��]y-�DC�J`�V������˫���pfB9�� �I��0�wv��pFF��0	,j\\�\0�I�5>6�!Ǟ�쨎��j)�����T�A�q����松)S4��ա�\n������$]�Y�����s]?~ӎ-�X=h��㮃�q�����*��z�:��F�\0�A%���Z�X�Ü^�P2j������̵����)��J:s]!.�\0ʶk��=�/jI�3yn���Y�BF��g�ڢS�`-�̹�1���92$V���[��tV��:j��	 匴���-@;R,�ADg����k��dS�԰A�q9��uGx�X	�����dM�dr�m��Ϟ6����|�_�9j�/�m��f�DnՇ�Lw[�ZL��{Aʳ~����l^��	�Ű����s`1� ���(�,p��%f�?�a4�5��E7�����Vk���C0\0����@�Y��Cx&w��?wg�dd2��{���\0�M�2��r�Q�S��� /�,H@ҶY���y���<g��1v�[�ZX�V�(���c����_@y�!�]�����&s�>��a��k\\�uۼi..y�Ξv��`5��8�j��\'��\0Ö�h׬����gP�AJI�b�R���!k7[z9�$ᓷn2�@���V�hJb�W�k�US���&�m�(\\�|�`oNPR�OM�3���1����E~,Z\0$�dF��QQ�a#��SG�C}m.+��,��A]�k���	��\\p���7W�ߜ�\n#���a9�#���?���].�d-ɟeB�W��P��b#��]�xZ\n�9+VAo��٨if��t졤ij�l^t�{��HI|��\"�ś�5�LP�3Ӳ����(���Y�J�e{�g]�Dh�J_�������}6V۱�P^n	�L�g�>1?D�����dxx�����+��qׁke2�409�aȶ\'.�=�k�-�;�0Ͼ\0��(ʄ44� �HږV����(�4��%ܣ2�	��3d�lx��a�(�(睋Mg-x�.D3��U��D\0���$	����A\'R��̣���\0��n݆�����Mfs/���Ve[\"����>m�n��g4�E�SJ\'��3@S��`wܴ���R#�˫Q�l͹�i�J��5�?��14+�v\0{���$�1F�ٱm�&w�-73����mZA]J�v ���QR\'��Ek�+R�z�ҥ\'�p����0I50��(�%i����@B��$�w��Y�IГ�y��k��sv�vߵ���o��Ɲ��R���yNB��\\t�4�0��e�Ǜr�����E	�����\'�þ�,]�Y��Mͱ�	җ��Γ>~�\0h5�}H�~�1`7ͳe�BA.a�����������F��߰0������(͚����X��A�0*)ˢ�3Y�l�d�?��K��I#�˰]\'簐E����W{�@� ���;����w��`�~��Ԍ��+���k}�{Ŕ�Y�;�2�Z,��g���Dg� )+�Ǫ��a?f^I�ӉԢ����Dv�gUƤ�����r�B\"�J��\0K4k3ɠ�	��vLKơ�6SaR�L��!�%&O���Y�^��AN�J&�ɰU���@������X�s4GV�5>	G.�U��pm0��F��VW��:<c����ۤ�K�cj�$2��\0*�=B�=��隙8#!��h>A+���o���@�ix.����[�pj�c98(�j�Y5fԠ����#��3/��^�?ٷ�Z�H�c=H2in׸IE�Y��?�0��ȄP�H�)�k6yr�z(���%�E�E��;\n���K|������.����N�Y0�&�ɻ�W����Γ������؁5���	׊:Z�W8*	�)5=l��UjR��[�k�(%p��+@t�0��Z O���d���^_<�m[�+���h�;��Z���2l�)�����D���L��&�Id0?�3J�L�\"SN+�x��M(/K��	��h���o4i9��i��D�|��P&(�d�d�S�������{�S�_�s��&������y]N�U��ڗ��W-�y?�ҋ��-�	��w�-�NfV��d�0;Ut!���ڳ(�T\'Z�0ٟ��T/��=J�!���N�t7#�ua�lu�������և���2�[�O�^\0��$F��=��<\'P�|�,�t�_�B�͗��o(�w%/ep����Ĵ��x?3�T#�R��	<:�9�Jo�����c��uNS����0����^r�߳��͢zxsV^/c.�{��!V�g����-ǉ�a�]|=���k�&W�F���a����4��}��p5+�#1\n�A2o9�hL�J�0��A2��z}��vz/R\n���G�N�_�Z`b\0�uَy�M���&���)_�=�Y\0����\ne��9:�� ��,p=���S��Ii���F����TkPO��F��Y�fT��8���X�45aJ���t�	�\"V��*S�$ib(r���Y�^r���#�2�J����$Bcx��������J1|�v���j<M��S����9Hs	jʐ���pW��ڽ�~x�q�E�\0I\0R&�q&����B&Z>,�Q��t�(p�a����k^���I����G����FL׷3��¯�p����]M���̤Bp����͌ۺu+$Y�E�5�0v!�J#���<��_�\0�N]��c�5\"�$�c%UU���L�`&I�;}�\"�5�P�{e�rY��[	V�����a�37�m�-h��HI�\"�W2��V���}i�%߹���Z��N������Yw/Q��kI*D����{�ė�+G��ZO9\"\"�Ta\"\\�,dY�t��HvSFN�?�j�g�_���@�zhl��aI���nY�6 ��8$�(x�y�^�|<�Q:��4�	Q~n�!>�l�c>PU]��F�m.(�\"i���0@��N�h*������`l�nM���0�9e��\'�rt~a9�j\\���(I���ͫO챆(��5�V�_eY�n	�[��^� 0��:q�YVnnB��;���g��^J�_UQ�jJ}���r#��́e:�<��Y����=����Ӭ�\n�7��S��F�ԭ��E]�}4۳]�����I�ra9g�� ��\03y��wd{����eF����ƸVG��\"�b����VZk��:L,���r�������W�C\nX�0��(M�(�GHH�\n���e���r�Y���@IDSRdvT�d|b��QV�h�뀉�,�q��w�����ڻ�>�V�}�OC@�uiw�fYȁ׏�4�\"py�n� �v�k��O�,1���ydl���0_cؒ���e��OE2��\\u9wms���\'�B}ic�ft���5l6FS����$��������ϣ��B3�R�n�$�3P���Xho����V��=���˘��VA֌lg�qᮕA{X���_y��W#eV~�t�R�)�����H�����&�M!��Zdp?A��>,�N�S|h��;w���8MFs��)�2�`&2�8��S�.^j3��(�������m��YM�r�`غ��Z*��(`�M-P]L��,.�稩^��U�q&+[��aY�l�}����uy�n��|����i��K+��Z��d7Ӎ��|آ�N��U��z��*7�0y�c!A7���y���q��n��������畣>�M���|�zt���\\6gg���Ng���5z���4jD�yH`��M��n�����)W\0�E#�����\\�;������%)8��~܇�n�5 ��}��?���r?՟UN�$�H��\nJ��E~,N\0���X.�X���ir=��)�P3�b7��O�������2�a�x^`r�dI-����8e@��{>��L���vw���g�kX])\0J~%�TD�	y:ξ��In��Uk� Jݫ��rY�EX�gd܋/�6\'��Q��1��+|�\\�/hȌ���+W�Q�g�^��z���U��A���MvH��4U���qW�8(7l�%���$\\��zе���kT2W«5�o(F��R#��q�,B�3��RR�8����]���T5nq�����5mAe�z�j�����h亞�ZL0�gY�r��]?�5\'����s��L�������ƛV\0]�Xnxi:N�3dN��Q��58���r�:w�*	H�\nt�$���S�����\0}��q�������,�C��s6A��<f�4���荔R3}^4An��W]U�R{��/l��D��1�N#�c��n\0�-ƃ�_qY;S�׻�h�Ocw=��lX��ڴ��t�hT��v�� �7Qo�[�M���V2�<�ݵn�����8�L�I\"�/9��6�̔�qA�/Њ�f8����E\'ד7Kf�Z�)rE\"�����=2>:�s�����ĀH��X�\0�05�NO����	�Vx�Z�\\�9�.��B7��XÏ������Kiv��w���ՔQAf���\"[v�(�-ܯ�n�{̵��ً���3�����5��u���&�C�z�w�S�2Xz��\"��n&�%>v�!��U����7\\�,��m��+յ����~̦xe�>w�>��m0��h:�d5r2�B��n�>\'쿥\0y�0�:L.b�Z���q�$�_2k�2@�y�߿�ګ��5��#av���\"��#�jﺡ�]��\'^s�3РN�efB��}<F�O�M�T&���g��VL@��:ڄꣃ��(@�˷ί2���b�����m�n7��C�à*i���Nɞ�ѧye�<hP@��\\i�O��	�S@P�#-��`���Z�5A�0g�뷾�΅GW�(N&�<�iݞ<:�r�W\0���=��q����5��3F�u�P��Oכ�P�U�y�M&��P��NF0��� ���U)d��m��$=å���9�4�6�{u���o�%5dǁ6lZ�X���јI�d��[f	�^�Q�����~7%׍ց�z�_��5X�!~B���\0�8������!�^��8���UIA��9:�)p�2ٛ8?�����u����ܟ��a��_�q!��Ç\"0�1a��K�_�b���l�O�14��8D��)IW�5�w��/c����EV̢L�+�ߕ)B#�U�S-_��R9�x[���W-[CMd��REʊR�Q��L��5�q�=I�����%�6F�.k��BGA_{x K�M�t��H�#�^)��t�\0��\"��6�No^膯T��E�FV�iDm���f�DJ��%���A� ��`�M�;ͦ�����	2�B�&Jm�&S~A���ɗȂ��D ����hN�A$�}��f994\'���!S ;*�����ll66a�e1��*L�J^e�R�$�>2���\0i\\\'..��	���6��2[�PJ��\"���O�˔��]�W�L�Gْ	�QY���]/�Y��2N��gfb�Ӥr�~x�ݮ��\\��+yvbY5��Wǖ:2�JJ��Xk��l�	�.�^�٢���K�)�y��EA�~H��5*���}�<`ΰ�ĺy�\0��\0\0�͇���O��?	�1E��g�e�g���s���U?Yv�c��E	�,6��)*Wt����̞��]�[���[z<@-ҟ�N�4��\\�z)���E!�M SQ-d6��h��I@>��ijM��ד���BX�!+�+�c�����UY\"��R�Iq�ٖ�0���ڝ#�E�^�.��N\'��&e�DA:UTJ��A�K݉�!w��i��\"�P���	��\\�\nwK�7��M�xo`���L�z�Z�`��G��7�]��DI�r�g��9庐�u1酪�C!�E�����,�&�1���,�R���Kh� R4~�Gs��n�*��Y��SXq�XR=O������l�DC���3@JÃ���faA3�5����F�$����!lay��L#�:AΖ�� ���{^uk�q�!-\\�rX��R����jj�\"��{+3e�F��CW<K�T?2`��8�N���Z�it|��Z�[��U����D��)��c�����b�!�������1����+�>��Ձ,�+F�v���Dw���3�z;���o��,LJ(ߥpV�;�D�5*�����;�dڙ[�&Ȣ�`�g���h\'���6�V��?�O\"\\��|������%�°�h听���\'+e��N��$�ִ4aw�pө �@KK��p��EϯlF��Ì\\�HU�ʁ���F�%����ǰQX�ʸ�X,�R�L`\nCRI�F{QT�z�.�Մ�H��Y^I��$��(�`f��M�v��X�7����Y� v���9Z�#J���b��栚Q�;J�S�NH@�3>M\0�R��,�Jx�F�E�F����5f��;ü��N�]^�S<\n�m��D��5)���9.%H�*�%V�f3*��H%����^�{�{�x(e|��G�2N A\"L�5������^X��!I\\5A�T#,Mc$cӸ���\"+7e��ζF�JN�$��}N�Ȳ�\'��i���z��C��!\'\n��j�=&��빧pm6CZ��u*y�`�ZѴ<���4CY��G]C�Ut-�|�\\$��dƿ�%ob�&6��~!���)�J�U�7�L>��Դ���ht2�3EX͆T�F#�42d������4��8Z�����d&�t�x�E{�?�[��x��)ڄ7E��L�.��Mxê�����NR���m��OxK��j�C�,�Z�.hvs�m,��@�N���=FT�)���_���fh {�k�+z�}��Aj�Ì+B��f�#f���p��_��~�ӿ���Kp�#��_����@�S�L�9t��e��#K.�&O���*�kc꿍H˦Rp�\\L-i+Հ��G23�i���tM�6R]YUއ�y�n��2ך�5��v�!8k՚��@�����h�ի��c���c�y�\0���IӰ��T!6;^�B���Z�*ϛ0�<���Wo��23�]\n=���殈����iB��9��$�����E��pv�.0���CP%����&����/���\'�s��B�,�,�2܅��s����� ��5�k��!]�hk��|tu�`��ef8��ukV�VƠ�R���p8�Pj6y.�L.����wM	Ԉ]�/��V%x��Ln�;P��,��I�=��<a�����>�A�	&p��1�k�q&�w���?s��#��5��qo�=	���\np��%�	]V���?/J	�p��7�	��.�݉`�(6�q�4-��L�\'���\"�\'t��W�i��Z���2=e%C�-1�I\\X�1���f���$F/)J�Ӽ�Y�R&�u�N���č�d5\\I���x�1����	���������9n��l�����An(���5�[ >�ۚଵ�뷮�Vj����\'�����GNB\'��9�+,B\"!:�5��W�(���2ǿQe�o��A��CAN6*?�ɧ �aJ#d�2�գ����c�e�$�~pTa>E�}�I7�a@ʸI,Qj�k�y��>e<�=���icq\0(�ɢ�4IC���u��,hk��W�(K(Hƀ�^�CH��9>�4;Jܑ��0�_6P��9������RF��1 ��D?*\"��,�0���B�j8�Ȕ69���\\m=såR�=\"}p]u9�^���y�L�����x���2�͡�����2Q�VA�W�j���f\\C�Hd�Շ�N�HPEs�#n��&����\n!��~Z��������Si���C����AP�A�ħ�_�O�46H	DO1=/�O�e�t�wzy7JLtO�h#�����d��e~���3��R:p%��ϝ���_�[256,�%5���{w�`DvVFu��q�Wkܭ���������}����A�R�ѳjmrO>������&�4P#��Ġ��܋\0��jt�O@9���r����`����K{\\ñW��I���tSø�9��&\nȘ@6bdIf,I���٭��:�9���G!osU*�1wd6]��f���Iv˚��;���n��$35��n�ʕf\"��ǿ�z\0�U6�?�����rp��+Z�n�Ӆs���G\\C}��*�<Q���+/�s[63���\\|4G�kpC,��*�`,k�OTU6%~�0�#GO�Hh\"L	GU�(Y���0$)fɼ�1T|�[�A�=f��I/�������Au�i2�j����l7��8w�0�5M��W����ۍ�3MPnm��Ǿ�5h0��ޠ[�r2�t�ҧ3s�������A�[ێT�Ы�h�����1�աp�8��!HvT��?S�.��^#j(;���b�U�[��U����A��Oz�LѺl �?U!,�TL%<,j\0\\�ↅ���}���(�`C�imY���D���2��o�{�u�H��H�Le6ek!�7J����K*�d�n�z>�]�����-���n��T�=p���~�̴����`a��s6�c1�r*��}����2�Cr,)�m[��`a5�OmFա�;�4N~Y��s�o`*��k�(S���Wx�LF�4��*�\'��9��,ԥ0c1���Q���̢�>Iz~+�Z+�j�������f���\'`Z؟�e��-��ȡ�3|J������q���j���]x�~��4����HD3��9`�2�dr@�a_��T�2�4�Q:�59�����nsK�V����z�¸,�yF��A��d|�62S�4�C���$O�>n�-�`S$2@��g��%^�,�W��\"�\0s,�9��\'�S�W��+��G��LR^Q��H��z��[qL\"(6jݺ�X�����;�N�>��!N2�\nm�~� S�e�9�M2&W�a�_A���aY�Z+��>]Ke����k6���S�{�weU�̼욼����ܟ$Rj�[<��O�N0��Z�3�W��\"?~����hi�Λ,!����@;�%8�7����\0��н��޻޿�H`�v���8�oݶ�� ����7/�.ܸ���2ij�fx�������l�ܰ݅na�D��@� �i��y�[)\0�x�~�A2�.9d�H�V��;ocfEE-���ũ���1a�@c\'e\\�t	���m��ی贌�������>��n(��kx�����#7H	@R()����.�w_�q��\0W�,���5|{;�7��:�e�0Js�q���R��*���U������P����=`M�qj�l��!����а�ppg>�Ai~��\0.Гd�q �l��M@����OQF�:�<�J�g�)uiŝS\0��+Şl�\'F`�F]VJvb�I�h�P��m*Ã�Z��&���tpp���$�[RW�7����t� ��AZW�6B�W��{(۸>H�1��N�rYm!%���L���.�\\ms-�,2Ȁ�B0��~���>��J�7p�\0��Rlh�?��p9�NV]�;\0�F4����i���K`;-���?�*���o?͟R�˽U�Ľ��!]����΢�(�~�\0S�)*��\\I�dE՛��+���5}�Y��b�+4�aim�+!�)Ы�*#�@��\"��\n	G4��,0=D��-C����(�B�)W�Ss���%-�8��T��%���I\0�J(��`�&]��E��,���\"1t��j6~�\'���B�\n����;���)� ��#��E�k��<�^]_1>���l�T�dN�o\\�]k>�{~xa�h�`�p��]�*ɲ��Y�Ňv4Y2����ws�0�F�)sJ+g���ltġn�bu�q�c���H�r��u�n�r#�6�4 Cl4�T�3`~�ٞ�g��\\���w��Q[G��!70�5�E�^�e�!�� 66w�uk��O��B�h$�5����4_2�����H�wui���D���(\'�\"\"~I��=3R�e�-H\n8XO�ͬUè4VA]Q�j�%Uڵ�nD|��͒�� selKA\0���������8��e���$B�&]�Ǣ@�?C�:J��LV�8}�F;1���d��h?b����-�a��Z����{�~cA��`�iV��2��,�o�u�/i�ͤ]���#�	j\n�3Ɖ�a�n����9�oV��\'f�UX`x��!�K*I�l����	f��]`9Or��)��9��&�ٮw�dP#?��8�M�eFV?��8W�� �v?�D\'D��%?���PI��ƈ� �\0Iʾ��/���j�m�v\"�ˢ\0Ma`�4��(�!�1�͡�ώN�ʂ)Dr���v:��� �����Y�r9��\\[�}dae�y������lbx�i���eV��Y��I��}�����nZ�~\"�%3Z�(-s�L�\\F�&��U+��<=�i���6�8`��2��$H�����G�2;Րy�.9�|,te�S�	���֢�����A:�A�	r�ی�-!ؚ+3�F��s�Ԍ9Yk���\n}TS�\nM�ċ�dR&�N�?#Qv*�`XY�������N��g�,���Sz�i�=%\n@F��(�w�?�sa��WO�����3�>d)�4�tٴqu\n�������wĽQ�㱾���]�<���`���5��L����Mx�(\"�J`?A�]���ERF�L�i��m�q3�]��<Y��GڞB���&��gt����Ĳ��\0��IE�� p�Y�Y�Tz�~^�o}�ick΢�^���!pr����K�!9|%���$i�<TFb�=�������}oMU&���2��X��N&��}�}P��M�7���\0���n��}���:���S���&������׾�7�������OF&ó>X�dȚ�1��;�A��l�� {!�2��-�̸:�Zm@�ޫ�,��:��\"C�2�HTzk��A-���\\�/�<e�0�/�.cfG���ʓo��t�^Xۙ���!�����j�i4\0�Ie�F8L�7G�-`����!%k��2D�lY_�`i\"�B��[6\"��00�\na\\�8X4��̞S9M��!Чr�e�ZJ%��*F4h�E9e��|+�Kq�)�,vE0d�r�	V2��>��^��|$��-�V�u�>�����Z�/��޴�aS�I��5�ؿjp�QgS=���yND��$<�S\\�ɋoA�~*0����i��&CѢ>!dU�dBKk�dK��;�����u�[n�xz�4h��J:�J&��\\m>F�D\0\\BX�kʕ��7z��O��BO��;m��<�n�Mb���hmfP����c���В��q�ҍ��a��|������*2(�ƢqD.�rC0[:a���!�!8@�N��+�X���i*2���,�(�1I��Z�	\0�FIDϡ#޴i-�)�ZvM����#�y��𵯺&i�����[�5��\\��h�\n��;�T�zۙ�mE%8nVV��9)���B�H����}h�z����.82[�{AA�\"\"؎�#3;[�P_��Vջ�Ve������FJ��t�/���Zw3�$�T0��+���}����.W���ڲ �nL\'.P�3Ȋ�3,��ۈ���mX��C%���B�5\\O6�Nw*��J�)�r��N�\\ʠ�^`��@\'SQiz��m�62�oP.b��Q6��t��S����M1�@VUb��[�}�bs�ۼu�����j�LQ�h�\\/�a.q��q��C�����5ʁ7�j���֘vpn�i!��tҁ�E4��<�B��\0���Nh��/\0y��1�g�v:�\n�x��d���~w�]��ʵ��W���ky��+�e�ȝJN�ŕ�2Cs=3����kh��������$�����ؑ���yU7.T+!��t���<\\^�]<B#8��=��q��<��J��&�-[�~j��8�z	Fl��I�m�W��3���\\ ��z��򰈏�z\0���C����\\�P!�%�ע��5bKx��Nz���a�M�Ǜ��|���1*PJ�\0*}2�9ti\n�\\�p������-$v��{�h�L��I���;��7�B	r�]vǎu=]�%�w�\n\n�.��5K�S\"�;�>�=��j.�XIa\'к����P�ϩ�����t#ٛ�6{Ͳ���Q9\"������v�\n�n���U�T3s7�0�3���ݽύ��� ��i\"(�㵊�2�i��8�h��t\\�����	�0n�@�-s��ѐ2[�<9�^a�H$D�\")����B�K��$O�3�����N0.��q��)�6��˫!�g�B @��l}�d*1��c�ӟ�s��Q���np�O�ᖳ��m���s�#ʙ��i�2����[�^u��4�D.�#��P�[�H�\\��l���q�auE\'����=�C\'��\0cF��ֹ%K��z/{�!9�9hS�3d\'&��8��f_��̔�������5�Y�dZ����K�\\Kt-��\'\\VQ���^g���d�D���j�e�Sww�}��Ҭ�y k0�}���kc^�ot�\'2�|���P��Z(%���#�U>��s6�ޏD�n��[)��]T/�cE��C��U%d]n��`����,���Ux�R�����u��3O��*�Y�����G)�S|Џ����&5سܫT��z.�g�R0���R�/�AG\\�	���\\�<��fw�Ʌ�Xje���=��Φ�e�Q�VFz�a7�^�	V��%k\'�77�z%�?v���)SЄ�\\�b���838��5E��n���)��ۚ�&���w�\"lƕ��%O:r�4U)���>�tw�3��,����щ	�X�y�}C�ŗ^��E��ݸk�d�q��9�]���&3:��Ν;�V�%f3<���[6��\\]4�BA���@�6�����͸i�]&;�3�߾����2��;��pc�}�ؘ��I���%��M}i!j2,ܵ�},|}7�;]�3���4�ʤm!Rnga-oE�ݠ(��>I�UȆ�$4�(�d�}�a㠄��-;׸<��:�����V/�r72������N14����w�Mc�Ľ��˖I��>3�d5l��㒕�%%e�y��^2��B����?�f<���k�f�@\'�%�IqY1��D*�.��|c��!��x��\"wd����|���RR�YO�܏L��V�z����5G�N���TF�-�%G�9P�3o��n���qx�(��pÍ;qѦB����C|���s	M��q���`�!R�$hE�xRD�4�Ժ�J�p>�μ�c6{���.A��*�l#pW3�����\'_9�ߎUfe�vT��[���^�Q�I��fEн����`L #��?d	�O�R��$^c\\��Y�*��<��CC��>���#B�H`7/F�D\02JeZ\\hr0v�?�?�e�M����c�S�.��>�ӓ�$�Ar�$�O2��%�;x�v��O����\'���<a�\\Jۤs,��m���~Gq4�@���#`˓!�P[�}e���w3�֑��ź�=�y���|�;����0��2ibt�\\78�D��3򈓤����+-�r��t/���m���>A�Uh�*��(�g��t�E�-�6R:�}����`��!V3w?�>����7��* ZGrK�ae����R855P��L���AV/�T��Ae��krN�O����ˌ@�i�Y�~��������Б!it�2�E<�}���nGw�Ov��s�b#����KO?�r���p6�]����%?��]�_�����)l�����(z	��G��2��X���eB)2��SS�d ��I��%��v-�rJ<O��L�~��ٮ��{�-]V��l�n�lW�]����Լ	���&K�R����͐�cF�B&Z���.�4���S���5��@��n���\'N_t�������0s�1��n9zVk}�����ܓO<gkw�LG%�$`��R�O��;0�R�2����;��g]�^�ڝ�`w���m S\neb??gvr�XxY�[[2�]+�$3C��>�x��{�`�3�{dγp�V/��,�&���!<С\"�̤��}SA�!e��<�c��v��3�����E���Ku��E�P�<>\0�d�G��`J�Lx�;�=�$ȁ����xo����:�${�Q�g�h�mv�{7T�!L�(���>�\0eS��z�a����`�Di:�a���%ˬ�PT�O��u�.`E�@fS\\Z�J(9������\\V��1J.���y��*�q����)Ù�cZ�Y�)�l��j��)���,��F�F`�F9�Lq�.YV�֯_x�MP#s!�is�0%����[_��	�+�Q�ܜ���&���d�4Np���]nM}��f�wS�B\n�|���.\"�Vuii������ܶ��!&_�\0�J9��؎�olv�\09h�|f��BE2� t�!:�1D�s(:~���K�xص�?�^g\nTeIJFPo�T�hsO~��9mXQ��Ly��-.�\"xs�k��$�����^��K�3�Â:����0d�#�مnӆ�.�5|��}�R\\�	�d`��md[��z�b�\02�O�&�a�B���^��g�[���Lp3�w9#�Y(�48]F�V�a�6+����r�j�<��)����2��i���ϜϗE����Z��3�ݚ��Y5�A��A$��71�&^ye������a�`$n�Ш��N>,�K|\\+�]�5�A����|u&�mh�U��F�Xˠe=t��������_t�C���	D��H��η֋h>�=t�I���|�e����!�ց;3���5�T�6\06IM����-:��\0���H����t@)��U)�u��V���ox����W���z\"2,3 �ˇN*��Cd����[Ti���`��G8\'�6�7�+z�uQ�N\"k�Tn��C����MK�v	쫚Y�8��?���!��y���+�����\'=����J�i���IM��u�-�>UF�\"�;��^åJw�\"`�Zk2�d�IV�k��_�s��8�f\0�@�7`ɞ��c�5�Ӯ�Bk��N0O�\"U#�h2�M�*s��õ����xډ3瞽��j���-�ܵ�͋�n���0p-�d]NmZ#+!*�J� P�2�r�lw�m������)}��&+(���~ܶ��~p��~�!#.!*i.��؏	��İk�fL�����ӱ�z�D�;M@`d���q(6�QW�K�/�/�5Rfa�%��5k0h����s7�L���j��a�P`�w<�V��z6�,$f�������~&����1������z�D�b���Q�4��u�+��Y@m@%C�E���(����U��S��٨�Κ��������Ğ/�I�F�<��4#>�&Hk��bWx�·���]��d���TT%�����\'�j,�2������!�bI�[]��\"+�+k�cw	G��Ь=�|��AP������֊!�s\0�`���,N0$?z^&F�M*4��,�U��O\n�ݑP	H��T��SG@[���ި�O�O4�9ѽ2Л,��<�Qlٶ�a�[qgɳ���?�N�8�������4j�$2@���mZ�2�9_V㤕��g�@,�;=t�s��ha˾\n�V\"�`_N�#������6�ֶN5*x�݌^T�d��נ��l��\"Q�]�\'������^����a�Z��4�z;�8t�|xuk�S��`>��;��!$e����FFG\0�B�����F��D.�A�F\0�d��=����O��m�/�i�*3�Lg���|&�Z��47�N�)�tiJx�%�>d!$��j�AM)$K�Y��2����	e޷��;C���=��u��f�1@�{��v���k��@YR�K��GI�	i|9��``6J��k��:�9A 8���fM���_p�2����$��$�YDp�\n��&��m��k����O��̘���R�e�c�z��5ˌ���t��*��h�zU�R����d�pv2n%ݺvz(cL>�(�Uʏa�6ȁQ��C����=�Y��mt&s>�s{�J�5���\0_ס6Fvk�ē��:����.���\\!V�1֮�R�?t�ʁh�\0��83E��`Tr���?� �.��0Iw^t��t�x����{�.g�s�Μ�^Lq�%c�J�d\'.h�,xfa|z<eht�i\0����D�K�2Ք�)P[+c���.�����U�^�jδ���3�����[���Ż!v��ioa~��������+؆ef,t�!�R3$:�f�\"�+��1��3��\\w����M��\0�n�k*%uR��ϙ����D�IAp��:��\0��.%���s��/�qԦ�\0%��i�}EX\'��/Y�A��x��G6�/G������N��O��U~N$[f�ΐB����S�Q]�y�T>y���p0\"�6���3;\'����;�q�����P���ﺞ9�Q�3�R�p��J48<9VD��9H���7&;��9�[N��[�e�,챯|ݝ;{ٵ7�P���B��t��U>F2�1ˍs(e���Ax��yf��ĎC#�~�d��������Lf���P)���O�ݜ�HjkVЄht���x�#Dw�s3��M�=�8&��J��4.@�*��6�(�#�Q�B�67�J�;x(�=�O_rp��ǟI��l���k�`�P��S��&*ۗk�I�Ɓ8���t��� �I�(��r�Y�쨞��D�!�H5�1�����2S�5�*\">O�cxu��-����/���v���@���@_�$Ԁ�&F%�#=��� ߶6��O�34�zl��<\'���8��}�d|�ڞF<�0ٶ�JGX�TR�?����*9�a�I���E/�=���x���94�BZ �R�G�/��8ek&���)�R�q\njK^n6������mä`x���3�y�CoK1�3���/��4Ϻ<�̶5��?�f�!��M-�VOP�)[P�7H6�̭��Ά�8g�k��I7�\n�&I�k ��*��{ҴB?�e�j��С,* @���K��`4�O79S>p�jQ�g�����/�n�p���O�X��.2|7��0@����0m��L`�2�^CZ�\"�Z�+�]*�����Y��LNB!�v!N;�Uډ��{�ˍ\\�u�U����<��k����0kX����ZJ�I��Yh6�bq����C�)�{a�~�������o~�����w�N�0�\\\0�0`�(stO<�`I��-�2�䐴;�a�,AT]����,�j2�,ȿ���`~t���Ϟ������bP�2G�&��dt�8���0FPRKEq�|�����k�٩�OC��:�}ͲF�T�bl����&u��G�)�OY������M�j�<�K�2E�pM�և��B��{\\������e�&��߫FC|��5��t=19L�^��� �f������uwv�9�#\'3Y8��Nr*]6\\Ǐd�hd�G�6�Ly�f��b���g�� ���.���CR�RANX�L�-\'�!�	�\\�{����O}�Y;���������s����XN�2A��g��l紵�W�(}���\\P�D4Ø!��`�G`��	��t���E�\0�Mgg��D��s@F:\"s�p\\2�D�GI���;n�G����4n�y��wlu?x�I��yse.�|���{م�7h]������˚�F�*?4$�$�����n�Jlf­Y�\n�Zw��2����>:i|�9J�eX7EH��Z\'݋�=Og�	԰�6Ou��mܲ����Xد��;{*��{�r-Ll)�2��9�v��}������oxtN�bLV�F���ԉ�n����/�RO���%<�E�ޗ_@J�w�[�t������w�d�s\0������*�9�#��C��Ҍ��$�Ap���؉.^��f�߸bP�X��c��1U��M�dV6C93E��נm�ȴ���U��l7�~S�E�y���&��ҥ%G�8�k�&�8��bFz��Jyȩ����Z����\'�D��ux����(n$3$�̈4Nfy	�qٲ6�döa�!%G�b�>�\\ѫ+���`��5xm��ROK��N�:ĺ�)R\"�Y� �ۉ{h�\\gu�|���w`�#�������/=����?�Fp�qO|����ZZ����.��d����d�r��F���2��@��yقf;�9��)����ٮS�&$|����\n�!੪R��lrA�oy\\�$I6B̫D�����MV������\"�/��5IAC���ב�4���]��pw�Ĩ��_t_��W8�.�z<�[��KzY�FM�.���AUR�ȠX8�\n[����qv�Ǎ_�Ǣ��%���B���;��x��\0�(��tHѕ�i^+c���B��떵�+_��6.��o�ų��}�ߒɨl95���`���4*�c��;d�A��V�Y�=M�\'�p���b_33���r�#�b�;Q7^{�5w_�4q1D赜��_��|��#*���i��Ɔܺ�K]=VY��x��JDh#����V�!��7��.gVm4����(eE�hmpgN�B��`x����u�ݲj��!���=Z�]̫��a�Tg@x���\n�},x�)�<oc��,�����i���@	�2�|5�æR\"J�6�)���g�O�!0N4dYʮ\'��4���e�\"Hsd�,x��!�a=1�_���S�HN@h��?z+[�\\�>a�F�������?@&:)�qF}R \'8i�V��Ȭ�\'��I<KV70�e���V�������${�jH�f3j�Kd�o���X��vU*�H�<�zJQ�eM���5FV�*��z�`~�[�a�c�&[{8G�1D\'���3�����Q�v�v⛈>����r���ܱŽ��nw�,k�rU]5�6R�k�Y7��\"n����\\Qz$\n�:g��xK@������2��Uv����S{4����C��ǎ���$��|w����C�c�>N�����`v��wg@	b��خ�̗\"\'s�[!�Ћk������ͱv\'��X�Ǣ���Jڴ-���`N�0�M�J��5���w\0�:al����b�<y�ݏ\\]�s;������;|�U��d$�޹7Sd=\0�)��4\'C�[:�C���O�O������A�\0h��1�����i��l�%���D?wݺ�]�Qd߮)]ˠQؾ��t������)K�ȭ�\\U�oeoA�dl���y���?+ S�&(��ɠtJ�	N>n�:�8�tw\\���z�MtU�z��(�W0^�\"���$����k�0-1�D� �t-�Dn�u\'6�l�~�+�5���*H%��^�r�5�T̨$Y��7Ջ�N5A}��4�/5m@�tP�\0��(pw�~=c��0Le]>��\\o�yX�WV������A���=5��\0&e�z\'�J�`^��� ����y~8j-��a��t�\nhzM�W4>#U��9:�S��(d�X��%�\'`�X�^��͛0t8���J�0T�R�Ϝ_�]G=�*�VЫ<^�����l�:�^��P�$�j@��Y���#L@Ȅ��`�}�~z�Ι$�w AF�f��ƪ�q�������°�$��۾��De�P���k߫�*Z\0� �JZ*Y���T��&,r��ǵMT��{Ti�ot���g?c�l7H�W��Z����744�o|��d�?�n�}	A���Ra�O�޻+�ϟj���ے�aՐ��r�h�j�d�dI��2/�\085+�\"?%\0bZ�:��U@����\"#��f�>��9m����H����#{����\n�\'?�.\\.��vfO�<����e��m�i�ͻ8ZT�3�q?��T��yNte�=]<�6�iD[�L�7�����z.@�&<ے��m�Cb͔\0\0V�x�3�/��*A��.\\9Ӽ�U��ӂ��X�l���x�a`���I���SX�53s��G�փ�����兩!/�c�R+��O�^��0�1��ukW�`\\��|5��\'�\n|׽�8A�\0��{|��46A�GP��{v$��,��2�,�k��8D4����J��{���]_;�g�Ud��\0Y�>@ٟ�7\"�.�L�^�U@�+	����]W�ũM��W�$p�I���RZ�%H��L�0�3�cV>��\\�*of�:�3P���\'#ބ��{I�_��:�)j��@b;����,���С��g��4]{�\n���� ��:j�Ł>B`h:���e�b�xԓ�U`n��)�)�3TFYlq!Ҿ�J��x������4<H\0�QoA\0����zʄ��06v�۪K���W�}�H\\_;��dܿj-�=k�e��<�G�Q9,	�˰t́f�� ��2�x��LEEދ���G��G����r�o[H�����(���ݷ�C���%%,!AcTiPmD��cz�!>˨������M����˩�nZ{it2�ԑ��\0�[ꗮ�2oi=a�7��g�}�͏2Ká!�0[$.�j2��~����ukMvv�7�\\Yum_|�5����I?<�g$m$FȽe�59�u�J$N\"�_Y%y��B|Def*�f�~̳�#�aM�J@��Bi\0�wd?��g���4�����f�NI*lU�����QBťp ���&���4��y\"�c�A�E�c��u��!�1�MQ��{�C�\n�H�ʌ��#���xx��Dy�nS&$!���^�	v�{	��!��W<7]��[WO3!	�[���J�:8FY�����fO?�q������bu��>ew��ˈ�V)�#&M�M�a�rimF��<����$e���G���F �s�Dw�@æ�ddb���xV�W�J*uml�]�@�Pk*��������5����|�BZ?\"A���&�J�k0Cj���KG���]kUX� vO��v�d����^�^�X1�V�<+u�����$��ŝ!�Z\nz�%�y�a�!^�X����`|�#ɔH~����eȣ�%V�*��k��!R�?���#n��ٝG��Q<ɡF���yG\"sx��W1#�J�����G4�}��JskL�`��z��R�Erp�Z��gz(4��yb���9xL�Y�)s����\"��w�xz��c�a�8��/��>�\0����פ36�=v�%|��ʽlo����^;�q��hf�t�f%6�������� 4���Q��5���[@���q��(\'2�R�x��O�.���|��*�MҀw��C�<���{!L�Y�b�k�rBN�Q�U�.�R��,5L�r����kH��\"]˺_FBzd0��\"�����A�P0>1Yn�J��kk,k�J�&Qn��u@�o\'8&JL[��ؤ�N���hd�k�2��шK2�\0�$�\nӅR�.3��4]t��\0�u�E��ɍ�Il��!M�t���F�ި�\'��Ñ�`��g�ȯ��5\"#�F#h]1q%�$�Ծ>��B!��+�L0��jU�\n���tt\0��ҵ	h(n�u���V��+�2,�D��!%N��Y�Z�AR.�U�f�`���H��|���J�@�B�=�f����kd���U0-F��g�O|7�Tpm�8	3��)P���a����sucX�f�H�`�|YM�b�ş�9��!���D9�l<$�M{{%�N��I�V�Z+iL`�����{-�������!���\"�tys�]w�f^	��\"�A�~�=z��֣��0�m�p�	Ҡ��k�gV4���%��4yO^E1f*��������:�VNMt�7�̵�ScY!,2�S.�ɺm,�9y��c�͓I\'8���������r��ww�}���X�K#���br��M�\n�?������}��l��L�p�&�(7#R�V:��\n���}o�-��*Ә�ΐ��й��q��,�)�5ce�g��$p�-=&L����.�plՃm���ay*�Sz�OE�`3Jd�5b�-\'̈M����y��-bÈ�#�F>���v6,O�k6{6�jٲ5��,KHܼm�Ie1�j��dfK�#ڦײ�g��5��_V�c�(1��_��9J��y�34đSwZ�)`?����9�i�&\nj�:��Y���̪($[v�h����D&&�E��񧮣^�.��u�O���E*��&�W��O�0LEA\0)�çlu��>4���;\'x!��)���%W�b�Ȗ�ʠ��ߵ5K�6��b���\'�T\0��H#�\'���� -ү�\\�\'���+�-#U�kke`�N�\\�C+�x����MG>��\nB�99�����A���(�e�������(�>�������ǹ�2n%���M٬|�l\\��_iOh$�/&ep1��6��p�kez/�P�;���`	���2�7o����(b��Eה�S���q�����i�p�}$@��(@��<!�n2��Q���2Ƞ�h\\�\"�gO�*[�#���h��^?�?�0���M�����3����!��u��&���ͥov�㮄�i|3K&���b�O���f=��_�r	_SnAsA�I�V�ӵ\0G���~��>�H�̢r�5in��9/생o��*�ݯ���훸������)77.��~�z���n�z{�`�F�}��h6Ժ�R�یǏ��t��>��[���/��~�����w��%54Cփ���5GM����H��A��Vf�0~��+��j��4�b��HxV�_�t�}�K�Z�q��������+L`��#��\nX�d7��C�w��xL�</�.P~EL�:k���pz��/_��?o��Z���48�ȿʡg��n��ܹ�&��+����l��{�F��h|�2���?.E�k<,Q-!�O���hd����w���ZfE��\"d�K��7��]7�.L��`+݋,hC��\"B=ő�G���!&��V0��������#�\0?ؿ���̭\\�ь*�h��af��8f��A���}�;j~��y�X��W��o���kZ�,�Ӱ�������O��L���#Ы��O��Qw��0VC��w��̔�˲�u=�AF��Ys�E�Q�\'��@&!$$1�X|5��\0%k��3&?�^�@8/5->��i���_��c���r�a�!�X��/�J��ۆ��g_t��,������%�A=�f*�L ��V�8�>��Lw�M�c=������nѺ�=�SJ�x��i���ffRf�V�>��qƇ\\�ߴ�U��\'�N�0��0W�$���Z�,1�f���	��̎��|н�}Q�gJ��������K��Q�?�Ψ���0$�F欮^Y�6`�y��C\'G�����V�r�u�:��+G\\<��m�.�}�T��������V�U��9����g?���\'�E��8ӭ�Q*F\"���0�4M7�rI��0�|�{�N#.��Fp���dd�8nt��m<|t��zfR����F94R9 ������xZo�ԪT��C����l�!fe�:�̹$UL��eG&���;nq�eUn�k������c\\&�L�Fj\n��Q�{���5\n�&sV+��t9��9�U}}N@�:��� ��,.��z���4|�70��8������s�p�9�Ȓ	�~�|�oqLkg�	�%����0*�6��a��y����O�C����3�r���?�!Wఒ�E(g���WO��O$��$>���\09�8:�Q��n�=p�Y��!�j��꫋]�YJa:�>����X��X:]�&΀\'�.����Y�β\'�̬D.͞[�e�	@5�b���l�s�F:���=�n�KO���(�frѶW��c�\n��t�W�C3+�s�1�y��������1	/T:f�Miѹ0�@V�U�N?k���v(��ղ��E�/���}[�$�Vz\n)A��\"���`�8J!�4� =K8.��vy����]c5m�kJ\0KG���*\n�2�ȇ�0̩HL��/Ns7��^�G�n�z�,��h��EVs��\"��s9�4�X�/�X���[O>�:pa9�l^��{�Y\0Pl�`�vYr�9az�ҕ$���-Ř��u������䃼/�\"6aL24Y��TW_	�0m��d�le�h�%���P�����.Ţ����oB��sO?��Ɋ��d����Ȧ�$&B��3���4Y�˯��i#�B�8	�Q�(:Qa|4 �E�\0��$͜w2ʂ�g�\0�e�N���9w�P��S3�`(8Y�u/��&���S~^�����\'e����~��_4�d,�p��&���/c� ��4%_&��t��_���M�A5��7����&pP~�ǐ�E��mѬ  \0�.C��p\"����Z���޿w�L{����2)>H��S	2o�ݰ�\0q{��,1٨�C)�d%�K�����Y�p��n�l+�-C����j̆�Ȼ6�B�H�,�-L��9�:z���̔�z}�͘gh���!��}_�X�3�\\�JZ�/�����ѯ������\0]x�\\�\n\"n/.1�뫡G�p7޴�}���!9��ͺ�����[��M&r�F!���p�p����=#����[�\0#YS��v8Z\n�u(��2�tmk!����H��SRi#��*��7^�>�s�u�7y�tݼk�5/�N��u��ַ`�\0������2C���k�	dPr��_��˲J��YL�}Cdql�jܶ;�q��:�#^?~ҵ����t%��UR����`�s�9wH���!y���uK�����S2`͂�95.�i�������uId	6T�K���D���Ů�,�Z_�#��Љ�h���$MJ[�j�PeU�gmR��,�le���d唅E�S�$�\na��;\'80��#+�O��nQB��o���)E����:�\0�\\��N�d)��:��S��R\"��;KGV�<���.�c�)G\'Pvh����AHH�d\04lK\"z*��M�į+Ûqpb�9u΍��e��u�7ѐ�wgN��w��P%���B��08��s��,�Q�~e+E�v\\��)���t���]�A;��u�Ã5�u�RH�q_��|b]xfYo<��:����`�c>�0�<|!ux��Z���2i�e�Q�u�Ǧ�\0?x��r!~bV���R���O/�2]9`�6.@��!N:�A-j�h%�S��%s�pLZF���B��c*{�	�d�#H�6�/*M��7�n?�TC�9�A�˦�D\0L��A�i���8!��������K�t\'p��dP�3�1�o:W+�	��_A:��V�n��f�_�����\0ڬ�:C/��ݻ�����������{6H�\\�K�ݘ@��\'#��h�����\0�)�2��Ձ�Ǫ�k�Ǭ[5=6o^���Z	���{,(��Lo�MW)ˀ�\"F<�\0��m�-{,(k2�(��|�	��c��|^���M���H�޶|��P�4�y)d.3`y���+_Z��X�,]�)ϛ��/(�p���m���c�̈v͖�d�d,tZ5�7F�<Gv^VNY�_%p�o��j�Y�M@#��y���k褐��=p��}|�}�[��誓=���a���ޣdb�>/�����^cCv�&L��*341��MjSf\"l�L��\0]ZXN�Q��&e�N�{�r�Q�h�I.s�K1՛�Y�NG�2|>J�:$�%Y�ҋ�ne}���A:�Hg�k�S\nA��\0��jGM�L(]A(L�^B�l2Qf�p��Y�{?�$��5��h@s4�]�`�3{&�c2=~���UR�u�F �Qw�p� �Ǭ�GR��E������y&J77��U��T͔1�u�!Ykv�f�xC������i��~Q��s��q��?������8��qL>|\\�)F	33�Yd�\n��0�T5�-��y~֗�L�����rK���g>uhj�����\no:*~�,Zx������n�~&�ERpY�x��PN�s-�ȥy��Bt�˖C�������~�d~~J����Y؂u\'���4@btX�hP�UC��8-�t�Kٴh��8Tr�т7L��?�)��c�iջ��E\n|teɈ�%��1��h��n�ܔug���_U��G{M�$8�:�\"��5�͛�y�-Ze\n�B��mK��T3Y{��k�~�U��9�Sd�I�hr����2��c�����`>�b�:��f����-_��:པ�1���ݰ�� %lj�����K�ܲ�f�z���C��9O����<3M�E��	l�/bWR6Q���]�&WF�Ì���]F�{�ܯ(�]?�\07e��b[,u���a������P:W�j�M��U��np�ܿ�ǰ�:v�J>:�3(E�-sQ<�]!�k��d���B��R\"l��F�hb�r�P��F�X��,U�\"��x�\'3���w��|ߒ�6kx��_�\0=<�{x��Pnֆ�GCb���2We�b��5� �&Ǝ��pFo���r���\"c��)��̐KGk>OO�MyZ�l�/:{�sp�\\ֲt�d�1�U���䪂r��� ��yͲ]TI��ʯ�57���>Lz[�eYCd�%�/YRM�	�N��H�>hp�f��y��/����\"��$�~FV�hAqU��\\���?-\0^lj�gdO2�e<�\"��Y8�1���S��;T��!0	�	�r=s�8��>N��[�q��ݱ�UU5�1��Q!N�kh`�!���AƜ14�*�d�g����=�QI45M���x=Hj/�<q�֟,�f����EZ*Y���̎�SJ����/�N�\0���>�s8☑�����)�%2@��V6]� ������fn��!����u�+��F��Va�g倿�DF�3�lZ�-z�T1\"���;�I,�2u�I�)��y�HS�t�� �^���\\�3�2� T�Y��}M����G�I/�����tx�R��F�\0t�Z��������ERN�ֆ����\0�]q�G.u�u}4��yW�Р&i2E����t���bQ�ϔ1��l\\�3|���8%%�-��0���%��)e��`���z�\\��A,0s5�����1\\#�{�7c�	.)kc�ERU(��˔A�y.�f\\i�,\\C���J��KX�ah+w�l��b�f�\\�[�y���O}\njO�{��S̞9�a�)f�+P�U�@]a�_�)y���sϿB��C�v�C���H&�k�ˍa���&L�ZXT�>MG1��Ŧ��<�2A���×�.��kEM%���Ҿ���))��������pp﯎��ӆ)��dɢ�����pv^��;����Y�� ��c���)��m�{�)�)�NӀ;�c�e�e��i�̌{f���?��[��M��v��o2�����o�w��@��)��%\'ш�(������Xc�&F6��ydld@�ԍ~��-�l�l�aʂ%K���c;v���NzxJ��	�pS؀�����t�?Ō�V1�]�A�h�dÕZ=O``Y&:ܠ�:��J��1T�4�Խ&�P�.<c\"_�DWAA����t�%�����d=���k�P�C�C�e�.�Z?�x��}����>O�@�ee���Q�g�&;@��P&�e��@F���2v`/Q#I�;k�|�\"%��3��bR�ٙɶ��������Z��)���MIbR����F0��j��J�I��T����c4�}�\0��$��\\v�ΔU�����9���J1��4���Fk��M�A��{e���qa�x��TY�J*©��Ԡ�I�rP�T>%�MqD�`#�w�`��O�������O���Z�t�G~���~7�J�F�Hkj�KF��A?�r8��|����3���MC]-�-]>۶�L��ٶ�;L�e+ۡ��&AJ�Z�ֱ�P��&�/A�-�JGC�=���\'4��[6���r��9�/b~əEg�+�(�|<|��c�_�u���)�� 蔤	�5�Csh|dzd8��t�}z��2@������w�4#9?��ME/,+#�*1��B�Ae��K&I��G���Ç�����0�$��Lw2lڴ�?���BsӍ���u��l��B���52$Sܤl�H\'�h��3��m0�Jz<�����v��5�LG�V�4֔�5���`|\n��Lp}m���3.�\\�f%��u�v��[�&oZ,��*/�����G8r�bd8ڟ�����\n׺��e港���Y	<���|H��ڤ~J̜�<��>\\�s���g;s��f1�.++c02l���\n:m��o@��9�m���i��TW9��K8����U�� 3�Y�&S��X���t���\'�=7[^F�����{�[��QP�i:\n�6���\0��>V\0sT�٥,�J�L�C��w~S��cY��>\'_��:Q�Ik��\\�|��~n�K��M@&?5� �.0�:U�D8��*�����5��b*�������/pA��퇸��8�\".��	 ���UG�������	i���ۿASX]�@	|�`ԚP�E��L��I�L�JID����pƊ��{t3aP#�ȯ\0��a��ؗ�|;�u]8�=O��y?V.�=��}\0�3m�����1-���OM��>;m�a�ׁ�e3���}��ࡽ����\n̵����>-��d�ڗ��A��ȱ�������f�s�b׌�F�d�~�#����0��06>���]YS�����<~���{�?#*������xJ������\0�o�0z(�b�����)�vW��G�7���f���Q	�e7�=�b�\\q�A\0y)U^۶�B�k#+�Ν�|�೦؄*ق�Y!�eZ=2�����U�\\We����֮B���Νo��/�LIW�M���&8�w��B�e�,B��=��l��{8�R+}V�Q�Yމ�\n�+��[�\0xy�3�p�P���$*%�hpcp�y���\\__O�界�0Z�j��v�s7�7����߂1�e�4�I�ɕ���֎�8n��O�L�)��kϳ�s2��J�M5��g����OR!�+�rI.<��� M�������\'���.��Ap��`��i>�y��������C�0�g�)!`ՠ�e�P)�w��^����E��,B��x�\"�����Zsb�KI�w\"�$J`��\nznP4·+�?�̷\\+#��Ƅ%(\n�n���&Ɓu`nh�!�i�X�`�0�,��`7=�n(f���	l笮��Jf\n��h*�F۹��6n*A�*����L��24��,RVL�=ia7bF�ڐ��O9��S�b�_�6��eȨ!�/�x�>0z��K\'Q§V�4�f� رo8�h��\\L�5ƒ�\'��3\"��B<�d�?���lDܜޟa7�L��s��\\���#9���SN��`a��`)8�@����BT���D�p[��v9�[���Z��O���\'~�cۺu+|�-܎Xd�NXw�X�Ӱ0���I�XKR��\"�$�,O�A6�eKfYoK-R�u�b�L�{�Y^V�T��e��K���4�K GÙ�2:��¢�ɽ�J罽���ge���o-$����+�?��GwU�=���7Y�S2N��*�cqo\\�֕N\nH��3r�2��A�@�T�I�v��XS��@Z<���V#pv08=Ź����E�v�ޒ�|�\'�`X��͵x2�޶hf������AY#R�_����B�CAN mx���[�Q���}���Y�ؾS(�p�����[�B��2�\naM�ȋ�a�d�f-_kY�p��s%�X��/�GNO��-.v-�D���^��3�t��:�Tj�����u削���g�\'J�Q�H��D�ȏuu�:nn|�<�f�nХ�~b��V�!�������]s�������(RC�sT��?��rK���D����#y&��)��Y)�8y��d��1��1lD�r�W�@),F4�և/V\n����X�꯮\\6�8@�P�p�뉎Mj\n���x��y�\\`Ff���@C\'ˠo|2�xXNv\"�m`�h.��ʯS��%ψW^~�Nި�������i�W�	�^˙xsaX�\'�cT�����c���cjS�tw}\0�z,_�m�����VXaً_�?#����dҒ�D��-	�K��i}��5G�$��E�=�� �����xޱI�YCp��_�@*E���Ǘ�&�W����D��y�Q�EɀN��W,,���3F��m�Ui�*际�D9���H82��\\<a�Օ���=��Kʠ_\n;|.e\"YL�s��A��lj�:=@=C&/�	���]P��O��W=N/0�{	�YBò�d��\"�{�����4�0aS�=U��Yd��D�u7.t�?�����5H�Qo��J��)�^]Iw���씵�\0x�p���ځ���<!W6)�D>��x��\'�Ωi��q�飈�����B�?�^:pK��������|��@������������Qa	�aV��\0eK����a1QF}���i�X�i$��Ϙۊ��p�8���֖N�2^z� $�\'�;GH�o홧�GH�����(�N��mh_�����B���>8�U��q��S�}�Ȉ��Dss���&([Dm�����*,���.5����߫����J2��,-Yo�j���+����߰�;Z=�P��)�d��ӕ��d4\'����p@�(AV�#��]<��D�.���?��c�)f�e�-��.w]*���%xA/v�ѻ?���;����)� �hn���2����T�Dٟ^���b�&�\0zC���bs`uz��E�q�s(Uia14�t�<\'p�Q����0)�$J�9�rz�ȫ�W��0����,<K0�u�>^P0#���<�! ?�۾�cj��_�~��=�I4���A�L�R�@�`�p{uM��?t�n��j{�cs-��C���mC\'�\nTc̜�b�<�ѷ�u?�*�}����A���L�;,��,��=����.y_�ƺu=G�� ����e~��qDjWן�������&����2|�3͒J��i*��)��#�o���8np�뭪�;׳��v������� ��x�f[�n��>u	�����C����L�Bu���8��`\0Q�r3E#�C3��B��~ګ�����\\3@��ɩ�n2�n��&�#�i�d #�ޡ�:33��m���08.�\0X%�D�C�����Pj�#L��\"#çχ@\'JKm&�mFA����X4�ǹ��]}rZ:��B�y`�l+���m>�_��Sl)8k�K�Y���NF�V���1 A\nI�p�3����jZF�q��\n����Y��#��G��W<����.U�i��Z��\0���Ɵ�F�EP,�?�@9�J$���!���῝����D\nx�\"�k2��EВ㙊���,�$hv��Aj�r��;�`.49��0J,GݕX��6#�\"���v�;��+���4�$AO�#�ɱ@��*F�B�^�w��l����L�3��|���5����p�jQ4���:�JU�	M�C��?���ۼ�\n���y;c1B����U�\n�t9X\\�E�;��)`\0u�<���Z�hus�;��!Ѿ���G�����b|�dV�-S\"�?\"r�C��Ǌ��\'c�0��a>6���mq�~��������R�E��_�Xb����wh�\0�n��ُ��8S�\\]\0��H��Ϛ1�P�d��e5�g��\0�즶��D�(%�c6�fyDX;Mkz,���~5V��K�h\0�,L_V�\\d�}�2%61U:߱5�\\[�x$�t�����=�r���⪙���@�3�쀼>�x��L���E���ht�}@Z�qZ-�e)MO��쁫8�iـTjS���zH� $�_�hn.�	f{�Ϯ�s��u���?��G���S��M9���4�>gP#[��^��\0�(�%�Ї~\\6��$�;��R��q`c�Y�;\n���J|\0���ѱd~\n�ƅS����`�EU�(ب@s��������@�<�4�����u�~�����Cd�,1[��0@[t���B��G\0�G���N����� �I\0t����5��g\\�NC��䳼27(\\��tO��{+���S߷�}�rM� SH�K\"�����͋�$\n�D��b��p�!�2G����5a|���a�?;��њ����\\D%HՃ_Jց��5�*BٳĂ������m;����P��(α���:�/�x�O>�f�u�m�A��e2	xl\"H�&Mdޓ�PM�(�y�(0%ZA�`b}TX�&f�����ܮ��=~�0���[���p�t|���i v�)��~K�!K`�؈g�$j0R.����Q��E3��ƛ7���=�̋��G��U��x�u.kQ/�t�<��o~߶�?j��_�Y��t��çσW�t+qP�r��x0���F+<_lmp���-\'U����ek0[o�f�1WX�c~�S-��d:�\n���r$���\\Y��eU`��܂}��)E��2�+�}�S��ׯ�9\\\\*@S\\A��\"J���z��}�_J���P��#�c�@�����%\'k.}9����4��T�-c6�6���r��$CIc���]d��l�zGԲ�D����`2� O6!.*�ԻDp��3�~8�����	�ݡ�RN|.��	@���: �0^�Uz�HI�QД9��zֱ�f��}M!�=�O�\"P���$��a]Ѭ{�F�_Jpݿ����������+�;HLp�� LQ3��8��?\"ϑ0�c%{��A _���n7�`:(�3q��� �p�zz�pU�͛g�+ꭦFKF�u� {t�?My�|��<��M{���G����X�.^�\0hU��f!GF�c�^w�&���V�%%9&k���o��)�װ	\\cZb(�Ez�P���ɘ�th+�5��[�=~�P濫3��tt����΢��)�%���0nS�TR����SF��E�h�u�ڜ%�y<�����S��HQ��ƞ;�a��Vۊ�+m���-r�NL�O�˻wby��[J��E�7�%⟋�i��T(�ܕ�����W-��XN�-�;��}�k����?`�+�����>\'ǀWY{�k_���C����%(��M[��*��hww��A�t\'�����F	>���xS����\n���RЉ-3\"X5�m�\0�4(^�}��Wm�]��T�x�R��6�y�]���՞]o���ع��+��{̞�Y�t�D����ܧ���\'_v�e��&�z��^��7�j�a��=���/l\n�Ӂ~ Է��D��W@�4@��d�O�~���04\\%D~�d>!L�tQAh 4`X��(=a�\n5��Ƌ#�ݰ�{�Z���6�[���p�[�^�ׂR�e~�$&%�:�`���2�P8�͖.��\0�3x^��xC���w��-з�lM8Gw)���Deax���X�Pil�(�3�I����U�Kŝ�*<x_�nՍ�l��()���ĥZ{}�^xؔ�cv���\\�JDT��8,Ħ�4��h\\���%�$��,��r(-�6p|�u��d/�*fW]7��|�-����,RS��3Jfm�0�_K�k��d��@g��5`%I�L�a��?6���[?��=�|�����D~�����%\0�\'�G�\'������w��9fv\"�iLe��u\'s�����\n@9����m�g7�C�l#Rn$��✜��#��۳����������Q��4�(Ӳx���V.���a, �]3��E��3���nb��UpK�<�h�*�ӳ�6�Ԕ�-�ks%	}�,w��(	H#�7��z�E~Y-��ޏ�GL��I �J�x\\}	����@���u̮��f7)����w�y�*�!$[u�R	��_��x����A���:]L��ԙ�Lٻ���Y���g�-(E�|�t��kǫm�d�U�4��C�����PJ*/�)����|��J�ޑ���W�\"`��5�I-���8>-,�9a%�(|���yJ�)�#�q�ƹ��9�^���uʩN�@B$�%�dA7�֊3��.��x�G��\n��`����Wd���&���~Rɡ�>��D݌� �S?T�ZRדg�����Xy�ɩh�0U��{Im�\n�8�9ij�i�Z,���Q��*;��V��N�\\yqO��>>��K�,��d�.^l�54FV�͐�*U%�\'e�Ͽ�\\i���8k;)�KG%��.�ʘ�w=�jP�4F�Ө��\n\09e9�� $k����F�DMǜ���;��>ޗ\0�aٗF������e|h`i:��Qa\0:\"��w�K�I�E���*�\n��l�ZkEF��{4�}�򅶖�>*hx&�#p�&���\\�=3��u��G���Y`�G�͡J���[4�T�og�*���0r���/Y\'�	5ϥ,������t��������)�%���f� 21�`�<�d��Ԗ�H��,����q�߽�޵��l���zdwV��MTc;X�Ĝ��[�Ud�L5��[���d�=��t\'����^D�z��Ɇ��`T_�t��߇]A���J��}*���¤���v��Z���Hl�N��QK\nx\\)�xe�W�:�K�?�￶/sm���k��+n���+k-�r.}JڼN$A�\'����P��\\S�U�2��2���P,�^��Sǔ $&����C��`��Β?�����_A\\�p�CZ\"d��k5̓$~Rcb�6�\0)k#�pn����� ֠��1�Q�UC���z��nJ�I�۵ ����EqD?�kW.�[o������+Ob�~�i\"k�4Y0��x~Gr]]�-�v��y�!;���\0����&��n2!mTx�>��Y(+A��H�%�u�g���}4�nF~NYS�pӥ��Ɓ���Ă�h�>k Mv�������9���Q{�M����fr�w$d,΢2~$��<��׬�n\0|[>��T�n�uOڀ��:����T�8D�a�ց�y;�%	,���VN���	��M��L�Y�R��>l\ne�l���iQM�0����eG�DW�Yr�E�\n���������������h�#0@h�S[��N�q��cԿ��BƝ\n; C���=̝=�m�#G��!/@čJx��\np�R�F�`{�:2��|���z442(�~�b�ir<�	��$�@t�đ�ߑ�	p���Q.0��+�o^��������\0���!�pe�NM��@L����@�Y���=�����c�Y��\"D�lu30�jb�Aq�ɲAH*���_,@���_�A�Iz]Ɛ^y�)*{0�����Y@�d�U\"j�HHD=�����^@k��Z�Y�`ayI�8�ơ-�~fjS�]�^F C--!�/���C#T���ys�-���rz�$�i���E�Z�Sр�\'c�|�ʱ������.��&T�<m�P��KTXp�\'��#����&gJ31~���n\0mݒ����E�ʅ�_;~�3ku2�72<�b���S#��Y�l�(;u���7,:��Cɜ�i���\"��d�yt��_���A��3h�i��h�����>?r���h|�!B0�b�F�O�wt-��|H�W���ؑ�\'mfv��n���y��)�����~��%E�����-Vϥ!M*Zs==�;�����P����[�\0/c�������\0�����` 	�.�<���G+���8����-\0Jd��9���͝��0a.pS��U2�}L}٤���D4���u!���)cLe�*�귿��S\\A(��	I��WL�H	��������zy2O��g���ы^���t�g9�w?���0���k(�V\\ @\n�T��mB#�+ӟ��u\0 7e���3Q�f8�G$��8zWQd5b@�U�+�Dq�G���e���xWFe�H��Z���������O81)��w-uǹ��M#�/\\2���w��+�C-tf����I����X7�gZ*E�?���H���C\"�ϺU�m�|4����3v���,������WVN �����a\"�}8���ޕ��s\"\n%�t8�G!P�&��IR�� G~%�_�U��?�9>9������޷\0��401W���86�Z��`q��v~.`�I��R�E�*,kH�&!u�_������Ӷf�FgW��o��N_8�T��L�%�YZ/װ�)�\\�Pƈ��Ở2a�F��fZh���h�/T[n�Lt�\0���Kp�)��er�i�4����ҮǴJ��e*����1�ZFj�FinKj�	����L~g	|E�O�%���ذ`Yx9�S&�zC��(B�J#7����7��<!���-�E1�~AR�*q�Պ��/�FA�H��-Ԋ�s�ӕ��2B}]%v���g#:��$�}vaթ��<�&Nx�c��wy��h��W���y�/�=U`��/<���\"�	��r���)x�]n�C���Q��_�@W��[S�9(�̡���D�����X 3R��D�Jy��P�O�#!Q/������A�r�{���`���,� �pA��܉蹒S,#����U��,η������AZÒ�Rvߍn��ס=A	;�(�|�d3�~gFZ�-\"T-s�D�m{�E�wզ�yNY����O���bm���Q��Pa����<`��pm-Q]�h��<]L�qg,���j�q��֩شs��H2�������Ov�}�6)��LCE�<�X��y��LzO66�z��!N)��)\"�Ԋ���Qc�v��g�*p��6��Qh\"b�	� e��6G6�E3\n�l^9RGH�s�?���l��]j��{����5X;�\0��)o���%�%.mx�X����2��� �#;�$yC#D��nx�r�B�t��*��U/sʁj�dwo������\n�e(L�%�1:ޙ�k����QB��%�%�\0X������h�o�T�~I��<Z�	b�����`�z`�����9�r��&@���pATw����2�1�j�KJ�n�@/>�����,�9�R��y��^\n�^��>W1�;{�������F����eG�l/�oaU�+ІJ�N�4\"����򻥷7�u s���=�,+<����j���˛��B�cu1�TDw�CP��#�+��	=�G\0�|\0�\0��f���|�4x!����*HN�5R�vi���%	x�%v����JN�rxIZ}H�[b �L\"\"��H�&T���9��d�����HGߒߩf-�+38�-�[b�l(��Zd�/[~Q^9����5���%u��5-_vV�^���<�YF*��=c�IQ�Cca����{M��+�?���[\0�KKL���7~v�z�;�R��଎[;}�ѩ>�8�2����LS�p}[��(dv�Ma��Cx��8z\\96\0.O��Lj��q]�l�m�n#x%�����|��t\\j&p�4�\'�\'7��߂�N\"YZbj�[�|�6�Czrz����q���1<�I�m��y��i����[l�\'7/L�6��f� yoߙ++}��=�+��Ͻ����k\nf�#�Z�9SC���ߢ�5�5\"��E�+,%����8�����1�C*��t@���D��줱ފ�N��=	⣩`=�j��RJ)(��;�۾�u�@���g���l�TFMy.�N/�iK)��b�xoL��?k���M��𶧰�lW\n��U!��2A���yg�̀j�����#h�����	;F��NL���|�V�Ɍ]�lR�\'�Bx��G�T��}��������~�T�/�c�I���`���-������H0V	�������~teh�!NZ��h�@VđM\nB$޳��n�z�\n�:$��>�y*�D�!�[��	����;���V{��v�X-j�����8�!���P~��6���qB��È�֍FG��T����C�k\0�H�ipz�{�	I���S\"�E���Ib���/I�d�X�ҷ�h8\n�6�bc\0V�!���$4��a�]�HR�2�����5[���K������ɷ�J~7����4,l�(�esRB�U�5ۃw_�-��T�֧���f2�T;v��m�u����m��:�?�;�����2�\n���[����pYi�,DRfJ�A�y.D\n��ɣ2JM��@E7rJ��\",�D@��eޔT�BR^zV#�0���{��!\n� hmm�����g�[H ������ߞ~�D��	�����0��<��醙��\ns��a���7\\�4��e��UtOp�_����qK�2=�ہC��&\\dF�6���Ez6�A��٢<hߎn^����SW	ntז����z�w�$�W5�v�g���\n��GuJ����Y��`n�}�R<��Ce��]�����d;w:��(�iǍf\"�{����ʵ�2V�d.�C\".\"�P�ٹ��oW)��P#))��\':�u�IK�ZZ�Y��ǀ��������>����h�Z	�e���?�z�~wXEQ�o��:`�:���;���ض=�����t$G���A`O�t��~z9����FҐ���d��F���8��9�\0G�K}n�./����l�����e��}��}�_�ܦ\'�\0����C 4�V�uq\'F�غ5�����8��J�H�>;������{���V�ϲnc���JTt�6l�����k٩E�&�{(Q1J�$�\'e2	�i,�� F8���NFV��ϝA	�� �(���m��������d+���X}�Z��F\'f{�C�5�$�i-�����i6�=c�$�n�pc��5�V���a�w�CM��)kƍ-!.�ʛU킿�����?�e�dW�6SQR�HM8e#��P�%�7 ��c@��S�Vp�v�T�Ah��I}EW��%�)y~-�HZ\0�>1ۙ�M�5Wo���b\nmye�Xg�80����q�8�|�s�h\n&��93�67c`�fi%\0g \nq��4��	�be��!F��ym>յ�U$Ш��xҞ�h ���uvcM�ߟ��z�O]�Y_P�,��D��p�vܺ�&�/)�X��O=���)<p��:�Ct�F��\"�k�QZJ��/x��\\[Pz��{tAХ�l9��8:�@�k��=o𩼬��s4�W��)����9�GpSC7�3C�w�{nY>�ܣI����5������%g�֡v�\'�X�2oJf���,i�ƣd>E_�i����ʊ7��3�����F�|z@仿w�x=fdo�\n�h�Z����\nk�q �� /��8�N���F´�<-�o��)��]�q����TN�_��}��#�ѱ9g�Û��{g��X)m���k���+��P$�$d�)�w�S��e�剚�i��ں�m�R���m-���hG����{�<��H�G�\0Ԩ���I��R���!�S�&��W-�aw�q7�ȃ4�����\')�Ӡ�l�z����[�:�glL�u�Z\n���b7�ϥ�\\C�BQ�%T�ơ^I��(ua	����H��#�����T��F���@߉ (SR.�Á�9�f��������i2�~;���-�.�?����f ��6�?�\n�WVV\n�#�\0�\\s�)������͛�[#x7q� �#��H_L�y�\\����N���1��\'�/	vr3�$�NW�)\"�����<7�C⧭!߽IT��追݆{��tŶ��� �j��%P�\"�6�n��6[<;׶�r̺Zz)u�\0��o�S�4��i�������P���cX�(���Z�PR��T5�8�\0|��<4�	?��7�����F$�%��T�*+�`)�Dі�^T�.Q��K�d�<�}�i��������PՈ��k��u3�A2�{4��%�m��ol<�aR�v��xjd�mټ���L�o)������֮C���塕�����<k��U����b��e�7�fD�8�%/�D%���U5�/X��{���CL|�`b֝�C�_��l��\n)�ຖ�㹚��(wkb�:U2Pb�%8�����3�����oZdL�]�CW���T	����1Ԥ`;���B�#5�MNX,d�-m�1���-^+ϯlDe�g��/@��>�e�ɚn�z)ÌC�`��ǚ�W�Di�� ��{t�8�\'��(�=���p���h����G��������)�p�F�藩b����xhW�l�a�����i��NӐ0�S���az뷚���<����G�{o����!�P?���R��\n?��\n���EU�;�����a�#�]#�m��`2gZ\"*���p�D���H�7(��Zd����p����Ϟ�\\PqG��rZ���ۻ��.䵍�<�����o��o\\n�4���}�&[��ƚY�S5���� =D>�ܓ9�a�)�����(�B/���rv	�����y�������zhǤ�fS]@$�Őn��H���$:SD� ��V��w���:���֢�I�������*)r�ݳZ�/��\"0�rV�>RK�N7���� ��^��}�Ы	=��^����uX������ft��A{e}_�֬�hK��w���\n���u�K4\'�!� ��\n��@����`���\"����������Ϗ_DH��=��\0�6]xz�Dhj��DGWDhF~�$�db�˺�\n�$kR�7��Ӻ��8<�틋�F4�5;��ٗw!o����7�1�E��gJ&+�I��·�Ă� \n��+VCB.b�<���d�(���/vL�A�~E«I���;��Ǟ�Ç΢��e�Ng�q�U�\'�OVHeK� �$,�X�;�u\'$�����z�4IyT:FM��/�c#^�Po���9Y�i	\0�aX$����ф�iv{k��j�BM�G�p�\\��g��P��䭳�>+�\nQ����|@��%�C,`|ؕ̚��(�g��4<P�~$��	���d��<O��P�I�4$�0�Ϩ�*>��\'JQ��x#���wA� ���>/���������:?��p�P�t�]�v=���o�����u*-)?[z��o��@o����7ø�c�p�<e�>IR8*�5�e��)	�r�1�SkB��}���A���S�����v	o����d���v\'��!�B�$jm��*{��M�ʋM�ԏ_Di�-_���}#S������U�ú643(�%/���_�Γ�������f��c(���[U�̝c���}�*�QQ���VT�E6X�l��u�#��RY5j;�8\n��ߒ�f2%W������-چ(c����a/a���26<��x��*~����	�!i]a�YǆG+V�E�g�G��iv��g=�@�2�tna���������Ψ8��ɫ\0�L&��kh�@��	�<�,/U����izy�x���M��A�P�il�X\0������{(��\'\"��I�_�<	�������#dR�V��m�J�hA%o�{�OP��v��JJQ��������[h���̉R���7,D�z�z�-{��WiN#��2A�?Ja?\\�E�$Ny�^\n�Ky^��ۣ��>�N��%`��?��󐡑��b�XY)J\'��쏥e\0��X6Q+I|��G)�8��F���_�bV��EK�K~�Ӫc�蔟%���ƻ��v���\\��[����` �+\0g�WR�i)���ŇDT�g�����,��B�F�ȏ�&q�L�q���G �s�K��w!h�5�^�Y�J��W�ͷl��bO���ELk@��e���%؊�>+�|��s��g^��1���@�S�������<�����k������ߞ{�E��k��Q!0���\n�uV�}Oʓ��b�*3{��>���:��S\"���<�l]�[	\"0pd��!Z��9̰��N�e5L\">%ϲ��xJ����6�����t	<`)=�8EI�\n;ivY�4��d\'�5��\'��bmi�/��	�aa+&��\\�ha�p׹i\\��,�=ۃL��ך�@�^]�h�Y�k�Qhy�٧(�۬9h��-����;�0x��O�5I�Y����迁Kw���l����I6u(��$��� �ة���@n��MᏑq��O�8p�~��\'�|!�������/��	n�J#-n�2��A�\'*n��/β�k��I�[�u���<�CVvN��*���=��=�]�O��z�m�q1��:{ײ�^�-�ODǊ�e���N$��U}BM��կ\"��<y��k���w��7�|�\0�Ƅ\'\0�����p��<ZniK�,v����O�N�7��Y84�c�ݰƎ4�ɺ������},B-��������)�3�@Z��U\0|�����/�q���|�����������:���;�-#�+&��~�#edTB����彂�~�a�bM�m�v�e�A�c���V�$|�k{(3�_7���~1XÉ(@��ٖ�7��؆��A7��5��9R2�K1xb�EfM��a6JKf�NÖW_z�E����͚��	/��e���}��6m%��9�4�Q�Bk�JH���sj�	/��&���cq��k����眦ď�j��{u_}���5,��;/���[�PĒG �E�5�,6����\0^�,�ʫchp|ngz^�Ζ��_��ʐ�	�z�ݣ�	�)��c��Ccrr!G���u��2GS�2O%�l-2K�=�D���p�6�_�b��\'-�5D��υS�Fr�i\n�/��h��4.�7|E����_0%fAU�x���M���	|$P\n>z�)��1ej��ډ\n{�ŭ��>[8g�\0�!�u��ʝ��\08�b��ى�y�1�$�GE�Z�[-_:���r����&�N�RY�&s��Db�U��ɛe+V`m�`é�Kp�7�E<�� ����L��N�:�f�7��4�;b3wZٜ\"�͸�9x��v��j�f-�eK�3I��N�0�&�s�����_�fAo��ט�a���v�vA������u����ٞ��n/��v��\0ҙt�<2Iw�zl�@NL͔k�]kp��Wznx?�S��]�|e�O��r#P���U�r�s��/!vrN�O5������_��a�:���N�ֳ��NUJ�0�V3��Д�Z��mޢ\"h����A�/6�3���/��	0x\"���M}��	���NAh\"��w$݋.����m�]����>���\0����I�QP.Q4!�l(hXw�(~G�=c(��*�j-57��|�v���${aZ����p�b�$jq��m�=\"AA��<�B\\d-#W*���(Ǖ��Qk��r:y�5cH��цF��X�b�$����$�ӱ����~@�x�d\07����˙}1�p�����(���_X\0O�����(*����i��%Kc�la(QI�=N��C�q�j��>��V�0d5�!d@ŒK����\\��_����o>����I�B�]�h\\1�Il������}\n\0��QYv�k��ۭt�\"X$N\n�J����;��\'��S��@葲�!�1\0���u�Q��`�,�.d������;8�ϴ��S0�~�w�~��>C�\\�1���Q��(���U��#Rp�~鳿b-@x�,F��� ��~N}1Z4%��Ps�y�#�$�~v\0��AW�M[�e���-��C�����E+*)����[�+3��O�]c�c��K���#��p�Y\"�T��Ⱦ���:G�9n�Х�g�J���YVy:����qm\"&Ԃ���[����a޴���+��P,���,�/\\��!�Ԝxg�A9�&��/&��4���A0[�?�[�izv�?58r�{��������G�G���I�m�d����-5!9JUH���0�&��?���o�0���(�Sf_����B\0�bY������B��8Ԍ9_x�U����Xe�C((k���:Um/�G}�u�8�e�����:��U_�-�[m���V�����,\"�D������{�]#rC��ԟf��T��o����2� (���I�W�Q3j��u����7�=n_���ܐL]T,��.�7���h�OC:�Ͷis�e��Z�h�t\\ZFOUs����������\n���\0���W�_��3�)9uKe�SQ�3�l�pX��!�ą�\n�s��aw�=�Ma:J����ǂ�@\'�&{0�@�݁N=\n�\\�B�8wy��������Ʈk�b�Sj��\"��v�mv���<د��E��F״O��&n��>�V���z��Hw��%�~h3FSn�c���T��)�.�͜����&v�iY��MӰ�Ɍ���)	(�ۍ0��!���m�р�a��n2x.J�ee�VY7�Bes�ۦM�\\O�	pn�l��챆�j�j�tRa@<&(��>��ǀ]tJ��e����0DW�)�1.�v�\0oJK\n�\\<q�}�ˁ�AR$6P��+��q���*��e�@�o/e/^����=e�^4��8���AY\']@]s���k=p䨕�p�=����og�y����$4,N8������vTj�樃V�e��q(��K��4�\\�E�&�\"<�2{}}��h9&@�dx�A��I%|�����Y4�qI�k���^GwO+��t�As��ź!�ƚmm���	��ԍ��U,�\'���9�c�e����5A4P�y�����Mr���-�\n!�+5�	c]�;2���X�͟J��N����䚉��C������-�+2�_��*j�w7U�&����ƃ�(�g���z��oO�K�TL�S\"WΨq�e�yޝt7O�C7F7J���}I_���w��Q�kR\0d��N�;��.b2]=�8�M���伏`��I���\0�R*{��O:|�wImm��ܖ�\"�IT�s�n�;g�<�%��+tqE����/[IF�FW�j�-��FS���\\��N_���_�̞��v�ìNgeU1����E����9�=�0�ή����,wmr๶��D0++�R{�W���Ш� ��h���3[��)N\\5�(-�귃�f�^^Zlg�[��\\d\"p�hd~n���!�ݳ�ׂ�_0��{\0���H�o�Lo���&܍�L�s���bI�����������k�>���#����,&F١�E�9`bai�c/9�H K�D�>��	2WaS�KK�t��b�HH�w���5[E�͛=�Q\n��ܨ����͙��n��fZ1LQ�QE�P���,j��3��q����9��/T4�`%�����Xi�r(j-f�l�tv2���W�!�������v���g�c�� o��<�=b�Ht7���A����S��NHg�t\'=��6���2�)��dOLt桨���ŋ~�J��/�����ݸ�E���X17)~�\nK⹑-�A�C \"�Ș0���PD��[�P	Ĭ��&rX/�y�T0�	}���Z��^r��JrX\\Ac���e@%��T{�΅�;`��8>yi�s�_�~�r�ً���8�^�Z�I����7�z����ȫ-�&�`߸��櫮OW2�W�)����a��@t�������x�<���_{c�%�����N�o`�A�O��D�W_�\n�^���-�掷� #�,6r�dA���>MP˲���vS�IX���d�E-�c�o�*��e�d�v���a[�>�/^\"���ys�f=}�	���d����D�t�����}�=z�	7��,���+��D.x�/�^�b�F�b�{����������أ��A�(�i)@8�c�<�6aڜ��w��I\'���zN���c��h�*N�����M�Q��u�;���,]�q�LX6?Cx��GNЛk��#�R��J�T�<FL�v���?,�6l�eg�Zm�7ݡ6��L2�5T�1���g?�&����]��9��²��[�Xus%����~���p�A����`?D�F˄w�Q���𮜻.A�>��\"��J���*�=�d���וM;q����˖��*/��F�[a{7�`<2��2�;21���m?�_���%3~cb��+\'\"\"�Nд/����+����㬶��Y����d	a+ϊp���ư�r�]F�q-/?�~�����TL ����ۅO���Loc��V��`8���+Z9�x�C��\\l��QK@�#Z�om�~�r�#Ur�7�������[U��d�7����ge��p�}H�q�u\na^����1�UK+\n�F+��@Sa��\0�CCqIR��I�<R�d���La/:����N�@r}}�+݂[ ͙�G�7����T���g%k������A\\5��.����A~�!�<��c�R�y�62+��a���fc����Nt�@:H\n��z1�����WA�mè�ϼ{�r6�����|;\0:؍W��CC��\"��h���y�m�q��(���N��K�H���&����G�Bp�4�����Oňn\\}�նy�Uvr�^�>���+�	�ՍQ+�kN�Y�V��䞌\"}T��S�1;�˛:��Mx\\x�~��y>�\0�`݃ ��ӷ��L��SvՉZN��~|��H�\'��i�Oo��}(�9�dp@(]y��%A��/�h��\nf���Q�;�;���Z��p��d؊������蛌OJ�Ȝ��5K�s<$�ӿ�w/+��=��{����k��Cm��!�|���!�m��!Um3ʘF�]��F\"�o?��,P�p�O�z�Q=evzCW�\'�����f:�����%�>��YER�R术���_z�H�\\Fn.�\\\"��S�eS$e$���P���+�@�`,uKz�N�Mp�\'H����B�2�h��	��!|Na)X:6_�E�#��*L`��qN!��l�>�\0��#T�t�7�?�����TS6�<?�u�$�3��ԁ5{�LI�j�\'���������/Nb�R?{D�o�ͭ>O.~\n��&q]&Ȍ��7^S��zZB�85 G|��ܺ\'�(�i��3�I��Y?���;W~��\'���@��s7c]�3��SpR,Nq�D�Z�8��ր����ণ\nR���& ���lD���!�\\9yv��v��ؒ�@f��:F��\\I�%0$�b\0&�}.��*�{��K:Lx�0}-=[��t�=�|�k��RVf u�K�RS2x�t�0���.y��B��X�ga�Ł-$CW(�RY�e��;�����Wf^����Vk��,1�}�^�����U�4Ӿn�.��BA;d3�&�����AO+o���|p��P�aɺ?>��O�3U�5:Z[0�k��+�`\"���f3�M4��=R/�I���N���r^I�\\�;t��~��B)�z=B}�C���KC�(\"c8��N�pz{���1�&g�`��d(@\'����BK�@F^�`��9}�������Ѱ�tǻE}�M2\n�.�r8�y���4�x\0,Zh��Il�v&�1q�!E���y�W�ዃ�R�dv����&��ǩ�g-��\\̧�����	�p=.\\l%3f:�&��L�2����c�&�@E&��Y�T��P��$�4�Y�1<$7P��8�d?�@0X�_I��K����.V؆�E�}��Ï���Gs�&L�\ntX`��e��;S�k��5��zwo���X�욷�}�o��u��.�Y���ק��9���2��O�RɆg��ݷn`MQb�4��S��C�rB�VU_dz~��ӓ��f96�v�H�g����I\"������>��;�u���)W9�}̓��唏{�EC��V--��`�=�n�r��D}��H�G�T<�s\0k�{;]	�墍#�u��ֵB��%˔ڶ������B������;|�N�]P\\R7(	�-��M/��~?�I�8L�ZH$��>礎��y���e�	��?�?9r����)w�����#���.âU7�p:��s}+�Z2�S;g~,�~�ɩ�&L4ޥ��5����ۼ�9\\c;p3]�.#��.�˸�`U�H�	s�!�a��K�\"��	_�3�k�6�<J���u�\\��0竑�	^[S�bF�cJ���$�&�H�y?f�2�ncP�8�?�Z�-]4ϚP���tAH����yy)xy���e��3��ј���=���SN6��ca��!�\'p׭^��djTK�m&h��B�����:O�Nô3;OMҫj�8�d��A�j��k�Ç#,/���ݒ���cJ���>���B�X}�P&������b��C1�|<�7�q�i��\\�v���+3w�����!c�+���g7�P��=M�%�� �^sN����pT%��&\"���e��k7ڪ�_o����[Z�p�z�A�h���g�NYd$mKu�Uɰ%S�J���kH�����A�.q �g�,\\��F�����!���PG6=lWm��ܔ$w6v��!���S�r�%���A��G߱�]��K�TD�D\nOD$�#`g�d��L!�֏���S2�����%��7���	�/���kO\\.�������µ���\'Jd�	J%?�O<΋����3�fC���,{i8����}��{�5����������o�^M����)cév�߾��*��Ul��6�J\\�R�/b���^2�@�.���P�#\0	�b�>����5=���k<BAR�jRǕ%\"֗��b���J��h�i�T_��E�}��(�b�ؑ#v��1�los�]�ZkWo�d9�Q�{�g�Ӣ1��&(GQ��&[�f�=��+��_n^��Igl�p�B�����b��v�����Y��n�[�z9b�^�u;MpT7���6o�B���{�	���q�єT�,��K,.�i��y�]�i��X��V�=ϐd��\"�t�jW>���o�.�Ք}z�\n|�c#S����W��YVv��/7b=��O}��v|��o���e<\"�ܫ0{��,9���=�-Y�/�d�@��֓����m���[�1°�r�g\'��B�m�1CI;%�t(^��dj���Xa�k[\"��k��dv��|�f>p��n��>��/|@;r�y�>J�d�7�>�}�3ˑú���!{k�kl�T�	ȌD^+	n1d��g��-7����+��?��3&��e;\"���y�]�Z�ٳ�>ϐ�R�l_SIS}ዿ� Cǎv�^����[�d��*I\'�g�yQ�wy�V��[Xg����Bw;yZ^ 8,R�j�#	|e���LHgDAX�����:X� �tV��~�k+����*%ٸ��~2�S���VXvb�=x/��͉��j���@}J��7�m�_�\\�7����\"�.Ib{\\R����u}])!ӃNΧ�8��60m�4�)��!t!��TB����B�y�i�\'uY�����U��tw�z�fT %X��jL�Y�cXg�@f����4��)����m��,B���6fnn�e\0��쁻�r g	h���ށ�W��RFm���Io*��z	<��Ëք�Ɨ����dP���\0^N%x�� Y~�U�|�,W:�|=��Tܻ�޴�]�=���v�i����m�X��\'���*[�n��_;�n�����U�V>�x��P_��I;-5HF%�͞U�Zw�\\��V�\\����A`��l/ ��ʈD*}6�S�/�^ЯJ΢t&��<�6���\\CR�����V~�1��$��8�	�c��\'@hx���f�Dw�Ll�AB!�gKk�u���YV>�0�Pz�#�k*/9��,B?�Op��P���=a���1�Cn>�`�\0��w�5��3�����۞��l��/Z�y���ڴ�n^���6m-�J�ɏr��\\X>r\\�j��Y��epY�����2����x�*V)�I�,/G�s(o��m6��ۊ`f��Q����x���x��%THI��Gi&ʘJZ�UuM�։��IZ��r]�L��aӕ�]���(��9o�K`o���L��ݓzYd ;T�=E�7��07�w7¹��2��;�݉iY��Rr_�-R���{|`2@w]��X��_�:�끡��������*mρ	;w�M=��of����)8��倛�&���}V֧,�e}\n�Wd��m�\0]�%�>�AX��I�5��f��jo6;�UK�b�y���9�׫\'$E�R\"�_W��\0e�\n���i�ץ��^�4�	�n.��e`Y�bR��AIr�(T�i�)�p�@b��[���<���_�.���q�d���s����s�^�?\'�~1Zf��a�Md�m�*����O�X��ߣ4��n����[��s�m>dc�	��-%}Q��\n���v\n�}�0�Ƹ{\0���d�y�Ȋ���W�^�z�6����\\���q��D��mR�S�z� ׻�Y�|�f�-_f�q�rC?k�̏w�k/���i/&p�k��%��?�	���w0e5��c������g$;Ldٌ<��/}��s��ϣ�/c�BR9�⇸��K�E�Ýaܠ�}S�7����C�C�D7��C�\'�+IP6�lNI�&����!�D��\\]��鷟�z��5��\"O$#{�	9N0�R\\v�y�,�k���a��Q��?�k��S~��W���\n��\\��&<-;���d�|Mm�HJ毾��-j���C��(���h��y/��4.�?�2��zU����Y-X��i�-C�~8 .T�)��� ܩ�-�`���gl`�OB�B䯉S⦅\nu�p����p���s���D���;��jePF�f���-V�HLB��A�C;A�BV�X��5чKMA2J��p�^5��\ntw~D\\e&�\n,�cNu���3<F������y\"OL�����Ebx8��C_uQ:��[9���J<F;�,��fkjj��h���~��4���-L��g�Y.vڜ�%��Ae6%���l\"�\0TC�%{$m=�f��7�^#�p�׫f�L��L8�s�>m�w�j F2*�&҆H�^���)��r$�HTT�/0�p��:�D��\n	Pr�����Zh	�Eg�ƻ��˗�m7B�;o�ݯ���ް&���¹9m����ϸf�F{��O����)�����ki$R�Jٻ��~��\0�g�\0��/�\'Wl2�g���$�bNV+i��N�+�k6� ���r�r>t�i}���O���uE��]8;1Zt�ȸ\n]����YY����*���ۭ�\\\" d�n^+�/_f�9��q�¾g�	��\\����	�\00������R�t���N6P��㭝{�ѨK�L�]��_[N�i�@?]�T\0	Y29=��\"9m��-U��=M3����x�T90�/��Z�9�q�B6��z�i��\0r�=��7v���	J�T+�ا(�N5Z�|�bK�H�����$\"���7��elS���3���Q��{b\0$��F���eh����X}.`*�\nN�Ov�r�s>��?�B�$-��ay����)80XAt�,N7�<�쥔	t2R�G]�2�Y��9��C�w�U�=g|%���a�A@&�����$ɇ��&�#�l#�7�צk�L%F��x2se5�Jo@J3,������ڷ���*k���9K(��eu�虅k�]�D�k�멲�e?�LT	L�N���F0t|+c��r�j�:�˭\0fh$��7��;��8�b���\0��h��{}��鵭P;������~�$��օ%�륊�b�<[�z5j/ɞu��(���z�q��1�/�y�Z�c�M�\'W���GkD�#|��1t���:P�a��aT��\03�������(�l;p�����s{��P��s���֐a��y������e��.��=�bb��!���Hk��8v�))�X�~�2�-i������������\n��2���J���Jhj*�,�ns���!5� a�MxT�-�*�]~Gd\n(*��,�qe���@�\ng�p�����<g�L�/,e�{���E��E���������Ȱ�ܹL����{=��C��ex�h�˚�S�\n0�!���g�3���]�J6�e]nK�=���C6����)��e��\n��-x�6�ԟU��z�a����0���I$>|ã\n���]N�!?\0���f���g@�e3�� ��9�A��i�u��H�q�VQ�\0p<ԟ��/�b�S��Ꟃ\n�4��u�[&��A�:_y� ��e��Y<�N/S��Ɵ@qښ<o�c���;�in���e�v�Z�_�\\�8�i�~�-d�O�ɝ�,�>e.�QS����f~����O\\��ed�u��������Y\\��aŴ�R5�!��<[@�@���}��r?��81����u���O�2��\'�V�\nuټ���CY�Ԣe\0,��I\"�`@;I�C�@���8|��淗�<s��Ơ(j�A2�u.)6�l9��2e!2qr��\'A��N �{�#�+,��׃A�T����$�N���$�S��~�+CCN�MF������������m;��\n�AkRB���`cZ��e�U��i��Vzwa�t��!&�����w.�ӿ<�$}ޙ��[���n�닰Y�C����W���0u�c��Nհ�AhkM��[;-��例��^ڀ�\"��	���ˑ=�Ƭ��[�V�xW1c5h�U�QƠTP������(�y�-m@*y�S�n�F��$ԫ;-�g��2���Q�:��&�l�`c��7ʿ׭�h����`~���^CY���v�ά ���[��T���k�)�O0�L �B�����:2H�,C�St��Rs�����s�r�R��>k��d���i�W1��G�����O��\0\0�[�]h!+�Y3J��	�~��� +\nzlWU8D	,R�w�]\n�YXtf3O���]�9\0.I��Wa�w�q��L����7�����*�n9���_�e���[�ar�@����W���lhJ\"9��/\"� ����\"jZ2w�l�:��z���-�p��m�ҕ\"^�P���P	�dp���h\n�p]�B\'�����ex2ٚ=o6�4��p�H�U;^��3�UOs��]!wX�ԣD�R��w�ڀ��BAx����:�F��j<ч˭�+ؕ���\n��Xu9+L|��ge�YX�jkV��]k�brx�4%#�А/����.�����Rgj;�r��MK����~jYiyB���;�=d��6aLUKټ2�&�q�*O�ӹ�� �(DB�y��̙��Ui����T-�_�v��ԣuvjH\n$!�Z[	d���0\'�q^W�a{���)m��T�9��\0��9�a1�eC��Avh�[�����@X��.�Ii��J>q���V�6_nn����^5����SϿ# ��a�d\0�,9�!p���^;Uq���^�x�Si���A�s�b�+u�6�Ͱ��-%��9(�[��=�j���׻���\"[����?�_����K/���1�v��klF�T_r\n��%��0(�#��b� �E��V�F���c�u:л���mWm��\0*?�o��U����?7,������8\0�)�˱��� �����\'�}����r��>0��2P��Z5�,J\0�7_y�fϝg��{�������O��^����k����ωF@��^�QDN���JȢ�ʗK$����ZrP;���L��󲘊�uZw߰�u�9p�:Qj�%]L`0s�-����v�|�=���^R֕Y���ۍ[V�����͝G�����c�%Ŏ2ـƁ#v�����~�M�[���f��/6����`-�A������F�[��K6�A0���B�ֽhn��rh�\\Vm W#���.H���?� 2j✕d�#�Q�h��n��B]��ue;z���>��/��>�p��fb���W��&j�^�ʟ�tmH닼u-t8���=��K,a��Pr�H�#��\"�Dz�5I�J��`��x�!3\n�\"�4m�2�`wǝ�ؼy���?�*�~d(Q�)�~��b�\"͑\n�w�A�\\�n�eYEL�|v�讧^Ғaw<�t~������gn;�=�@�9edQ��4����zl���]4��[\078��3�,�t�me�<x\0�4��6��~O����|ə@����.F��1��F<��9�e�,fp��ݻ�Nn�SƄ��+o�B ͵{��|�~��{��91d�.]�m`���Kq�@�<*�ǠY�����{�ɝN=xٲev�7��-/�`(�M��ݲ�a�\'���O�np���k�\"� �D󫵳��s��a��d�(gŎPf��KxQ& ^�1>sStI��\0H>��^\0wy��qk�Eu��o)������@� �a?A7��,����-������cW���7v��c����KS�T�[�rіM�#�MލbN6Y_��\'�K�ؑ�`�<d�xb<����̏��/c��3JG�������˱���ߘ��}��9\0���;�����簛���v�	���Xm���&�����O㠋���VC�7v�����d�z�{�C\0?k�\n�(�Lstp��1}P�h����\\0S�$�M3\0�d4�������}���X�ħ�&�s�B�{	l�!��\0�C%�V*B!�|~�Z���8�jy���g9c��4���[^j�U7u�\\lH>��-_�]kU����\n}��\0���e`z�@ü�׽�Y���7ZWX�k��#�ܱ6쬶���N<R��	ד�U�s�b�(:�f�4SSY=>m�fn�.`޺���{���>�����.�A�+[��3�2�t����Ǚ�)9C�0�a*�Փ��0�l`6��w�����U\\�u�1����2�#�qA=8CmP�BԘJ�V����@���Y�k�ot31)&	�b>Kd9%��I�E\'k��`�^#�\0l\'&��f�e�ڬ�l@��f�H2�	G��@:nO<��r,��[�f>����	��o�EVTYFZԪDlS����)�w��7^;d]L�W��O�As��l25�uU��\"��Z����M����z����/w�*ɋ�^����1�G܁�����`��@�-m�\0���%\0&�H�����@8���������l͆�p���#�;Xg;��Sg+�����#�&���)��$hB\n������q��[��{W��I�n$���Qa��!�� C��4>0��y�Ȅ�^\\�B�W�çi���o����b���ĕ�g�G��\n���e&\n�}�N�!�ԛyN!�hatSEt���kԏk[Y��Q��%�>Y�S�o|����|�T�ƚ@�����j����P_m�@@�N�UJ.\0z�f�-\0UE�u$��BҤT{\'���Q��vK�鳍k��+��64��;޾����������f�B��?\n��\0蒝�5m�����7��EPX�tŪ$;w��P��<��|z0�}y�8�AG �/+�@S�6�N��������%xN������)cβ�{����A5z1���5��(L�p�t�sI�����A�0YE���dznq@A*.)\0�qeg���,|)������l��N�V�e��+�`�|�+�����?z��\nj،u��d�|�γ��`$U�d�u�0>J�.��y����g峑��].�����[��R��}�}&��\0�-����Ջ��;ﵚ�z{����J��iM��cd۱��R�:�Qڝ=IIMpkt�����ΦA�?;��Q6)X�TLf���}Ĥ�H��1ހ̼%J �E)����Y#Ћ�aC��c��>N�A�**j��|����v���l�B�Hx���v^z�u���%6#����h��\0���:D��!�Y ��ye�o�T��&[�Hs1���$X��2Է�l��;9�Wa��Q�����Wrrn\0Vδz ?m������R�~*��J�&*[��{���5R=2����):��\\w\\����_C��\"Ɠ�&X��3	J>���4E����e�b��z���>,��zѸE���%� ���V��\n[)I��]��MD�oz���ZD|V^�lKW��b��n��;u�D�������(�|P�����\"MD��LŞ�i)II)�@���gr��۾,<q�#T=�~n���BhɜH�H�i���ǜ	7�6m�i�/�T�\\۷�ڮ�nx�T�i�D�u�¥��Xd�O8�k�n^�!�: T�pD�6x��m��w\"hΧ8O�h2�T6P�\\M}<���5-~M*����gB<>F��J*1��[�邬���ub|U���I�.1<7���D*��I���105	���sf�llbD=S_R��~�(�\nÈ�f;gy�ƣDY�s	��d;�%��?�g��=�g��U��XQQ����pދ#+T�T��:W؝��4��D���n\0@=���л�ݐ�n*��\"(�3\"@8J������ux�ҋs,2O}?����K�����|�\0�A��6۶ݕ��ȑcG����YuJD��`2%o�DF@��B�vq>��ҒB�s?`�6�Af[�,�Y-\nc,��I��%���o)*$�\n�lH|z�1�(Qj��bPP�L�՗������Z��9�6Mͅ�Kef�.?r,�zx�H,���M�ʦ.\'�%HѸt�A�8oJ&�!։T���U^Noԏ��9�L�� �^=�ɓȷ�)K�AY�F���@�:�$-\'��@]{�º!���7Q�Zh�m�j&��ɖ������ڽG�^mk������u|������r�s_��-�OoI)��f˗G &y�:������F1v��u�r�e ܦR�����$��LP����w?x�)��m��5�`�,��p�`�J)�	�r5\'x�]�\n;��Wʾ$`��r��\\e۶]���,B��Jl��@���d��\"�}�؄!��Dm� �S;(G���p�g��`@����9�$B������\0�|�c�c�H����\np}KԼ\\�!B� *���s>�1�k�k���C\\5����B�&�K�}f;�<G��,d\"�l7�_c�ʺ�M��ode�G��veqW\'\n)��tNc<	��$��t�p�d�92L�v���и	�Xׅ׏�K���<L��p%�N�F/W���b�������!T@{j�A2$�T����䣱�����u���� �(��7�`t��%F�7w��@��+�\n8�>��0���sg��G\'��V����屬�T���2BO@eV�lT6��Q��g��b�@��E���(a�PUH�o������������TN��^�k��}���C(�sF��4��Π��j��|�Z��=m�v����{��a��~{䁇@)�ٮ�v�*��S\"�k:�zҚ���gM�!��)\'��@7=�p?F��rL�����s2l�J�Ļ΍�Z�s�o���?84觎��<>�p�5<1���c��}�{V�f�u���ˊ_�0�6���+���(#�0���{\0�\"�踦a�Zyl6�h��%�/#���O!0����(�̶G3�mc��`���~�J����d7�B�k@\n�E��I�\n�OS�Pd��]u�� ���T����2/s�K�Ⱥ�����a�����4��Ҧ�F��ّ2A8pO��%�T:�7N�g6�+X*�l�N��$l?[<�`�Y���L@p@`�ǜf��y7�Ї�s�G�§P�xw�at�c5������sz��w�X���UpnU�Sv�+��bX�JMPz�\n��49��M2��P�a��6PR��.RY�`@))in��(e˖�;����\\�/`��w2�9�hn�>u�>a�M�B�)oe��AG!p:�=4H&�׭��P�.(������|��2U���D~�o5��9\\�f��aq��k�`��N�^LR� �e��CpH����0�>�Ѻ�!8\n�CM��}AJ���8�~����8�i9Ly��$�\nOn�F�h>���e�*KM�%n>+��8ezZ׋�F0#�^}��I|�)o޼���|4�\0��1Z	��q6I��i\0��{\n�J�!t�JaEjC8���8�j,#���e�D�y������Bw�:��JK�P��\'�y��\0�\"�3�.��}&:v��!__���pQFƄ]���&�d��׍p%��h&���Mr�B0�\nB���]F�R���I����k���*��^��,J��s�N�5{F.O�3�c�����;I�(��#�6\0J���m��K�����|K	�h��Z�2�Tnp�D�͡�^D�M�!(���\\2�����S<;3��1U�TS�CU�H����&�l���z2*`.��ֆ�H-��Xy�v�������{l�rm)����tk������>�,7/ʥ�\\WRvv4C�;d�j5�}d�̰U��s6Ş�*A��nE�/��݆|�e��r�l	Ð�n�Hzu�z\0q	��2�=!����s�s�3}� �ge�ʖ��c�`�%i �\\�Uߗ�I��|�M���;2Hv`J���=N/v�C&� r��7\0��\"za�2�����A�>v1���������2�s\\�D��ェ�u��ˆ���;�Z������I�-j.EYC�%��4����� De�������u��x�d�;�ڐ�J�Ě�UiK��z�Q\n�U&���YDZɦ{{�}f.�QD������r\'���$���N�a�ʊ8\0��B�5Z��=�L[��G�M���<�kٮ��X*G*u9X�4�k6�`1��$A��,֠@�B�;�a�����k���Ņ�ƾ���n}���֓0c>�S�w�E\0ԋ�o�j��}���,���\\lZ�@Fw�,���w�Ğ.�o;�:�ZQ(NoI�ñs�,�N8���m��7�]e�Y�Cc;/7�>y�C@?J���u�L&j˩\0���Y���C�ʍr��A��\0\0�#IDAT�~��\"��.#=��[��]`Ŝ�\0����\"\'�DF�aM��hf\0e)�N�>�L�k��@qd��.H����~�ʂz�;m��q��2��Gڃ��\0�p�⩣6L���b@�gY��Kg�D��G��o\nՇvEY=��o�E���!��k�W���������Az}{ݴ�\"����qN���2�$��ԩ}��$��:��z&���W�Bp��R�p\';\'����ma&�i��%�1��M[�f4�	�rB$R�ј�������grE��W�,�h�H�M*+*�ۤ��DX�y�J��C�w�\0\'��80|��^�Ņ�is�[i��6�k��@���k	��۶:^��H�f�~�^{�y;��MZ!\0��C��Эŗ�駞����c���w����˿�K����iX3\'�v�h��%�|�:[:7��I����y��Yv�|�������,:���Ty�\\�x��$�Ɠ���!&d�G��!t���\"6�AD�XSd�ʏ	L�Nz������?�UݓnJ,6L�x�+�5\\�N���[݇-�>:����,����~�u\'ú^<K�l��t(�ö�@u���ѯ��h=�x��2�M\0�q훿��#!	��ݞ�9x�o�=���0�:n-��B�\'�/\\$z�N��Ŵ�S�\"gX�WU�C.�z�C�� &a4̷c�c_x�EE�m\\��)=��/ح�%~��0	�]U�udr2�e�`5�j��ld���I�N�}ێ�l�l��}[���c0P�74���#��$j7ϓm�<��曶P�,�\\�&r����O4V�(Rɉ0@\0�{r�S�E��f2����D~&ц{�9�[��%���T�~��=t�m`w���¬$������Y2�j�Wճ58��0~�[쪫ֹ�}��d�w�,�ß�+�;}���h >��0&P�V�N�\"!	��P��b�v��P�t	�>�����O�3������:gn�G�N��|r�@Jɽ���_�lؘ0�NL_���	OH�opO��Q<O?=�J������7,#cH��敥ڌ|����&ig�ڬBTL�<���x1���Q�^�f:w�t�GX)���b���o9������gwݲ��Q*7p?�P�Y��z[�����ݷ]oe�Y��hJV6`.fR�k��37��(60�!q���p�e���Y�\"քrh��1��a��#��ؼ��v�H�]��W����/��W�n�:�aH����Iy�p��3�a��D��k�%����x7�:�1����T	v��+�:MN��8�S�5Y��p��~��\\��{�{l�䛙ٕ�������Oe��͙��i\0d��Ú�́#Z��ػ	�b���l��ʕ4pQ;�x�FM\0^hܿ��U�{���Ft���v{����\0c��m{0_`w���}�d��[��՘O�����n��OE����M�yi\\�z��r�Ux���DJ���L��L5Idʧ!I\"AJ7���YzD����F��y:x)����}�xS<u�>L�F��C.f�����÷2>�sw�P��{n��$�b�{->_�+��\'���c\0�L�^���4z��~�&�s���d��튅�����!��`fz��8-��;��w��c2���7q9�Қ�̕>�ߢȉ��֭c&�s��zf|o�*」([�?G4P%�\n���x�MMa����nw�M\0��(��q���P_S:�c�/�P��:t\\�I@t��)����P���D�����J���o�y��0x�����Z�(F#Қ�́z�:��챗���\"\0O���z�2d��V�`��J����%�o��/�K�>�ı�UY�b���?�s��_�2MX@<�K v����Ƀ8��o��ԫ�$�������x��0��VK��{�@�\'��m���EL�5��D0���?��\'Nw����3\0~h2��&���:�����܅��gEƥ[w��3-ʗhu�v��?�h\nx;hnj�e���S����i�HH�����^ͷ_��y���	{≹Hß���H�,�a?�Ꮽ �Ⅻl���87�N>N��L`�Ɔ��J��#�*��Fo��_MM��f!��A�gz��\nf��TR�\n!�dJ:�D��@�%�=��8��<�����ে�F\n�I�=���\0����%� ��*ف�D�:��|��z3���(Mq	|Fx�MO�IA!��ex����G�����E�=ZrL*ǀy��>l\"�� �HIF���[�Y}ϋ�4����ϱ���\nt��4�_�.O�I��/֖����Z�:��56��&�k��<B�4���%�l�����ń��A6\0:x�ݡ2Ł���枮�����1H���M�}�B)�������$^k@�B��G�����1�}�Gs}<����PQ����򬝸Pc 	�pB�Qy¦<�P>��2��D��$�U]�U��>�^}zE�c�������������l�u�n@�cg3׽��	̗4L�NF�o>�#�AD$�{��B��h+a��c+�eR^��c�P�Hx��SïW�����6>�ٟ���+�����GuMK�s��m�J96����R^��e*f�\\P���@ҭb9A�ˎaj$� PD?g�����b�w��7��c+8E�1@8��p��y�dr��r�W-��ව��$�L�Ȍ�H���;�>�(z�H�7�T���/�W��#{�p������\'�5 ^n��X�L���)�<n�ne�G�<#T�&�zt��E�NP�x��lR���!>FIuz�����xv�t�F�\n���=.D1S�\'BՐ��@ƣ\'y��W�GWAp�ɧzv~6� /��Ȑ~c<�����~��lhA>�7l[�0>+���\0�.p�[�k�i��ي��g�\'��˟�CK3�g�ܵ��x��*�ROo���`;\0��t�*���M����3È���>��u(H�V�X\'%�{@�p����Ϝ=Z^\"�����LP��:�t��J��燅1�s����#�7�0��}�E�R��+;�;־��ն� |\0�ܩc\\P^������y\"${�A.�����$ /��YGd��ٰv=��Li�uW�ڡ��կ����Y�0\n~!�!ht�,�I�1%�;etxE�/�&nh����U��Me��Q�7N�6����\n}��m]�vt�v�7�!~|�2@]k������3o���oL�5�37�MW!-O����\n&���^��MCH�\0U�\n�/\\��4��*&A�W��\n�m�n�3j���<�����M�����o>J����_����̉�iB\'��z�L�}	d;����<�FgfМ\'p��78�)6�o�z�zM�%��d��b�x�N#w\"�򜑠�l�������Jge�.+$�J_0�éyA �k9z��Je�(>���Ire[��{����<\n��V�*��)�5�Q�N���f�?�t��ӱ\0�]q�������#����p=M����r���{׮��\'�����\\�=I���+��-B:���a�#��\'�hF&��s��Oߍ8�\0p���c����!�e=����a�x�e��U&��Fӯ���I�bL����-c��޷w\0�K\'�`���������\0݇��)��ہ�V������$8��5Ù��)�i��KE���J�=A��ϐ����	Vsa�������O<x�}����u��O��4���U�fe�E�L�폵*̕IJ]JtHE8!�Q�&�0O�����G�����*zOU��xi{�m��\0�>��Ow�C\0�»���+�7W�^��jt�/	���$[틳K�S6tY��^�����ƍ�r�*\0J:����(2س�y�X\\-���p:�>��ǘ�E#3����ÏV{���PF������1��9Y%x���qL�0؎M�d+Z�a\n�M�9˳�,������n=B���{5M�]��Rph����c�~�l4��\\�IR�Q,���c��mk/U�6Įjo�tϫ2L0�$9�����[����R���q�޷�I[�^O�3@�\'�J]]�`�v�\\���R�9��꡿��:dg�U:������%)�^4��쥂�I��l8��غ:�C�M�7@�_6�z����[わ)������:��y%�q��#�S�75�a��v�}��E��:��v�幬L�9�I��4gh\'#u� N�(������bRމ���Jlmis�����M� r���]�7����l<J�����u��:*!Ԫ�\'l7����)��шY�\"h�T�y�>�K�OUfK� ��^^����@I��{�����	}|��N�����W���?��Ξg/��C�D��^2,/k?AP=J�1���>*�(P��0 h�\'��|���ˊ��[����VNe��xh͞�C�56�LLx��v}��\0�k~����W����?xpf��ԑ�����\\&{��XE�o\'�\0��X���T�0��0N8�	&p\'�ф���&����J(#�T��N�#G�ۑ�G���&&�GO��\'~t�@<�.[}�L;�\\\0�N#�IjQ6��>�(z\nbl����@������\0�>�Ͷ1I	�ػ��C3ӺJ��&��������^�xގ=��4��D��q�S���Ƙ� \'L�ʕ+m��r;�tQڅ�06�k���U��7��EFq��y�`�C�\'��\0=��8S��v\0���j �l�U�_@�m?�x�L�,�k��l����ZT��݊$T12���MclK��\0<��IvN�*8.	@�\n��u��ws�\nt�]k��FV��Oٖ�e9����X,�n�6��J��]�v9��К�&\0��j�j+-Lį�8t�M�#�����%�Kl;^&{��b�܃�\n}<�����V/Y�uC��N���:��zr���4�Ȱ������v��~p���TOcoy��92�>�)��H\0h\n��&�n@�a��$p�Ð�J �ߴ�Z��f�����с��%��/�_��߯}�J�ͳ��W�2�A/�CLr�Ȓa�@�`<�9M�58]�1�~r��;X�0��ۼ���g0�99����]ߝt����ッꔺ%�~Z��\0�B�>Y�����KwfE��4.J�I��j}9&�}�Y���J�Uɖ@i��囓�=	�|�9ylģ�2J3����R���|��ic,�-��+��o��/�>�9����/���`�� e���XNA���	�Z\0T�ny�N�����5���L�c�PS�_0�\"D�VӘ��z�z�a��TO�0��i��\n\"�� ^��,�{�:H/n.\0�2ei�dT����7������e�w�\n�9_i������)�\'GaI?�p�=��g�Ng$\'�ؒ�0��n\"�S�v�4��EO�|ъ�Y��u��^�zt��Ҳ�;ixt�rv�����O�Dz��-��`��ʬGSHe:�t���{^.�U������\n�o0\"����N�M\\k�\\<��m\\4\'��F��c�F�w���%��W	ظ�EtϨ͚M��S�9��,y���(��s��<����?B�u\0p�3���t�Π�XXZN�F�{e���;������P�aU�����܈����s��$:8h2�3����8�2|��I�;R�\n�faJC�\0�$��H�kX�2��[�v��1�Vw�������C��#���?�K��+q<a����W�h:��I���M���3����=9,�p�u�1��Gd�-�}��$�m9��[���.ɍ˝��?\0z+��\0<�s諾�]&�-�ע�F���l�[<;¾��R��7w�d��.��1�L���ь�b39-�ъ�1!����#�^����ۯ�i[h��[�ؽ-���?a�y�9��^�/���m�>����i��E���?q���ѡ]6wõ��^q��h�Ԏ��u��~\'��US��m��ZhO-N���ˏ�ҽ�tv<�g�����%V�d������>�Q��\'��e2;���ǚ~E��~�3�5��W��&�\0����y�~�G(S���K@;K��ƭ��w�%.�2�T9�M���d�=���d5dk�2<ͭ���-_�̾���(��(|�i�/k��1�`Sk��YVi�^-��L�;XN3k]]�L)s�G�WJP� �AOh�9�(6�����#�*�G�X�**�M���{��ge�u+%k[f�&�C��]�W��\0uje�}���;ӎ���u����a��q����ro-�@㼗�\\{Qخ6����푇nu-������c��TbNc��$��Y�h>֖��Z���y�}��f��Ixc}7�ݭN)(1���BŀJ�|<$�&�O8%�T�&��~&�2�#�}��[[{�򹫵������-���ȷ\'_|k\0��Db�G�+oR�t���|}d�H�M�>�o��8�G�M���\\������63����Xm|���uLM4������t����	�\0��ß�}�3�@؝�G�}�����1��f3#C���<[�0�jק�Y�Bޗ�JR)���do���&1E`�@d$N��y�NL�د|�Oq[��bu�u�pI��,�O��o�����s��\0��-����B������m�ß�O��6Ĥ�Z�,2[g�26)��I$��h\\��)�.�tY~)Fߜ��bP/�F֍���d{���:�yn��\'Pu:��\nbd�hZ�jhd�y�r/3C�!��鼈 ;I6k&�5Ҭ4��\n�/����bꭷ��Fp�S�M�5�4��$龜�������e��8�����&�\n#�PP��i�lzuT���ǈ:�\n|���Ѥ�OI��,DMG��S\nƣaW>��rjjj����z���D^{<-��8�(�R�Ic\0���N\"@v>���o`C�L�A�9M�nGr����W�_�T��/�p�r8�\0��Νnq��D�u�+Xг(�`Մ\"ȡ�U�(1��\0}�h���>n$�N�8��y��(I���I)H}9\":��F�,H�z\'3L	���V\"�a��w�Ŗ@k����ΐ�Re����Y�#!���-�ch\0�*��v5�ЀLW�OÜɀD.ܹq8�!L{K��O@bn)QL�Α�Cg&�o���\\k��(�/8��H���\0��1��74����W3Rd��Ȓ���)i�a7ܴi*̣{hT#�=E�7�Eo]\0�� �kJ*+�	n8�e#�0�ǐ��Ԯo�t �&��l���j����w~�����؛o�a��z$����W����������ʣ$�/�t��Х�_��)���w�;D���7����\nIt�#��47�����lZ���w0����MF�����ԙ۠�I�Ms��*�}���� ����΍7� S�D8C��������t��j#�Y2�N�6��TA#��RyA+�����A��0�e��gB��Nr���߻pi�KԷp\n��v��9ژl.�kdS���`0�����E��bx��a���l�U�`F^1u�1O;������N4AN\"��|=\n�G8;_�#��y8X�!J�~�w�:�`��{\n����^Y^1�����z�\n�9(�v4��昰e�2��Ћ�|��)���KZ����\"G\'����W8CK��&�Q���}L�5�h�H�y�7��ވ-b@6wf�=F��w�7���n7{��������g�2��¯���~Tqc�5ƑOpeͩ�̾4����?0�Fѱ�Tg���%��l��Nᄿ�������C��������A?�&ޚz�0�|�?}�{���Ӎ(v��Ŋǣ�EE���?�6�ng�p����\0N�X�p�M�K:k�/�-�@~�)n�$�|WC��$��ل�8���&��Eۜ�9�Jۭ��ҏ�#������{�\']6�gKv9b������|���Z��3.]5)�п����!¤�D	4��:L� ��!(K����p��i��i�`���q�y�0�lTN	���:M��8���s�?��L.�=�L�qBlj��0I��x{\\F��D2�G%�.���0�\nv��Z��08����w�����/�t�B��#!4+��x��\0\"�G�*�ޘXXC\010�Iћ\'�f� �J<�4���4���󑴂��	!��uQ��9��\n�g0-�@JP$�c=�%l-ob��������pE�)���|����[�ր��$ 1P���J;�\n7����^;a���Î�9��`����$Ǥ�\'�S��ȹ��{��d�I�>��E6��d��y��}��%g?$��BP��=�tO����6�Y�Xn��s+���}��ä[�>��d�7T ��GTЕK��C,���~�2�;	�Ѷru�?+?t�w���\\��b����+���*���Gf���3���]t�>����:~���c��O���5^52��� 6�*|.�0��>ͮ�?ˊ�f��i��W:�U�\n�\n| \"2�M��o-^i��`O>���w��l�9�!�rf���}���V��z���L�0�ا��\0#�D�lק`L��M�l���)Ĕ%E0)>r��g��]D!�f�������R�1�.�������|�\'�Z�|\"Cӆ�E>���y�@G3?�����;D�D8Ē��C6�ˮ���I�T�>4I�<S����5��!�}� �W�a��L-�Xd��mJk���O�P�oe}S�T��A���d��m=MxBעBG�Wfi9q���.P�����8||�T��\\G�Y.��a��H�q������vv^+������Q���0e*�sBO��}h0�.R\'���~���Qg\\���������No-�L722� \n�PS_�Cx�\'��\"����C.L��q&!\'6#�p�U)H�w�,<�_�ة��_f[��f6{�\\{�����6��O���Q�h\\#`\0�,X�T2��C�iO��9r�j�v���<G�h�@{�K]�_�=��C\'��y��G.�����!�\0�&�j�[���xZ�������%��sf\'P^ u	O���y~�jJ�(��8ť�,ʘ�SғfW����o�N�3�A��}��R,&?�f�����q�C�^}5�o[_�f�ߢ$�}��~�p�/8�^ѽD�F�*d2�%D�z��J���	�%\"�������I��GΠS���LI���+ғ�A�]�R]�\'����M�APVS]����3�2uї�!J��\\%�E��hz�Gѩ�2�4�8�Qe�����%� �`}-��|�e��D2�*`<�#˜%�\0V��`)d�ƣXO<��h`7YM�P(�D���`($�Kx9A1���(M��ԗ�����Q�� H�s���o��6l��̪��*0��I������Ł��a�(r�1�Mղ|�M�a��aFGKع��c�r�9YLW+/\0ξ`C�\n��v?���JP]=���.�:���C6�s����eb���<��(�eWN���D����L$���%�u\"Z�:�\nG>GM�Ǎ$@v���M�[�_��;��N��n�~�=t߃.<u��r�mv�����f�1���Ne�A�6��?%�nZ�JLbpK�Y�� �o뻓�颭]	�$�fϊ��u��j��qb��]�����A;�}���X��*�yS.�\0&+.6�}������CE�١�\"M��)C\n~4�bÀ�T�X;����~!�����Lٟz62�f͚����]���7�O�~�ՠ�Z~6�}v����b7�t���o~��7	Wv�p�mڐ�8j&C�j�dh����t?S�8&��/L�F���C�Q~�S���7�M/�52\nMkgc����@�;\\���sScg;ͼ�o�wЌ~��J�U�	p��K*���2���Q���;?��ה=��n��ۅ��W����d�����W�:��1>�����tx��2�(.p��O?�*ִ5�^�r,���ם9ۀ��I����3��g�Z�k��~b�#�R��;FY&�P���8F ΐ��@?/�ru+εxO E���}�F��]�_���1��Xb��+�m��m/>MF���c�\\�A�>��)�ʊ���<�n�l� ���������F`Eڌ���Y|�\'%d`�i��B��N(mR��cz��[��⎓����p8%sQ&׶j�zr�Q��y����qP��=���6ǒ�ed�!�R�fK(���q��o�}Ug�����$o��k��͝�\0p�^@ٛ^0��O%3<@[��H04\\K\"���*��JK��¼��Rz����;+�.�?;�m�ឝ�ݒzp�_p��L�$�\'^�G)\0��]��lL�?�\\�uW�caa)a����9i˗��Pf���������,��8���Ń����I:	������Ƃ՛�\0���_���-Zw�dF9%�ǿ�8����/�*\'�������g�k�r)eZ�,�{b�S�8q��68���H��^&!�E&T7�y\0�I�a^<w	Y�a�z�|r�Kƨ��KS�-kR�E���!�(�{ȩ��B�$;��E\"��ʪ/�u411 Al�S�ɀ��Q�7�������>j��(���z�B(Tz��N�y	(�D����Bz���҄\'�A�;���/�c�i`��ub_y��N#��ji���#U�c�����b	�\n������#=.q�b+�[b9y�v��ag�����v��[��Ð��\0���@�c[��@�7��K\0o�s�:�Uլ<&��z/�0��&k�w�a&W//q�*��I�(��q�%e����JF�g�5��\'���G0\\�1�?(��&��?$���͠+������4��p&�S:`%� ̩x��ט�LPiexVJ��r�F���: �8	�؁�;�>{��Ʋa�=��ǜ�iIQ������5�͒U:�S��_�!�aOʚ��J&\"k������IC_-�P-X��]��A�5��Y�w���q���7�<��Fs����V�>����w����T���>�LJ���;\'��sw������M�	��6��_��g�ء�|<�R�Q��&����8������>��E ��\'�(�T���T����QV3�=*}�[n����^pxM��~�\no���Xe�!���}D�/����2h��K$ߠ/#5yF�1n�T�8}G]#UPoK|])�(P*X��6�8�~�[���������cƔ�(ijܫ�7Ѓ�}-qK�(K�TU�p���m����G���L��w�CE��BbD��Op�׫)\'��`��#�C�S~\'�d�ݝ���#�r�˅��{�[OZO;�����\"�����rr��93P�N����>����]���4!��!ʉO�I���#y���V��}�TK1Z^\"ŤRj��G)�\'�J�/\\f:��d 3�YB�h���O%��:����\0Oᵌʩs\0�Q|nh�܆�K�A�)I�[젞��WЧP�=��@���`f\0��f�B�����|ٲ`/������EK�H���k��_�w�u`N��U^��x�A�+�<�%>(H�K�Frb�UiB�=U�)�G�T�f�,f0D\n�d}����v��_�]��l���R������#^xⵆW[ZA�{oY����}t\"��䣖^��~`����3u�		���n�9���!,r���<����\"{��6̈�OO#\0Q2Qfhz;��o���!F�J!���Lh�b�\'_�d�����������I[�f�����K��羀br5��Ld��hU�6s��ڳ��\nV��-�[�����Dw�$�\n��念�I��\\m�W*��\n��ʅe�j�r�QJ#Y�`3�ld��΂����&ߐ�׾�Tef�Uz_N�O��8�t�N������}�Z��Ѳ\\��:,�-��&�nB��&�2��%�ve� .\'��-O�!�7��ϓ�֡��))Q�x�L۰i�͞�g� E^p0!�E\0_\'3o\'����|@��(��~�ǰP��8�\"(����p���P(����w$٪�*���8��\0�#Ȑ����g=g���!Zg���@n0G�O��r���/���\0�����ab�/�N�dz;�kr!r`ʌ�i�{�Z��֭`�t��z���o����1�����n���/�ʘ_]Vd�?x�>%�Z���BI�4��R��5b�[I;:��� �	CT;͈�2X2t���hl��z��]G�����)�3?]\no<�}|T���tno��=UW��7\"�gE���Ĥ%��/\\6�n��FqK��py��Ȟripɞ���O�#�Tߎ����p<<|�����[��n���zx�mڴ���VW]�������O��O��_�W���o�hK)A���輊5�aC?0���)+S#)8��\'D$֛q�5��d��P���ݰvn���B5��9d布�[ژ�qCGե�*����+\\��P.K���D��~��\\�)]��r�ϩ�9��O�H�#��Ɏ��& i0*�ecA�2B�dJ�x�\\�!�5S��S���Ȱ;{��e�J֖E٫��N�|\'�D1��M��<��:�䚌�#eE��%�����ܿX�m��ɦ�@��˿��G�P�-_M`�2>M�+Ƭ�I�+�U���AQ��oF���4���qY\0��\'e������`��k:�A6>AfNf���퉋�ɲSf<��`����4����;o�|����[���=w_ƳCݽw�^m���{�M�#���e��=E	IUF;gz����g��{RO�7����qs��K=u{�������m5�9/��`0�}��~W��b\0�����Apdd��|CˋoE��6\n�ّ�k�\"�֣9݃�Y.a�Ǫ����\"�-_��I���ᙦ�͉��!�R�A��+o��m��?�i�����Dzc#޹�O3�ebH����S{ÿ~뻮��r�L�n�&u*��>�٠�	v�ĩ3d;�s􏴙T�i@!�)a�H����\"����3�\"9o������#P�\n1�?w��[�#�\"���T�=�\n�m�	��\\2�SV���4p�Q�7��J�.���$�0=,�5Je6=B�t�x*�a�c/H%T��%�aF���Z�� �(x)���Q3��X`sq�K�\"\0������)1lr�ߔ������AO���=2�Y���\0�]�+9)���G4�o��22	+/�Q2�����{zN�rk�;���*;��M-�Vj[�:�XT���\0��	����O��GF(��%k���}��4N���I����i��q�����ѣ\\�8�!z�G�[o�/|������/��7ٵ8�=���ܝv�|���,[`�Ρ�\"yo�Lrҍu�fm�s@E�!n�����P��ώ$�K>��	�iom�|`��;{�hl�v�G�re���G=\0:�A`}�G&v����-�NdlJĘoh����sX8!٨��ٱS��$2?٬NO6������s�y*���eS��\\^�؀��>��qJ�G8�ɫ��~|��}��dж���E�\0��!��>v�Bg�X}�4��ō��a��#�	*�	�,�0lyǗհ��f��T�ߛ\"#��������5W\0��믦�F(� �h/����3]W!Q�����`�E���D)��>e���M��d|.\"`����B�����P�I�ē��sK4���~��G=�~\"���dk\nfsf.�e+g�}���,�_f��SM.?3+��2Tv��SS�X��$��\\]L�Z��!����@�m~����ND�p ���jY�����(��2����_�5�����Ԅ�`o8�_`9�%���0TT��TcD��Oѯ��I5��ݸ�*��ݥv�@/���Z[��*��j�>+B���=j�{�q:�����KT!�ȓ9�9I�>�3r)�n�F6���ܛ�k���*�s��$~�J��؆���S)$F�/Uw֞��\040�bCS��wg~��{���{f�|1񄉽�NM���h�ʈ����YI1��R�0�`��m�Ԡu������c\"*]�v��r.��4;Y@e����qn:YP��a4���h���Β���v������m���\"\n\'�q�D�?���v��(�Z	��M0��&��E�A��fE���TQBbMH٣�i(b��`W�o���z[��@q������]0�!�fg �P��y�e�bPШm�sgN�f���̣�6Bf��HOq��r \'+��zS��S�9w��r%n���,���`7�>J�W^~������E;uq�.8��Є�J�\"<ap�ҹMd����\"s�n��5��L��qţy?&Ph�1���%�f�R+�Mt���\n�m.К�ߗe����Ơ�2�Dy-�zjJ&�����h�ɜ;�~3��z��g�{�W��fi;¨S��h�3��і<d{��)<�җ#+������5ӈ���k�{V9������g��kZ�����?��ö�=}\na\n�\"�7lbT���d\n�*1l0K�4R?Z`}�i@Zrj\'\0�\'s83q�oB͹�ó\n�_*e��j&C\"|�5��GNv��y����]������|����n�24&ps���z���M�˸e��4!�#6�^��26f�t����3��*�y:�>�yy�J��)?�R���\"���A9ɤ.�Ӽ�EWF9����]��s/ؓO>a+V�E��!�*�я~\06�ζ>��x�z��ot@�&���ڀ�A��S:\0$K�4�`I�%J��8ҿ\"q�Z�+]���-�!��z��Pݪ��bc��$b%Z�f\0�i9�\"-���G�C �Jf�7\'h荒��%�ؚ���u��`4K�F��+�w�+\"+{6�:�#���:�þ=��`��i�����Ӏ�cD�Ʀ{R�d�m��]j\"{>9��G�m{�I�q��S�蝫�6h�S��>IFǀ���!�\\����}��^{}�AM���j��O{�{���?j�5�nb�rSH;U�\\����ЈD�$��ad�������\n��f�e�~��3�BA�n�؈��r�m!rj>�rp����*7�����إ�\'��۷�u�\\COn�\0�v��PJ�?��?��&���.�\'�^�Y2L��Gہ��J�CP����Se�F6�h���]N5Z^� ,�x���YH��@�:�;�q�f����}�^��CZeo��Փ�����A�Z�ߕ�OIM��=��9z�X�K�W�\\Sn7R\'�w��ti��N�v���9��I�\0�ÉO?�(�p(e��u���\0K���{�\0�>���z}KX�s�Y��7�a[_{��������\\n����os�δ���?����w�Z�w/S���׮�o�c��O�Ɋ�ƠhP�i�0AsM4������q�l0��p�@����h:-g�ӗ��Q�U��V�rȉr*f!\"�4�pB�@�P��~{��%�5�-]��M�>�	}�%�Zx�F2���ǿ�A���I�؉�e=�Ю����1��������Tt�<6��Y���6Hr��\0� AUf؁��?��2�@ǐ�*x����`(�>�ƃ�\nъ�KUv�����FԲ���}砌���3-�����P�:�R��Ew#	�L�0*.˱q\")�5`�o��������	YHj\"N�������M�^��S\\�p�+��Av�h�vl�6�6sl6���\'z�������_��,f���7���_�#��f�8\n�/���\0�;qo���[30�\"�EQ�F�\'����z]�P��9��C���Qm�Xy�3�l�tF�XKG�@MMWsec����<}��{�ȕ�/���H����28���*�����J!^2�p�˖���G��פŎgG1��l�7b���!��t���\\l=�$��A.��+3��	[l�T�̃�i�&�v�QH[?Գ)���2�c��و&,�_�4R�[� �9�p\\���V�4��q�}��y�Mm���^\'�:J()N�D�Xes�-%��L,�� �R���~���A��`�Z�xJJ*�qL���� �M��4Te�=o��VRR�2\"A7V���y]�U~�\' ݨ��[SK;��P��g�;C�_:��.�e���;;PAe��d~Ûm���Ƕ:�p�S�q~�w�`n[e��xe%�6&��L��,�F�V��ď?�ŕQ&کN�\"8�g��n޳<��UPb�R�^�x����z@:���j\\_1� ,s�h05�;�Zd�BC%!�7Wo�5���i��\0�J�*��n�fbi5�\"� d�b�l��j�������W��������N0���v&�%��}{��S��O!j��r�P��S�d�*.���Y��픂�Sr��x�B~9P\n�2�����a�4rx�!���|y�Z��G��_����;�z��]-;O\\=TU�5�S%��9}(���mJ��.��g0C4ƭm>;\'��6�FG��欨Us��$���fMXeO(Ж�GFl��3�Zl�*+ͧtD��Q�e�<�4�/a1:�s��*����DR�e�Y�m����-\0__�J�D����[���H׿e�=�2�d4g��?�o���Z�檕v���4l�YdG��#�!K<��V�]�������ewL�׉�\'�4� �2�GD�%������F�O�}xZ;��\n+��T0سA2�㈥j�96ԏ����3)�2���?A��SZ8����LO���Bi�<2Kp�ɀ��\"�9Q��T�5��	�w��(Y�ÅG������ßYe�T�>��QI�y�`$�d�v�9 �}˝�+����!�\0O���>���Uj>*}��ݹ/�-�m&@t����\0��1��%������΅ă��#u�A�#��g�-��Db׭X�r��N�l1t�[�\\���Ӎ�[f��Y	@��o�Z��Z(ßx�	�5H����.�W$롇��u�:\nKrDL�ox���`%�Q���\0�R[<a�(C(��(�\'j��VSmDcd_Fƞ\0�f�������s���>u�Dom}s��։nz����j��^i�G���w���\0�Þ������\'�ǿ?1�2�pbIz�?;*y�6\"���j���Ha�M\0�\n��F��	��Fi\'A%��\"=9o^V�\0����\"��˶\\w�m�:`�g�I�bO?��m%fb���#��n�����b���i�L�d+�8sf����l��8\0v7�p���=l�!W�`{)g7�t�/�\"��H� !���e�*ӛD�[K`��g�[��$�$�Z;A]�K����^�G|��\\<���5��:�,n��!�ڑ��%�wR��~S(3[��͇�S�������{��qG&K�|�ʙ5\0�)qa�����F0��ح@7E���~���#��\\��\n]��*���L]�%�A��TZ�j^��,+hSH�fhUZ��i	�pMB����U������ny��\\.:�\'�\'���Ț}�,�G�mfI�}�J�5K�k_���c�h^�ݰ!���ş�9�F[�d�}�W~�A��6�⥫�w~��6�̓0���`����P$+��CQT�\'ZOI�L�iq�n�V^�=�i}�P0������YYy �ٶxY�TD��pcKg����s�����ήA��|���~W��%�ޯ�g�V��-�,�#SR⢗,�θ~cƝ�g���ψ(�+��\"�jo�n��{Q��ԛ3c�5�B)�;B��0��}��pi�1�`�Q��Ņ�bJލ�נ$3��S]�e^�c?D���C�J�/��o`XT��E{z���-[�`��oO��i�o���e��cl����Qk�%!�(l#���t�%�H$uM��a+��2�﵍�^�ұN��dg1Щmj���{\0vC��ɦ��h/٪��rP�$���%�ı.�&\0�`vT��NFoWmZI�&:a>�ff.�{�����СC��\\4E���-���1��S@�b��B-\'�C���a\"n-��p�1����{�	�q�:s��8�75�\'���2�nS�a�b�ʕEIefY1��I�M��-i�ӂZrxfM��mj���+���D|��LpG���}��d���or��q�}�_b8n7n��\n����ns-�����\\�.���O��~`6�!��N[� ���$�s��V0��v��!�\nL�98��-��)��H�n��|�w���O�y9��(�e���Ջ�l݆YV8#���������#���}���6,���t�O�o�C��HJ\\�W��o}�K\0��W\0A����(l��gfD]�!�����O������aM�>ۻ��s#�(6R�k��oc�9���7�MAʬ)�\0j(��F��I@3� A�����4�o�Ζ]�[��Z8�a��6l�;p�[{�|��;�,Cv��1�\0�(�b���|�~�&�����m�(U�(5��M�dLBcp�(��M��o�7i�x�6���+���j�y��.[��4��pBcC�r��d�4	.QJ����:K%35o*�5.逈����I�3�\"�̲��aK�/r�e�Ҭ��w��8�e��X(n���z�n(`݀�8��aJ�x����%�������A2?(a�i)+DЫ��9E�$_�Y�/w�v��_�Gp�l\n8�N�o<�0B��e.�sJ�NJHM��xJ�f��������G���4�������gZ٦@��m���͙��p��ѓ����Q`9�����SxN���YFG�YW���d�~��.S%�_��1��1���:�)�C�]^�p!}V��iw\\n+��/.˝�����x����7�u쮪�����/���P�#Mu�����X�!X;�(�q�1�ߡ�Cc!g϶������؜�p�7O�G�D�祣r�-�6+?��cv�ԛз��2�����k=AQ.��e3�&��	�L#G�k��əئ���LZٌ9v���q�֝���_���9���|�Q�J\n���Ͷ������pd�}���+v�X�C?�;\\�y<�X��HK\"˴ىe;�(�LƓ2g<�ؖ=�cO�q�;q���lKq��Ӳ��Ϋ��+\0�e�-�^��=�;=>.���u�=j ��������o�dj������Ϫ���CT�K�\\��.��i���T2\0��������RH�LP]\0����\0��\\�(<6�D�\'Y��I�ٳc�9cN��͡JH�KlsS�Q���aK�Z<��1EM���ڼ*�;�{f $�-	K��@h�e���a�l�A�j���X\'X�p��^P�g��S2)�+�\"\"���;yoC?3�-j~9�+�Wdgb�/�*U`ȷ��)�����s�RbY9Z:5�������P��a9��D+#��(��>���ؽ�	�fM��W�/�ͦ���ǵR�FC�/��ԉ�܆S��?�y*q�ڼ���E�;ìC�e7�H�^�i�_Z�\"�\\�\\\n�*�\'�fI�s���n9��y�Ϫcau�`���#؆yq�NO�/�f掜/���|{��K�k<�`c����.���?���i\0(�ٸ1�^!کhl33q��Fib1V�z�P�c{܏�v�w�������&0�l+���q�d.��ڰWi���\"[E��ȓ����VH�4��Nfvԡn������eև₅�80��g?�͆�xuU�>��{��\\�}{�f�ԯ�Y�O�P���q����`U\"2m��)��z�4=Y��ϯ�価L��ۆT�{/�çA����v�v��I7c�n��jȼ��H��p��e35������HGP=��\'�y*�fLEcky��6�P_p?��hI\"�r2l����Ml��/M�G�lPcd{-f�U8la�J��+����&�8�G���4we�fw/��>u���PM�d.wcCI}��Q��5��\n�c\'�{|)��)Z��>Mq#���2��2sQq�!������B}�gX~�����e1�}��\"� �\'��:���O�#�g�0!M+�V}��-,�>��)B8��9�p�_x!��}�827���_1�l��U9t�5�ĔT8[D�A��.O�tsly\'5�Ҟ���ü3X�zR��d\"}q>3������r��KӉ\"�w3�5�w�o�J�N@����k�w�\"��CP���mo�����_|����������������}�]��ө�0��V��boش�f�-!����*��8O��Z������	U�3���淴@�]�v�b�E����$��3���g�aY���C>�3?�>����.]���������j�Y��Q*���H����|��;���p�\"�~�V{0r��`~)&*�t�;Ei-e��~� \"��e��Ɏ�]��Vu�|��8�\"�_���Ua�i*\\�������W���\\��a��f�YYҾ�x�����d>2�e�\0�6�t�\"���}��(��(`.g��ɜ��[��\0�\n���$�7�9MT���ޥ~�3;���?�	�r�y�~3R8���:d!\\�7A�+[o�FYJ��S��ꉡ�f�	~�+U��*������)$�/~���A_ڣ~�\'>�y�z���տfs���or�556��j��vwA]��<�2�WgN_P�!r/ƘÊ�#�~�d{���LjN��Y5�G��j�&y��.��\\�kp�ԡ�!��~h\0�0G}=1�;y1���n���x�����0=�4.;��>���Gyi�w\0��끠��|��x�\\���Q���ɧ��(;|K{�ɮ\0.��+SϿ�����DK�~��vvQ!��d��<�.4�EN��_�JT��b�˯����W�`�_\0 ����|�Gۜ�M�D��x�KTj���Ȱ�W=����Ï�\'w���$b��D}��-s#L�H3N3%��b�03�%s����ꂷ�JJ^4҇��Y(7S�}}	`�\\��DJ�ӣ�{��w7)�\n|����5z���A�{;ߢ���}X�ݯ����QafvU?���AR�>��?�)V����~cR���7�Lv22a�TC�F:���g~�G�S��k#)�I\nU���*�+���67��!�L,h�ԅ	��wj6e�����ΨZ\'��CA[��Ϸ_}I��S\0�d���!������j~� ��	����DrAj X����C�\';���G89��o�������P8��l��v3=5�Μ��\\_�\"p�!R�&&��T�\\�5�B�@*#��,�Eb���@��#fn���}\\��cS?����7WL%W�3�D}����s�zi�3�R2%\njm��K����K[������������6X��@�4����lo��l���/?��֊+�:���u��G����@��z�8�!ߞ�U�}V�Y�n��̚�$�c��-S�٠dx�`��QL]Ѭ�$�I>�8|�(�j\nP����}ITPᾯm�%[Wrh�?����5բb�GyL=��h>�G��a�xL]F{��?�d��/�(A��.tq%�u���]�\"@�U�+}9\0#v��{㵯���:)��y���i\"}H��B�����wD�pw������ېV�J��m�^�ᄂ�΃�TŲ��Υ��Nh���M�p�ɌB��i�#�KQђiL�\'�)1h0�7(�_B!�j��7i�Ē䰰hHR�9��B���;Q���\"P�n��%4��\'������Zc;��b��c?�C�_i��SS^���<���9�}���޻{�<k�C�dJ����d!��Mfu%�EhB�?�\01���7[m�/��]\0���x�e���i��p�N���Q��G�Q�����+���\\��v�m�K�\\x�܅5�xZx�x��C>����m�o趺̝��YH�!\0\'�A��}���Wߚ�Ж���Kᅑ��G��Gé�T<.�6�:H��зN%ɗGy0̋���.��9m@{*V)�h$h�ɀ]Z.�$T�HBtp����Lt�5*:��-�h2�=jrJ\"\'c��~�U��v�Вݍ�Ԡz�����WQ����\"���� �V���`T�%4��Rj!���a>�ꏡ�@�KK.�\"�O,g/k�\0b�e���pzHe�A*�~u�t?|�+�Kg	���k��b���EzP��;m\0���C�Ɇ��U? &�*�\"^Ҫ@#݅^�4��f�0�=�zvzFmh���gC>\\�||A�h�Bii��*���l�C�Ϊ(�}`��k��!`\nQ�v�w�\'��8�c�gf���H�N����;�֛���QΪ]���5�TL\0.Y�qX�8�b���R��$�=0�c�F�N�:4�nlתl��c{��T�Yx��&ô�~52�Q������R��z�x�/��25qq���5�ӫ?���~�A�;\0�Vx+�Z�����l͑L��⃇:�z�5}�Z]��֛<�.�я�@�pВΨ7���wA��NB������ޠ��ڠ*Kc�z�s��O#$Ty��x79h�~�>�\"]c>&Q�2����@�5���>M*�2Ɲ/��Iqjd�N8g�H��6�b/��C����Pc�3	ooU�\'�Gu��R�|y��M8u�ٹC��D���1256��,��|���d9 ��b�����gϰ:zd�5�Z�m4��B:�2�n�;⒄4�s;�F�\nm�-���;*M+���؎������U��N���1���{1,��E���m�	����@{�!G��:�%����nM��¦�����������e��}�/#���3�˳d���qo&T�mB�D�s��i�(K�O����U5�s/Q��+�R-F4i�Ty%�ٌЅ���ZZ|��	�F�;då����R�n��÷/���[�ʊ���-�D��(cxzS���b~jvu��j󉯼��W\'�c�TJ��Z�g\\x4?k�ީ\0(ǡ���Ѽc�w�9j�kG(>�ӓq@�:�=ҟ>|�﩮6�;�vo0���0k�2\'��|�MO��rj�y T7@�EE\0U��*�ɍw��Fp�d�ʋ����#�ӢJ�eW�q�0�څ��E;�	R��E��x�J�W_�z�.�$W�sddD[X�#��1�L�@����(�O�:�{�I�����U\0��8�����TI�Vfq�F��7�[ij��\0��c�@���r�V.��f��b��e�8�\0��vP���qi�۠���j��2]@vWS}p�zZmꞻv�o���6Ie}�-�8�^����5Ͼ0�����iY���(�a�ED��A\"3�ƆwQm\n\"t�\00;Fԛ\'f��y��H�ԫ����Am,��moג�v����L�VVQ`\0�UB�3ń��$3�*n�R	�i���I��,��t��(�kR2�΃�v����$3�����.�uUT����V�s�\\�����Z8s����o�^?q*Ư��@?s�o{uW�;���:߻~t\'��ƅ����[�w�pŮ,�Ck(]�����=w��؝{$�i�;�[����f��|������jI�_�E^�7CHL�6��Sl�|��OH�D�h�U��0���)*/LYS��,��/ꇉ�Y3��r[4/�\"��M(d�/�I��6�߯���$t���M�l^)R|�\nT�\"�Ɖ�������pI���ml����^�$�Kj�Io�n5�����~�ie��h��Za�I$�VX�^��e��y���&!���4�JA��@�ݒh����pY�3֧E�N/ ��^�I�����q@����u�ݳM�ؾ�Y�;���3iW%�9�F�1�s&��}�C�7����-8{��\n�ڃ\'c�։	k�f�\n��af��j3�4�rCd�����V�\0e����!�.ڻ�$�I���ɇF�����i��o9����)��{��#A��Fjv>y%�i9�͗�/N\\���,%�д�e�����ӷ�w�����]����\0(gr#&��fڀ��+\"b�cҹqnz����G~x���=W��R���O��\nJo^���Wo2/����� 6ZW�R$H%Q�o���\n�D��-O�\'-�����\0�X<	dd�.Z�\"mk\nm��&��;�Zw`Z5�;��IpOG{X{�U@gN�׌EEb�������_������<;�OM�:��O���4,��K�	�C����\"��:j�Ύ>u��&\0IT��m�Dq\n\0ʁ�A�$�j6��t��ݍ���W2�a��W���8��<��j�2���f�yrbQ;3�i|��y/��I@��d�L�\n\0�`�y�fř$�lmm��u$g�̎���O[\\���A~���Ι���WbL�0ai�bJ�z� ����i�Ob`093���Xp�/�C�\'%i{E�(�v!�_}�a�$vZ�	�(@h��������$y[�?m���}�����ޞ���Rʉ��;F:���Zx�\"\"Z\0�y`�vX?FcE�����k[�O��/�S�$�.�������m-���W#;<j�LJ�yd�es�e��0��k�o��C�V�����\'<�M�?�dI��/l��71[]��W�S�ZغֹnΟ�`�T\"��e#˂YC{^�ZK*�V>W/�)$i,��Cȏ������EP�a��5x,r[>��?���j�G�kE@����PI�A��X�t��V[*�S�;�_�\'��(E\'�Ɔহ+y��x�9y� ��j��p݁�mZ���1�D�91ZX�����W��+3��BJ�<r��Zğ�豳D��S��hn�?��O��ާ��R>8���nlȄ׊CL#�%�\\����pz���j��q��/��X�u�D��T���ڥ���\0Q젠�o@�i=	n\0~�L9��\'�~�c��T[w��)�P���Z�(�\\��<37�,]��d�y����lj _��.��@���\0���zՠ�A�*P?�z*�����<��#�ݡ�#Cͮ���@G�{�{[8��#�#��������R�c�T<����\nFT ��J*��;.�v�ɶ@�H[AT���W���Y#�������[�	���`�*\"�Ul�.O!g>��.$k�<&D��>�.�zPt�,Bճ�Ob�9��gՈ?�EUʫN�eN��z��oA�>�:t�6K�V�g~��g����	U\0&Ugj�@%W�\\C,Z2H��w�R��ٷ	�\\wv����0\'�������_��i[^h~��}\0-�kj5Fd�~e�ީ��_|S������K��y�~���;\0� ��A*irSj}\'���XYM\\\\U�!���鯨\'�R_���T)%����塣3�n�=	�2���	�\\�s���٠��y��R�:s�-�XG0�A��\'�6��!�����3�6gQ�p������!6᳨��/�\'�z�c�JgO�+���<_^]�ʆW_tl5��瀺��5�\0�N�;5n��7���~#��].��ak�Q33I��֟ݷ���G�k�D���S���6���}�jdp\'@�$�ܫ��2͌m�Y[�ۉ���N$c�⃔+1��8\\lN=���B�ʯ\"�3*�y�\n�ʆ����j>l�y�T_vxn�_[jt����x\\��=��Ʊ�fU����u@�@�w�V��ZKYaY#�<\0Qf�Rx\n����8�8�� j8�{\'��Q��X��=!;H�*��+��Z�����51�\'�EF-Z븸B.��sЊ���������w�hS޻k��)Whq󴢫l�+jG�Իڬ���&3�X�U�\03��	�CZ^P�oYZ�F;�N\0Ӆ���q�!�F���X���	����chQ׸?�+���UhAR����.K�]\'c�NT�ۙQ�E��hYS;�����Ѐ�-:����:�Dma�r�7O�=;�^��\\Fǫ/1t\04r�̺^����M��z1�)W�*�w������j��U!��9�G�jm1�����\"�v�8vz������.���k����E��Ҵw	6�����VCIr3#D�Q��-^���f�^��6Ïa�MT2{�jBjІn��$(�Md����9u``�6��+��~n����w��k�v��}��~�	�P]f�W�>y��ܧ6�����`�?�e/���8y��oÓ{D��a����@i�:��Ck���,�8�>x�+���nUxI�������\'?����#B\0�����ߡ\0�j�¸���ڴ�\"��;��	(G����PG߈i�]N�(v2]J�5�ϋj��A(1\0˒`�}�µem]%X��!6�\0m���H�l\"�c�TE�QeNX��<��|�.Y���|���=s5��1��EM�ol���0s�N&�.4B�\\)���_�sN�x4���\'�مt9#9��!/�[_�£Ѽ��[Dn\0�}`f4�>/�Oo9�\0h�Yu)�vn`����9�s���������]���聽�m�vO3��ёAu`R���𞻸�m{��p��1$̋����P7꼠�*:J�ts���h�Csw�nH\0Ze��+�����j�+��L7;���C�7~eH��T$4�K���m��j�\".r�G�$v�e�M�N�T8Q x@(�ؐ�y]��	s����Cy�`��:��!m	���,�3���jITs�eс-�p�$l%���c����?C~�K��p���^�H���`İ]#^�L]V6�%�Y������T\0��_֬��#�M<S�A��Z�\0���%FI�s���Cfy�`�\'@��:���.3[;�ymCers��cs��*��bUENL��}`H�l��-�\\���<�s������o�\\~��K��5	6���Ho1��t\0���t[]���\'cly���n�=�\'��`hE�����srj�63��<>����?tOt��/>���2j�5F�}p��vzi�Sjf6OV�[����\0Rmc�p3٦�P7BӐ�N^�z��n�\'�T!�B�C��F٥):	]��W�a�	\"Q����{!�?����Vx꥿}N�?��j*#/n�Q(7�������ܫʌLR�N��\"^�q\"�/�\'m�X���e�T��0�~�uw��Ơ\0�4�j��^��re?9h>�.dU[�C�]��!\\�ױ�m�7�ٳg�M?���r���EU�Tf>6,�T�c/����TT��G%d.K���;�l���]s��l%dJH�v�!������Y.��i6�K�[�U�=��3d�{G�:�3��z�j�χ#�l5�Ù�^�L��b�����k�GOf�NO�*��~F\0��-�ֲ�}?�\0��z�\'�2��&����3��~]y�ˇvh�+�d2m���J*��?�/�ѐ/�=�ut�\'�=M���:�	�=���Q#Y;��fc�%��.U������@�NZk��.�e�h�:_�yGQ�t��:ϫ��*Ij����,� �hP�������J	ߺEuv|Z9rL-�(.�UZiܗ(q���$���$K�q��\n�Q�8y�<��C�n��ű�\n�lx�f\"��!�7b5��C�^$p�9l�Os�y,�klC�PMJ�d�c/��˓8H��~S���IK9�N�[��&\'\'	8O�Mn���#j/ǯ�6��R(D6$tM�%�dJ��/}M�_�(��6μvWIVs�L�/��	�Ed~��ᄲC#�פ�A�)�E,�9�s$���jQ{	hB�R��|T����l�EGxy5���ٗ��JUV�hOrBHҀ��f�����#��7e�����N�w\0�x[|F@Ru./\'j_���W����uܳۿk׎쁾�doG��鰻�i�sFT�X��sn2jeyZ�s1�5��b�����\0?��R�LPk�1(%X����Ю&�j15���/@�=�?4��E?Of]KȾbW��YU3�+��\n�>�ʓ-�Es� ��B��$��6�h�J�~�������>���Ũ��}Dm��Y�\0�����p\0�FU����������2��G�6��X�\0t���p?�j[�~�w��l�}�q<\0�R����9l�g����4���;SB�+b� rY\'j�2��SϾ����2s�:��ʨ��ij�\"��:wX��y��+F�Qĳ���-pD���4�8�d��j3�pS�eJ���&�lz)Y��r��慹����T5ϲ�ҀO�;}�!_ˇr�@P���6k�w���/a��H�@������A����x�k߇���_\\����Ω�ș�W�w�=�ݾ1��wD��͑P�o?ˉ�wuQ��չsi\"(c��,ibH��������� �!���	��?����IƄ�֦��_X�B��k̴Қ���\"0�b�O�S��(�wܫ��۰�O�1A��2X��4n�~\n\'/�-UZ��s��h��|O��\0\0��ˊ�C�8�:��n������cF(d�E����{y�n,����^���\nT�i�,I�2�N#:��?��Y�`6wEMN��(���Q�%;E{j��llI�#��JR��H�S�6**��	2��s��;q!ʉ.���k|v�g��W*�h��8QmlW{�I���CE���z\"{%?5Ϭ劉lͽ��O��o�O9�*/���e�}���P�l?������ws�Z�R7<\0oxD�.Ш����<4���jE�W�r��_Q�4�&jo�4�~e�hp`l{h���/�_C���\"����=�Ïu�+KU5~��d��e�ƀ��v�]��U�X,��p %+fb|�D�K�6:Z8�v��2��HHC�U���S1\nqZ���	�YV�ͧ)&������_�P%ng�?�����l]��ZG\'�|��\"�\"���_/�_��ՀO\0#즨�RLԧ~�\"�2�gHl���\'ʱ\n��	�&`/��n��!�^y�ݧ:p��j��q�]�C����m���/~[}�K/c￪)@ā\'�Q�-*Q���hᤵ�{��&6�v�Z:\\YE�8�[V�Dt\"S����W.0jH!{C�{�����5&>\")����y�z2[*����|u�����ō�ۧ.$�8���s����lu�\n�z�}�|zeh��o�uzK��)��-��qaM\'����!�d=���g��|_���[���=@7jw�C^Gww�q`Wľs�{�Ȁk�ϗiw�\n�H�qڂ�f��T��-�����;�Rhf�v����QJ0+�	(b���*\0bqSN�#�(=��e���F��	Ѧz��D��3�WM�D~����\0�t��\"$l\'f�2�,��V�dԁ���3?�4��������W�מy�d��*�1��������TＴz����{��@�Q�/(>}E�lR��R���2��J*g9�KM��m,Y��eFY2\0� y�53Z<@7���w\n��</|���\"�Oy�i![Y��l��x6W���PW�)����	y���ʲ��W�t=�G�_��ߞX;�����2�E���`�>7�FM��56�U�W���\0�?p79�`&\0f=��h��<�������ttu69��lv�vv������5�j�N{sS[ �;}�|�<]TS���QA�P�N�cC@�D>e��EҘ���l\'qMTTsª�9�,S$O���*q�l;��R��O�5\0�A�L�X�c�*�w(%�8\"����l\\3#y�,M��z�3�ĨҾH�V���F=0ԇFY�ŸAS���F�����,���H����q%,H4�=`JP��g���7��v���fF��V��$[� �f��J���~P�֘�	X:h՝�W��u�hX|A9�F�B�������N��>��x\0��Z-�ӥd��ln#W���Ɯ�8Y;s��j%��Q�*M�{z�+U�^�g~��ר�5nx�����}���^���/p�u�93Uu�:\0�Q��\n���F�g��9ڢ^����sϮ�c��p�Ψc�/�m���U��ty$0��w��]Ķ+�.�䬚��]f���(.�h\0��(�l�s8�q1��	I�[zM}m\"^��|�ZB������g�磭��@�a��68�ƸT���8��پx����$�:��MI��d�\0Z�5ɟ��94+��4	zi�a�BHZ%�IX�e0@�����\\pmSaJ?{�ʳ(��T��.\\��\"c+��lo1�����h�����ȈD�Tx�,ZZ���a�U�E#v��^�-�R9\\��,k�l޽��n�81��q��re~1U���ت\n�� h>#��8�ӫ?��5�~7|���X\0���O���4Vo:�5�\n��h�]_o���$y!�h������{������Y�j᰷9�u�Jr��t��u��+G6Su��f�lycXy�$���\\Ee+A6��Rб����)%g��7ȬM,�{�R����!Ǝ����4S�zT��C����&�]�\\\\`�\0�/^�9\\��S��(�i=Y2x��,1ss��`	S�_\'.��N���+҄D~W�$���(>ְ�/$�j!I5����5ՠ�n&�UE��8���?��6�+�-����!��Y=u��^*�����z�*�8�z��rai9�8��^�ި����-�P�	P�=���OA�ϸ�0/?��2�ߟg�u+[����ߓ��_�癪@sէ��yب5n�\"�\\Ng�%������	:�;���f[o�Snom�w���x�L��I�;\\���[d{�ܲm#ﴭ%rj��*���D���c�L�\n �l��y(a8��%��m0�,|N汢\n�p>�$	����+�H@\'�*IQdP�*���m�p4��p�\"�6W\00��W	��V�ummQ-��@�%��LV,�p�ˊ�Qi2w��$a���#�z���:������f�[��J��[u����+[���%L`��d��3˅+�mvq��2���^��T��_�k[\\c���͔c���\0��~=��{����-��,\0������x�%���\n��=�4`#�|ǬP����䵷����|��n��#�B]mj�5T�	8\"A�Ӈ	��	__���+�%4��8N�[<YR�T$�[\\�ZRkil���ld�*���>S�ՠ� ���+��`�%4�<1������dUuD\0KZS;IC�|͚R5�kh+��`^(\0�o\nh�|�r�bE��xm}����r_�s�S��QV� �bo��6D�a/��;�ܴ�X���x���jT�\\GL\n�H��,�r93����fs���Z}a1��c.[�[� O�T�B����Љ�z�kno͕�\0�����iQ��d����N���v~[][�����hhl�m��J���R�>�$�ٜ:�������lc��ᱷE������\\�kf���v�0��?����\\��q;+u�x�QhVq؍:�R[�e�$�\0382���M�,S!J��dB�����l����[�(�\"�A�?�`���B7~���(��!\n��|ph=p���IM%�J��蛃�`��:k=C�=Y{s�Sk�m>G�F�]�=7�O!�%|�Z)��|��@�Q����jWҾ���ͧ��KU�,ejT�����UyF��y�a������+@s���YM��<�[��	X\0��>A�@hn��`���I6��?7��-6޾�o��=B���Y5��~�����읝A��QG/�G�Z1��l�Az[wOw�c� �bP�Efe��)*+�qh.U��(s?�[�ȡ�tt`��JcE�7�cF���M2Mʴ���!�~\0���ʼO�ae�\0�<,8��\'$A.i��b�o����d1P�\\�ǘ~�\\�*�F�J��Z���l�\\�T��H�j�tU,d5ժ�D��N��`J�ѵ��\\��Q����@\'.�+A#�Y����wS�n�M�{��u�q�Ѩ�5o��j�o���G��w�~�[�h\n\n �mp�Ã��@�b�;⯴���@Wsp#�䎄1���R�`\"�M.�I�jKn�����\"���Y�4E�F�n\n��fi��f���D�V$O�a��O���lz���b�U�����Q(62;��m�|��D6�/;��*��l=��^YKd���?;=_��-lԖV��D�PE�ǯZ�F>�gnf�kT����ͮy�a�\0��2�u��{~RY7��O���~��r�E�;ZV������\n�~זX�=Ӈ�4��ئk�H;j�\n���a��=�E�{Wg��v�ݡ6�Ͷ�&{�c/6�(�E#Qg>�q�};��a��.��e�H���8CM�Z!_�ndC�;k,ol^X��*�����V!�\"c���$9���<�`Y��6������R�Le���B̞�0�����k�\\�m-���K�z=�C�U�3S���F�2�����Hs1K��%F��Qd4ָ��u��,\0�\0�:7��d�*B��f@��f�V^�4���3��n�yi�n���G#>{y�C>[s�����Ҏk�ac�yBMAg6�v��<�p�����]�Y(�r�|[4j�9]�T*%|k��m3>����zY��(0��R�@X���r1�ʲ����)����%�oa1��\\�D�U�V�w3U�V���f\"����޼֬�mx��]�jY�U{l�����#l44��7B#0AѸ��\0~>{��m�A��z���8�h�67\\@�a����!\'ǖ��	1;z���m���m��2+|��8��ǣ��_�7��z�z>/�N�|�K���)tPjx���͸��gzz�hl���m��3�\0?w���.6Bc�f�\n7j���wQd����X�\\��t��A�\\���o�}ט-��lc���o��ņ���d�	�����w�G�W�>7�#3V��\\w���_�冑�l&7+@��Ձ��V��!y�Z-����z���F�@3-�!a�&g�f��*���������}9ѭ�6��V@a��� �ȑ��m�=c�f�蚁�h^��g�u���^�(��X-���9`���F�9s+|��*?#^��3��\0���z��U{r�F�g��̖cF4��F%�qng��7��E�\\�x>�O1�.�OT�$n��ޜ�h�p=�Ӂмu�^;����`#໕\nP?yc%���Xy�)-�����3oz�՞���h�k����k�����Q}�/ب�4Vp�6y�%������^%h|#���V�V��U�ר�4S[`#��qQ�H�k��̋�\n��?�;�������Y�]ݒy�f��̤g3��z?��fX~�~[�Vx��o���f@и�5�{+�m�|O�F3�F�#`�A����j����	X\0�=8���W^�T�ﻥ�4�ި��y�a�FU��ӧۍT���-������0���<1?�ú���W3��aCr3n���j�g��yc�h�kn��������_�9���5���O����?�y�X����Z��m��3@�t�z�݈�U�����Fm�y����׷�M���7}T�6Es�x��n+>��:7���lT�m���Lp�����>�O��X\0�����~����*ǭ����[?3H�	�[U����EQ�ݟu����\0�6�c܆w����ѿ���V�<�3W�Fp�޿o�c��҇�,\0����n���~>������;[��:���N�:���N�:���N�:���N�:���N�:���N�:���N�:���N�:���N�:���N�:���N�:���N�:���N�:���N�:���N�:���N�:���N�:���?������<\0\0\0\0IEND�B`�");
INSERT INTO tbl_usuario VALUES("2","2","RUT","2","1","$2a$07$usesomesillystringforeCFgULGhtYgEopegGdjbjYiHOQCeHz.S","","ADMIN","2022-07-26","2022-08-11","ALEXANDER","");
INSERT INTO tbl_usuario VALUES("3","3","LUZ","2","1","$2a$07$usesomesillystringforeFz7dK1VZWNMEJiH0HNOXYw/HL.5hY4.","","ADMIN","2022-07-26","2022-08-11","ALEXANDER","����\0JFIF\0\0\0\0\0\0��\0�\0\n$)..3),8-484,/1=55%BJ=4?.451?+??<4?14?7651441?111111414411144?14144144?111441141��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0L\0\n\0\0\0!1\"Aa2BQq�#R���br����$S�3Cs���4ctu������%DT��\0\0\0\0\0\0\0\0\0\0\0��\0\'\0\0\0\0\0\0\0\0!1QAaq\"�R���\0\0\0?\0�ԥ(�(�(�(�(�(�y�iJP)JP)JP)JP)JP)JP)JP)JP)JP)JP)JP)JP)JP)JP`�ʩ!Y�諷sy�>f����T�[�����wM��*>Y��r�h#��Z9Դm��m�\n�K}�S��IU�oCݼ-�׈����|tI�_#�g��C�M�m�[^F��-ےE�\0&���4�V(���)JP)JP)JP)JP)JP)JP)JP)JP)JP)J�f��xMi�ߪ��[Z�(���Pw�o��f���\n<kVMI���u�q@�Fެ�O��!O̊\'\\?9�g�KtHS�rjf�Ԯ��<EG\\ql+�H����j>���[���I��ۋ�l�ն�_�Q�:��[��?��;x?�j�ĜCip�Vx��o:0��|A�v=��\0Qm��?�x�5�����ҳ��p��ʛetI����T|{I�}�t��aɕ�z����1.�>��E���v��OR��ԁ�t��$S��#Er���F\09\'�\\�[N�*Qƶ��O�s88e�C�^] e��Ve��pGβ%Σ�wQ�W�}�����Z$ӧ^�I���,RE���LR/����\n�5LoҾw\nӺ�T!{�#�lh7;���p(7�Z��!uH�=��\n:�����U�@�)@�)@�)@�y���JV	�\n3A����L�.Y��ungv�*�d�*?�5�2,/m<��{(�29���@X����&關��z�/E���ֈlFѫk{vwHϧ�ު��u\"��a�3�/A���\0GWoZCߙ�ُ3R��v���3JT7E+�YUY��,���E\\q5�5Ͳ����SLK׵�?�sl���u\'�8�:8�H���SR��ttu�����e=Eh����a�?�7��:��h�R��+$i�:\\3��cI6�c맚��@�eui߅���}xݿ�ƿ�}�=ǟƬvwk!�/Xeh�X\0\"*��q���ȣ\\�\0��,;5�$�\'�+�fQho�q��b[��g�N�Ku���1ϗR~um�l�K%|v������\0���r�v�m2<�ޛ|�ޚ��ϑ�8#�V���N�_�u���+�Ԏ�O��G�hۥj-�β�A���iA�i���=K���>�e_΢��Rr�EVk�eF=�G6r<@��,��S��ږo�v��<��6�U�k�KL�O���~x�N��K�tp��eoʾ+�j\nօ���w4H����d_�\\���\\V��R3��q>��*D;I�m�\'�s�>\0u\'�**���f���/�v���F�R��:�)���8��Ӹ��{Y�1=|���DǄ���MmԒ{I��O)�����t�k����~ʹ�|����v�\\>���\0�\\����N�ȧ�Z����\'���\0��˯�����b>�̓N9C�H�T�TU��}UQԚ��G�$��X+w��.���ߨ<>5C�x��pVY�toY7mF���]K�G������gghaϰ���<�q�WJ�#�f�v���ãM<sȠn`�+���uR+���mi<��hy�%_��+�t��f>��9�c�mo6���H�?*ե4:\'�&O	r=&?/���Zӵ�$�Ĉ�����W���Mbd�,rzѻ2�o�1��Z��ؗ���uh��y�`����v�\n<MsA���\0�\04��Z�q_I|�ΫƥU�\\��s�Q��y7�N3���f��-V袴i�y��u#���5M�V�+�Rna�VP����]S�G���-�w�0��T�{�-�V�ӆ��+]�k��7�\"�ç�?�u��d�]n��sE�9$�Ǻ�.��J�:��2�\';�t����WL��g���uVN�%e�y�Ĝ��~t���{��\0��R��𴉵#��+�p#Sy�������G4��?��F��?�{��2�7ap_n��7vs(�W<��<�k�;�8��c��p�3m>�5��c��������׮�ެEr��~[5��Ӈ���ǥW^I�_O��n����w����_�NI�6�g��y~��߸��W;!�E�w>�:�ѓ�{�U��^?�����2G�\\�ڳ\"\"��Q��AS�ǯ�gXodK�wԒ.������\0nj6�E@�U�X�\\����ݚ�5\nD&���ږ�;+������Q\\a�^�:���W�(���[�<��$j����n�Wr��ZVV�eGnŽH�{�or�\\y�Q:&Y���\03�#y	Sw�Q�<#|������\0�5�$Uw%<_�&ӦO^)���u��j_��A��=�m�$m�Eo�[��3������)�1vd�Re���]��2��:U�]սk{f�\0)?�Q����3l�D޷dĪ��V��UE�M:�\\(�U�~���� ����V}nM����s��$�r�s�*�W��n��sLqR�Q�64�OIѧ�b�Fҕ���B�I�V����L5�-�x�\'�������Z�#�v�Y��woy>56�Cb�J�:�y�9v�*��;�}���ʮ�}؄�D�>�_��~8��{��G	�ٻ���}j7A�6{��Hb�پ�`|I�Syoo����Y䲸gki��[�qM��G�u����vW6���̫\'i�\"���#\'���CS�ǿ/=�5��Ն5�\"���I$�t�U{����N�`�xn��uҶ�2aΩW�~�/	�=�h���gN�\'Psqp�|V$��\0��[ʿ&���l�Y8��#�*����@����]�G��͍B�P���	\'k*�3\'l���}1V)��ty�O���j-m�lC5��g�wm����o�QQ8~��{�\\J��=���3p$�ג�&��)._�GV��|�g�A����{�3v�ɷ{�ڪ��(�����:}��R���=Ԯ�S�v�����ꮎ�J�j�ֲ��}\\�����H��W����{�?#]5�5�sb��RcdN�kr�^I4l}�-�E���$5��\0���������W�*8pDC�F_�\"���ڹ%d�e�y��D��U�@�������p�f����4c��w���x��cx]6�ݪ���\"��rLi�k4Qʡ�$]ɽv��Б឵�P3��P��[mWA�YS�P{��A?Q1��\\�*#;������纯vb�%��=u��f�p{�{����~��\n�~��o��P�>���,��ݺ�����5�FQy��ޏ�A4j�H$O�fu��y����mp�x��q�#5j����#��;����c�Q��4ǯ.�W5�.���D�\0ѿ�S�龜���vm���6��r5g]v?i.c�\0ik*� O0�ڳYԶI�� S��?�m$`rW�ݨ���oQ~*��� ���7;|���)<S5�Ϩ�R~Ŵ�~d^�ۇ����w��U�?1X%(+�8^����0]�����\nf��k`yQ����C���1�*{o�_+6��,!s�w�c�v�@x�\n�д�i����nﲊ:\"�\0?�u��i��M�dؠ�6��Uj����S�����q&+%wB.�IE�Z�H����R��R��W��i@�SDb�҂���0$+\"�x��N��yy�x5o�#E�{fy�!:.�e\\�$uC���*��6���,��\0�SjĶ\'M�o��s�\0g��\0�����TYbu�4l��U��\0z�_	J���đ���ӳ!���/��O��n��c�����[�V���T��ɵ��9�>�ž�\0GGn���O����H�\0>=~��\n��[�`Hl��4GO��A���S����w�v�z���tg�t�h�W��|;���Uh���X>�ʄ���8�4��\0�v�|�5x��n���\0�1��(�\n���7k�P��T/V-�W�jn#�e�zI�L�\0��x��{g�|�b�������K�k��\0Gl�x��i�2FU�]��u���E��,��J���䣠B��BVE@+�)@�)@�)@�)@�)@�)@�}n�z�f�+��AϸZ�{i;�ڳ,y�\0[{�=��|�5M5�G�gޚ!�3t�>8�<p*G��b�F�Ѷ��ϼ����^%Dwhֲ�\0�{ֲ���|�ڳ���N�u��7f�)/�7��mF!�X�\0�[�k�9�A��:�ȷ�;� ����~5�tu�טU�I��\'�GB��[*2G���p[���b��-`/4��;���;p$���~3��F���Dۗ����m��,^VUDݲ!���O����-�.]�*۹��y�)�l!����X#�*�i���p�����Um�m�n|�T匘�Ѽ���k�iZ��*`Dʪ����{�M~)�dɾ1�/GC��w�nWw�kK�.�?�����.O�m3�o�8��)ũ;vn���������@��3Wg���F�Z�xJ�	h<�V�-��_\n��j�0<+%)@�)@�)@�)@�)@�)@�)@�)@�)A����tdp���oz��((w<lrDH��;��*��\\>�vD��m|���8�OBq]���Ps�aŜM	g�)�����ʾLO/��b4����Z��(�\0\\.��l�A�˷ƽ�7�V���a���f�/��槚����qd��ѻ�z?��:�ݻs�Uv$nY��_˚���u�N�کVk�P�Q���9����=A\\;�5� 9`�Y��-�>�»��$��#++.�CnV�����_{d�6��;J�V�}U<%)J)J)J)J)JFkz�[@�I��]���Gg`���,I�k���\0�g�r*pq��-�:]�5�bi!��xgd\'�O23˗�+gE�h�eh�W��,}�˫f�f]�I\\��#�Z\\k���/�m�V����K�Z�`<|T\n��N���h sn�Zs���;HbYw6̌d�\0惡ҹ����B�mF;�,��O<��,����w#�=+B��ӭ���u(�*V��+��I�W\0�@�����USY⧆[���{���d��9!�bVR��yyTD��]Ci%Τ���Iio�S��`˶�rs�����X8X�Ač\"A���\'��@��<ω�p��띲\"��3�W�aZ庤)�֛=�A4�iq��ő��Hr�\0�\"kc�4+[u(�7��sٮ��w2*�u\\��y��ʃ�S`����w^���f�	���f�p�I�G�K<�����6��>���p>�TK�V�i�s���x�z��sS��*,��Iˆ7����Y8gL��t�/�&uYnVRN0X�w�V���gv�#3FЬɽ����\'�9|jf�T�L����Y��*sFС���e��X�6��Yv�\\��Wul\\p�{tXU���R�ˉ7�X�X�>�{�1[�ny~�Z^Ե}+J��~�Z�ER~�F��\0V���|j�\'����G��O\n)K���g�ОG��8�U�B�]=��ّ����,��vCЂIds��[����C|SY����zV�W�J��0����M��o�#eL�5Ɯ����y��@�M���d�����k�eܗ�M3�\\?��Hq�0<qV���J�Zl}f��^�r��Qm,�hc�Tr�\02�=�I$�x-���\0�omRK��[yQ��T����hIp� ��c��]�T+�f��PyM���z,V�nd�q�H�2�� \0D-ԫw�i=�Ix���k�=S��&q��2:�R2(:�+�A�A#�Gcq��{f��帖HnIV�rC����`�A��^��x�SH�w\"K�d@�n���r��R�<;��Z��G-Ԑ��B�,�2����n\'*g�۫�����y�g�Dwz|��F\n�Q�\0N\0�՟W�{yZ\'���if�n�1Pq�����C�\n_u�Bon��n�������:���q}m��g��WQ�<�ҡiK�\0�L�`u�Z���;]N���\'������V�U�c�A�F�9d)����\\�T�1���h�s� ���?#[Sq���.��f�(a�k�\nHl� ��`�PU�+X���Z����r�ja�Rݙ��q*6�����]�n����,�ykp;X����c�٘�#��O�8��y;%�;)q��H�:�0q�ʤuMF;x�Y�b�=go>@\09�N03A��~&�mcN�\'���4s�m�#i@��s̑Z�?X���J��_̦%H��2elr������B�w���w��[xߑۂF�_*�C9+s�S���l��r��i�:^��k6�ⰳk��zu����p�������D�٘�b��@kk�\\�[�jݯ��V(�;D���=��U��G\"]_aB�$��1�>U�tt��Eq����5 H�Y�e�A��Ѽ�+��i��ԗ���\"U���8ن�G\\�U<������K��d��v��w�fP�I$��$�V���!d��h�S$PJ�����-cD#�u����\"H� ~5���&�x�7����e��CO���nl��k{dn���h�3���E��msso5��+5�E2lt�m˜��K0#ʫ1�\n\n�3����B��6	�d;����.�I�u_~�+6�t�&*d��X�{���5��.��m����k:�S��\0����V][��hoa�-���1���(�ʩ�|�8��U��ohnR?�Z�D��C�c�#�@�٣$.��ϸ�g���H�L�?K�%�NH��\0���������j&Uܖ	-�J���@ێ�\'&�t}b�]7�o^[]���J��r3��70Y��9�uX��XD7L���;yH��n\0wpr9���6<�ã�7��GV��l����&<׵fڟ��.�emya%� �f��3�It��3��2r@�5?q�:p����u+�*��%��c|tP6��85]�.KǻWy��F��:��m�r�_�:�fX狴Q���Y9d�b0}��7+�\0�SmL}�g��j�;m��u��	���d���$�J��$ �_]@���ˋ�Y��a���F��Y]ٜ)���\0$�\\�J��������@��i��̳>��^|��t]��ᶷY���E�I%�yf]�e��\\Շ>}�U����浝�N�V��Pi澰��a,�\'�x𸍗��ҽ�Ќ�s�I-ŕմS^��G*��v-�+ Un�H�۸���d��ݽ���$���6�v�\0֌��bd*˒D��5%��a�Z�?�At����6�o�X���Z䇳լ��[&������Zv2(��˰$��6Ic�����T�[#zM�ket��u�ғ�.�@�znY�M;��U/�����+�-�u!��<�Td�X���ɧv]�M:W�ѝ�\n�����=(.�������u5��y����5R���QbT���*Ek�S��wYP���RzO�<���>���y-�eJ�8�4R����l��e�ߕ�QR2�\'`W��71���k�j�]Ǥ��I!�c\0��;�w�dWfS� �7�5A�/�����]Xvr���k*�l�HT�cQן3A��k�E�iv�b��~ܔ˶�b��?3P�Ǩk���vv�\"��ۼҧԇm�2��\'9�z���k�n������,��KY�Wx/���`��k�jq=̩q��%��\"��_FR�Yp۲@#�;��kM��􀚍��ǋы+oFb�\0���y��P>����Ʀ���Ѣ��@���g£o�R�	-����}�#-��K\n�e���VH�M��Oo ��uPݛ�G1�$�?���e�R��q�G��9m�-����DPX���Uo݊�6�-���Ig�vF��>Жtv ��U^~@U��N��F�{�aq�g��U��<Tb#9#$g�Pm��[7�#o%�J{$��19}�v��\\��+q��V�q��X��h��泛��i�6��8�g�Xx�t�n����^�h��H0A(�v�+���O�R[�.��^@�EؘP��ŷ=S�9���8���\'����\0M�����O/��g(zg����^t�!}.��kf�v�akdؙB�9c�c����T.7DMZ�@	��n]��B���kk���\0b.l��ڢ~��f�Nq�ኋ��yo%Yf[p��U�YrX��Nri6�~���L�kG��B�$�����\n��q+#ީ�UY��Ƥu(V�^��W��sJ�6�oF�6�|��>���x��4IZ��R�D�k�S��q�j��q�ԱK#�R[w��U��	nd䝣�,r�i��_.Kq��g��f����\'��F��NwXF/��Cx��uA���l�)%�VF��t�d���s�Y�y�~�/�\n��7u�nc�2��݊��U�l��4-n�v��\\Ϟ�?\\��Sp��fcq���fX4o�ؗwW�Ks\"G�U���9�\0P3�?HCtzE�([��ț��a٣sE��u@�\\Isf h^)q�ufEc�� ��#�jk:��3	.	T�@V(�9 I���O���у�ɋ=m>#k��NDډq��_99W��_p�ԗH�q�.�g�Y.��2�WI��-L�ݡV�D��Գ&��+�\0=��=f�����%��M�v���4���$�k���JzΛ%�Z�����77�X�swo��ӭ,��u}g,��Ӄ��hp�X�^$�譳Ú;�2Oζmc��\nL�\\/�$[YI1����\0�����h���y�]-���Qop�� �?X��\n�˗���w<�y��:�$�\\*���Tl�I�#��MN�[��K��N�1,-�v{��E\n��R|Fj��3{	_C��1��gb�42<��Á\"`�g�\'=/xn��V;��x᏾����J���b@\0�:�A�auqݤ7��W���-��c*���$\0T�y�b�8CdW�JB����}Y�t�I���i��&�LG�Ց,�g��e������Q�-Q�������!�	@��*����wu����A��_I5��K�Z���5�Ǣ�+@�#*���;V@I<��*���Cg��4��Q����z9ec\"3�8>�o/��sg-�	 ���+�]�F�0�U*A�� �r�}�����o-ƞ�\\m2�I���R0r\'���t�(�(�(1I�P�?{�\0J��(شǥh�b?����G�\"������V�\0E���\0��b?�e���\0�S<l[wc�\0��7|�Y�\0Ec��\0�-(Ƚ�ԫ_�����\0�S�V?����R��[�[���G�\"������\0�U��;��V�Ec��\0���9�;#�����Q����G*�JQ%)J)J)J)J)J)J)J)J)JQ�iJQ�yJP)JQ�iJQ�yJP{JR�JR�JR�JR�JR���");
INSERT INTO tbl_usuario VALUES("4","4","JOSE","2","1","$2a$07$usesomesillystringforePP9wVrG7ur0QdkQ9rpSzfE/DlP4e8u.","","ADMIN","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("5","5","GABRIELA","2","1","$2a$07$usesomesillystringforek7hUNAdfzELkC2Xk6YPva7JCsoP6rh.","","ADMIN","2022-07-26","2022-07-29","ADMIN","");
INSERT INTO tbl_usuario VALUES("6","6","ALEXANDER","2","1","$2a$07$usesomesillystringforeP7mXKbfh9ebyT3M.rcGnqD3gYHLx/pu","","ADMIN","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("7","7","CESAR","2","1","$2a$07$usesomesillystringforelk7hEP5l/8xGhqhzzpBD065n5bEXx2S","","ADMIN","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("8","8","JUAN","2","2","$2a$07$usesomesillystringfore24KuaN0qO9IVZ9tIXt3l5Gy/G5o.KWm","","LUZ","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("9","9","DAVID","2","8","$2a$07$usesomesillystringforeK2F0CA.OyIc/hzje/abe5/.lBawI8Ca","","CESAR","2022-07-27","","","");
INSERT INTO tbl_usuario VALUES("10","10","IKER","2","8","$2a$07$usesomesillystringforecHYBqgWfna9zyvdLydQv0EYK49B5C82","","ALEXANDER","2022-07-27","2022-07-26","ALEXANDER","");
INSERT INTO tbl_usuario VALUES("11","11","DANIEL","2","5","$2a$07$usesomesillystringforePH8CXTpBjgw/NZeLeXQ6eBg2yFS9OE.","","JOSE","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("12","12","RAQUEL","2","4","$2a$07$usesomesillystringforeUBzOoe/fyqEveRzs1qiMcRg0TjegQPu","","RUT","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("13","13","YAMILETH","2","6","$2a$07$usesomesillystringfore/K7kHH0AKBo3XrR19eUxnbbahup7owe","","GABRIELA","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("14","16","MARGARITA","2","2","$2a$07$usesomesillystringforeVxRNnRV8j0V/Qv7SN5pK5Zs/4jXqeqa","","LUZ","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("15","17","RAMON","2","5","$2a$07$usesomesillystringforeFUN5v3JgHk8ENz9lcf.hrCfeYRowdmi","","ADMIN","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("16","18","FRANCISCO","2","6","$2a$07$usesomesillystringfore.OFApK0lnq2pWTrZBEzPs25tOi/peQO","","GABRIELA","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("17","19","JOSUE","2","4","$2a$07$usesomesillystringforeto0mvDpaV0DK4cFtWyWxnWiZ4qt7Z4.","","RUT","2022-07-26","2022-07-26","RUT","");
INSERT INTO tbl_usuario VALUES("18","20","LAURA","2","6","$2a$07$usesomesillystringforeOe47YYBALHNylsq90yhjERGpHl.p9kG","","GABRIELA","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("19","21","MAJO","2","2","$2a$07$usesomesillystringforeVTuDZ.MUZx5QQxqolAMBpd2VqKlfrRa","","LUZ","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("20","22","PAULA","2","5","$2a$07$usesomesillystringforeUvuV8h0neq0uPPmQLgOJsjz2TeSbXeC","","ADMIN","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("21","23","MARIO","2","4","$2a$07$usesomesillystringforeC1qiwiZxWnmXgS0TeTaf41.2zC9eoJa","","RUT","2022-07-26","","","");
INSERT INTO tbl_usuario VALUES("22","24","CRIS","2","8","$2a$07$usesomesillystringforemrCfnY4uA0DxWUm8xBIP17QxqXX.scS","","ALEXANDER","2022-07-27","","","");
INSERT INTO tbl_usuario VALUES("23","25","ANDREA","2","8","$2a$07$usesomesillystringforehRJWC.CF6mpqr2p1llRk3PxU/cZ65DS","","CESAR","2022-07-27","","","");
INSERT INTO tbl_usuario VALUES("24","27","KATY","2","8","$2a$07$usesomesillystringforeHgs1s2uw38U9bfe/nzsY9NxbYN5tPiC","","RUT","2022-07-27","2022-07-28","ADMIN","");
INSERT INTO tbl_usuario VALUES("25","29","DESIRETH","2","8","$2a$07$usesomesillystringforeBNDqae843YwiG.YpUXHq9I4KSLbDAQ6","","GABRIELA","2022-07-27","2022-07-26","GABRIELA","");
INSERT INTO tbl_usuario VALUES("26","30","NAOMI","2","8","$2a$07$usesomesillystringfore6EINqszN38WG50TBh9xqXuz82S4gTBK","","LUZ","2022-07-27","","","");
INSERT INTO tbl_usuario VALUES("27","31","ERICK","1","8","$2a$07$usesomesillystringforeP5wUikw4pkTxWim7XoEvmNeS8uKtbjS","","ADMIN","2022-07-27","2022-08-05","ALEXANDER","");
INSERT INTO tbl_usuario VALUES("28","32","ANYH","2","6","$2a$07$usesomesillystringforef3K3SHJ3KU57GQVdI9QQ7CPsELwicyS","","ADMIN","2022-07-29","","","");
INSERT INTO tbl_usuario VALUES("29","33","ISEL","2","4","$2a$07$usesomesillystringforeQcFYFzyEb3JVU3JYKOfs3gUabsUlQWe","","ADMIN","2022-07-29","2022-08-11","ALEXANDER","");
INSERT INTO tbl_usuario VALUES("30","34","ARMANDO","2","4","$2a$07$usesomesillystringforeIWLQb30CQ.VUYtobQCyzQFYDZlzPjV6","","GABRIELA","2022-07-29","2022-08-11","ALEXANDER","");
INSERT INTO tbl_usuario VALUES("31","35","LUISMI","2","2","$2a$07$usesomesillystringforeo.Za9sjz40Tnh798TxidWyZRTQ.mtoC","","LUZ","2022-08-02","","","");
INSERT INTO tbl_usuario VALUES("32","36","VALERIA","2","2","$2a$07$usesomesillystringforeXAQheGJF7USzYzdQgtA7gv6RllsR2Va","","ADMIN","2022-08-02","","","");



SET FOREIGN_KEY_CHECKS=1;